//
//  ListaContatosViewController.m
//  ContatosIP67
//
//  Created by ios5198 on 23/05/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "FormularioContatoViewController.h"

@implementation ListaContatosViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        SEL metodo = @selector(exibeFormulario);
        self.navigationItem.title = @"Contatos";
        
        UIBarButtonItem *botaoExibirFormulario = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                               target:self
                                                                                               action:metodo];
        
        self.navigationItem.rightBarButtonItem = botaoExibirFormulario;
    }
    return self;
}

- (void) exibeFormulario{
    NSLog(@"Aqui vamos exibir o formulário");
    
    /*UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Formulário"
                              message:@"Aqui vamos exibir o formulário"
                              delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
    
    [alertView show];*/
    
    //para usar um arquivo .xib
    //FormularioContatoViewController *form = [[FormularioContatoViewController alloc] initWithNibName:@"FormularioContatoViewController" bundle:nil];
    //[self.navigationController pushViewController:form animated:YES];
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    FormularioContatoViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Contato"];
    
    [self.navigationController pushViewController:form animated:YES];
}

@end
