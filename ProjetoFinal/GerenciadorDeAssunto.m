//
//  GerenciadorDeAssunto.m
//  ProjetoFinal
//
//  Created by Kio Coan on 30/06/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "GerenciadorDeAssunto.h"
#import "Variavel.h"
#import "Operadores.h"

//NSString* const FONT_THIN = @"Colaborate-Thin";
//NSString* const FONT_REGULAR = @"Colaborate-Regular";

@implementation GerenciadorDeAssunto

-(id)init{
    self = [super init];
    
    if(self){
        titulosEDescricoesAssunto = [NSArray arrayWithObjects:[[Variavel alloc] initWithTitulo:@"Variável" descricao:@"Conteudo de Variável"],[[Operadores alloc] initWithTitulo:@"Operadores" descricao:@"Conteudo de Operadores"],nil];
        
        NSLog(@"so para comitar");
    }
    
    return self;
}

+ (GerenciadorDeAssunto *)sharedGerenciador{
    static GerenciadorDeAssunto *sharedGerenciador;
    if (!sharedGerenciador) {
        sharedGerenciador = [[super allocWithZone:nil] init];
    }
    return sharedGerenciador;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedGerenciador];
}

- (Assunto *)retornaAssuntoIndice:(int)index{
    
    return [titulosEDescricoesAssunto objectAtIndex:index];
    
}

- (int)retornaQtdAssunto{
    
    return titulosEDescricoesAssunto.count;
}

- (void)instanciarConteudo{
    
    
    [assuntoSelecinado prepararAssunto];
    
    
    
}

- (void)assuntoSelecionado:(int)index{
    
    assuntoSelecinado = [titulosEDescricoesAssunto objectAtIndex:index];
    
}

- (UIImage *)retornaConteudo{
    return [assuntoSelecinado imagemConteudo];
}

- (NSString *)retornaTituloAssunto{
    return assuntoSelecinado.titulo;
}


@end
