//  NoticiasDAO.swift
//  Mesa News
//
//  Created by Kovaltchuk, Fernando Cesar on 20/02/21.
//

import UIKit
import Alamofire
import SwiftyJSON

class NoticiaDAO: NSObject {
    
    func retornaTodasAsNoticias() -> Array<Noticia> {
        
        
        var listaNoticia:Array<Noticia> = []

        //func retornaTodasAsNoticias(controller: PesquisarNoticiasViewController) {
        
        let url = "https://mesa-news-api.herokuapp.com/v1/client/auth/signup"
        //let url = "https://mesa-news-api.herokuapp.com/v1/client/auth/signin"
        //let url = "https://mesa-news-api.herokuapp.com/v1/client/news?per_page=5"
        
        var bytesImagem: Data?
        
        let parameters: [String: String] = [
            "password": "515000",
            "email": "fernandokk@gmail.com",
            "name": "Fernando Kovaltchuk"
        ]
        var headers: HTTPHeaders = [
            "Content-Type": "application/json",
            //"Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJpZCI6OSwiZW1haWwiOiJqb2huQGRvZS5jb20ifQ.px43BWNshWtH09-NSGYuWgawHTeD8diEI2aYTqKwoA4"
        ]
        
        AF.request(url, method: .post, parameters: parameters).responseJSON { [self] (response) in
            switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    
                    let str = json["errors"]
                    
                    let data = Data(str.uInt8)
                    //let data = Data(str.uInt8)
                    //(json["errors"], )
                    
                    do {
                    
                        if let jsonText = try JSONSerialization.JSONObejct(with: data, options: []) as? [String:Any] {
                            
                            if let errors = jsonText["errors"]
                            {
                                print(jsonText["errors"]["code"])
                            }
                        }
                        } catch let error as NSError {
                            print (error)
                        }
                    //print(json)
                    //print("token")
                    //print(json["token"])
                    print(json["errors"])
                    print("Código do erro: ")
                    print(json["errors"])
                    
                case .failure(let error):
                    print("Erro!!!")
                    print(error)
            }
            
        }
        
//        AF.request(url, headers: headers).responseJSON { [self] (response) in
//            switch response.result {
//                case .success(let value):
//                    let json = JSON(value)
//                    print(json)
//
//                case .failure(let error):
//                    print("Erro!!!")
//                    print(error)
//                }
//
//        }
        
//        let ceara = Noticia(titulo: "Ceará", descricao: "Viagem para o Ceará", caminhoDaImagem: "img1.png")
//        let rioDeJaneiro = Noticia(titulo: "Rio de Janeiro", descricao: "Viagem para o Rio de Janeiro", caminhoDaImagem: "img1.png")
//        let atibaia = Noticia(titulo: "Atibaia", descricao: "Viagem para Atibaia", caminhoDaImagem: "img3.png")
//        let paraiba = Noticia(titulo: "Paraíba", descricao: "Viagem para a Paraíba", caminhoDaImagem: "img4.png")
//        let fortaleza = Noticia(titulo: "Fortaleza", descricao: "Viagem para Fortaleza", caminhoDaImagem: "img5.png")
        //let listaNoticia:Array<Noticia> = [rioDeJaneiro, ceara, atibaia, paraiba, fortaleza]
        //let listaNoticia:Array<Noticia> = []
      
        return listaNoticia
}
}

//class NoticiasDAO: NSObject {
//
//    var listaNoticias:Array<Noticia> = []
//
//    func retornaTodasAsNoticias(controller: PesquisarNoticiasViewController) {
//
////        let url = "https://documenter.getpostman.com/view/8211335/SzKbLFAY"
////        var bytesImagem: Data?
////
////        AF.request(url).responseJSON { [self] (response) in
////            switch response.result {
////            case .success(let value):
////
////             let json = JSON(value)
////
////             print(json)
////
////             /*for i in 0...24 //retorna por default do serviço 25 ocorrências
////             {
////                let cerveja = Cerveja(nome: json[i]["name"].string!, slogan: json[i]["tagline"].string!, descricao: json[i]["description"].string! , caminhoDaImagem: json[i]["image_url"].string!)
////                self.listaCerveja.append(cerveja)
////             }
////
////             DispatchQueue.main.async {
////                 controller.updateCervejas()
////             }*/
////
////            case .failure(let error):
////                print("Erro!!!")
////                print(error)
////            }
////
////        }
//
//    }
//
//}
