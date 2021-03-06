//
//  sGAPI.swift
//  ProjetoFinalStudioGhibliAPI
//
//  Created by Caroline Feldhaus de Souza on 01/11/21.
//

import Foundation

protocol sGAPI {
    
    func setSGURL() -> String
    
   func getSG(urlString: String, method: HTTPMetodo, completion: @escaping (Result<[films], SGApiError>) -> Void)
}

