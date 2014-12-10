//
//  Assunto.m
//  ProjetoFinal
//
//  Created by Kio Coan on 30/06/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//


// #### Classe genérica seus herdeiros serão os assuntos tratados individualmente ######

#import "Assunto.h"

@implementation Assunto

-(id)initWithTitulo:(NSString*)titulo descricao:(NSString*)descricao{
    self = [super init];
    
    if (self) {
        self.titulo = titulo;
        self.descricao = descricao;
    }
    
    return self;
}



-(void)prepararAssunto{
    
    NSLog(@"chamou");
    
}

@end
