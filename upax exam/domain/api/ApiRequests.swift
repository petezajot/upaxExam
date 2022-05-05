//
//  ApiRequests.swift
//  upax exam
//
//  Created by Sergio García Vargas on 04/05/22.
//

import Foundation

class ApiRequests {
    func apiRequest(_ url: String, _ method: String, _ output: @escaping(Data?, Error?) -> Void) {
        let request: URLRequest = RequestHelper().configure(url, method)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            output(data, error)
        }.resume()
    }
}
