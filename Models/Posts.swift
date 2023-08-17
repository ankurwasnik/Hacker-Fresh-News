//
//  Posts.swift
//  H4kr News
//
//  Created by Ankur Wasnik on 15/08/23.
//

import Foundation
struct Post: Decodable, Identifiable {
    //computed property is declared by var
    var id: String?{
        return objectID
    }
    let postId: String?
    let title: String?
    let author: String?
    let url: String?
    let objectID: String?
    let points: Int?
}

struct Result: Decodable{
    let hits: [Post]
}
