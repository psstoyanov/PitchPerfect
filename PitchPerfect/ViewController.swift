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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        print("View Will Appear");
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(_ sender: Any) {
        print("Record Button was pressed!");
        recordingLabel.text = "In Progress";
    }
    @IBAction func stopRecordingAudio(_ sender: Any) {
        print("Stop Recording");
    }
    
    
}

