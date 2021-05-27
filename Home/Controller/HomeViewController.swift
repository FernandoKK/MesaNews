//
//  HomeViewController.swift
//  Mesa News
//
//  Created by Fernando Cesar Kovaltchuk on 19/02/21.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {

    @IBOutlet weak var scrollViewHome: UIScrollView!
    
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldSenha: UITextField!
    
    var gerenciadorDeUsuarios:NSFetchedResultsController<Usuario>?
    var contexto:NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //recuperaUsuario()

    }
    
    func recuperaUsuario()
    {
        let pesquisaUsuario:NSFetchRequest<Usuario> = Usuario.fetchRequest()
        pesquisaUsuario.sortDescriptors = []
        
        gerenciadorDeUsuarios = NSFetchedResultsController(fetchRequest: pesquisaUsuario, managedObjectContext: contexto, sectionNameKeyPath: nil, cacheName: nil)
        
        do {
            try gerenciadorDeUsuarios?.performFetch()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func buttonLogin(_ sender: Any) {
    
        recuperaUsuario()
        guard let contadorListaDeUsuarios = gerenciadorDeUsuarios?.fetchedObjects?.count else { return }
        var usuarioNaBase = false
        if textFieldEmail.text == "" || textFieldSenha.text == ""{
            //usuário ou senha preenchidos incorretamente
            MontaAlerta(controller: self).montaAlerta(titulo: "Atenção!", mensagem: "Preencha os campos usuário e senha!")
        }
        
        print("Número de Usuários: ")
        print(contadorListaDeUsuarios)
    
        if contadorListaDeUsuarios != 0 {
            
            for indexPath in 0...contadorListaDeUsuarios-1
            {
                guard let usuario = gerenciadorDeUsuarios?.fetchedObjects![indexPath] else { return }
                
                if textFieldEmail.text == usuario.email {
                    if textFieldSenha.text == usuario.senha {
                        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                        let controller = storyboard?.instantiateViewController(withIdentifier: "PesquisarNoticiasViewController") as! PesquisarNoticiasViewController
                        self.present(controller, animated: true, completion: nil)
                    }
            
                }
            }
            //Usuário não cadastrado na base de dados
            MontaAlerta(controller: self).montaAlerta(titulo: "Atenção!", mensagem: "Usuário ou senha inválidos!")

        } else {
            //nenhum usuário na base de dados
            MontaAlerta(controller: self).montaAlerta(titulo: "Atenção!", mensagem: "Usuário ou senha inválidos!")
        }
        
        
    }
    @IBAction func buttonCadastrar(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard?.instantiateViewController(withIdentifier: "CadastrarViewController") as! CadastrarViewController
        self.present(controller, animated: true, completion: nil)
    }
    
}
