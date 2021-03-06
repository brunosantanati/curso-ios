//
//  ContatoDao.h
//  ContatosIP67
//
//  Created by ios5198 on 16/05/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contato.h"

@interface ContatoDao : NSObject

@property (strong, readonly) NSMutableArray *contatos;

- (void) adicionaContato:(Contato*) contato;
+ (id) contatoDaoInstance;
- (Contato *) buscaContatoDaPosicao:(NSInteger)posicao;
- (void) removeContatoDaPosicao:(NSInteger)posicao;
- (NSInteger) buscaPosicaoDoContrato:(Contato *) contato;

@end
