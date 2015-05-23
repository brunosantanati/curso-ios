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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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
        self.navigationItem.title = @"Cadastro";
        
        UIBarButtonItem *botaoAdd = [[UIBarButtonItem alloc] initWithTitle:@"Add"
                                         style:UIBarButtonItemStylePlain
                                        target:self
                                        action:@selector(criaContato)];
        self.navigationItem.rightBarButtonItem = botaoAdd;
    }
    return self;
}

- (void) criaContato{
    [self pegaDadosDoFormulario];
    [self.dao adicionaContato:self.contato];
    
    // voltar - modal
    //[self dismissViewControllerAnimated:YES completion:nil];
    
    //voltar - push
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)pegaDadosDoFormulario {
    /*NSString *nome = self.nome.text;
    NSString *telefone = self.telefone.text;
    NSString *email = self.email.text;
    NSString *endereco = self.endereco.text;
    NSString *site = self.site.text;
    
    NSLog(@"Nome: %@, Telefone: %@, Email: %@, Endereço: %@, Site: %@", nome, telefone, email, endereco, site);*/
    
    self.contato = [Contato new];
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
@end
