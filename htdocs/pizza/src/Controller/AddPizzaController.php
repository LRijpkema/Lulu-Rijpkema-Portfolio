<?php

namespace App\Controller;

use App\Entity\Pizza;
use App\Form\PizzaType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AddPizzaController extends AbstractController
{
    #[Route('/addpizza', name: 'app_add_pizza')]
    public function addPizza(Request $request, EntityManagerInterface $em): Response
    {
        $pizza = new Pizza();
        $form = $this->createForm(PizzaType::class, $pizza);

        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()) {
            $pizza=$form->getData();
            $em->persist($pizza);
            $em->flush();

            $this->addFlash(type: 'success', message: 'Pizza Toegevoegd!');
            return $this->redirectToRoute('app_add_pizza');
        }

        return $this->renderForm('addpizza.html.twig', [
            'form' => $form, 'title' => 'Add Pizza'
        ]);
    }


}
