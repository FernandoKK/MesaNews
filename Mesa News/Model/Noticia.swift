//
//  Noticia.swift
//  Mesa News
//
//  Created by Fernando Cesar Kovaltchuk on 20/02/21.
//

import UIKit

class Noticia: NSObject {
    
    // MARK: - Atributos
    
    let titulo: String
    let descricao: String
    let caminhoDaImagem: String
    
    // MARK: - Init
    
    init(titulo: String, descricao: String, caminhoDaImagem: String) {
        self.titulo = titulo
        self.descricao = descricao
        self.caminhoDaImagem = caminhoDaImagem
    }

}
