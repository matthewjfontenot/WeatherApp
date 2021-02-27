//
//  ContentView.swift
//  WeatherAppIntro
//
//  Created by Matthew Fontenot on 2/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "New York, NY")
                
                MainWeatherView(SFSymbol: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                temperature: isNight ? 54 : 76)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: isNight ? "moon.fill" : "cloud.sun.fill",
                                   temperature: isNight ? 62 : 74)
                    
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: isNight ? "moon.stars.fill" : "sun.max.fill",
                                   temperature: isNight ? 77 : 88)
                    
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: isNight ? "moon.fill" : "cloud.rain.fill",
                                   temperature: isNight ? 48 : 55)
                    
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: isNight ? "cloud.hail.fill" : "sunset.fill",
                                   temperature: isNight ? 22 : 60)
                    
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: isNight ? "thermometer.snowflake" : "snow",
                                   temperature: isNight ? 11 : 25)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                
                
                Spacer()
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                                   isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 40, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherView: View {
    
    var SFSymbol: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: SFSymbol)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
    .padding(.bottom, 40)
    }
}
