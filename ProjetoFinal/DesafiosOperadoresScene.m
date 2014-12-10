//
//  DesafiosOperadoresScene.m
//  ProjetoFinal
//
//  Created by RAFAEL APARECIDO DE FREITAS on 18/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "DesafiosOperadoresScene.h"

@implementation DesafiosOperadoresScene

{
    GerenciadorDesafios *gerenciadorDesafios;
    BotaoDesafiosNode *btn1, *btn2, *btnRestart;
    OperadorDesafiosNode *operador;
    SKNode *conteudoAtivo;
    
}

-(id)initWithSize:(CGSize)size{
    
    if (self = [super initWithSize:size]) {
        [self setUserInteractionEnabled:NO];
        gerenciadorDesafios = [GerenciadorDesafios sharedGerenciador];
        gerador = [[Gerador alloc] init];
        desafioAtual = [[DesafioOperadores alloc] init];
        desafioAtual = [gerenciadorDesafios retornaTarefasParaDesafio];
        nodeProgresso = [[ProgressoDesafioBar alloc] initWithBolinhas:[desafioAtual nTarefas]];
        //nodeProgresso = [[nodeProgressoDesafioBar alloc] initWithBolinhas:3];

        
        
        fundo = [[SKSpriteNode alloc] initWithImageNamed:@"Desafio-Operadores-Fundo.png"];
        [fundo setPosition:CGPointMake(384, 512)];
        [self addChild:fundo];
        if ([desafioAtual desafioFinalizado]) {
            [self exibePlacarFinal:[gerenciadorDesafios desafioFinalizado]];
        }else{
            [self montaTela];
            [self adicionarCronometro];
            [nodeCronometro iniciarAnimacaoDeEntrada];
            
            vetorExercicios = [NSMutableArray array];
            
        }
        
    }
    
    return self;
}

- (void)reiniciarDesafio{
    
    [desafioAtual restart];
    [gerenciadorDesafios restartDesafio];
    [nodeCronometro resetarDados];
    [nodeProgresso reset];
    [self montaTela];
    [nodeCronometro iniciarContagem];
    vetorExercicios = [NSMutableArray array];
    
}


-(void)habilitarToqueNosBotoes{
    [self setUserInteractionEnabled:YES];
}

-(void)animacaoDeEntradaCronometroFinalizada{
    
    [nodeCronometro iniciarContagem];
    [self performSelector:@selector(habilitarToqueNosBotoes) withObject:nil afterDelay:0.05];
}

- (void)tempoEsgotado{
    NSLog(@"tempo esgotado");
    
    
    [self insereResposta:NO];

}

