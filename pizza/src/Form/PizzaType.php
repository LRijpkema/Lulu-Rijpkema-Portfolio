<?php

namespace App\Form;

use App\Entity\Category;
use App\Entity\Pizza;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class PizzaType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name')
            ->add('image')
            ->add('description', TextareaType::class,)
            ->add('category',EntityType::class,[
                'class' => Category::class, 'choice_label' => 'name',
            ])
            ->add('price', type: NumberType::class)
            ->add('save', SubmitType::class, ['label' => 'Opslaan'])

        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Pizza::class,
        ]);
    }
}
