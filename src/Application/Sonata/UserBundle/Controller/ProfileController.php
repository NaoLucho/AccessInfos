<?php

namespace Application\Sonata\UserBundle\Controller;

use FOS\UserBundle\Event\FilterUserResponseEvent;
use FOS\UserBundle\Event\FormEvent;
use FOS\UserBundle\Event\GetResponseUserEvent;
use FOS\UserBundle\Form\Factory\FactoryInterface;
use FOS\UserBundle\FOSUserEvents;
use FOS\UserBundle\Model\UserInterface;
use FOS\UserBundle\Model\UserManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\EventDispatcher\EventDispatcherInterface;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;

use Symfony\Component\Form\Extension\Core\Type\FormType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;

use FOS\UserBundle\Controller\ProfileController as BaseController;
/**
 * Controller managing the user profile.
 *
 * @author Christophe Coevoet <stof@notk.org>
 */
class ProfileController extends BaseController
{

    public function __construct()
    {
    }
    
    /**
     * Show the user.
     */
    public function showAction()
    {
        $request = Request::createFromGlobals();
        $em = $this->getDoctrine()->getEntityManager();
        $user = $this->getUser();

        if (!is_object($user) || !$user instanceof UserInterface) {
            throw new AccessDeniedException('This user does not have access to this section.');
        }

        $formBuilder = $this->get('form.factory')->createBuilder(FormType::class, $user);

        $formBuilder
        ->add('save', SubmitType::class, array(
            'attr' => array(
                //'class' => 'validate_new_structure_btn'
            )
        ));

        $form = $formBuilder->getForm();

        if($request->isMethod('POST') && $form->handleRequest($request)->isValid()) {
            $em->flush();
        }

        return $this->render('@FOSUser/Profile/show.html.twig', array(
            'user' => $user,
            'form' => $form->createView(),
            'page' => 'profile'
        ));
    }

    // public function editAction(Request $request)
    // {
    //     return parent::editAction($request);
    // }
}
