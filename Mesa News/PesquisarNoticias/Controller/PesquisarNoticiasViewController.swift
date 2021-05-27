//
//  PesquisarNoticiasViewController.swift
//  Mesa News
//
//  Created by Fernando Cesar Kovaltchuk on 20/02/21.
//

import UIKit

class PesquisarNoticiasViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet weak var tabelaNoticias: UITableView!
    
    let listaNoticias:Array<Noticia> = NoticiaDAO().retornaTodasAsNoticias()
    //var listaNoticias:Array<Noticia> = []
    //let noticiaDAO = NoticiasDAO()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //noticiaDAO.retornaTodasAsNoticias(controller: self)
        self.tabelaNoticias.dataSource = self
        self.tabelaNoticias.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaNoticias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath) as! NoticiaTableViewCell
        let viagemAtual = listaNoticias[indexPath.row]
        
        celula.labelTitulo.text = viagemAtual.titulo
        celula.labelDescricao.text = viagemAtual.descricao
        celula.imagemNoticia.image = UIImage(named: viagemAtual.caminhoDaImagem)
        
        return celula
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }

}

