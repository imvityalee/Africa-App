//
//  VideoPlayerHelper.swift
//  Africa-App
//
//  Created by Victor Lee on 12/7/21.
//

import Foundation
import AVKit

private var videoPlayer: AVPlayer?

public func playVideo(fileName: String,
               fileFormat: String) -> AVPlayer {
    if Bundle.main.url(forResource: fileName,
                       withExtension: fileFormat) != nil {
        videoPlayer = AVPlayer(
            url: Bundle.main.url(forResource: fileName,
                                 withExtension: fileFormat)!)
        videoPlayer?.play()
    }
    return videoPlayer!
}
