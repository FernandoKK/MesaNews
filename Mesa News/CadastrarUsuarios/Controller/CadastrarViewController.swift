//
//  CadastrarViewController.swift
//  Mesa News
//
//  Created by Fernando Cesar Kovaltchuk on 19/02/21.
//

import UIKit
import CoreData

class CadastrarViewController: UIViewController {

    @IBOutlet weak var textFieldNome: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldSenha: UITextField!
    @IBOutlet weak var textFieldConfimacaoSenha: UITextField!
    @IBOutlet weak var textFieldDataNascimento: UITextField!
    
    var contexto:NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func buttonCadastrar(_ sender: Any) {
        let usuario = Usuario(context: contexto)
        let confirmacaoSenha = textFieldConfimacaoSenha
        
        if textFieldNome.text == "" || textFieldEmail.text == "" || textFieldSenha.text == "" || textFieldConfimacaoSenha.text == "" || textFieldDataNascimento.text == "" {
            //campos preenchidos incorretamente
            MontaAlerta(controller: self).montaAlerta(titulo: "Atenção!", mensagem: "Preencha todos os campos corretamente!")
        } else {
            usuario.nome = textFieldNome.text
            usuario.email = textFieldEmail.text
            usuario.datanascimento = textFieldDataNascimento.text
            
            if textFieldSenha.text == textFieldConfimacaoSenha.text {
                usuario.senha = textFieldSenha.text
                
                do {
                    try contexto.save()
                    print("Sucesso!!!")
                    self.dismiss(animated: true, completion: nil)
                    
                } catch {
                    print(error.localizedDescription)
                    
                }
            
            } else {
                //usuário digitou emails diferentes no cadastro
                MontaAlerta(controller: self).montaAlerta(titulo: "Atenção!", mensagem: "Verificar a digitação da confirmação do e-mail!")
                
            }
        }

    }
    @IBAction func buttonVoltar(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
