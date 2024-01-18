//
//  PaywallView.swift
//  face-swap
//
//  Created by Saltuk Bugra OZELGUL on 12.01.2024.
//

import SwiftUI
import AVFoundation
import _AVKit_SwiftUI

struct PaywallView: View {
    @ObservedObject var viewModel = PaywallViewModel()
    @State var currentIndex = 0
    let typeSpeed = 0.1
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollViewReader { scrollProxy in
                ScrollView {
                    LazyVStack {
                        ItemScroll(currentIndex: $currentIndex, index: 0) {
                            topContainer
                            Spacer()
                            firstText
                            Spacer()
                            GoDownButton(scrollProxy: scrollProxy, currentIndex: $currentIndex)
                        }
                        ItemScroll(currentIndex: $currentIndex, index: 1) {
                            joinTheFunText
                                .padding(.top, 120)
                            TransationImages(viewModel: viewModel)
                            Spacer()
                            GoDownButton(scrollProxy: scrollProxy, currentIndex: $currentIndex)
                        }
                        ItemScroll(currentIndex: $currentIndex, index: 2) {
                            Spacer()
                            RewriteHistoryImages(viewModel: viewModel)
                                .padding(.top, 140)
                            Spacer()
                            GoDownButton(scrollProxy: scrollProxy, currentIndex: $currentIndex)
                        }
                        ItemScroll(currentIndex: $currentIndex, index: 3) {
                            numberOneVector
                                .padding(.top, 60)
                            ScrollableCommentsView(initalIndex: 1)
                            Spacer()
                            GoDownButton(scrollProxy: scrollProxy, currentIndex: $currentIndex)
                                .padding(.bottom, 10)
                                .zIndex(50)
                        }
                        ItemScroll(currentIndex: $currentIndex, index: 4) {
                            LoopVideoPlayer(videoName: "paywall_video")
                                .zIndex(-1)
                                
                            GoDownButton(scrollProxy: scrollProxy, currentIndex: $currentIndex)
                        }
                        ItemScroll(currentIndex: $currentIndex, index: 5) {
                            Spacer()
                            deserveFunText
                                .padding(.top, 60)
                                .padding(.bottom, 30)
                            selectables_one
                                .padding(.bottom, 60)
                            GoDownButton(scrollProxy: scrollProxy, currentIndex: $currentIndex)
                            Spacer()
                        }
                        ItemScroll(currentIndex: $currentIndex, index: 6) {
                            Spacer()
                            transtation_three
                            Spacer()
                            GoDownButton(scrollProxy: scrollProxy, currentIndex: $currentIndex)
                            Spacer()
                        }
                        ItemScroll(currentIndex: $currentIndex, index: 7) {
                            ScrollableCommentsView(initalIndex: 2)
                            Spacer()
                            circleImages
                            Spacer()
                            GoDownButton(scrollProxy: scrollProxy, currentIndex: $currentIndex)
                        }
                        ItemScroll(currentIndex: $currentIndex, index: 8) {
                            rightPlaceContaier
                                .padding(.bottom, 50)
                            GoDownButton(scrollProxy: scrollProxy, currentIndex: $currentIndex)
                        }
                        ItemScroll(currentIndex: $currentIndex, index: 9) {
                            selectables_two
                        }
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(maxWidth: .infinity)
                            .padding(.bottom, 150)
                    }.scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
                .ignoresSafeArea()
                .background(Color(red: 0.12, green: 0, blue: 0.29))
            }
            footer
        }
    }
    
    var footer: some View {
        VStack {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                HStack(alignment: .center, spacing: 10) {
                    Text("Unlock All Features!")
                      .font(
                        Font.custom("Montserrat", size: 20)
                          .weight(.semibold)
                      )
                      .foregroundColor(Color(red: 0, green: 0, blue: 0))
                }
                .padding(10)
                .frame(width: 300, alignment: .center)
                .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                .cornerRadius(20)
            })
            .padding(.vertical, 30)
            HStack {
                Spacer()
                Text("Terms of Use")
                Spacer()
                Text("Restore Purchase")
                Spacer()
                Text("Privacy Policy")
                Spacer()
            } .font(Font.custom("Montserrat", size: 10))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.93, green: 0.93, blue: 0.93))
        }
        .background(Color(hex: "#1E004A"))
    }
    
    var topContainer: some View {
        ZStack(alignment: .bottom) {
            Image("paywall_image")
                .frame(height: 270, alignment: .top)
                .clipped()
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 270)
                .background(
                    LinearGradient(
                        stops: [
                            Gradient.Stop(color: Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.5), location: 0.00),
                            Gradient.Stop(color: Color(red: 0.12, green: 0, blue: 0.29), location: 1),
                        ],
                        startPoint: UnitPoint(x: 0.5, y: 0),
                        endPoint: UnitPoint(x: 0.5, y: 1)
                    )
                )
            VStack(spacing: 10) {
                TypeWriterView(finalText: "FaceSwap")
                    .font(
                    Font.custom("Montserrat", size: 32)
                        .weight(.semibold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                HStack(spacing: 0) {
                    TypeWriterView(finalText: "Join 100K+ and ", delay: 8 * typeSpeed )
                        .foregroundColor(.white)
                    TypeWriterView(finalText: "re-write the history", delay: 23 * typeSpeed, hasHaptic: true).foregroundColor(Color(hex: "#50FF8C"))
                }
                .font(
                    Font.custom("Montserrat", size: 16)
                        .weight(.semibold)
                )
                .multilineTextAlignment(.center)
                
            }
            .padding(.bottom)
        }
    }
    
    var firstText: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                TypeWriterView(finalText: "A good ", delay: 43 * typeSpeed)
                    .foregroundColor(.white)
                TypeWriterView(finalText: "quality", delay: 50 * typeSpeed, hasHaptic: true).foregroundColor(Color(hex: "#50FF8C"))
                TypeWriterView(finalText: " is", delay: 57 * typeSpeed)
                    .foregroundColor(.white)
            }
            HStack {
                TypeWriterView(finalText: "is never ", delay: 60 * typeSpeed)
                    .foregroundColor(.white)
                TypeWriterView(finalText: "FREE!", delay: 69 * typeSpeed, hasHaptic: true).foregroundColor(Color(hex: "#50FF8C"))
            }
            TypeWriterView(finalText: "and", delay: 74 * typeSpeed)
                .foregroundColor(.white)
            HStack(spacing: 0) {
                TypeWriterView(finalText: "You", delay: 77 * typeSpeed, hasHaptic: true).foregroundColor(Color(hex: "#50FF8C"))
                TypeWriterView(finalText:" know you", delay: 80 * typeSpeed)
                    .foregroundColor(.white)
            }
            HStack(spacing: 0) {
                TypeWriterView(finalText: "deserve", delay: 89 * typeSpeed, hasHaptic: true).foregroundColor(Color(hex: "#50FF8C"))
                TypeWriterView(finalText: " to have ", delay: 96 * typeSpeed)
                    .foregroundColor(.white)
            }
            HStack(spacing: 0) {
                TypeWriterView(finalText: "some fun", delay: 105 * typeSpeed, hasHaptic: true).foregroundColor(Color(hex: "#50FF8C"))
                TypeWriterView(finalText: " like all!", delay: 113 * typeSpeed)
                    .foregroundColor(.white)
            }
        }
        .font(
            Font.custom("Montserrat", size: 32)
                .weight(.semibold)
        )
        .frame(width: 301, alignment: .top)
        .multilineTextAlignment(.center)
    }
    
    var goDownButton: some View {
        Button(action: {
            
        }, label: {
            VStack(alignment: .center) {
                Image(systemName: "chevron.left")        .rotationEffect(.degrees(-90))
                Image(systemName: "chevron.left")        .rotationEffect(.degrees(-90))
                    .offset(x: 0, y: -9)
            }
            .scaleEffect(1.2)
            .padding(.bottom, 5)
            .padding(.top, 10)
            .foregroundColor(.white)
        })
    }
    
    var joinTheFunText: some View {
        Text("Join the Fun!")
            .font(
                Font.custom("Montserrat", size: 35)
                    .weight(.semibold)
            )
            .multilineTextAlignment(.center)
            .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98))
    }
    
    var numberOneVector: some View {
        HStack(spacing: 30) {
            Image("#1_left")
            (
                Text("#")
                    .font(
                        Font.custom("Montserrat", size: 64)
                            .weight(.bold)
                    ) +
                Text("1")
                    .font(
                        Font.custom("Montserrat", size: 128)
                            .weight(.bold)
                    )
                
            )
            .multilineTextAlignment(.center)
            .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98))
            Image("#1_right")
        }
    }
    
    var deserveFunText: some View {
        Text("You deserve fun!")
            .font(
                Font.custom("Montserrat", size: 35)
                    .weight(.semibold)
            )
            .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98))
    }
    
    var selectables_one: some View {
        VStack(spacing: 20) {
            typeSelection(type: .yearly, selectedType: $viewModel.selectedType, price: "$29.99/Month", subtitle: "$7.5/week", isBestPrice: true)
            typeSelection(type: .monthly, selectedType: $viewModel.selectedType, price: "$99.99/Year", subtitle: "$1.92/week", isMostPopular: true)
            typeSelection(type: .weekly, selectedType: $viewModel.selectedType, price: "$9.99/Week", subtitle: "Billed weekly", isBestPrice: false)
        }.padding(.horizontal, 35)
    }
    
    var selectables_two: some View {
        VStack(alignment: .leading, spacing: 35) {
            Text("Continue\nwith Premium")
              .font(
                Font.custom("Montserrat", size: 35)
                  .weight(.semibold)
              )
              .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98))
            typeSelection(type: .yearly, selectedType: $viewModel.selectedType, price: "$29.99/Month", subtitle: "$7.5/week", isBestPrice: true)
            typeSelection(type: .monthly, selectedType: $viewModel.selectedType, price: "$99.99/Year", subtitle: "$1.92/week", isMostPopular: true)
            typeSelection(type: .weekly, selectedType: $viewModel.selectedType, price: "$9.99/Week", subtitle: "Billed weekly", isBestPrice: false)
        }.padding(.horizontal, 35)
        
    }
    
    var transtation_three: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text("Be the movie hero\nyou want to be")
              .font(
                Font.custom("Montserrat", size: 35)
                  .weight(.semibold)
              )
              .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98))
            Spacer()
            ZStack {
                Image("paywall_before_3")
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: 195, height: 266)
                Image("paywall_after_3")
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: 195, height: 266).offset(x: UIScreen.main.bounds.width / 2 - 77.5, y: 100)
                Image("arrow_vector")
                .offset(x: 135 , y: -90)
                
            }
            Spacer()
        }.padding(.bottom,100)
    }
    
    var circleImages: some View {
        VStack(alignment: .trailing) {
            Text("Be the adventurer")
                .font(
                    Font.custom("Montserrat", size: 35)
                        .weight(.semibold)
                )
                .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98))
            ZStack(alignment: .top) {
                Image("paywall_image_2")
                    .offset(x: UIScreen.main.bounds.width * 0.1, y: 0)
                Image("paywall_image_3")
                    .offset(x: UIScreen.main.bounds.width * -0.3, y: 0)
            }
        }
    }
    
    var rightPlaceContaier: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text("You’re in\nthe right place")
              .font(
                Font.custom("Montserrat", size: 24)
                  .weight(.semibold)
              )
              .foregroundColor(.white)
            HStack(spacing: 20) {
                Image(systemName: "checkmark.circle.fill")
                .frame(width: 22, height: 22)
                Text("Innovative AI\nTechnology")
            }
            HStack(spacing: 20) {
                Image(systemName: "checkmark.circle.fill")
                .frame(width: 22, height: 22)
                Text("Fun and Engaging\nExperience")
            }
            HStack(spacing: 20) {
                Image(systemName: "checkmark.circle.fill")
                .frame(width: 22, height: 22)
                Text("User-Friendly\nInterface")
            }
            HStack(spacing: 20) {
                Image(systemName: "checkmark.circle.fill")
                .frame(width: 22, height: 22)
                Text("Privacy and\nSecurity")
            }
        }
        .padding(.vertical, 20)
        .font(
          Font.custom("Montserrat", size: 20)
            .weight(.semibold)
        )
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .background(
            Rectangle()
            .foregroundColor(.clear)
            .frame(maxWidth: .infinity)
            .background(Color(red: 0.59, green: 0.28, blue: 1))
            .cornerRadius(30)
          
        )
        .padding(.horizontal, 45)
    }
}

