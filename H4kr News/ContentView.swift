//
//  ContentView.swift
//  H4kr News
//
//  Created by Ankur Wasnik on 15/08/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts){ post in
                NavigationLink(destination: DetailView(urlString: post.url!)){
                    PostView(post: post)
                }
            }
            .navigationTitle("Today's News")
          
        }
        .onAppear{
            networkManager.fetch()
        }
    }
}

struct PostView: View{
    let post: Post
    var body: some View{
        HStack{
            Text("\(post.points!)")
                .bold()
            Text("\(post.title!)")
                .padding()
            
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
