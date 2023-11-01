//
//  AsyncImageView.swift
//  Comcast
//
//  Created by Hanh Vo on 10/25/23.
//

import SwiftUI

struct ImageView: View {
    @State var urlString: String
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipped()
        } placeholder: {
            ProgressView() // Show a progress view while the image is loading
        }
    }
}


#Preview {
    ImageView(urlString:  "https://www.ccn.com/wp-content/uploads/2020/02/shutterstock_785518696.jpg")
        
}
