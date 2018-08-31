<?php

namespace BuilderBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction()
    {
        return $this->render('BuilderBundle:Default:index.html.twig');
    }
}