struct TransationImages: View {
    @ObservedObject var viewModel: PaywallViewModel
    @State var animation1 = false
    @State var animation2 = false
    @State var animation3 = false
    var  body: some View {
        ZStack(alignment: .topLeading) {
            Image("paywall_before")
                .offset(x: animation1 ? -75 : 5000, y: 0)
            ZStack {
                Image("paywall_before")
                    .offset(x: animation2 ? 0 : 5000, y: 100)
            }
            Image("paywall_after")
                .offset(x: animation3 ? 75 : 5000, y: 200)
        }
        .onBecomingVisible(withThreshold: 0) {
            print("triggred noel baba animaton")
            animation1 = false
            animation2 = false
            animation3 = false
            withAnimation(.spring(duration: 1)) {
                animation1 = true
                viewModel.delay(seconds: 1) {
                    withAnimation(.spring(duration: 1)) {
                        animation2 = true
                        viewModel.delay(seconds: 1) {
                            withAnimation(.spring(duration: 1)) {
                                animation3 = true
                            }
                        }
                    }
                }
            }
        }
    }
}

struct GoDownButton: View {
    var scrollProxy: ScrollViewProxy
    @Binding var currentIndex: Int
    var body: some View {
        Button(action: {
            if currentIndex < 10 {
                currentIndex += 1
            }
            withAnimation {
                scrollProxy.scrollTo(currentIndex, anchor: .top)
            }
        }, label: {
            VStack(alignment: .center) {
                Image(systemName: "chevron.left")        .rotationEffect(.degrees(-90))
                Image(systemName: "chevron.left")        .rotationEffect(.degrees(-90))
                    .offset(x: 0, y: -9)
            }
            .scaleEffect(1.2)
            .padding(.bottom, 5)
            .padding(.top, 10)
            .foregroundColor(.white)
        })
    }
}

