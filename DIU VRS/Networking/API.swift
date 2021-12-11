//
//  API.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/10/21.
//

import Foundation

class Networking {
    
    // get request
    static func getRequest<T: Codable>(url: URL?, token: String? = nil, expecting: T.Type, completion: @escaping (Result<T, Error>) -> Void) {

        guard let url = url else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(token ?? "")", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else { return }

            let response = Result {
                try JSONDecoder().decode(T.self, from: data)
            }
            completion(response)
        }
        .resume()
    }
        
    
    // login post request
    static func loginRequest<T: Codable>(url: URL?, expecting: T.Type, email: String, password: String, completion: @escaping ((Result<T, Error>) -> Void)) {
        
        guard let url = url else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: AnyHashable] = [
            "email": email,
            "password": password
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else { return }
            
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                //print(response)
                completion(.success(response))
            }
            catch {
                completion(.failure(error))
            }
        }
        .resume()
    }
    
    
    
    // Registration request
    static func registrationRequest<T: Codable>(url: URL?, expecting: T.Type, name: String, email: String, phone: String, password: String, completion: @escaping ((Result<T, Error>) -> Void)) {
        
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
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else { return }
            
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                //print(response)
                completion(.success(response))
            }
            catch {
                completion(.failure(error))
            }
        }
        .resume()
    }
    
    
    
    // create venue request
    static func createVenueRequest<T: Codable>(url: URL?, expecting: T.Type, rentAmount: String, seatingCapacity: String, venueInfo: String, venueLocation: String, venueName: String, completion: @escaping ((Result<T, Error>) -> Void)) {
        
        guard let url = url else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: AnyHashable] = [
            "rentAmount": rentAmount,
            "seatingCapacity": seatingCapacity,
            "venueInfo": venueInfo,
            "venueLocation": venueLocation,
            "venueName": venueName
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else { return }
            
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                //print(response)
                completion(.success(response))
            }
            catch {
                completion(.failure(error))
            }
        }
        .resume()
    }
    
    
    
    // reserve venue post request
    static func reserveVenueRequest<T: Codable>(url: URL?, expecting: T.Type, token: String? = nil, name: String, phone: String, date: Int, month: Int, venueId: Int, completion: @escaping ((Result<T, Error>) -> Void)) {
        
        guard let url = url else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token ?? "")", forHTTPHeaderField: "Authorization")
        
        let body: [String: AnyHashable] = [
            "date": date,
            "month": month,
            "reserversName": name,
            "reserversPhoneNo": phone,
            "venueId": venueId,
            "slot" : "ALL"
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else { return }
            
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                //print(response)
                completion(.success(response))
            }
            catch {
                completion(.failure(error))
            }
        }
        .resume()
    }
    
    
}
