//
//  GerenciadorDeAssunto.h
//  ProjetoFinal
//
//  Created by Kio Coan on 30/06/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Assunto.h"
#import "AlteraAnimacaoDelegate.h"
#import "CenaExercicio.h"

//extern NSString* const FONT_THIN;
//extern NSString* const FONT_REGULAR;

@interface GerenciadorDeAssunto : NSObject
{
    NSArray *titulosEDescricoesAssunto;
}


- (Assunto *)retornaAssuntoIndice:(int)index;
+ (GerenciadorDeAssunto *)sharedGerenciador;
- (int)retornaQtdAssunto;

@end
