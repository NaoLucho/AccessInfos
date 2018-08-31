<?php
namespace BuilderBundle\Utils\Form;

use Doctrine\ORM\EntityRepository;

use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\BirthdayType;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Doctrine\Common\Annotations\AnnotationReader;
use Symfony\Component\Validator\Constraints;
use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;

use Symfony\Component\PropertyAccess\PropertyAccess;
use Ivory\CKEditorBundle\Form\Type\CKEditorType;
use Sonata\CoreBundle\Form\Type\DatePickerType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Sonata\CoreBundle\Form\Type\DateTimePickerType;

use BuilderBundle\Form\Type\FileArrayType;


//UTILS pour builder
class FormBuilder
{

    static function createForm($f_form, $formBuilder, $user, $em) //, $entity = null
    {
        
        //$formBuilder->with('Section');
        if ($f_form != null) {

            $metadata = $em->getClassMetadata($f_form->getEntity());
            //dump($metadata);
            $docReader = new AnnotationReader();
            $reflect = new \ReflectionClass($f_form->getEntity());
            //dump($reflect);
            foreach ($f_form->getFormFields() as $ffield) {
                $options = [];
                $field = $ffield->getField();
                $noError = true;
                $usebuilder = true;
                $options['attr'] = [];
                $options['label_attr'] = [];
                $options['label_attr']['class'] = '';
                $options['constraints'] = [];
                $type = null;

                //verifier que la property existe:
                if (!$reflect->hasProperty($field->getProperty())) {
                    //dump($f_form->getEntity().' does not have property:'.$field->getProperty());
                    // continue;
                }
                //recupérer les informations relatives à la property
                $docInfos = $docReader->getPropertyAnnotations($reflect->getProperty($field->getProperty()));
                //dump($docInfos[0]);

                //VERIFIER LES DROITS =>desactivé pour le moment

                
                //AJOUT DU LABEL:
                //Mandatory:
                $options['required'] = $ffield->getMandatory();
                if ($ffield->getMandatory()) {
                    //check type du champs:

                    //If endwith ToMany:
                    if (strstr(get_class($docInfos[0]), 'ToMany') === "ToMany") {
                        //is arrayCollection
                        $options['constraints'] = array(
                            new Constraints\Count(array('min' => 1, 'groups' => array('dynamic'))),
                            //new NotBlank(array('groups' => array('program_step'.$step)))
                        );
                    } else {
                        //is entity or simple type (int/string etc..)
                        $options['constraints'] = array(
                            new Constraints\NotBlank(array('groups' => array('dynamic'))),
                            //new NotBlank(array('groups' => array('program_step'.$step)))
                        );
                    }
                }

                // TYPE OF PROPERY WITH Doctrine Metadata.
                // probleme: fieldMappings concerne les champs type simple
                // et associationMappings concerne les champs object(entity)
                // Seule la propriété reflClass contient tous les champs,
                // > ce qui équivaut à passer par ReflectionClass
                // $prop = $field->getProperty();
                // if($field->getFieldType()->getComponent() == "image")
                // {
                //     $prop = str_replace("File","Name",$prop);
                // }
                // $fieldMetadata = $metadata->fieldMappings[$prop];
                // dump($fieldMetadata);
                // // Catch the type
                // $fieldType = $fieldMetadata['type'];
                // dump($fieldType);

                
                // $strMandatory = '';
                // if($ffield->getMandatory())
                //     $strMandatory = ' <sup>*</sup>';
    
                //DEFINE label:
                $options['label'] = $field->getLabel();
                $options['label_attr'] = array_merge(
                    $options['label_attr'],
                    array(
                        'class' => $options['label_attr']['class'] . ' control-label'
                    )
                );

                if (substr($options['label'], -1) !== ":" && substr($options['label'], -1) !== "?") {
                    $options['label'] = $options['label'] . " :";
                }

                //Add info indication:
                $ffield_info = $ffield->getInfo();
                if (null === $ffield_info || strlen(trim($ffield_info . '')) > 0) {
                    $ffield_info = $ffield->getField()->getInfo();
                }

                if (null !== $ffield_info && strlen(trim($ffield_info)) > 0) {

                }
                $ffield_info = $ffield->getInfo();
                $field_info = $ffield->getField()->getInfo();
                if (null !== $ffield_info && strlen(trim($ffield_info)) > 0) {
                    $options['attr'] = array_merge($options['attr'], array('help' => $ffield_info));
                    //$options['label'] = $options['label']."<small>".$ffield_info."</small>";
                } elseif (null !== $field_info && strlen(trim($field_info)) > 0) {
                    $options['attr'] = array_merge($options['attr'], array('help' => $field_info));
                    //$options['label'] = $options['label']."<small>".$field_info."</small>";
                }


                $errormessage = "";
                $isList = false;
                //CREER LES CHAMPS SELON LEUR TYPE:
                switch ($field->getFieldType()->getComponent()) {
                    case "select_simple":
                        $isList = true;
                        $options['placeholder'] = "...";
                        $options['label_attr'] = array_merge(
                            $options['label_attr'],
                            array(
                                'class' => $options['label_attr']['class'] . ' col-sm-5'
                            )
                        );
                        $options['attr'] = array_merge(
                            $options['attr'],
                            array(
                                'class' => 'col-sm-7'
                            )
                        );
                        break;
                    case "radio":
                        $isList = true;
                        $options['expanded'] = true;
                        $options['placeholder'] = 'N/A';

                        if ($field->getFieldType()->getName() == "RadioList") {
                            $options['attr'] = array_merge(
                                $options['attr'],
                                array(
                                    'childclass' => 'multiple-radio-buttons'
                                )
                            );
                            $options['label_attr'] = array_merge(
                                $options['label_attr'],
                                array(
                                    'class' => $options['label_attr']['class'] . ' col-sm-5'
                                )
                            );
                            $options['attr'] = array_merge(
                                $options['attr'],
                                array(
                                    'class' => 'col-sm-7'
                                )
                            );
                        }
                        if ($field->getFieldType()->getName() == "RadioList_classic") {
                            $options['label_attr'] = array_merge(
                                $options['label_attr'],
                                array(
                                    'class' => $options['label_attr']['class'] . ' col-xs-12'
                                )
                            );
                            $options['attr'] = array_merge(
                                $options['attr'],
                                array(
                                    'class' => 'col-xs-12 mt-1'
                                )
                            );
                        }
                        break;
                    case "select_multiple":
                        $isList = true;
                        $options['multiple'] = true;
                        $options['attr'] = array(
                            'class' => 'multi-select-field'
                        );
                        break;
                    case "checklist":
                        $isList = true;
                        $options['multiple'] = true;
                        $options['expanded'] = true;
                        $options['label_attr'] = array_merge(
                            $options['label_attr'],
                            array(
                                'class' => $options['label_attr']['class'] . ' col-xs-12 mb-1'
                            )
                        );
                        $options['attr'] = array_merge(
                            $options['attr'],
                            array(
                                'columnsize' => 7
                            )
                        );
                        break;

                    case "textarea":
                        $type = TextareaType::class;
                        $options['attr'] = array_merge(
                            $options['attr'],
                            array(
                                'parent-div-class' => 'col-xs-12 mt-1',
                                'rows' => 4,
                                'placeholder' => $ffield->getField()->getPlaceHolder()
                            )
                        );
                        $options['label_attr'] = array_merge(
                            $options['label_attr'],
                            array(
                                'class' => $options['label_attr']['class'] . ' col-xs-12'
                            )
                        );
                    //Constraints:
                        if ($field->getLimit() !== null) {
                        //CLIENT constraint:
                            $options['attr'] = array_merge(
                                $options['attr'],
                                array(
                                    'maxlength' => $field->getLimit(),
                                )
                            );
                        //SERVER contraint
                            $options['constraints'] = array_merge(
                                $options['constraints'],
                                array(
                                    new Constraints\Length(array('max' => $field->getLimit(), 'groups' => array('dynamic'))),
                                //new NotBlank(array('groups' => array('program_step'.$step)))
                                )
                            );
                        }

                        break;
                    case "number":
                        $type = null;
                        $options['attr'] = array_merge(
                            $options['attr'],
                            array(
                                'class' => 'col-sm-7',
                                'placeholder' => $ffield->getField()->getPlaceHolder()
                            )
                        );
                        $options['label_attr'] = array_merge(
                            $options['label_attr'],
                            array(
                                'class' => $options['label_attr']['class'] . ' col-sm-5'
                            )
                        );
                        break;
                    case "link":
                    case "text":
                    // $fieldBuilder = $formBuilder->add($field->getProperty(), TextType::class);

                        $type = TextType::class;
                        $options['attr'] = array_merge(
                            $options['attr'],
                            array(
                                'class' => 'col-sm-7',
                        //'maxlength' => ($field->getLimit()!==null?$field->getLimit():2000)

                            )
                        );
                        $options['label_attr'] = array_merge(
                            $options['label_attr'],
                            array(
                                'class' => $options['label_attr']['class'] . ' col-sm-5'
                            )
                        );
                    //Constraints:
                        if ($field->getLimit() !== null) {
                        //CLIENT constraint:
                            $options['attr'] = array_merge(
                                $options['attr'],
                                array(
                                    'maxlength' => $field->getLimit(),
                                )
                            );
                        //SERVER contraint
                            $options['constraints'] = array_merge(
                                $options['constraints'],
                                array(
                                    new Constraints\Length(array('max' => $field->getLimit(), 'groups' => array('dynamic'))),
                            //new NotBlank(array('groups' => array('program_step'.$step)))
                                )
                            );
                        }
                        break;
                    case "boolean":
                        $type = CheckboxType::class;
                        $options['label'] = " " . $field->getLabel();
                        break;
                    case "email":
                        $type = EmailType::class;

                        $options['attr'] = array_merge(
                            $options['attr'],
                            array(
                                'class' => 'col-sm-7'
                            )
                        );
                        $options['label_attr'] = array_merge(
                            $options['label_attr'],
                            array(
                                'class' => $options['label_attr']['class'] . ' col-sm-5'
                            )
                        );
                        break;
                    case "datetime":
                        $type = DateTimePickerType::class;
                    case "year":
                    //$type = 'date';
                    // $options['years'] = [2010,2011];
                        $options['attr'] = array_merge(
                            $options['attr'],
                            array(
                                'class' => 'col-sm-7',
                        //'widget' => 'single_text',
                        //'format'      => 'MMMM-yyyyd',
                            )
                        );
                        $options['label_attr'] = array_merge(
                            $options['label_attr'],
                            array(
                                'class' => $options['label_attr']['class'] . ' col-sm-5'
                            )
                        );
                        break;
                    case "image":
                        $type = FileType::class;
                    // ->add('imageFile', FileType::class, array(
                    //     'label' => 'Logo *',
                    //     'required' => true
                    // ))
                        $options['attr'] = array_merge(
                            $options['attr'],
                            array(
                                'class' => 'col-sm-7'
                            )
                        );
                        $options['label_attr'] = array_merge(
                            $options['label_attr'],
                            array(
                                'class' => $options['label_attr']['class'] . ' col-sm-5'
                            )
                        );
                        //SERVER contraint
                        if($field->getLimit() !== null){
                            $options['constraints'] = array_merge(
                                $options['constraints'],
                                array(
                                    new Constraints\File(array('maxSize' => $field->getLimit().'M', 'groups' => array('dynamic'))),
                            //new NotBlank(array('groups' => array('program_step'.$step)))
                                )
                            );
                        }
                        break;
                    case "TableObjectivesType"://SPECIFIC ADD FIELD TableObjectivesType extend CollectionType of form P_ProgramObjectiveType
                    case "TableNbByYearType"://SPECIFIC ADD FIELD TableNbByYearType extend CollectionType of form P_ProgramNbByYearType
                        $usebuilder = false; 
                    //OR USE BUILDER WITH:
                    // $type = CollectionType::class;
                    // $options['entry_type'] = P_ProgramObjectiveType::class;
                    // $options['allow_add'] = true;
                    // $options['allow_delete'] = true;
                        break;
                    case "inactif":
                        $options['attr'] = array_merge(
                            $options['attr'],
                            array(
                                'read_only' => true
                            )
                        );
                        $isList = true;
                        $options['label'] = "" . $options['label'];
                        $type = TextType::class;
                        break;
                    case "LocalisationType":
                        $usebuilder = false;
                        break;
                    case "ImageArray":
                        $usebuilder = false;
                        break;
                    case "FileArray":
                        $usebuilder = false;
                        break;
                    case "TextEditor":
                        $type = CKEditorType::class;
                        break;
                    case "Rights":
                        $usebuilder = false;
                        break;
                    default: //Text
                    //ERREUR DE TYPE
                        $noError = false;
                        $errormessage = $errormessage . "ERREUR: " . $field->getFieldType()->getComponent() . " >notMatch";

                }



                if ($isList) {
                    //TYPE
                    $type = EntityType::class;
                    
                    //DETECT IF LIST IS A G_LIST
                    // Si le champ liste commence par "Liste="+ListeName
                    $listname = $field->getListName();
                    $pos = strpos($listname, "Liste=");

                    $isG_List = false;
                    if ($pos === 0) //FIND at start
                    {   //The field use a G_LIST
                        $listname = substr($listname, $pos + 6); //6 = length("Liste=")
                        $isG_List = true;
                    }

                    if ($isG_List) {
                        //LISTE CREE PAR G_LIST
                        $options['class'] = 'BuilderBundle:G_ListItem';

                        $options['query_builder'] = (function (EntityRepository $er) use ($listname) {
                            return $er->createQueryBuilder('listitem')
                                ->leftJoin('listitem.list', 'list')
                                ->where('list.name = :lname')
                                //->orderBy('listitem.name', 'ASC')
                                ->setParameter('lname', $listname);
                        });
                        $options['choice_label'] = 'name';
                    } else {
                        //LISTE d'entité:
                        //element d'une entité: Namespace:Entity.choice_label#Filter
                        $listparams = explode("#", $listname);
                        $EntityList = explode(".", $listparams[0]);

                        $options['class'] = $EntityList[0];

                        $options['choice_label'] = 'name'; //Default choice_label
                        if (count($EntityList) > 1) {
                            $options['choice_label'] = $EntityList[1];
                        }
    
                        
                        //IF FILTER EXISTS: aprÃ¨s le # Property.attribut=Value exemple: owner.id=currentUser.id
                        if (count($listparams) > 1) {
                            $filterparams = explode("=", $listparams[1]);
                            $filterProperty;
                            $filterPropertyAttribut = null;
                            if ($filterparams[0]) //owner.id
                            {
                                $fpProp = explode(".", $filterparams[0]);

                                $filterProperty = $fpProp[0];//owner
                                if (count($fpProp) > 1) {
                                    $filterPropertyAttribut = $fpProp[1];//id
                                }
                            }
                            if ($filterparams[1]) //VALUE exemple: currentUser.id
                            {
                                //basic value
                                $fvalue = $filterparams[1];
    
                                //CONVERT to booleans:
                                if ($fvalue === 'true') {
                                    $fvalue = true;
                                }
                                if ($fvalue === 'false') {
                                    $fvalue = false;
                                }
    
                                //Specific value
                                if ($filterparams[1] === 'currentUser.id') {
                                    $fvalue = $user->getId();
                                }
    
                                
                                // TODO LATER; faire l'introspection multiniveau des propriétés/attribut typés
                                // $fpvalue = explode(".", $filterparams[1]);
                                // $fpvalueElem = $fvalue[0];
                                // if(count($fvalue)>1)
                                // $filterValueEntity = "owner";
                                // $filterValueEntityProperty = "id";                            
                            }

                            $options['query_builder'] = (function (EntityRepository $er) use ($filterProperty, $filterPropertyAttribut, $fvalue) {
                                $er = $er->createQueryBuilder('entity');
                                if (isset($filterPropertyAttribut)) {
                                    $er = $er->leftJoin('entity.' . $filterProperty, 'entityJoined');
                                    $er = $er->where('entityJoined.' . $filterPropertyAttribut . ' = :filtervalue');
                                } else {
                                    $er = $er->where('entity.' . $filterProperty . ' = :filtervalue');
                                }
                                $er = $er->setParameter('filtervalue', $fvalue);
                                return $er;
                            });
                        }

                    }
                }
                
                //MANAGE SPECIFIC FIELDS:
                
                //Nom de la personne en charge de lâ€™animation de lâ€™observatoire
                //DEFAULT VALUE: utilisateur courant
                if ($field->getProperty() === 'ownersAnim') {
                    $options['disabled'] = true;
                    $options['data'] = $user;
                }


                //DUMP field:
                if ($field->getProperty() === 'dazdzadzadazdz') {
                    dump($field->getProperty());
                    dump($type);
                    dump($options);
                }
                
                
                //ADD FIELD TO FORM
                if ($noError) {
                    if ($usebuilder) {

                        $formBuilder->add($field->getProperty(), $type, $options);
                    } else {
                        if ($field->getFieldType()->getComponent() === "TableObjectivesType") {
                            $options['entry_type'] = P_ProgramObjectiveType::class;
                            // $options['allow_add'] = false;
                            // $options['allow_delete'] = false;
                            $options['label_attr'] = array_merge($options['label_attr'], array(
                                'class' => $options['label_attr']['class'] . ' col-xs-12'
                            ));
                            $formBuilder->add('objectives', TableObjectivesType::class, $options);
                            // array(
                            //     'entry_type'   => P_ProgramObjectiveType::class, //FORM IN COLLECTION
                            //     'allow_add' => false,
                            //     'allow_delete' => false,
                            //     'label_attr' => array_merge($options['label_attr'], array(
                            //         'class' => 'col-xs-12 mb-1'))
                            // ));
                            // var_dump($options);
                        }
                        if ($field->getFieldType()->getComponent() === "TableNbByYearType") {
                            $options['entry_type'] = P_ProgramNbByYearType::class;
                            // $options['allow_add'] = false;
                            // $options['allow_delete'] = false;
                            $options['label_attr'] = array_merge($options['label_attr'], array(
                                'class' => $options['label_attr']['class'] . ' col-xs-12'
                            ));

                            $formBuilder->add($field->getProperty(), TableNbByYearType::class, $options);
                        }
                        if ($field->getFieldType()->getComponent() === "LocalisationType") {
                            
                            //get type geo (from Geom)
                            //get value geo:
                                //get list of departement
                            $locDepartmentData = $em->getRepository('SiteBundle:Geom')
                                ->createQueryBuilder('geom')
                                ->select('geom.nom', 'geom.id', 'geom.type')
                                ->where('geom.type = :type')
                                ->setParameter('type', 'departement')
                            //->setMaxResults(10)
                                ->getQuery()->getResult();
                            //var_dump($locDepartmentData);
                            $locDepartmentArray = [];
                            foreach ($locDepartmentData as $loc) {
                                $locDepartmentArray[$loc["id"]] = $loc["nom"];
                            }
                                //get list of region
                            $locRegionData = $em->getRepository('SiteBundle:Geom')
                                ->createQueryBuilder('geom')
                                ->select('geom.nom', 'geom.id', 'geom.type')
                                ->where('geom.type = :type')
                                ->setParameter('type', 'region')
                            //->setMaxResults(10)
                                ->getQuery()->getResult();
                            //var_dump($locRegionData);
                            $locRegionArray = [];
                            foreach ($locRegionData as $loc) {
                                $locRegionArray["" . $loc["id"]] = $loc["nom"];
                            }

                            $locNationalData = $em->getRepository('SiteBundle:Geom')
                                ->createQueryBuilder('geom')
                                ->select('geom.nom', 'geom.id', 'geom.type')
                                ->where('geom.type = :type')
                                ->setParameter('type', 'national')
                            //->setMaxResults(10)
                                ->getQuery()->getResult();
                            //var_dump($locRegionData);
                            $locNationalArray = [];
                            foreach ($locNationalData as $loc) {
                                $locNationalArray["" . $loc["id"]] = $loc["nom"];
                            }

                            $locDOMData = $em->getRepository('SiteBundle:Geom')
                                ->createQueryBuilder('geom')
                                ->select('geom.nom', 'geom.id', 'geom.type')
                                ->where('geom.type = :type')
                                ->setParameter('type', 'dom')
                            //->setMaxResults(10)
                                ->getQuery()->getResult();
                            //var_dump($locRegionData);
                            $locDOMArray = [];
                            foreach ($locDOMData as $loc) {
                                $locDOMArray["" . $loc["id"]] = $loc["nom"];
                            }


                                //get list of zone (littorales et maritimes)
                            $locZoneLMArray = [
                                'Z01' => 'Mer du nord',
                                'Z02' => 'Manche',
                                'Z03' => 'Mer Méditerrannée',
                                'Z04' => 'Océan Atlantique',
                            ];
                                //get list of outre-mer
                            //var_dump($localisationArray);
                            $portee_geo = [
                                [
                                    'label' => 'National',
                                    'key' => 'national',
                                    'value' => $locNationalArray
                                ],
                                [
                                    'label' => 'Regional',
                                    'key' => 'regional',
                                    'value' => $locRegionArray
                                ],
                                [
                                    'label' => 'Départementale',
                                    'key' => 'departemental',
                                    'value' => $locDepartmentArray
                                ],
                                [
                                    'label' => 'Communale (ville)',
                                    'key' => 'cp',
                                    'value' => 'cp'
                                ],
                                [
                                    'label' => 'Zones littorales et maritimes',
                                    'key' => 'Zones_littorales_et_maritimes',
                                    'value' => $locZoneLMArray
                                ],
                                [
                                    'label' => 'Outre-Mer',
                                    'key' => 'outremer',
                                    'value' => $locDOMArray
                                ]
                            ];
                            //var_dump($portee_geo);
                            $options['mapped'] = false;
                            $options['attr'] = [
                                'portee_geo' => $portee_geo
                            ];
                            // Ne peut pas avoir de constraints puisque le champs n'est pas mapped, Assert dans P_Program->localisations
                            // $options['constraints'] = array(
                            //     new Constraints\Valid(),
                            //     new Constraints\Count(array('min' => 1, 'groups' => array('program_step2'))),
                            //     //new NotBlank(array('groups' => array('program_step'.$step)))
                            // );
                            $formBuilder->add('f_' . $field->getProperty(), null, $options);
                            //dump($options);
                        }
                        if ($field->getFieldType()->getComponent() === "ImageArray") {
                            $options['entry_type'] = 'BuilderBundle\Form\PartnersForm';
                            $options['entry_options'] = array('label' => false);
                            $options['allow_add'] = true;
                            $options['allow_delete'] = true;
                            $options['by_reference'] = false;
                            // $options['prototype'] = true;
                            $options['label_attr'] = array_merge($options['label_attr'], array(
                                'class' => $options['label_attr']['class'] . ' col-xs-12'
                            ));

                            $formBuilder->add('partners', PdfsType::class, $options);
                        }
                        if ($field->getFieldType()->getComponent() === "FileArray") {
                            $options['entry_type'] = 'BuilderBundle\Form\PdfsForm';
                            //$options['entry_options'] = array('label' => false);
                            $options['allow_add'] = true;
                            $options['allow_delete'] = true;
                            $options['by_reference'] = false;
                            // $options['prototype'] = true;
                            $options['label_attr'] = array_merge($options['label_attr'], array(
                                'class' => $options['label_attr']['class'] . ' col-xs-12'
                            ));

                            $formBuilder->add($field->getProperty(), FileArrayType::class, $options);
                        }

                    }
                } else {
                    dump($errormessage);
                    //MESSAGE ERREUR TO LOG
                    $formBuilder->add("error", TextType::class, array(
                        "mapped" => false,
                        "label" => $options['label'] . ' ERROR ',
                        "data" => $errormessage
                    ));
                }
            }
        }
        //$formBuilder->end();
        return $formBuilder;
    }
}