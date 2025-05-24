//
//  CursoiOSApp.swift
//  CursoiOS
//
//  Created by Developer on 26/03/25.
//

import SwiftUI

@main
struct CursoiOSApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @Environment(\.scenePhase) var scenePhase
    
    init(){
        inicio()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView().preferredColorScheme(.dark)
        }.onChange(of: scenePhase) { oldPhase, newPhase in
            switch newPhase {
            case .active:
                print("Activo")
            case .inactive:
                print("Inactivo")
            case .background:
                print("En segundo plano")
            @unknown default:
                break
            }
        }
        
    }
    
    func inicio(){
        print("Inicio de la app")
    }
}
