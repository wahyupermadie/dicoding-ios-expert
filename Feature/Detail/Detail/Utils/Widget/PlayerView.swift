//
//  PlayerView.swift
//  Detail
//
//  Created by Wahyu Permadi on 16/02/21.
//

import UIKit
import AVFoundation
import AVKit

class PlayerView: UIView, UIGestureRecognizerDelegate {

    private let playerLayer = AVPlayerLayer()
    private var previewTimer: Timer?
    var player: AVPlayer
    var previewLength: Double
    @Published var isPlay: Bool = false
    init(frame: CGRect, url: URL, previewLength: Double) {
        self.previewLength = previewLength
        self.player = AVPlayer(url: url)
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
        player.volume = 0
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.backgroundColor = UIColor.black.cgColor
        previewTimer = Timer.scheduledTimer(withTimeInterval: previewLength, repeats: true, block: { (_) in
            self.player.seek(to: CMTime(seconds: 0, preferredTimescale: CMTimeScale(1)))
        })
        layer.addSublayer(playerLayer)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapHandler(_:)))
        tapGesture.delegate = self
        self.addGestureRecognizer(tapGesture)
    }
    required init?(coder: NSCoder) {
        self.previewLength = 15
        self.player = AVPlayer(url: URL(string: "")!)
        super.init(coder: coder)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    @objc func tapHandler(_ sender: UIGestureRecognizerDelegate) {
        if isPlay {
            self.isPlay = false
            player.pause()
        } else {
            self.isPlay = true
            player.play()
        }
    }
}
