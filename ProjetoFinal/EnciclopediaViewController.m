//
//  EnciclopediaViewController.m
//  ProjetoFinal
//
//  Created by ANDRE NORIYUKI TOKUNAGA on 12/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "EnciclopediaViewController.h"
#import "GerenciadorDeAssunto.h"

@interface EnciclopediaViewController ()

@end

@implementation EnciclopediaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    GerenciadorDeAssunto *gerenciador = [GerenciadorDeAssunto sharedGerenciador];
    UIImage *imagemConteudo = [gerenciador retornaConteudo];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:imagemConteudo];
    self.scrollConteudo.contentSize = imagemConteudo.size;
    [self.scrollConteudo addSubview:imageView];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
