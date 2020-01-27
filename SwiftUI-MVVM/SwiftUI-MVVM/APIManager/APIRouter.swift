//
//  APIRouter.swift
//  SwiftUI-MVVM
//
//  Created by Anshul on 17/01/20.
//  Copyright © 2020 Anshul Shah. All rights reserved.
//

import Foundation
import Alamofire
public typealias APIParameters = [String: Any]

protocol Routable {
    var path       : URL { get }
    var method     : HTTPMethod { get }
    var parameters : [String: Any]? { get }
}

// This the all objects of the all the routes

public enum APIRouter: Routable {
    case getMovieList(APIParameters)
    case getMovieDetails(movieId: String, param: APIParameters)
}



extension APIRouter {
    var path: URL {
        
        // Add base url for the request
        let baseURL:String = {
            return Environment.APIBasePath()
        }()
        
        let apiVersion: String? = {
            return Environment.APIVersionPath()
        }()
        
        // build up and return the URL for each endpoint
        let relativePath: String? = {
            switch self {
            case .getMovieList:
                return "discover/movie"
            case .getMovieDetails(let id, _):
                return "movie/\(id)"
            }
        }()
        
        var urlWithAPIVersion = baseURL
        if let apiVersion = apiVersion {
            urlWithAPIVersion = urlWithAPIVersion + apiVersion
        }
        
        var url = URL(string: urlWithAPIVersion)!
        if let relativePath = relativePath {
            url = url.appendingPathComponent(relativePath)
        }
        return url
    }
}



extension APIRouter {
    var method: HTTPMethod {
        switch self {
        case .getMovieDetails,.getMovieList:
            return .get
        }
    }
}

extension APIRouter {
    var parameters: [String: Any]? {
        switch self {
        case .getMovieList(let parameters):
            return parameters
        default:
            return [:]
        }
    }
}


