//
//  DesafioScene.h
//  ProjetoFinal
//
//  Created by Felipe Costa Nascimento on 11/18/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "ExercicioDesafio.h"
#import "ProgressoDesafioBar.h"
#import "SpriteCronometroNode.h"

@protocol DesafioSceneDelegate <NSObject>
//-(void)exibirDadosEstatisticos:(NSArray*)tempos nAcertos:(int)nAcertos nErros:(int)nErros;
-(void)exibirDadosEstatisticos:(NSArray*)vetorExercicios;
@end



@interface DesafioScene : SKScene{
    int nExercicios;
    NSMutableArray *vetorExercicios;
    SpriteCronometroNode *nodeCronometro;
    ProgressoDesafioBar *nodeProgresso;
}

@property id <DesafioSceneDelegate> myDelegate;

-(void)reiniciarDesafio;
-(void)mudarProgresso:(BOOL)resposta;

@end
