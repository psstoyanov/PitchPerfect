//
//  ViewController.swift
//  PitchPerfect
//
//  Created by PakoSt on 2/20/18.
//  Copyright © 2018 PakoSt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
    }
    @IBAction func stopRecordingAudio(_ sender: Any) {
        recordingLabel.text = "Tap To Record";
        recordButton.isEnabled = true;
        stopRecordingButton.isEnabled = false;
        
    }
    
    
}

