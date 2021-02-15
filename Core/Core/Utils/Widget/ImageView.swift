//
//  ImageView.swift
//  Core
//
//  Created by Wahyu Permadi on 15/02/21.
//

import SwiftUI
import SDWebImageSwiftUI

public struct ImageView: View {
    private let url: String
    public init(url: String) {
        self.url = url
    }
    public var body: some View {
        GeometryReader { geo in
            WebImage(url: URL(string: self.url))
                .resizable()
                .indicator(.activity)
                .clipped()
                .scaledToFill()
                .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: "https://blckbirds.com/wp-content/uploads/2020/09/Screenshot-2020-09-25-at-19.06.17-1024x640.png")
    }
}
