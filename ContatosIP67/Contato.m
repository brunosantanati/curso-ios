//
//  Contato.m
//  ContatosIP67
//
//  Created by ios5198 on 16/05/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import "Contato.h"

@implementation Contato

- (NSString *) description {
    return [NSString stringWithFormat:@"Nome: %@, Telefone: %@, Email: %@, Endereço: %@, Site: %@", self.nome, self.telefone, self.email, self.endereco, self.site];
}

@end
