//
//  DetailView.swift
//  H4kr News
//
//  Created by Ankur Wasnik on 17/08/23.
//

import SwiftUI
import WebKit

struct DetailView: View {
    var urlString: String?
    var body: some View {
        WebView(of: urlString)
    }
}

struct WebView: UIViewRepresentable {
    let urlString: String?
    
    init(of _urlString: String?){
        self.urlString = _urlString
    }
    
    func makeUIView(context: Context) -> WKWebView{
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeURLString = urlString {
            if let url = URL(string: safeURLString){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
            
        }
    }
    
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(urlString: "https://www.google.com")
    }
}
