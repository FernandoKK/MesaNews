//
//  MontaAlerta.swift
//  Mesa News
//
//  Created by Fernando Cesar Kovaltchuk on 20/02/21.
//

import UIKit

class MontaAlerta: NSObject {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func montaAlerta(titulo: String, mensagem: String) {
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alerta.addAction(ok)
        controller.present(alerta, animated: true, completion: nil)
    }
    
    
}
