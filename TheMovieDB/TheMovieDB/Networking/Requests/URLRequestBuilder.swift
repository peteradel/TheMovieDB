//
//  URLRequestBuilder.swift
//  TheMovieDB
//
//  Created by Peter Sorial on 11/12/18.
//  Copyright © 2018 NEUGELB STUDIOS. All rights reserved.
//

import Alamofire
import Foundation

protocol URLRequestBuilder: URLRequestConvertible {
    var baseURL: URL { get }
    var requestURL: URL { get }
    var path: String { get }
    
    var method: HTTPMethod { get }
    var headers: HTTPHeaders { get }
    var params: Parameters? { get }
    var encoding: ParameterEncoding { get }
    
    var request: URLRequest { get }
}

extension URLRequestBuilder {
    var baseURL: URL {
        // Change server marin url here based on enviroment ex:{Development, Live}
        return URL(string: NetworkURLs.serverBaseURL)!
    }
    
    var requestURL: URL {
        return baseURL.appendingPathComponent(path)
    }
    
    var headers: HTTPHeaders {
        return HTTPHeaders()
    }
    
    var defaultParams: Parameters {
        var params = Parameters()
        params[NetworkKyes.apiKey] = NetworkValues.apiValue
        params[NetworkKyes.lang] = Locale.preferredLanguages[0] // Response language will be based on device language
        return params
    }
    
    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    var request: URLRequest {
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        headers.forEach { request.addValue($1, forHTTPHeaderField: $0) }
        return request
    }
    
    func asURLRequest() throws -> URLRequest {
        return try encoding.encode(request, with: params)
    }
}
