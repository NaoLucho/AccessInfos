<?php

namespace BuilderBundle\Admin;

use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Show\ShowMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Ivory\CKEditorBundle\Form\Type\CKEditorType;

class ContentAdmin extends AbstractAdmin
{
    // Fields to be shown on create/edit forms
    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
            ->add('title', 'text', array(
                'label' => 'Titre'
            ))
            // ->add('content', CKEditorType::class, array(
            //     'label' => 'Contenu',
            //     'attr' => array('size' => '10')
            // ))
            ->add('content', CKEditorType::class)
            // ->add('content', CKEditorType::class, array(
            //     'config' => array(
            //     'filebrowserBrowseRoute'           => 'my_route',
            //     'filebrowserBrowseRouteParameters' => array('slug' => 'my-slug'),
            //     'filebrowserBrowseRouteType'       => UrlGeneratorInterface::ABSOLUTE_URL,
            //     ),
            // ))
            ->add('type', 'text', array(
                'label' => 'Type',
            ))
            ->add('class', 'text', array(
                'label' => 'Class spécifique',
                'required' => false
            ))
            ->add('rights', 'sonata_type_model', array(
                'class' => 'Application\Sonata\UserBundle\Entity\Group',
                'property' => 'name',
                'multiple' => true,
                'label' => 'Droits additionnel',
                'btn_add' => false,
                'required' => false
            ))
            ->add('locked', null, array(
                'label' => 'Locked by super-admin',
                'required' => false
            ))
       ;
    }

    // Fields to be shown on filter forms
    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
       $datagridMapper
            ->add('title')
            ->add('type')
       ;
    }

    // Fields to be shown on lists
    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->addIdentifier('title', null, array(
                'label' => "Titre"
            ))
            ->add('content', 'string', array(
                'template' => 'BuilderBundle:Field:admin_list_content_overflow.html.twig')) //FIND HOW TRUNCATE CONTENT
            ->add('type')
            ->add('class')
            ->add('rights', null, array(
                'associated_property' => 'name'))
       ;
       //$listMapper->get('content')->setData('content');
    }

    // Fields to be shown on show action
    protected function configureShowFields(ShowMapper $showMapper)
    {
        $showMapper
           ->add('name')
           ->add('type')
       ;
    }
}