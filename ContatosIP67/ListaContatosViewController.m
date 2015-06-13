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
    self = [super initWithStyle:UITableViewStylePlain ];
    if (self) {
        
        UIImage *imagemTabItem = [UIImage imageNamed:@"lista-contatos.png"];
        UITabBarItem *tabItem = [[UITabBarItem alloc] initWithTitle:@"Contatos" image:imagemTabItem tag:0];
        self.tabBarItem = tabItem;
        
        SEL metodo = @selector(exibeFormulario);
        self.navigationItem.title = @"Contatos";
        
        UIBarButtonItem *botaoExibirFormulario = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                               target:self
                                                                                               action:metodo];
        
        self.navigationItem.rightBarButtonItem = botaoExibirFormulario;
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        
        self.dao = [ContatoDao contatoDaoInstance];
        
        self.linhaDestaque = -1;
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

- (void) viewDidAppear:(BOOL)animated{
    if(self.linhaDestaque > 0){
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.linhaDestaque inSection:0];
        [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
        self.linhaDestaque = -1;
    }
}

- (void) viewDidLoad{
    [super viewDidLoad];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(exibeMaisAcoes:)];
    
    [self.tableView addGestureRecognizer:longPress];
}

- (void) exibeMaisAcoes:(UIGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        CGPoint ponto = [gesture locationInView:self.tableView];
        NSIndexPath *index = [self.tableView indexPathForRowAtPoint:ponto];
        
        if (index) {
            self.contatoSelecionado = [self.dao buscaContatoDaPosicao:index.row];
            _gerenciador = [[GerenciadorDeAcoes alloc] initWithContato:self.contatoSelecionado];
            [self.gerenciador acoesDoController:self];
        }
        
        self.contatoSelecionado = [self.dao buscaContatoDaPosicao:index.row];
    }
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
    
    form.delegate = self;
    
    if (self.contatoSelecionado) {
        form.contato = self.contatoSelecionado;
    }
    
    //transição de tela push
    [self.navigationController pushViewController:form animated:YES];
    
    //transição de tela modal
    /*UINavigationController *barrinha = [[UINavigationController alloc] initWithRootViewController:form];
    [self presentViewController:barrinha animated:YES completion:nil];*/
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dao.contatos count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifier];
    }
    
    Contato *contato = [self.dao buscaContatoDaPosicao: indexPath.row];
    cell.textLabel.text = contato.nome;
    cell.imageView.image = contato.foto;
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    return cell;
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(editingStyle == UITableViewCellEditingStyleDelete){
        int linha = indexPath.row;
        [self.dao removeContatoDaPosicao:linha];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.contatoSelecionado = [self.dao buscaContatoDaPosicao:indexPath.row];
    NSLog(@"Nome: %@", self.contatoSelecionado.nome);
    [self exibeFormulario];
    self.contatoSelecionado = nil;

}

- (void) tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    self.contatoSelecionado = [self.dao buscaContatoDaPosicao:indexPath.row];
    _gerenciador = [[GerenciadorDeAcoes alloc] initWithContato:self.contatoSelecionado];
    [self.gerenciador acoesDoController:self];
}

- (void) contatoAtualizado:(Contato *)contato{
    self.linhaDestaque = [self.dao buscaPosicaoDoContrato:contato];
    NSLog(@"contato atualizado: %@", contato.nome);
}

- (void) contatoAdicionado:(Contato *)contato{
    self.linhaDestaque = [self.dao buscaPosicaoDoContrato:contato];
    NSLog(@"contato adicionado: %@", contato.nome);
}

@end
