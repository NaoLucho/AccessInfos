<?php

namespace SiteBundle\Admin;
use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Show\ShowMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;

use Symfony\Component\OptionsResolver\OptionsResolver;

use Doctrine\ORM\EntityRepository;
use Application\Sonata\UserBundle\Entity\User;


use BuilderBundle\Utils\Form\FormBuilder;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Validator\Constraints\IsTrueValidator;
use Sonata\CoreBundle\Form\Type\CollectionType;


class LienAdmin extends AbstractAdmin
{

    //to add template for fields
    public function getTemplate($name)
    {
        switch ($name) {
            case 'edit':
                //var_dump( parent::getTemplate($name));
                return 'BuilderBundle::Field\formbuilder_admin_template.html.twig';
                break;
            default:
                return parent::getTemplate($name);
                break;
        }
    }

    // Fields to be shown on create/edit forms
    protected function configureFormFields(FormMapper $formMapper)
    {

        //$programId = $this->getSubject()->getId();

        $em = $this->getConfigurationPool()->getContainer()->get('doctrine.orm.entity_manager');

        $f_form = $em
            ->getRepository('BuilderBundle:F_Form')
            ->findOneBy(array('name' => 'lien'));
        
        //$user =  $this->get('security.context')->getToken()->getUser();
        $user = $this->getConfigurationPool()->getContainer()->get('security.token_storage')->getToken()->getUser();
        //$formMapper->with($f_form->getTitle());
        $formMapper = FormBuilder::createForm($f_form, $formMapper, $user, $em);
    }
    
    // Fields to be shown on filter forms
    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('title')
            ->add('url')
            ->add('info');
    }
    
    // Fields to be shown on lists
    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->addIdentifier('title', null, array(
                'label' => "Titre"
            ))
            ->add('url', null, array(
                'label' => "URL"
            ))
            ->add('info', null, array(
                'label' => "Info"
            ));
    }
                
    // Fields to be shown on show action
    protected function configureShowFields(ShowMapper $showMapper)
    {
        $showMapper
            ->add('title')
            ->add('url')
            ->add('info');
    }
}