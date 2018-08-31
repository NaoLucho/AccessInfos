var latInput, longInput, addressNameID, CPID, cityID;

$(document).ready(function() {
    map.setTarget('map');
    latInput = '#p_structure_form_latitude';
    longInput = '#p_structure_form_longitude';
    addressNameID = '#p_structure_form_address';
    CPID = '#p_structure_form_postalCode';
    cityID = '#p_structure_form_city';



    $('#map_search_button').click(function (event) {

        event.preventDefault();

        var coordinates = searchCoordinates(setCoordinates);

    });
});