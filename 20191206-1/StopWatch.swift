//
//  StopWatch.swift
//  20191206
//
//  Created by airy on 2019/12/06.
//  Copyright © 2019 airy. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

// 1.
class Stopwatch: ObservableObject {
    // 2.
    @Published var counter: Int = 0
    
    var timer = Timer()
    
    // 3.
    func start() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.counter += 1
        }
    }
    
    // 4.
    func stop() {
        timer.invalidate()
    }
    
    // 5.
    func reset() {
        counter = 0
        timer.invalidate()
    }
}
