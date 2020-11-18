//
//  ContentView.swift
//  123
//
//  Created by User17 on 2020/11/18.
//

import SwiftUI

struct NetworkImage: View
{
  
    var urlString: String
    @State private var image = Image(systemName: "photo")
    @State private var downloadImageOk = false
    func downLoad()
    {
        if let url = URL(string: urlString),
         let data = try? Data(contentsOf: url),
          let uiImage = UIImage(data: data)
          {
            image = Image(uiImage: uiImage)
            downloadImageOk = true
          }
    }
    var body: some View
    {
        Button(action: {
            print("NEW")
    
            downLoad()
         
         }) {//button
            HStack {
               Image(systemName: "magnifyingglass")
               Text("NEW PICTURE")
               Image(systemName: "magnifyingglass")
            }
            .foregroundColor(.red)
            .background(Color.yellow)
         }//button
        
        image.resizable()
          .onAppear
          {
               if downloadImageOk == false {
                  downLoad()
               }
          }
        
    }
}
  

struct NetworkImage_Previews: PreviewProvider {
    static var previews: some View {
        NetworkImage(urlString: "https://picsum.photos/200/300")
    }
}
