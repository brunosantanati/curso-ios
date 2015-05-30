//
//  ListaContatosViewController.h
//  ContatosIP67
//
//  Created by ios5198 on 23/05/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ContatoDao.h"
#import "FormularioContatoViewController.h"

@interface ListaContatosViewController : UITableViewController<FormularioContatoViewControllerDelegate>

@property  ContatoDao *dao;
@property Contato *contatoSelecionado;
@property NSInteger linhaDestaque;

@end
