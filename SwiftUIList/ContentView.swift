//
//  ContentView.swift
//  SwiftUIList
//
//  Created by Abdelrahman Mohamed on 3.09.2020.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedRestaurant: Restaurant?
    
    var body: some View {
        NavigationView {
            List(restaurants) { restaurant in
                NavigationLink(destination: RestaurantDetailView(restaurant: restaurant)) {
                    BasicImageRow(restaurant: restaurant)
                }
//                NavigationLink({
//                    if (0...1).contains(index) {
//                        FullImageRow(restaurant: self.restaurants[index])
//                    } else {
//                        BasicImageRow(restaurant: self.restaurants[index])
//                    }
//                }, destination: RestaurantDetailView(restaurant: restaurants[index]))
            }
            .navigationBarTitle("Restaurants", displayMode: NavigationBarItem.TitleDisplayMode.automatic)
        }
    }
    
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont(name: "ArialRoundedMTBold", size: 35)!]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont(name: "ArialRoundedMTBold", size: 20)!]
        navBarAppearance.setBackIndicatorImage(UIImage(systemName: "arrow.turn.up.left"), transitionMaskImage: UIImage(systemName: "arrow.turn.up.left"))
        
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        
        UINavigationBar.appearance().tintColor = .black
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BasicImageRow: View {
    
    var restaurant: Restaurant
    
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            
            Text(restaurant.name)
        }
    }
}

struct FullImageRow: View {
    
    var restaurant: Restaurant
    
    var body: some View {
        ZStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(10)
                .overlay(
                    Rectangle()
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .opacity(0.2)
                )
            
            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(.white)
        }
    }
}
