//
//  ListaEnciclopediaViewController.m
//  ProjetoFinal
//
//  Created by ANDRE NORIYUKI TOKUNAGA on 12/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "ListaEnciclopediaViewController.h"
#import "GerenciadorDesafios.h"

@interface ListaEnciclopediaViewController ()

@end

@implementation ListaEnciclopediaViewController

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
	// Do any additional setup after loading the view.
    
    gerenciador = [GerenciadorDeAssunto sharedGerenciador];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:180.0/255.0 green:77.0/255.0 blue:84.0/255.0 alpha:1.0];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          [UIColor whiteColor],NSForegroundColorAttributeName, // Cor
                          [UIFont fontWithName:FONT_MEDIUM size:25],NSFontAttributeName, // Font Style
                          
                          nil];
    
    [self.navigationController.navigationBar setTitleTextAttributes:dict];
}



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //titulosDescricoes = [gerenciador retornaTitulosEDescricoesAssunto];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    CustomizadaTableViewCell *cell = (CustomizadaTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    Assunto *novoAssunto = [gerenciador retornaAssuntoIndice:indexPath.row];
    
    cell.titulo.text = [novoAssunto titulo];
    cell.descricao.text = [novoAssunto descricao];
    [cell mudaCorDeFundo:(int)indexPath.row];
    //tableView.separatorColor = [cell cor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [gerenciador retornaQtdAssunto];
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomizadaTableViewCell *cell = (CustomizadaTableViewCell*) [tableView cellForRowAtIndexPath:indexPath] ;
    [cell.btnGo setHidden:YES];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [gerenciador assuntoSelecionado:indexPath.row];
    CustomizadaTableViewCell *cell = (CustomizadaTableViewCell*) [tableView cellForRowAtIndexPath:indexPath] ;
    [cell.btnGo setHidden:NO];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}


@end
