//
//  ContentView.swift
//  YOLO
//
//  Created by Jonathan Nguyen on 10/14/21.
//

import SwiftUI
import SCSDKCreativeKit
import SCSDKLoginKit
import SCSDKCoreKit

struct LoginView: View {
    @State var isPresented = false
    @State var connected = false
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient:Gradient(colors:[Color("top"),Color("bottom")]),
                               startPoint: .top,
                               endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(spacing: 0){
                    Spacer()
                    Text("BYOM")
                        .font(.system(size: 100))
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .shadow(color:Color("Color"), radius: 0, x: 5, y: 5)

                    Text("bring your own memories")
                        .italic()
                        .font(.system(size: 25))
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                        .padding(.bottom,20)
            
                    
                    if connected{
                        NavigationLink(destination: MainView(),label: {
                            Text("Continue")
                                .foregroundColor(Color.white)
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                                .frame(width: 200, height: 40, alignment: .center)
                                .background(Color("Color"))
                                .clipShape(Capsule())
                                .sheet(isPresented: $isPresented) {
                                    LoginCVWrapper()
                                }
                        })
                    }
                    else{
                        Button("Connect to Snapchat") { self.isPresented.toggle();self.connected.toggle()}
                        .font(.system(size: 18,weight: .bold))
                        .frame(width: 200, height: 40, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color("Color"))
                        .clipShape(Capsule())
                        .sheet(isPresented: $isPresented) {
                            LoginCVWrapper()
                        }
                    }
                    Spacer()
                    
                }.offset(y: -60)
                
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
