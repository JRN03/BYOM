//
//  MainView.swift
//  YOLO
//
//  Created by Jonathan Nguyen on 10/14/21.
//

import SwiftUI
import SCSDKCreativeKit
import SCSDKLoginKit
import SCSDKCoreKit

struct MainView:View{
    
    let rand = Int.random(in: 0...data.count-1)
    let rand2 = Int.random(in: 0...data.count-1)
    let randQuote = quotes[Int.random(in: 0...quotes.count-1)]
    @State var index = "All"
    @State var clicked = false
    @State var stickerData = data[0]
    
    var body:some View {
        ZStack{
            ScrollView(.vertical,showsIndicators: false){
                HStack{
                    Text("Take your pick.")
                        .font(.system(size: 45, weight: .bold))
                        .foregroundColor(.white)
                        .opacity(clicked ? 0.2 : 1)
                    
                    Spacer()
                    
                }
                .padding(.horizontal)
                .padding(.top,20)
                
                HStack{
                    Text("All")
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical,6)
                        .padding(.horizontal,20)
                        .background(Color("Color").opacity(index == "All" ? 1 : 0))
                        .clipShape(Capsule())
                        .onTapGesture {
                            index = "All"
                        }
                        .opacity(clicked ? 0.2 : 1)
                    
                    Text("Social")
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical,6)
                        .padding(.horizontal,20)
                        .background(Color("Color").opacity(index == "Social" ? 1 : 0))
                        .clipShape(Capsule())
                        .onTapGesture {
                            index = "Social"
                        }
                        .opacity(clicked ? 0.2 : 1)
                    
                    Text("Active")
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical,6)
                        .padding(.horizontal,20)
                        .background(Color("Color").opacity(index == "Active" ? 1 : 0))
                        .clipShape(Capsule())
                        .onTapGesture {
                            index = "Active"
                        }
                        .opacity(clicked ? 0.2 : 1)
                    Text("Dares")
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical,6)
                        .padding(.horizontal,20)
                        .background(Color("Color").opacity(index == "Dares" ? 1 : 0))
                        .clipShape(Capsule())
                        .onTapGesture {
                            index = "Dares"
                        }
                        .opacity(clicked ? 0.2 : 1)
                
                    Spacer()
                    
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal,showsIndicators:false){
                    HStack{
                        ForEach(data){i in
                            if i.category == index || index == "All"{
                                Card(data: i, width: UIScreen.main.bounds.width)
                                    .opacity(clicked ? 0.2 : 1)
                                    .onTapGesture {
                                        clicked.toggle()
                                        stickerData = i
                                    }
                                
                            }
                        }
                    }
                }
                .animation(.easeIn, value: 20)
                .padding(.top,20)
                
                Divider()
                    .padding(.top,40)
                    .frame(width: UIScreen.main.bounds.width-60)
                
                HStack{
                    Spacer()
                    Text(randQuote)
                        .frame(alignment:.center)
                        .opacity(clicked ? 0.2 : 1)
                        .font(.system(size: 25,weight:.bold))
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                }
                .frame(alignment:.center)
                .padding(.vertical,40)
                
                Divider()
                    .frame(width: UIScreen.main.bounds.width-60)
                
                
                VStack{
                    HStack{
                        Text("Suggestions")
                            .italic()
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.white)
                            .opacity(clicked ? 0.2 : 1)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top,20)
                    
                    randCard(rand: Card(data: data[rand], width: UIScreen.main.bounds.width), direction: -1, colorScheme: [.pink,.purple])
                        .opacity(clicked ? 0.2 : 1)
                        .padding(.vertical,15)
                        .onTapGesture {
                            clicked.toggle()
                            stickerData = data[rand]
                        }
                    
                    randCard(rand: Card(data: data[rand2], width: UIScreen.main.bounds.width), direction: 1, colorScheme: [Color("4"),Color("3")])
                        .opacity(clicked ? 0.2 : 1)
                        .padding(.vertical,15)
                        .onTapGesture {
                            clicked.toggle()
                            stickerData = data[rand2]
                        }
                }
                
                
            }
            .background(
                LinearGradient(gradient: .init(colors: [Color("top"),Color("bottom")]),
                               startPoint: .top,
                               endPoint: .bottom)
                
            )
            
            if clicked{
                Sticker(description: stickerData.description, title: stickerData.title, width: UIScreen.main.bounds.width)
            }
            
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        
        
        
    }
    
    
}