-(void)montaTela{
    //(768-nodeProgresso.size.width)/2
    CGPoint posicao;
    posicao.y = self.size.height - nodeProgresso.size.height;
    posicao.x = (self.size.width / 2) - (nodeProgresso.size.width / 2);
    
    [nodeProgresso setPosition:CGPointMake(posicao.x, posicao.y)];
    
    if (![[self children]containsObject:nodeProgresso]) {
        [self addChild:nodeProgresso];
    }
    
    
    
    lblParte1 = [[SKLabelNode alloc] initWithFontNamed:FONT_LIGHT];
    lblParte2 = [[SKLabelNode alloc] initWithFontNamed:FONT_LIGHT];
    lblResultado = [[SKLabelNode alloc] initWithFontNamed:FONT_MEDIUM];
    lblIgual = [[SKLabelNode alloc] initWithFontNamed:FONT_LIGHT];
    
    CGFloat fontSize = 68.0;
    
    [lblParte1 setFontSize:fontSize];
    [lblParte2 setFontSize:fontSize];
    [lblResultado setFontSize:fontSize+20.0];
    [lblIgual setFontSize:fontSize];
    UIColor *cor = [UIColor colorWithRed:(76.0/255.0) green:(95.0/255.0) blue:(138.0/255.0) alpha:1];
    
    [lblParte1 setFontColor:cor];
    [lblParte2 setFontColor:cor];
    [lblResultado setFontColor:cor];
    [lblIgual setFontColor:cor];
    
    [lblParte1 setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeCenter];
    [lblParte2 setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeCenter];
    [lblResultado setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeCenter];
    [lblIgual setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeCenter];
    
    btn1 = [[BotaoDesafiosNode alloc] initWithImageNamed:@"Desafio-Operadores-btn1.png"];
    [btn1 setName:@"btn1"];
    btn2 = [[BotaoDesafiosNode alloc] initWithImageNamed:@"Desafio-Operadores-btn2.png"];
    [btn2 setName:@"btn2"];
    
    operador = [[OperadorDesafiosNode alloc] initWithImageNamed:@"Desafio-Operadores-Operador.png"];
    
    
    
    
    [lblParte1 setPosition:CGPointMake(384, 720)];
    [lblParte2 setPosition:CGPointMake(384, 450)];
    [lblIgual setPosition:CGPointMake(384, 360)];
    [lblResultado setPosition:CGPointMake(384, 250)];
    [btn1 setPosition:CGPointMake(192, 80)];
    [btn2 setPosition:CGPointMake(576, 80)];
    [operador setPosition:CGPointMake(384, 605)];
    [lblIgual setText:@"="];
    
    
    [self addChild:lblParte1];
    [self addChild:lblParte2];
    [self addChild:lblIgual];
    [self addChild:lblResultado];
    [self addChild:btn1];
    [self addChild:btn2];
    [self addChild:operador];
    
    lblParte1.text = [desafioAtual parte1];
    lblParte2.text = [desafioAtual parte2];
    lblResultado.text = [desafioAtual resultado];
    [self ajustaBotoes];
}

-(void)exibePlacarFinal:(BOOL)concluido{
   
    if (concluido) {
        
        
//        btnRestart = [[BotaoDesafiosNode alloc] initWithImageNamed:@"Desafio-Operadores-btn1.png"];
//        [btnRestart setName:@"restart"];
//        [btnRestart setValor:@"Restart"];
//        [btnRestart setPosition:CGPointMake(384, 250)];
//        [self addChild:btnRestart];
//        [self adicionaResultado];
//        int i = vetorExercicios.count;
    }else{
        [btnRestart removeFromParent];
        [lblNAcertos removeFromParent];
        [gerenciadorDesafios restartDesafio];
        [self montaTela];
    }
    
    
}

-(void)corrige:(NSString*)opcao{
    
    BOOL resposta = [gerenciadorDesafios corrige:opcao];
    
    [self insereResposta:resposta];
        //[self nomeiaBotao];
}

- (void)animacaoTemp{
    SKAction *temp = [SKAction waitForDuration:0.8];
    
    [operador runAction:temp completion:^{
        [operador runAction:[operador acaoReversa] completion:^{
            [nodeCronometro iniciarContagem];
            [self performSelector:@selector(habilitarToqueNosBotoes) withObject:nil afterDelay:0.05];
            [self alteraTarefa];
        }];
        
    }];
    
}

- (void)insereResposta:(BOOL)resposta{
    
    if (resposta) {
        [nodeCronometro usuarioAcertouResposta];
        [nodeCronometro prepararCronometro];
        [operador acertou];
        //[nodeProgresso insereAcerto:[desafioAtual retornaTarefaAtual]];
        [operador setValor:[(BotaoDesafiosNode*)conteudoAtivo text]]; // FAZ UM CAST DO CONTEÚDO ATIVO PARA TER ACESSO À PROPRIEDADE "TEXT"
        
    }else{
        [nodeCronometro usuarioErrouResposta];
        [nodeCronometro prepararCronometro];
        [operador errou];
        //[nodeProgresso insereErro:[desafioAtual retornaTarefaAtual]];
        [operador setValor:[desafioAtual operador]];
    }
    
    [self animacaoTemp];
    [self mudarProgresso:resposta];
//    [vetorExercicios addObject:[[ExercicioDesafio alloc] initWithTempo:[nodeCronometro tempoAtual] acertou:resposta] ];
    
    
    
    // Inserir exercico no vetor
    
}
//-(void)nomeiaBotao{
//    if ([@"??" isEqualToString:btn1.name]) {
//        btn1.name = nomeBotaoAtivo;
//    }else{
//        btn2.name = nomeBotaoAtivo;
//    }
//}

