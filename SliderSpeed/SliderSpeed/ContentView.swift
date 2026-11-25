//
//  ContentView.swift
//  SliderSpeed
//
//  Created by RMP on 15/06/1448 AH.
//

import SwiftUI


struct ContentView: View {
    
    // first slider
    @State var counter: Double = 0.0
    @State var downloadFinish: Bool = false
    
    // second slider
    @State var secondCounter: Double = 0.0
    @State var secondDownloadFinish: Bool = false
    @State var triggerNextDownload: Bool = false
    
    // third slider
    @State var thirdCounter: Double = 0.0
    @State var thirdDownloadFinish: Bool = false
    @State var triggerThirdNextDownload: Bool = false
    
    // fourth slider
    @State var fourthCounter: Double = 0.0
    @State var fourthDownloadFinish: Bool = false
    @State var triggerFourthNextDownload: Bool = false
    
    // fifth slider
    @State var fifthCounter: Double = 0.0
    @State var fifthDownloadFinish: Bool = false
    @State var triggerFifthNextDownload: Bool = false
    
    // sixth slider
    @State var sixthCounter: Double = 0.0
    @State var sixthDownloadFinish: Bool = false
    @State var triggerSixthNextDownload: Bool = false
    
    // seventh slider
    @State var seventhCounter: Double = 0.0
    @State var seventhDownloadFinish: Bool = false
    @State var triggerSeventhNextDownload: Bool = false
    
    
    var body: some View {
        
        VStack {
            
            // MARK: FIRST SLIDER
            VStack(spacing: 0) {
                
                withAnimation(.default) {
                    Slider(value: $counter, in: 0...100).disabled(true)
                }
                Text(downloadFinish ? "Complete Download" : "Downloading: \(counter.formatted())%").font(.footnote)
                
                
            }
            .padding().onAppear {
                
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                    
                    withAnimation(.default) {
                        counter += 1
                    }
                    
                    if counter == 100 {
                        
                        timer.invalidate()
                        downloadFinish = true
                        triggerNextDownload = true
                        
                    }
                    
                }
                
            }
            
            
            // MARK: SECOND SLIDER
            VStack(spacing: 0) {
                
                withAnimation(.default) {
                    Slider(value: $secondCounter, in: 0...100).disabled(true)
                }
                Text(secondDownloadFinish ? "Complete Download" : "Downloading: \(secondCounter.formatted())%").font(.footnote)
                
                
            }.padding().onChange(of: triggerNextDownload) { newValue in
                
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                    
                    withAnimation(.default) {
                        secondCounter += 1
                    }
                    
                    if secondCounter == 100 {
                        
                        timer.invalidate()
                        secondDownloadFinish = true
                        triggerThirdNextDownload = true
                        
                    }
                    
                }
                
            }
            
            // MARK: THIRD SLIDER
            VStack(spacing: 0) {
                
                withAnimation(.default) {
                    Slider(value: $thirdCounter, in: 0...100).disabled(true)
                }
                Text(thirdDownloadFinish ? "Complete Download" : "Downloading: \(thirdCounter.formatted())%").font(.footnote)
                
                
            }.padding().onChange(of: triggerThirdNextDownload) { newValue in
                
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                    
                    withAnimation(.default) {
                        thirdCounter += 1
                    }
                    
                    if thirdCounter == 100 {
                        
                        timer.invalidate()
                        thirdDownloadFinish = true
                        triggerFourthNextDownload = true
                    }
                    
                }
                
            }
            
            
            // MARK: FOURTH SLIDER
            VStack(spacing: 0) {
                
                withAnimation(.default) {
                    Slider(value: $fourthCounter, in: 0...100).disabled(true)
                }
                Text(fourthDownloadFinish ? "Complete Download" : "Downloading: \(fourthCounter.formatted())%").font(.footnote)
                
                
            }.padding().onChange(of: triggerFourthNextDownload) { newValue in
                
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                    
                    withAnimation(.default) {
                        fourthCounter += 1
                    }
                    
                    if fourthCounter == 100 {
                        
                        timer.invalidate()
                        fourthDownloadFinish = true
                        
                    }
                    
                }
                
            }
            
            Spacer()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



class SpeedSettigns: ObservableObject {
    
    @Published var speed: CGFloat = 0.0
    
}


struct SliderSpeedView: View {
    
    @EnvironmentObject var speedSetting: SpeedSettigns
    
    var body: some View {
        
        Slider(value: $speedSetting.speed, in: 0...100)
        
    }
    
}

struct TextSettingsView: View {
    
    @EnvironmentObject var textSettings: SpeedSettigns
    
    var body: some View {
        
        Text("the value is: \(textSettings.speed.formatted())")
        
    }
    
}
