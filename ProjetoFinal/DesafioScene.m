//
//  DesafioScene.m
//  ProjetoFinal
//
//  Created by Felipe Costa Nascimento on 11/18/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "DesafioScene.h"

@implementation DesafioScene

-(void)reiniciarDesafio{
    
}

-(void)mudarProgresso:(BOOL)resposta{
    if (resposta) {
        [nodeProgresso insereAcerto];
        
    }else{
        [nodeProgresso insereErro];
    }
    
    [vetorExercicios addObject: [[ExercicioDesafio alloc] initWithTempo:[nodeCronometro tempoAtual] acertou:resposta]];
    
}

@end