-(void)alteraTarefa{
    
    if ([desafioAtual incrementaTarefa]) {
        [operador setValor:@"?"];
        lblParte1.text = [desafioAtual parte1];
        lblParte2.text = [desafioAtual parte2];
        lblResultado.text = [desafioAtual resultado];
        [self ajustaBotoes];
        
    }else{
        [self fimDesafioAtual];
    }

}

-(void)ajustaBotoes{
    int aleatorio = arc4random() % 2;
    if (aleatorio == 1) {
        [btn1 setValor:[desafioAtual operador]];
        [btn2 setValor:[gerador retornaOperadorInverso:[desafioAtual operador]]];
    }else{
        [btn2 setValor:[desafioAtual operador]];
        [btn1 setValor:[gerador retornaOperadorInverso:[desafioAtual operador]]];
    }
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    conteudoAtivo = [self nodeAtPoint:location];
    
    if (![operador hasActions]) {
        if ([@"btn1" isEqualToString:conteudoAtivo.name] || [@"btn2" isEqualToString:conteudoAtivo.name]) {
//            nomeBotaoAtivo = conteudoAtivo.name;
//            [conteudoAtivo setName:@"??"];
            BotaoDesafiosNode *temp = (BotaoDesafiosNode*)conteudoAtivo ;
            [nodeCronometro pararContagem];
            [self corrige:[temp text]];
            [self setUserInteractionEnabled:NO];
            
        }else if ([@"restart"isEqualToString:conteudoAtivo.name]){
            [desafioAtual restart];
            [self exibePlacarFinal:NO];
            [nodeProgresso reset];
        }

    }
    
    
    
}

-(void)fimDesafioAtual{
    [self removeNodesIndesejaveis];
    [nodeCronometro pararContagem];
    [self.myDelegate exibirDadosEstatisticos:vetorExercicios];
    
}
-(void)removeNodesIndesejaveis{

    SKAction *fadeOut = [SKAction fadeOutWithDuration:0.2];
    //SKAction *removeDaTela = [SKAction removeFromParent];
    
    [lblIgual runAction:fadeOut completion:^{[lblIgual removeAllActions];[lblIgual removeFromParent];}];
    [lblParte1 runAction:fadeOut completion:^{[lblParte1 removeFromParent];}];
    [lblParte2 runAction:fadeOut completion:^{[lblParte2 removeFromParent];}];
    [lblResultado runAction:fadeOut completion:^{[lblResultado removeFromParent];}];
    [btn1 runAction:fadeOut completion:^{[btn1 removeFromParent];}];
    [btn2 runAction:fadeOut completion:^{[btn2 removeFromParent];}];
    [operador runAction:fadeOut completion:^{[operador removeFromParent];}];
    //[nodeProgresso removeFromParent];
    
    
    //[self exibePlacarFinal:YES];
   
}

-(void)adicionaResultado{
    
    CGFloat fontSize = 68.0;
    UIColor *cor = [UIColor colorWithRed:(76.0/255.0) green:(95.0/255.0) blue:(138.0/255.0) alpha:1];
    
    lblNAcertos = [[SKLabelNode alloc] initWithFontNamed:FONT_LIGHT];
    [lblNAcertos setFontSize:fontSize];
    [lblNAcertos setFontColor:cor];
    [lblNAcertos setPosition:CGPointMake(384, 605)];
    [lblNAcertos setText:[NSString stringWithFormat: @"Acertos: %d", [desafioAtual acertos]]];
    [self addChild:lblNAcertos];
    
    
    
    
}

@end
