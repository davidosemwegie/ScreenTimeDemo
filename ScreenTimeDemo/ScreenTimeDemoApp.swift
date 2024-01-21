//
//  ScreenTimeDemoApp.swift
//  ScreenTimeDemo
//
//  Created by David Osemwegie on 2024-01-21.
//

import SwiftUI
import FamilyControls
import DeviceActivity

@main
struct ScreenTimeDemoApp: App {
    
    let center = AuthorizationCenter.shared
    @State private var context: DeviceActivityReport.Context = .init(rawValue: "Total Activity")

    @State private var filter = DeviceActivityFilter(
            segment: .daily(
                during: Calendar.current.dateInterval(
                   of: .day, for: .now
                )!
            ),
            users: .all,
            devices: .init([.iPhone, .iPad])
        )
    
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                DeviceActivityReport(context, filter: filter)
            }
            .onAppear {
                Task {
                    do {
                        try await center.requestAuthorization(for: .individual)
                    } catch {
                        print("Failed to enroll Aniyah with error: \(error)")
                    }
                }
            }
        }
    }
}
