//
//  ExercicioDesafio.h
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 01/12/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExercicioDesafio : NSObject


@property float tempo;
@property bool acertou;

- (id)initWithTempo:(float)tempo acertou:(BOOL)acertou;

@end
