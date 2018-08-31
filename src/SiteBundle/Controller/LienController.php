<?php
namespace SiteBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class LienController extends Controller
{

    public function listAction(){
        $em = $this->getDoctrine()->getManager();

        $listLiens = $em->getRepository('SiteBundle:Lien')
        ->findAll();

        return $this->render('SiteBundle::list-lien.html.twig', array(
            'listLiens' => $listLiens
          ));
    }

}