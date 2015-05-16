//
//  ViewController.h
//  ContatosIP67
//
//  Created by ios5198 on 16/05/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contato.h"
#import "ContatoDao.h"

@interface FormularioContatoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nome;
@property (weak, nonatomic) IBOutlet UITextField *telefone;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *endereco;
@property (weak, nonatomic) IBOutlet UITextField *site;
@property (strong) ContatoDao *dao;

- (IBAction)pegaDadosDoFormulario;

@end

