<?php

namespace BuilderBundle\Admin;

use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Show\ShowMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;

class PageAdmin extends AbstractAdmin
{
    // Fields to be shown on create/edit forms
    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
            ->add('name', 'text', array(
                'label' => 'Titre'
            ))
            ->add('slug', 'text', array(
                'label' => 'Slug'
            ))
            ->add('pageContents', 'sonata_type_collection', array(
                'by_reference' => false,        
                'type_options' => array(
                    'delete' => true
                )), array(
                'edit' => 'inline',
                'inline' => 'table',
                'sortable' => 'id'
            ))
            ->add('headerImage', 'text', array(
                'label' => 'Nom de l\'image d\'entête',
                'required' => false
            ))
            ->add('class', 'text', array(
                'label' => 'Class spécifique',
                'required' => false
            ))
            ->add('rights', 'sonata_type_model', array(
                'class' => 'Application\Sonata\UserBundle\Entity\Group',
                'property' => 'name',
                'multiple' => true,
                'btn_add' => false
            ))
            ->add('seoTitle', 'text', array(
                'label' => 'Seo Title',
                'required' => false
            ))
            ->add('seoDesc', 'text', array(
                'label' => 'Seo Description',
                'required' => false
            ))
            ->add('seoKeywords', 'text', array(
                'label' => 'Seo Keywords: keyword1, keyword2, keyword3',
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
            ->add('name')
            ->add('slug')
       ;
    }

    // Fields to be shown on lists
    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->addIdentifier('name', null, array(
                'label' => "Titre"
            ))
            ->add('slug')
            ->add('class')
            ->add('rights', null, array(
                'associated_property' => 'name'))
            ->add('pageContents', null, array(
                'associated_property' => 'content.title'))
       ;
    }

    // Fields to be shown on show action
    protected function configureShowFields(ShowMapper $showMapper)
    {
        $showMapper
           ->add('name')
           ->add('slug')
       ;
    }
}