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
#import "CondicaoSimples.h"

//NSString* const FONT_THIN = @"Colaborate-Thin";
//NSString* const FONT_REGULAR = @"Colaborate-Regular";

@implementation GerenciadorDeAssunto

-(id)init{
    self = [super init];
    
    if(self){
        titulosEDescricoesAssunto = [[NSMutableArray alloc] init];
        
        
    }
    
    return self;
}


@end
