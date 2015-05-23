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
        
        self.dao = [ContatoDao contatoDaoInstance];
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
    
    //carregando arquivo .xib via código
    //FormularioContatoViewController *form = [[FormularioContatoViewController alloc] initWithNibName:@"FormularioContatoViewController" bundle:nil];
    //[self.navigationController pushViewController:form animated:YES];
    
    //carregando storyboard via código
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    FormularioContatoViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Contato"];
    
    //transição de tela push
    [self.navigationController pushViewController:form animated:YES];
    
    //transição de tela modal
    /*UINavigationController *barrinha = [[UINavigationController alloc] initWithRootViewController:form];
    [self presentViewController:barrinha animated:YES completion:nil];*/
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    /*cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:nil];
    int linha = indexPath.row;
    Contato *contato = [ContatoDao]*/ //terminar
    return cell;
}

@end
