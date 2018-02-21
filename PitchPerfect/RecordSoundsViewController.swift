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

    // MARK: IBOtlets
    @IBOutlet weak var recordingLabel: UILabel!
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    // MARK: RecordingState (raw values correspond to sender tags)
    
    enum RecordingState { case recording, notRecording }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureRecordUI(.notRecording);
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func recordAudio(_ sender: Any) {
        configureRecordUI(.recording);
        
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
        configureRecordUI(.notRecording);
        
        audioRecorder.stop();
        let audioSession = AVAudioSession.sharedInstance();
        try! audioSession.setActive(false);
    }
    
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if( flag) {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else
        { print("Recording was not successful"); }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "stopRecording"){
            let playSoundsVC = segue.destination as! PlaySoundsViewController;
            let recordedAudioURL = sender as! URL;
            playSoundsVC.recordedAudioURL = recordedAudioURL;
            
        }
    }
    
    func configureRecordUI(_ recordingState: RecordingState){
        switch(recordingState) {
        case .recording:
            recordButton.isEnabled = false;
            stopRecordingButton.isEnabled = true;
            recordingLabel.text = "In Progress";

        case .notRecording:
            recordButton.isEnabled = true;
            stopRecordingButton.isEnabled = false;
            recordingLabel.text = "Tap To Record";

        }
    }
    
}

