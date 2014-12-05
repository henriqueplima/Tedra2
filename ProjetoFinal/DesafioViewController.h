//
//  DesafioViewController.h
//  ProjetoFinal
//
//  Created by ANDRE NORIYUKI TOKUNAGA on 12/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DesafioOperadores.h"
#import "GerenciadorDesafios.h"
#import "Gerador.h"
#import "EstatisticaViewController.h"
#import "JCRBlurView.h"
@interface DesafioViewController : UIViewController <UIPageViewControllerDataSource, DesafioSceneDelegate>

{
    EstatisticaViewController *estatisticas;
    GerenciadorDesafios *gerenciadorDesafios;
    Gerador *gerador;
    SKView *viewDesafioAtual;
    NSArray *arrayExercicios;
}

@property (strong, nonatomic) UIPageViewController *pageController;
@property (nonatomic,strong) JCRBlurView *blurView;
@end
