<?php

namespace App\Controller;

use App\Entity\Category;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

    class HomeController extends AbstractController
    {

        #[Route('/pizza')]
        #[Route('/home', name: 'home')]

        public function showCategories(ManagerRegistry $doctrine): Response {
            $categories=$doctrine->getRepository(Category::class)->findAll();

            //dd($pizzas);
            return $this->render('homepage.html.twig', ['categories' => $categories, 'title'=> 'Home']);
        }
        public function homepage(): Response
            {
                return $this->render('homepage.html.twig', [
                    'title'=> 'Home'
                ]);

            }




    #[Route('/contact')]
    public function contact(): Response
        {
          return $this->render('contact.html.twig', [
              'title' => 'Contact'
          ]);
        }

    }