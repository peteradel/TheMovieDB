//
//  NetworkManager.swift
//  TheMovieDB
//
//  Created by Peter Sorial on 11/12/18.
//  Copyright © 2018 NEUGELB STUDIOS. All rights reserved.
//

import Alamofire
import UIKit

class NetworkManager {
    static func request<T: Codable>(request: URLRequestConvertible, withResponseType responseType: T.Type, completionHandler: @escaping (T?) -> Void) {
        Alamofire.request(request).responseJSON { response in

            if let data = response.data {
                do {
                    completionHandler(try JSONDecoder().decode(responseType, from: data))
                } catch let error {
                    Logger.logException(exception: error)
                    completionHandler(nil)
                }
            } else {
                completionHandler(nil)
            }
        }
    }
}