struct RewriteHistoryImages: View {
    @ObservedObject var viewModel: PaywallViewModel
    @State var animation1 = false
    @State var animation2 = false
    @State var animation3 = false
    var body: some View {
        VStack(spacing: 0) {
            title
            HStack{
                Image("paywall_before_2")
                    .resizable()
                    .frame(width: 130, height: 130)
                Spacer()
                Text("Pick your scene")
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
            }
            .offset(x: animation1 ? 0 : 5000, y: 0)
            HStack{
                ZStack {
                    Image("paywall_before_2")
                        .resizable()
                        .frame(width: 130, height: 130)
                }
                Spacer()
                Text("Wait for the magic")
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
            }
            .offset(x: animation2 ? 0 : 5000, y: 0)
            HStack{
                Image("paywall_after_2")
                    .resizable()
                    .frame(width: 130, height: 130)
                Spacer()
                Text("Enjoy your\nnew\nversion!")
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
            }
            .offset(x: animation3 ? 0 : 5000, y: 0)
        }
        .font(
            Font.custom("Montserrat", size: 20)
                .weight(.semibold)
        )
        .multilineTextAlignment(.center)
        .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98))
        .padding(.leading, 25)
        .onAppear(perform: {
         
        })
        .onBecomingVisible(withThreshold: 0) {
            print("rewrite images animaton triggered")
            animation1 = false
            animation2 = false
            animation3 = false
            viewModel.delay(seconds: 0) {
                withAnimation(.spring(duration: 1)) {
                    animation1 = true
                    viewModel.delay(seconds: 1) {
                        withAnimation(.spring(duration: 1)) {
                            animation2 = true
                            viewModel.delay(seconds: 1) {
                                withAnimation(.spring(duration: 1)) {
                                    animation3 = true
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    var title: some View {
        Text("Rewrite the History")
            .font(
                Font.custom("Montserrat", size: 32)
                    .weight(.semibold)
            )
            .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98))
    }
}

struct typeSelection: View {
    let type: PaywallSelectableTypes
    @Binding var selectedType: PaywallSelectableTypes
    let price: String
    let subtitle: String
    var subtitle_2: String?
    var isMostPopular = false
    var isBestPrice = false
    var isSelected: Bool {
        type == selectedType
    }
    var body: some View {
        ZStack(alignment: .topTrailing) {
            HStack {
                Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                    .font(.title)
                    .padding()
                VStack(alignment: .leading) {
                    Spacer()
                    Text(price)
                        .font(
                            Font.custom("Montserrat", size: 20)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                    if subtitle_2 != nil {
                        Text(subtitle_2!)
                            .font(Font.custom("Montserrat", size: 12))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    } else {
                        Spacer()
                    }
                    Text(subtitle)
                        .font(Font.custom("Montserrat", size: 12))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                    Spacer()
                }
                Spacer()
            }
            VStack {
                Text(isMostPopular ? "MOST POPULAR" : isBestPrice ? "BEST PRICE" : "ERROR")
                    .font(
                        Font.custom("Montserrat", size: isBestPrice ? 12 : 10)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0, green: 0, blue: 0))
            }
            .opacity(isMostPopular ? 1 : isBestPrice ? 1 : 0)
            .frame(width: 100, height: 20)
            .background(
                Rectangle()
                    .frame(width: 100, height: 20)
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    .clipShape(
                        .rect(
                            topLeadingRadius: 0, bottomLeadingRadius: 10, bottomTrailingRadius: 0, topTrailingRadius: 10)
                    ))
            .opacity(isMostPopular ? 1 : isBestPrice ? 1 : 0)
            
        }
        .onTapGesture(perform: {
            withAnimation(.spring) {
                selectedType = type
            }
        })
        .frame(maxWidth: .infinity, maxHeight: 70, alignment: .center)
        .frame(width: .infinity, height: 70)
        .foregroundColor(.white)
        .background(
            Rectangle()
                .foregroundColor(.clear)
                .frame(maxWidth: .infinity, maxHeight: 70)
                .background(Color(red: 0.59, green: 0.28, blue: 1))
                .cornerRadius(10))
        
        
    }
}

#Preview {
    PaywallView()
}

#Preview {
    typeSelection(type: .monthly, selectedType: .constant(.monthly), price: "sa", subtitle: "as")
}
