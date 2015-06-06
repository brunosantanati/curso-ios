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

@protocol FormularioContatoViewControllerDelegate <NSObject>

- (void) contatoAtualizado:(Contato *) contato;
- (void) contatoAdicionado:(Contato *) contato;

@end

@interface FormularioContatoViewController : UIViewController<UIAlertViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nome;
@property (weak, nonatomic) IBOutlet UITextField *telefone;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *endereco;
@property (weak, nonatomic) IBOutlet UITextField *site;
@property (strong) ContatoDao *dao;
@property (strong) Contato *contato;
@property (weak) id<FormularioContatoViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIButton *botaoFoto;

- (IBAction) testar;
- (IBAction) selecionarFoto:(id)sender;

@end

