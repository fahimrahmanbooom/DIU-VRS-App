//
//  API.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/10/21.
//

import Foundation

class Networking {
    
    // get request
    static func getRequest<T: Codable>(url: URL?, expecting: T.Type, completion: @escaping (Result<T, Error>) -> Void) async {
        
        guard let url = url else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedData = try? JSONDecoder().decode(T.self, from: data) {
                completion(.success(decodedData))
            }
        }
        catch {
            completion(.failure(error))
        }
    }
    
    
    // Login post request
    static func loginRequest<T: Codable>(completion:@escaping ((Result<T, Error>) -> Void), url: URL?, email: String, password: String) async {
        
        guard let url = url else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: AnyHashable] = [
            "email": email,
            "password": password
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let response = try? JSONDecoder().decode(T.self, from: data) {
                completion(.success(response))
            }
        }
        catch {
            completion(.failure(error))
        }
    }
    
    
    
    // Registration post request
    static func registrationRequest<T: Codable>(url: URL?, expecting: T.Type, name: String, email: String, phone: String, password: String, completion: @escaping ((Result<T, Error>) -> Void)) async {
        
        guard let url = url else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: AnyHashable] = [
            "name": name,
            "email": email,
            "phoneNo": phone,
            "password": password
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let response = try? JSONDecoder().decode(T.self, from: data) {
                completion(.success(response))
            }
        }
        catch {
            completion(.failure(error))
        }
    }
}