struct Card : View{
    var data: ActData
    var width: CGFloat
    var body: some View{
        VStack{
            VStack{
                Spacer()
                HStack{
                    Text(self.data.title)
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                }
                HStack{
                    Text(self.data.category)
                        .italic()
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Spacer(minLength: 0)
                }
            }
            .frame(width: UIScreen.main.bounds.width - 80)
            .padding(.horizontal,20)
            .padding(.bottom,40)
            //.background(Image(self.data.image).resizable().scaledToFill())
            .background(
                LinearGradient(colors: [
                    Color(String(Int.random(in: 0...9))),
                    Color(String(Int.random(in: 0...9)))
                ], startPoint: .leading, endPoint: .trailing)
            )
            .cornerRadius(20)
        }
        .frame(width: self.width,height: 200)
        .animation(.easeIn, value: 2)
    }
}

struct randCard : View{
    var rand: Card
    var direction: Double
    var colorScheme:[Color]
    @State var animateGradient = false
    @State var angle = 0.0
    var body: some View{
        VStack{
            VStack{
                Spacer()
                HStack{
                    Text(rand.data.title)
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                }
                HStack{
                    Text(rand.data.category)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Spacer(minLength: 0)
                }
            }
            .frame(width: UIScreen.main.bounds.width - 80)
            .padding(.horizontal,20)
            .padding(.bottom,40)
            .background(
                LinearGradient(colors: colorScheme,
                               startPoint:.trailing,
                               endPoint: .leading)
                    .hueRotation(Angle(degrees: angle))
                    .animation(.easeIn(duration: 4).repeatForever(autoreverses: true), value: animateGradient)
                    .onAppear(){
                        angle = direction*150
                        animateGradient.toggle()
                    }
            )
            .cornerRadius(20)
        }
        .frame(width: rand.width,height: UIScreen.main.bounds.height - 700)
        
    }
}

struct Sticker: View{
    var description:String
    var title:String
    var width:CGFloat
    var body: some View{
        VStack{
            HStack{
                Text(title)
                    .font(.system(size: 25))
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                Spacer()
                Button(action:{
                    let img = self.snapshot()
                    let sticker = SCSDKSnapSticker(stickerImage: img)
                    let snap = SCSDKNoSnapContent()
                    snap.sticker = sticker
                    
                    snapAPI.startSending(snap){ (error: Error?) in
                        print("error")
                    }
                }){
                    Text("Snapchat")
                        .font(.system(size: 15))
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .padding(.vertical,6)
                        .padding(.horizontal,20)
                        .background(.yellow)
                        .clipShape(Capsule())
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
            
            HStack{
                Text(description)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                    .padding(.horizontal)
                Spacer()
            }
            Spacer()
        }
        .frame(width: self.width-20,height: 130)
        .background(.white)
        .cornerRadius(20)
    }
}
extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let targetSize = CGSize(width: controller.view.intrinsicContentSize.width+20,height: controller.view.intrinsicContentSize.width+20)
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}

struct ActData: Identifiable{
    var id:Int
    var title:String
    var category:String
    var image:String
    var description:String
    @State var pressed = false
}


//data for cards
var data = [
    ActData(id: 0, title: "Social Butterfly", category: "Social", image: "p0",description: "Go out and make a new friend."),
    ActData(id: 1, title: "Sports Fanatic", category: "Active", image: "p0",description: "Pick up a new sport."),
    ActData(id: 2, title: "Flippin Awesome", category: "Dares", image: "p0",description: "Do a flip"),
    ActData(id: 3, title: "Sweetheart", category: "Social", image: "p0",description: "Compliment the next person you see"),
    ActData(id: 4, title: "Chef's Kiss", category: "Active", image: "p0",description: "Learn how to bake something new"),
    ActData(id: 5, title: "Cupid's Arrow", category: "Dares", image: "p0",description: "Ask out a crush"),
    ActData(id: 6, title: "Dance Monkey", category: "Active", image: "p0",description: "Make a dance routine for your favorite song"),
    ActData(id: 7, title: "Dad Joke", category: "Dares", image: "p0",description: "Tell a funny joke")

]

var quotes:[String] = [
    
    "Life is hard; it's harder when you're stupid.\n­­­- John Wayne",
    "Do or do not, there is no try.\n- Yoda",
    "'To be is to do\n-Socrates\n\nTo do is to be\n-Jean-Paul Sartre\n\nDo be do be do\n­­­-Frank Sinatra'\n­­­\n- Kurt Vonnegut",
    "Always give 100 percent. Unless you're donating blood.\n­­­-  Bill Murray"
    
    
]

var snapAPI = {
    return SCSDKSnapAPI()
}()
