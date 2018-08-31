<?php

namespace BuilderBundle\Admin;

use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Show\ShowMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;

class G_ListAdmin extends AbstractAdmin
{
    // Fields to be shown on create/edit forms
    protected function configureFormFields(FormMapper $formMapper)
    {

        $securityContext = $this->getConfigurationPool()->getContainer()->get('security.authorization_checker');
        
        if ($securityContext->isGranted('ROLE_SUPER_ADMIN'))
        {
            $formMapper
                ->add('name', 'text', array(
                    'label' => 'Key'
                ));
        }
        $formMapper
            ->add('title', 'text', array(
                'label' => 'List'
            ))
            ->add('listItems', 'sonata_type_collection', array(
                'by_reference' => false,
                'btn_add' => 'Ajouter',
                'type_options' => array(
                    'delete' => true
                )
            ), array(
                'edit' => 'inline',
                'allow_add' => true,
                'inline' => 'table',
                'sortable' => 'order',
            ))
            //->add('listItems', 'sonata_type_model_list')
            //     'sonata_type_model_list', array(
            // 'btn_add'       => false,
            // 'btn_delete'    => false,           
            // ))
            //     'sonata_type_model', array(
            //     'class' => 'BuilderBundle\Entity\G_ListItem',
            //     'property' => 'name',
            //     'label' => 'Elements',
            // ))
       ;
    }

    // Fields to be shown on filter forms
    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
       $datagridMapper
            ->add('name')
            ->add('title')
       ;
    }

    // Fields to be shown on lists
    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
        ->addIdentifier('name', null, array(
            'label' => "Key"
        ))
        ->addIdentifier('title', null, array(
            'label' => "List"
        ))
        ->add('listItems', null, array(
            'associated_property' => 'name')
        )
       ;
    }

    // Fields to be shown on show action
    protected function configureShowFields(ShowMapper $showMapper)
    {
        $showMapper
           ->add('name')
       ;
    }
}