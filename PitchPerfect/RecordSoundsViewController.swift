//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by PakoSt on 2/20/18.
//  Copyright © 2018 PakoSt. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsVewController: UIViewController, AVAudioRecorderDelegate {
    
    var audioRecorder: AVAudioRecorder!

    @IBOutlet weak var recordingLabel: UILabel!
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("View Did Load");
        
        recordingLabel.text = "Tap To Record";
        recordButton.isEnabled = true;
        stopRecordingButton.isEnabled = false;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(_ sender: Any) {
        recordingLabel.text = "In Progress";
        recordButton.isEnabled = false;
        stopRecordingButton.isEnabled = true;
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String;
        let recordingName = "recordedVoice.wav";
        let pathArray = [dirPath, recordingName];
        let filePath = URL(string: pathArray.joined(separator: "/"));
        
        
        let session = AVAudioSession.sharedInstance();
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker);
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:]);
        audioRecorder.delegate = self;
        audioRecorder.isMeteringEnabled = true;
        audioRecorder.prepareToRecord();
        audioRecorder.record();
    }
    @IBAction func stopRecordingAudio(_ sender: Any) {
        recordingLabel.text = "Tap To Record";
        recordButton.isEnabled = true;
        stopRecordingButton.isEnabled = false;
        
        audioRecorder.stop();
        let audioSession = AVAudioSession.sharedInstance();
        try! audioSession.setActive(false);
    }
    
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print("finished recording");
    }
    
}

