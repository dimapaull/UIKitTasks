// PlaylistViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

/// Контроллер с плейлистом
final class PaylistViewController: UIViewController {
    // MARK: - Private Properties

    let playlist = [
        Track(name: "Let It Be", artist: "The Beatles", length: "04:03"),
        Track(name: "Yesterday", artist: "The Beatles", length: "02:05"),
        Track(name: "The Show Must Go On", artist: "Queen", length: "04:31")
    ]

    // MARK: - Actions

    @IBAction func openPlayer(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            openPlayer(track: playlist[0], image: sender.imageView?.image)
        case 1:
            openPlayer(track: playlist[1], image: sender.imageView?.image)
        case 2:
            openPlayer(track: playlist[2], image: sender.imageView?.image)
        default:
            break
        }
    }

    // MARK: - Private methods

    private func openPlayer(track: Track, image: UIImage?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let trackViewController = storyboard
            .instantiateViewController(withIdentifier: "playSong") as? TrackViewController
        else { return }
        trackViewController.choosedTrack = track
        trackViewController.choosedTrackImage = image
        print(track.name)
        do {
            if let audioPath = Bundle.main.path(forResource: track.name, ofType: "mp3") {
                trackViewController.player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                trackViewController.player.play()
                present(trackViewController, animated: true)
            }
        } catch {
            print("Error")
        }
    }
}
