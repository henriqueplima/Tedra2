//
//  ListaEnciclopediaViewController.h
//  ProjetoFinal
//
//  Created by ANDRE NORIYUKI TOKUNAGA on 12/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomizadaTableViewCell.h"
#import "CustomLabel.h"
#import "GerenciadorDeAssunto.h"

@interface ListaEnciclopediaViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    GerenciadorDeAssunto *gerenciador;
    NSMutableArray* titulosDescricoes;
}
@end
