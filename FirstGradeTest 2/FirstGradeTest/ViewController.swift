//
//  ViewController.swift
//  FirstGradeTest
//
//  Created by 이가영 on 2020/06/04.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer!
    var timer: Timer!
    
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var progcessSlider: UISlider!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var albumCoverImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.intializePlayer()
    }
    
    // 음악 세팅 + 슬라이더 초기화, 설정
    func intializePlayer() {
        // 음악파일 예외처리문
        guard let soundAsset = NSDataAsset(name: "With You") else {
            print("음원 파일 에셋을 가져올 수 없습니다")
            return
        }

        // 예외처리 do-catch
        do {
            try player = AVAudioPlayer(data: soundAsset.data)
            player.delegate = self
        } catch let error as NSError {
            print("플레이어 초기화 실패")
            print("코드 : \(error.code), 메세지 : \(error.localizedDescription)")
        }
        
        // 슬라이더 설정
        // 총 재생시간을 슬라이더에 저장
        progcessSlider.maximumValue = Float(player.duration)
        // 처음 시작시간을 슬라이더에 저장
        progcessSlider.minimumValue = 0
        // 슬라이더의 값을 음악파일의 현재시간을 저장
        progcessSlider.value = Float(player.currentTime)
    }
    
    // 재생되는 초 업데이트하는 함수
    func updateTimeLabelText(time: TimeInterval){ // TimeInterval : 시간간격
        let minute = Int(time/60) //100
        let second = Int(time.truncatingRemainder(dividingBy: 60)) // time % 60
        
        let timeText = String(format: "%02ld:%02ld", minute, second)
        
        timeLabel.text = timeText
    }
    
    // 슬라이더에서 재생될 수 있게 만드는 함수
    func makeAndFireTimer(){
        // 1초마다 반복해서 슬라이더 추적
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            if self.progcessSlider.isTracking {
                print("block excuted")
                return
            }
            self.updateTimeLabelText(time: self.player.currentTime)
            self.progcessSlider.value = Float(self.player.currentTime)
        })
        timer.fire()
    }
    
    // 타이머 해제, 음악 일시정지
    func invalidateTimer(){
        timer.invalidate()
        timer = nil
    }

    // 버튼을 눌렀을 때 action
    @IBAction func touchUpPlayBtn(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            // 음악 재생
            player?.play()
            makeAndFireTimer()
        } else {
            // 음악 멈춤
            player?.pause()
            invalidateTimer()
        }
    }
    
    // 슬라이더를 움직였을 때 action
    @IBAction func sliderValueChange(_ sender: UISlider) {
        updateTimeLabelText(time: TimeInterval(sender.value))
        if sender.isTracking { return }
        player.currentTime = TimeInterval(sender.value)
    }
}

// 델리게이트 메서드
extension ViewController: AVAudioPlayerDelegate {
    // 오류
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        guard let error: Error = error else {
            print("오디오 플레이어 디코드 오류 발생")
            return
        }

        let message: String
        message = "오디오 플레이어 오류 발생 \(error.localizedDescription)"

        let alert: UIAlertController = UIAlertController(title: "알림", message: message, preferredStyle: UIAlertController.Style.alert)

        let okAction: UIAlertAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction)-> Void in
            self.dismiss(animated: true, completion: nil)
        })
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }

    // 노래가 끝나면 다시 00:00으로 돌려놓기
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        playPauseButton.isSelected = false
        progcessSlider.value = 0
        updateTimeLabelText(time: 0)
        invalidateTimer()
    }
}
