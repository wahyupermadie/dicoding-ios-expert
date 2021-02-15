//
//  LoadingView.swift
//  Core
//
//  Created by Wahyu Permadi on 15/02/21.
//

import Foundation
import SwiftUI

public struct LoadingView: UIViewRepresentable {
    public init() {
        
    }
    public func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}

    public func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .medium)
        view.startAnimating()
        return view
    }
}
