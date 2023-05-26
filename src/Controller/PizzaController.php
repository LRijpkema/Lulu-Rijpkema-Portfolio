<?php

namespace App\Controller;

use App\Entity\Category;
use App\Entity\Order;
use App\Entity\Pizza;
use App\Form\OrderType;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class PizzaController extends AbstractController
{


    #[Route('/menu', name: 'menu')]
    public function showPizzas(ManagerRegistry $doctrine): Response
    {
        $pizzas = $doctrine->getRepository(Pizza::class)->findAll();

        //        $categoryName = $pizzas[0]->getCategory()->getName();
        //dd($pizzas);
        return $this->render('menu.html.twig', [
            'pizzas' => $pizzas, 'title' => 'Menu'
        ]);
    }

    #[Route('/pizza/{id}', name: 'pizza')]
    public function showPizzaDetail(ManagerRegistry $doctrine, int $id, Request $request, EntityManagerInterface $em): Response
    {


        $order = new Order();
        $form = $this->createForm(OrderType::class, $order);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $order = $form->getData();
            $order->setPizza($doctrine->getRepository(Pizza::class)->find($id));
            $em->persist($order);
            $em->flush();

            $this->addFlash(type: 'success', message: 'Bestelling Succesvol! Bedankt :)');
            return $this->redirectToRoute('home');
        }


        $pizza = $doctrine->getRepository(Pizza::class)->find($id);

        if (!$pizza) {
            throw $this->createNotFoundException(
                'No pizza found for id ' . $id
            );
        } else {
            return $this->renderForm('pizza.html.twig', [
                'form' => $form,
                'pizza' => $pizza,
                'title' => 'Pizza'
            ]);
        }
    }

    //    #[Route('/category/{id}', name: 'category')]
    //    public function showCategory(ManagerRegistry $doctrine, int $id): Response
    //    {
    //        $category = $doctrine->getRepository(Category::class)->find($id);
    //
    //        if (!$category) {
    //            throw $this->createNotFoundException(
    //                'No category found for id ' . $id
    //            );
    //        }
    //
    //        $pizzas = $category->getPizzas();
    //
    //        return $this->render('category.html.twig', [
    //            'category' => $category,
    //            'pizzas' => $pizzas,
    //            'title' => 'Category'
    //        ]);
    //    }

    public function getPizzasByCategoryId(ManagerRegistry $doctrine, int $categoryId): array
    {
        $pizzas = $doctrine->getRepository(Pizza::class)->findBy([
            'category' => $categoryId,
        ]);

        return $pizzas;
    }

    #[Route('/category/{id}', name: 'category')]
    //    #[Route('/category/{category.name}', name: 'category')]
    public function showCategory(ManagerRegistry $doctrine, int $id): Response
    {
        $category = $doctrine->getRepository(Category::class)->find($id);

        if (!$category) {
            throw $this->createNotFoundException(
                'No category found for id ' . $id
            );
        } else {
            $pizzas = $this->getPizzasByCategoryId($doctrine, $category->getId());

            return $this->render('category.html.twig', [
                'category' => $category,
                'pizzas' => $pizzas,
                'title' => 'Category',
            ]);
        }
    }


//    #[Route('/category/{slug}', name: 'category')]
//    public function showCategory(ManagerRegistry $doctrine, int $id, string $slug): Response
//    {
//        $category = $doctrine->getRepository(Category::class)->find($id);
//
//        if (!$category) {
//            throw $this->createNotFoundException(
//                'No category found for id ' . $slug
//            );
//        } else {
//            $pizzas = $this->getPizzasByCategoryId($doctrine, $category->getId());
//
//            return $this->render('category.html.twig', [
//                'category' => $category,
//                'pizzas' => $pizzas,
//                'title' => 'Category',
//            ]);
//        }
//    }
}
