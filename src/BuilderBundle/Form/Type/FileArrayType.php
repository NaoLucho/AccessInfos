<?php

namespace BuilderBundle\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;

class FileArrayType extends AbstractType
{
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'entry_options' => array('label' => false),
            'allow_add' => true,
            'allow_delete' => true,
            'by_reference' => false
        ));
    }

    public function getParent()
    {
        return CollectionType::class;
    }
}