//
//  ViewController.m
//  ContatosIP67
//
//  Created by ios5198 on 16/05/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import "FormularioContatoViewController.h"

@interface FormularioContatoViewController ()

@end

@implementation FormularioContatoViewController

- (void)viewDidLoad{
    if(self.contato){
        self.navigationItem.title = @"Alterar";
        UIBarButtonItem *confirmar = [[UIBarButtonItem alloc] initWithTitle:@"Confirmar"
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:self action:@selector(atualizaContato)];
        
        self.navigationItem.rightBarButtonItem = confirmar;
        
        self.nome.text = self.contato.nome;
        self.telefone.text = self.contato.telefone;
        self.email.text = self.contato.email;
        self.endereco.text = self.contato.endereco;
        self.site.text = self.contato.site;
        
        if (self.contato.foto) {
            [self.botaoFoto setBackgroundImage:self.contato.foto
                                      forState:UIControlStateNormal];
            [self.botaoFoto setTitle:nil forState:UIControlStateNormal];
        }
        
    }else{
        self.navigationItem.title = @"Cadastro";
        
        UIBarButtonItem *botaoAdd = [[UIBarButtonItem alloc] initWithTitle:@"Add"
                                                                     style:UIBarButtonItemStylePlain
                                                                    target:self
                                                                    action:@selector(criaContato)];
        self.navigationItem.rightBarButtonItem = botaoAdd;
    }
}

- (void) atualizaContato{
    
    UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"confirmação"
                                                     message:@"quer realmente alterar?"
                                                    delegate:self
                                           cancelButtonTitle:@"Cancelar"
                                           otherButtonTitles:@"OK", nil];
    
    [alerta show];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.dao = [ContatoDao contatoDaoInstance];
    }
    return self;
}

- (void) criaContato{
    [self pegaDadosDoFormulario];
    [self.dao adicionaContato:self.contato];
    
    if (self.delegate) {
        [self.delegate contatoAdicionado:self.contato];
    }
    
    // voltar - modal
    //[self dismissViewControllerAnimated:YES completion:nil];
    
    //voltar - push
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1)    {
        [self confirmaAtualizacao];
    }
}

- (void) confirmaAtualizacao{
    [self pegaDadosDoFormulario];
    
    if (self.delegate) {
        [self.delegate contatoAtualizado:self.contato];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)pegaDadosDoFormulario {
    /*NSString *nome = self.nome.text;
    NSString *telefone = self.telefone.text;
    NSString *email = self.email.text;
    NSString *endereco = self.endereco.text;
    NSString *site = self.site.text;
    
    NSLog(@"Nome: %@, Telefone: %@, Email: %@, Endereço: %@, Site: %@", nome, telefone, email, endereco, site);*/
    
    if (!self.contato) {
        self.contato = [Contato new];
    }
    
    if ([self.botaoFoto backgroundImageForState:UIControlStateNormal]) {
        self.contato.foto = [self.botaoFoto backgroundImageForState:UIControlStateNormal];
    }
    
    self.contato.nome = self.nome.text;
    self.contato.telefone = self.telefone.text;
    self.contato.email = self.email.text;
    self.contato.endereco = self.endereco.text;
    self.contato.site = self.site.text;
    
    //NSLog(@"Dados: %@", self.contato);
}

- (IBAction) testar {
    //iterar pelas views da tela
    NSArray *views = [self.view subviews];
    for(UIView *v in views){
        NSLog(@"Tag: %lu", v.tag);
    }
    
    //UIView *botao = [self.view viewForTag:13]; //pegar pela tag
}

- (IBAction) selecionarFoto:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        //câmera disponível
    } else {
        //usar a biblioteca
        UIImagePickerController *picker = [UIImagePickerController new];
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.allowsEditing = YES;
        picker.delegate = self;
        NSLog(@"Antes");
        [self presentViewController:picker animated:YES completion:^{
            NSLog(@"Meio");
        }];
        NSLog(@"Depois");
    }
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *imagemSelecionada = [info valueForKey:UIImagePickerControllerEditedImage];
    [self.botaoFoto setBackgroundImage:imagemSelecionada forState:UIControlStateNormal];
    [self.botaoFoto setTitle:nil forState:UIControlStateNormal];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
