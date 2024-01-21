//
//  ScreenTimeDemoReportExtension.swift
//  ScreenTimeDemoReportExtension
//
//  Created by David Osemwegie on 2024-01-21.
//

import DeviceActivity
import SwiftUI

@main
struct ScreenTimeDemoReportExtension: DeviceActivityReportExtension {
    var body: some DeviceActivityReportScene {
        // Create a report for each DeviceActivityReport.Context that your app supports.
        TotalActivityReport { totalActivity in
            TotalActivityView(totalActivity: totalActivity)
        }
        // Add more reports here...
    }
}
