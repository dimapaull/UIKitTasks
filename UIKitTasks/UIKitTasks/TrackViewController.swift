// TrackViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

/// Информация о треке с плеером
final class TrackViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet private var trackNameLabel: UILabel!
    @IBOutlet private var trackSlider: UISlider!
    @IBOutlet private var trackAuthorLabel: UILabel!
    @IBOutlet private var trackImage: UIImageView!
    @IBOutlet private var trackLength: UILabel!
    @IBOutlet private var playButton: UIButton!
    @IBOutlet private var nextButton: UIButton!
    @IBOutlet private var prevButton: UIButton!

    // MARK: - Public Properties

    var choosedTrack = Track()
    var choosedTrackImage: UIImage?
    var player = AVAudioPlayer()

    // MARK: - Private Properties

    private var timer = Timer()
    private var namesOfSongs = [
        PlayList.track1.name,
        PlayList.track2.name,
        PlayList.track3.name
    ]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        settingSliders()
        updateDataOnScreen()
    }

    // MARK: - Private Methods

    private func setupUI() {
        trackNameLabel.text = choosedTrack.name
        trackImage.image = choosedTrackImage
        trackAuthorLabel.text = choosedTrack.artist
        trackLength.text = "-\(choosedTrack.length)"
    }

    /// Установка минимального и максимального значения слайдера
    private func settingSliders() {
        trackSlider.minimumValue = 0.0
        trackSlider.maximumValue = Float(player.duration)
    }

    private func updateDataOnScreen() {
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(relodeTime),
            userInfo: nil,
            repeats: true
        )
    }

    // MARK: - IBActions

    @IBAction func nextTrack(_ sender: UIButton) {
        if trackNameLabel.text == PlayList.track1.name {
            trackImage.image = UIImage(named: PlayList.track2.name)
            trackNameLabel.text = PlayList.track2.name
            trackAuthorLabel.text = PlayList.track2.artist
            playButton.setImage(UIImage.pause, for: .normal)
            if let audioPath = Bundle.main.path(forResource: namesOfSongs.last, ofType: "mp3") {
                do {
                    player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                    player.play()
                } catch {
                    print("Erorr")
                }
            }
        } else {
            trackImage.image = UIImage(named: PlayList.track2.name)
            trackNameLabel.text = PlayList.track2.name
            trackAuthorLabel.text = PlayList.track2.artist
            playButton.setImage(UIImage.play, for: .normal)
            if let audioPath = Bundle.main.path(forResource: namesOfSongs.first, ofType: "mp3") {
                do {
                    player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                    player.play()
                } catch {
                    print("Erorr")
                }
            }
        }
    }

    @IBAction func playPress(_ sender: UIButton) {
        if player.isPlaying {
            player.pause()
            sender.setImage(.play, for: .normal)
        } else {
            player.play()
            sender.setImage(.pause, for: .normal)
        }
    }

    @IBAction func sliderSongChanged(_ sender: UISlider) {
        if sender == trackSlider {
            player.currentTime = TimeInterval(sender.value)
        }
    }

    @IBAction func closePress(_ sender: Any) {
        dismiss(animated: true)
        player.pause()
    }

    @objc private func relodeTime() {
        let allTime = player.currentTime - player.duration
        let minutes = Int(allTime / 60)
        let seconds = -Int(allTime.truncatingRemainder(dividingBy: 60))
        trackLength.text = NSString(format: "%02d:%02d", minutes, seconds) as String
        trackSlider.setValue(Float(player.currentTime), animated: true)
    }
}
