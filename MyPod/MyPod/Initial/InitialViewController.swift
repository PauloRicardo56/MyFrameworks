//
//  InitialViewController.swift
//  MyPod
//
//  Created by Paulo Ricardo de Araujo Vieira on 20/12/22.
//

import Foundation
import UIKit

public final class InitialViewController: UIViewController {

    public override func viewDidLoad() {
        super.viewDidLoad()
        #if DEBUG_URL_AS_CURL
        view.backgroundColor = .blue
        #endif
    }
}
