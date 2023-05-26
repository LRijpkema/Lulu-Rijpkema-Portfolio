<?php

namespace App\Controller;

use App\Entity\Order;
use App\Entity\Pizza;
use App\Form\OrderType;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class OrderController extends AbstractController
{



    #[Route('/orders')]
    public function showOrders(ManagerRegistry $doctrine): Response
    {
        $orders = $doctrine->getRepository(Order::class)->findAll();


        return $this->render('orders.html.twig', [
            'orders' => $orders, 'title' => 'Orders'
        ]);
    }





}