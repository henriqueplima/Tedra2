//
//  Variavel.m
//  ProjetoFinal
//
//  Created by Rafael Aparecido de Freitas on 02/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "Variavel.h"
#import "AnimaOperadores.h"
@implementation Variavel

-(id)init{
    
    
    self = [super initWithTitulo:@"Variável" descricao:@"assunto de variável"];
    
    if (self) {

    }
    return self;
}


-(void)prepararAssunto{
    
    // INSTANCIA AS PROPRIEDADES QUE SERÃO USADAS PARA EXIBIR O ASSUNTO
    self.imagemConteudo = [UIImage imageNamed:@"conteudoVariaveis.png"];
    
}



@end
