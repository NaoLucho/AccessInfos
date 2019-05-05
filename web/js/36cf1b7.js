//On prépare la carte pour l'intégration des points après leur réception dans le DOM en générant toutes les variables / couches et cartographies nécessaires
var map, overlay;

$(document).ready(function () {
    var maxFeatureCount, pointLayer;
    function calculateClusterInfo(resolution) {
        maxFeatureCount = 0;
        // la variable features représente soit un regroupement de points soit un point unique
        var features = pointLayer.getSource().getFeatures();
    
        var feature, radius;
        for (var i = features.length - 1; i >= 0; --i) {
            feature = features[i];
            var originalFeatures = feature.get('features'); // Récupère le tableau des points à l'intérieur de chaque feature
            var extent = ol.extent.createEmpty();
            var j, jj;
            for (j = 0, jj = originalFeatures.length; j < jj; ++j) {
                ol.extent.extend(extent, originalFeatures[j].getGeometry().getExtent());
            }
            maxFeatureCount = Math.max(maxFeatureCount, jj);
            radius = 20 * (originalFeatures.length / 3.14)^(1/2);
            feature.set('radius', radius);
        }
    }
    
    
    var currentResolution;
    function styleFunction(feature, resolution) {
        if (resolution != currentResolution) {
            calculateClusterInfo(resolution);
            currentResolution = resolution;
        }
        var style;
        var size = feature.get('features').length;
        if (size > 1) {
            style = new ol.style.Style({
                image: new ol.style.Circle({
                    radius: feature.get('radius'),
                    fill: new ol.style.Fill({
                        color: [255, 153, 0, Math.min(0.8, 0.4 + (size / maxFeatureCount))]
                    })
                }),
                text: new ol.style.Text({
                    text: size.toString(),
                    fill: new ol.style.Fill({
                        color: '#fff'
                    }),
                    stroke: new ol.style.Stroke({
                        color: 'rgba(0, 0, 0, 0.6)',
                        width: 3
                    })
                })
            });
        } else {
            var originalFeature = feature.get('features')[0];
            style = iconStyle;
        }
        return style;
    }
    
    
    function hoverStyleFunction(feature, resolution) {
        if (resolution != currentResolution) {
            calculateClusterInfo(resolution);
            currentResolution = resolution;
        }
        var style;
        var size = feature.get('features').length;
        if (size > 1) {
            style = new ol.style.Style({
                image: new ol.style.Circle({
                    radius: feature.get('radius'),
                    fill: new ol.style.Fill({
                        color: [153, 153, 153, Math.min(0.8, 0.4 + (size / maxFeatureCount))]
                    })
                }),
                text: new ol.style.Text({
                    text: size.toString(),
                    fill: new ol.style.Fill({
                        color: '#fff'
                    }),
                    stroke: new ol.style.Stroke({
                        color: 'rgba(0, 0, 0, 0.6)',
                        width: 3
                    })
                })
            });
        } else {
            var originalFeature = feature.get('features')[0];
            style = hoveredIconStyle;
        }
        return style;
    }
    
    //Génération du style pour les points
    //TODO : Créer le style pour le cluster si plus de 1 point dessus
    var iconStyle = new ol.style.Style({
        image: new ol.style.Circle({
            radius: 5,
            fill: new ol.style.Fill({
                color: [165, 42, 42, 1]
            }),
            stroke: new ol.style.Stroke({
                color: [165, 42, 42, 1],
                width: 1.5
            })
        }),
        zIndex: 1
    });
    
    var hoveredIconStyle = new ol.style.Style({
        image: new ol.style.Circle({
            radius: 5,
            fill: new ol.style.Fill({
                color: [153, 153, 153, 1]
            }),
            stroke: new ol.style.Stroke({
                color: [153, 153, 153, 1],
                width: 1.5
            })
        }),
        zIndex: 1
    });
    
    var tooltip = document.getElementById('tooltip');
    overlay = new ol.Overlay({
        element: tooltip,
        offset: [10, 0],
        positioning: 'bottom-left'
    });
    
    
    
    
    // Création de la source des points qui sera peuplée dans le JQuery avec les données long et lat des structures
    var iconSource = new ol.source.Vector();
    
    // Génération des clusters pour grouper les structures si elles sont proches sur la carte
    var clusterSource = new ol.source.Cluster({
        distance: 40,
        source: iconSource
    });
    
    
    // Génération de la couche et implémentation du style
    var pointLayer = new ol.layer.Vector({
        source: clusterSource,
        style: styleFunction
    });
    
    
    // Création de la cartographie avec les propriétés désirées
    map = new ol.Map({
        layers: [
            new ol.layer.Tile({
                source: new ol.source.XYZ({
                    url: 'https://a.tile.openstreetmap.de/tiles/osmde/{z}/{x}/{y}.png'
                }),
                preload: 4
            }),
            pointLayer
        ],
        view: new ol.View({
            center: ol.proj.fromLonLat([3.0322265624999996, 47.279229002570816]),
            zoom: 5
        })
    });
    
    
    // Change la couleur du point si la souris passe dessus
    map.addOverlay(overlay);
    
    map.addInteraction(
        new ol.interaction.Select({
            layers: [pointLayer],
            condition: function(evt) {
                return evt.type == "pointermove"
            },
            style: hoverStyleFunction
        }),
    );
    
    map.on('pointermove', function(evt) {
        var pixel = evt.pixel;
        var feature = map.forEachFeatureAtPixel(pixel, function (feature) {
            return feature;
        });
        tooltip.style.display = (feature && feature.get('features').length == 1) ? '' : 'none';
        if (feature) {
    
            // TODO : gérer le tooltip
            overlay.setPosition(evt.coordinate);
            var focusedFeature = feature.get('features')[0];
            var name = focusedFeature.get('name');
            var logo = focusedFeature.get('structureLogo');
            tooltip.innerHTML = '<img src="' + logo + '" class="tooltipLogo" /> ' + name;
        }
    });
    
    map.on('click', function(evt) {
        var pixel = evt.pixel;
        var feature = map.forEachFeatureAtPixel(pixel, function(feature) {
            return feature;
        });
    
        if (feature) {
            if(feature.get('features').length == 1) {
                var id = feature.get('features')[0].get('structureId');
                window.location.href = "fiche_structure?id=" + id;
            } else {
                var tempPolygon = [];
                feature.get('features').forEach(function(point) {
                    tempPolygon.push(point.getGeometry().getCoordinates());
                });
    
                tempPolygon.push(feature.get('features')[0].getGeometry().getCoordinates());
    
                var polygonFeature = new ol.Feature({
                    geometry: new ol.geom.Polygon(
                        [tempPolygon]
                    )
                });
    
                // console.log(feature.getGeometry());
                map.getView().fit(polygonFeature.getGeometry(), { duration: 1000 });
            }
        }
    });

    var JsVars = jQuery('#js-vars').data('vars');

    // Récuperer les structures pour la cartographie
    var structures = JsVars.structures;

    structures.forEach(structure => {
        var feature = new ol.Feature({
            geometry: new ol.geom.Point(ol.proj.fromLonLat([structure.long, structure.lat])),
            name: structure.name,
            structureId: structure.id,
            structureLogo: structure.logo
        });

        iconSource.addFeature(feature);
    });

    map.setTarget('map');

    // var source = new ol.source.Vector({
    //     features: new 
    // });



});

function reloadMap() {
    setTimeout(() => {
        map.updateSize();
    }, 500);
}