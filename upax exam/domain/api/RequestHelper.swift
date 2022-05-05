//
//  RequestHelper.swift
//  upax exam
//
//  Created by Sergio García Vargas on 04/05/22.
//

import Foundation

class RequestHelper {
    func configure(_ url: String, _ method: String) -> URLRequest {
        let urlString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        var request: URLRequest = URLRequest(url: URL(string: urlString!)!, timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Client-ID saRMvPxVD5Z683IGRRHM-kdj0HRPYQGGXytMrdjc6kg", forHTTPHeaderField: "Authorization")
        request.httpMethod = method
        return request
    }
}
