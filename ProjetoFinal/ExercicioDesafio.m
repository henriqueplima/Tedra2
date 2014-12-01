//
//  ExercicioDesafio.m
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 01/12/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "ExercicioDesafio.h"

@implementation ExercicioDesafio



- (id)initWithTempo:(float)tempo acertou:(BOOL)acertou{
    
    self = [super init];
    
    if (self) {
        
        
        self.tempo = tempo;
        self.acertou = acertou;
    }
    
    
    return self;
    
}


@end
