<?php

namespace App\Form;

use App\Entity\Category;
use App\Entity\Order;
use App\Entity\Pizza;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;


class OrderType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options ): void
    {

        $builder
            ->add('costumer',  )
            ->add('adres')
            ->add('email')
            ->add('size', ChoiceType::class, [
                'choices'  => [
                    '20cm' => '20cm',
                    '23cm' =>'23cm',
                    '25cm' => '25cm',
                ],
            ])
            ->add('status', HiddenType::class, [
                'data' => 'Besteld',
            ])

            ->add('save', SubmitType::class, ['label' => 'Bestel'])

        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Order::class,
        ]);
    }
}
