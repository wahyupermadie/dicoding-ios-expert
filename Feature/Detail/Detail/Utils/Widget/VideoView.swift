//
//  VideoView.swift
//  Detail
//
//  Created by Wahyu Permadi on 16/02/21.
//

import SwiftUI
import AVFoundation
import AVKit

struct VideoView: UIViewRepresentable {
    
    var videoURL:URL
    var previewLength:Double?
    func makeUIView(context: Context) -> UIView {
        return PlayerView(frame: .zero, url: videoURL, previewLength: previewLength ?? 15)
    }
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}
