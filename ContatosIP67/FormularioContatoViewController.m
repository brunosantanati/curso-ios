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
    }
    return self;
}

- (IBAction)pegaDadosDoFormulario {
    /*NSString *nome = self.nome.text;
    NSString *telefone = self.telefone.text;
    NSString *email = self.email.text;
    NSString *endereco = self.endereco.text;
    NSString *site = self.site.text;
    
    NSLog(@"Nome: %@, Telefone: %@, Email: %@, Endereço: %@, Site: %@", nome, telefone, email, endereco, site);*/
    
    Contato *contato = [Contato new];
    contato.nome = self.nome.text;
    contato.telefone = self.telefone.text;
    contato.email = self.email.text;
    contato.endereco = self.endereco.text;
    contato.site = self.site.text;
    
    [self.dao adicionaContato:contato];
    
    //NSLog(@"Dados: %@", contato);
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
