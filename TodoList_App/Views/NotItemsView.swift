//
//  NotItemsView.swift
//  TodoList_App
//
//  Created by ILYA POPOV on 24.09.2023.
//

import SwiftUI

struct NotItemsView: View {
    
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Image(systemName: "list.bullet.clipboard")
                    .renderingMode(.original
                    )
                    .font(.system(size: 42))
                    //.scaledToFit()
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should click the add button a bunch of items to your todo list!")
                    .font(.footnote)
                    .opacity(0.6)
                    .padding(.bottom, 20)
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add Something")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondaryAccentColor : Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? secondaryAccentColor.opacity(0.3) : Color.accentColor.opacity(0.3),
                        radius: animate ? 20 : 8,
                        x: 0.0,
                        y: animate ? 16 : 8)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)

            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        //первая строка для того, что не вызывать анимацию дважды
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
    
}

#Preview {
    NavigationStack {
        NotItemsView()
            .navigationTitle("Title")
    }
}
