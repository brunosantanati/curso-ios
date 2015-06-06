//
//  GerenciadorDeAcoes.m
//  ContatosIP67
//
//  Created by ios5198 on 06/06/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import "GerenciadorDeAcoes.h"

@implementation GerenciadorDeAcoes

- (id) initWithContato:(Contato *)contato {
    self = [super init];
    if (self) {
        self.contato = contato;
    }
    return self;
}

- (void) acoesDoController:(UIViewController *)controller {
    self.controller = controller;
    
    UIActionSheet *opcoes = [[UIActionSheet alloc] initWithTitle:self.contato.nome
                                                        delegate:self
                                               cancelButtonTitle:@"Cancelar"
                                          destructiveButtonTitle:nil
                                               otherButtonTitles:@"Ligar", @"Enviar Email", @"Visualizar site", @"Abrir Mapa", nil];
    [opcoes showInView:controller.view];
}

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    //implementar switch case para decidir qual método invocar de acordo com o botão clicado pelo usuário
    switch (buttonIndex) {
        case 0:
            [self ligar];
            break;
        case 1:
            [self enviarEmail];
            break;
        case 2:
            [self abrirSite];
            break;
        case 3:
            [self mostrarMapa];
            break;
        default:
            break;
    }
}

- (void) abrirAplicativoURL:(NSString *)url {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

- (void)ligar {
    UIDevice *device = [UIDevice currentDevice];
    if([device.model isEqualToString:@"iPhone"]){
        NSString *numero = [NSString stringWithFormat:@"tel:%@", self.contato.telefone];
        [self abrirAplicativoURL:numero];
    }else{
        [[[UIAlertView alloc] initWithTitle:@"Impossível fazer ligação"
                                    message:@"Seu dispositivo não é um iPhone"
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil, nil] show];
    }
}

- (void) enviarEmail {
    if([MFMailComposeViewController canSendMail]){
        
        MFMailComposeViewController *enviadorEmail = [MFMailComposeViewController new];
        enviadorEmail.mailComposeDelegate = self;
        
        [enviadorEmail setToRecipients:@[self.contato.email]];
        [enviadorEmail setSubject:@"Caelum"];
        
        [self.controller presentViewController:enviadorEmail animated:YES completion:nil];
        
    }else{
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!"
                                                        message:@"Não é possível enviar email"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
        
    }
}

- (void) abrirSite {
    NSString *url = self.contato.site;
    
    NSRange range = [url rangeOfString:@"http"];
    if(range.location == NSNotFound){
        self.contato.site = [NSString stringWithFormat:@"http://%@", self.contato.site];
    }
    
    [self abrirAplicativoURL:url];
}

- (void) mostrarMapa {
    NSString *url = [[NSString stringWithFormat:@"http://maps.google.com/maps?q=%@", self.contato.endereco]
                     stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [self abrirAplicativoURL:url];
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    [self.controller dismissViewControllerAnimated:YES completion:nil];
}

@end
