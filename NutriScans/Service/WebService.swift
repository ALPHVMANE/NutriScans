//
//  WebService.swift
//  NutriScans
//
//  Created by Ace of Heart on 2025-11-16.
//

import Foundation

enum HTTPMethod: String {
    case GET, PUT, POST, DELETE
}

    class WebService{
        
        func sendRequest<T: Codable> (toUrl: String, method: HTTPMethod, body: T? = nil) async -> T?{ // T : Template asynchronous function
            do{
                guard let url = URL(string: toUrl) else { throw NetworkError.badUrl }
                
                //create request
                var request = URLRequest(url: url)
                request.httpMethod = method.rawValue
                
                //check for body
                if let body = body {
                    request.httpBody = try JSONEncoder().encode(body)
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                }
                
                let (data, response) = try await URLSession.shared.data(for: request)
                
                guard let response = response as? HTTPURLResponse else{
                    throw NetworkError.badStatus
                }
                print("URL : \(toUrl) Status Code: [\(response.statusCode)]")
                
                return try JSONDecoder().decode(T.self, from: data) // return the data or nil
                
                
            }catch{
                print("Request Failed: \(error.localizedDescription)")
                return nil // empty response
            }
        }
        
        func downloadData<T: Codable>(fromURL: String) async -> T? {
            do {
                guard let url = URL(string: fromURL) else { throw NetworkError.badUrl }
                
                let (data, response) = try await URLSession.shared.data(from: url)

                guard let response = response as? HTTPURLResponse else { throw NetworkError.badResponse }
                
                guard response.statusCode >= 200 && response.statusCode < 300 else {
                    print("HTTP Status Code:", response.statusCode)
                    throw NetworkError.badStatus }
                
                guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else { throw NetworkError.failedToDecodeResponse }
                
                return decodedResponse
                
            } catch NetworkError.badUrl {
                print("There was an error creating the URL")
            } catch NetworkError.badResponse {
                print("Did not get a valid response")
                
            } catch NetworkError.badStatus {
                print("Did not get a 2xx status code from the response")
            } catch NetworkError.failedToDecodeResponse {
                print("Failed to decode response into the given type")
            } catch {
                print("An error occured downloading the data")
            }
            
            return nil
        }
    }
