//
//  SchedulerHelper.swift
//  Test
//
//  Created by Suriya on 28/9/2565 BE.
//

import Foundation
class SchedulerHelper {
    
     var timerInSeconds : TimeInterval {
        60
    }
     var timer : Timer?
    
    static let shared = SchedulerHelper()
    private init(timer: Timer? = nil) {
        self.timer = timer
    }
}

extension SchedulerHelper {
    public func stopScheduler(){
        if let _ = self.timer {
            self.timer!.invalidate()
        }
    }
    public func startScheduler(){
        self.stopScheduler()
        timer = Timer.scheduledTimer(
            timeInterval: timerInSeconds,
            target: self,
            selector: #selector(timeToRefresh),
            userInfo: nil,
            repeats: true)
    }
    @objc func timeToRefresh(){
        NotificationCenter.default.post(name: .CNReceiveRefresh , object: nil)
    }

}
