<?php

namespace BuilderBundle\Admin;

use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Show\ShowMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;

class G_ListItemAdmin extends AbstractAdmin
{
    // Fields to be shown on create/edit forms
    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
            // ->add('list', 'sonata_type_model', array(
            //     'class' => 'BuilderBundle\Entity\G_List',
            //     'property' => 'name',
            //     'label' => 'Liste',
            //     'multiple' => false,
            // ))
            ->add('name', 'text', array(
                'label' => 'Valeur'
            ))
            ->add('order')
            ->add('icon', null, array(
                'label' => 'Icone (optionnel)'
            ))
            ->add('description', null, array(
                'label' => 'Description (optionnel)'
            ))
            ->add('parent', 'entity', array(
                'class'  => 'BuilderBundle\Entity\G_ListItem',
                'choice_label' => 'name',
                'label' => 'Parent (optionnel)',
                'required' => false,
            ))
       ;
    }

    // Fields to be shown on filter forms
    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
       $datagridMapper
            ->add('list', null, array(), 'entity', array(
                'class' => 'BuilderBundle\Entity\G_List',
                'choice_label' => 'name',
                'label' => 'Liste',
            ))
            ->add('name')
            ->add('icon')
            ->add('description')
       ;
    }

    // Fields to be shown on lists
    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->add('list.name', null, array(
                'label' => 'Liste'
            ))
            ->addIdentifier('name', null, array(
                'label' => "Valeur"
            ))
            ->add('icon', null, array(
                'label' => 'Icone (optionnel)'
            ))
            ->add('description', null, array(
                'label' => 'Description (optionnel)'
            ))
            ->add('parent.name', null, array(
                'label' => 'Parent (optionnel)'
            ))


       ;
    }

    // Fields to be shown on show action
    protected function configureShowFields(ShowMapper $showMapper)
    {
        $showMapper
           ->add('list.name', null, array(
                'label' => 'Liste'
            ))
            ->add('name', null, array(
                'label' => "ListItem"
            ))
       ;
    }
}