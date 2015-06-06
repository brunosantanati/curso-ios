//
//  GerenciadorDeAcoes.h
//  ContatosIP67
//
//  Created by ios5198 on 06/06/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Contato.h"
#import <MessageUI/MessageUI.h>

@interface GerenciadorDeAcoes : NSObject<UIActionSheetDelegate, MFMailComposeViewControllerDelegate>

@property Contato *contato;
@property UIViewController *controller;
- (id)initWithContato:(Contato *)contato;
- (void)acoesDoController:(UIViewController *)controller;

@end
