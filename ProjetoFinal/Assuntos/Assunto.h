//
//  Assunto.h
//  ProjetoFinal
//
//  Created by Kio Coan on 30/06/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "Animacao.h"
#import "Exercicio.h"
#import "CenaExercicio.h"

// #### Classe genérica seus herdeiros serão os assuntos tratados individualmente ######

@interface Assunto : NSObject

@property NSString *titulo, *descricao, *conteudo;
@property NSArray *imagens, *exercicios;

-(id)initWithTitulo:(NSString*)titulo descricao:(NSString*)descricao;
-(void)prepararAssunto;
@end
