//
//  NetworkManager.swift
//  H4kr News
//
//  Created by Ankur Wasnik on 15/08/23.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var posts: [Post]
    init() {
        posts = [Post]()
    }
    func fetch(){
        let url:URL = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page")!
        let urlSession = URLSession(configuration: .default)
        let task = urlSession.dataTask(with: url){(data,response,error) in
            if(error==nil){
                if let safeData = data {
                    do{
                        let decoder = JSONDecoder()
                        let results = try decoder.decode(Result.self, from: safeData)
                        //async task to fetch posts
                        DispatchQueue.main.async {
                            self.posts = results.hits
                        }
                    }catch{
                        print(error)
                    }
                }
            }
        }
        task.resume()
    }
}

