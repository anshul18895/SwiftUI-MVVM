//
//  AppDelegate.swift
//  SwiftUI-MVVM
//
//  Created by Anshul on 16/01/20.
//  Copyright © 2020 Anshul Shah. All rights reserved.
//

import UIKit
import Combine
import Alamofire

let Application = UIApplication.shared.delegate as! AppDelegate

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var reachability = Reachability()!
    
    private var movieListPipeLine: AnyPublisher<MovieResponse,APIError>?
    private var cancellable: AnyCancellable?
        

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        
    movieListPipeLine = APIManager.shared.callRequest(.getMovieList(["api_key":Environment.MOVIEDB_APIKEY(), "page": 1]), parseTo: MovieResponse.self)

       cancellable =  movieListPipeLine?.sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    fatalError(error.localizedDescription)
                }
            }, receiveValue: { value in
                print(value)
            })
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    // MARK: Reachability Observer
    
    func internetConnectionCheck(){
        reachability.whenReachable = { reachability in
            DispatchQueue.main.async {
                print("Reachable via internet")
            }
        }
        reachability.whenUnreachable = { reachability in
            DispatchQueue.main.async {
                print("Not reachable")
            }
        }
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    
}

