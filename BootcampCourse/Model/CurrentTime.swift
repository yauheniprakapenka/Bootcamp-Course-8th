//
//  CurrentTime.swift
//  BootcampCourse
//
//  Created by yauheni prakapenka on 02.01.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import Foundation

class CurrentTime {
    enum Time {
        case second, minute, hour
    }
    
    private func getTime(time: Time) -> String {
        var result = ""
        
        switch time {
        case .second:
            result = String(Calendar.current.component(.second, from: Date()))
        case .minute:
            result = String(Calendar.current.component(.minute, from: Date()))
        case .hour:
            result = String(Calendar.current.component(.hour, from: Date()))
        }
        
        guard result.count == 1 else {
            return result
        }

        return "0" + result
    }
    
    func getCurrentTime() -> String {
        return "\(getTime(time: .hour)):\(getTime(time: .minute)):\(getTime(time: .second))"
    }
}
