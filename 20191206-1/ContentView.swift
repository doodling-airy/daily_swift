//
//  ContentView.swift
//  20191206
//
//  Created by airy on 2019/12/06.
//  Copyright © 2019 airy. All rights reserved.
//

import SwiftUI
/*
struct ContentView: View {
    // 1.
    @ObservedObject var stopwatch = Stopwatch()
    
    var body: some View {
        VStack {
            HStack {
                // 2.
                Button(action: {
                    self.stopwatch.start()
                }) {
                    Text("Start")
                }
                
                Button(action: {
                    self.stopwatch.stop()
                }) {
                    Text("Stop")
                }
                Button(action: {
                    self.stopwatch.reset()
                }) {
                    Text("Reset")
                }
            }
            // 3.
            Text("\(self.stopwatch.counter)")
        }.font(.largeTitle)
    }
}
*/

struct ContentView: View {
    @ObservedObject var user = viewmodel()
    
    var body: some View {
        VStack {
            Text("\(user.name)")
            Button(action: {
                self.user.initialize()
            }) {
                Text("init")
            }
            Button(action: {
                self.user.allshow()
            }) {
                Text("show")
            }
            
            
            Button(action: {
                self.user.callchange()
            }) {
                Text("change")
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
