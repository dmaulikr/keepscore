//
//  InterfaceController.swift
//  KeepScore WatchKit Extension
//
//  Created by Jeff Kempista on 8/17/15.
//  Copyright © 2015 Jeff Kempista. All rights reserved.
//

import WatchKit
import Foundation


class MatchInterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        if let workoutSession = context as? WorkoutSessionContext {
            self.setTitle(workoutSession.activityType.getTitle())
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
