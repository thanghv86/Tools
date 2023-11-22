//
//  SwiftUIView.swift
//  Tools
//
//  Created by Ho Viet Thang on 09/11/2023.
//

import SwiftUI

struct Mel: View {
    
    @State var username: String = ""
    let date: Date
    let dateFormatter: DateFormatter
    let utcString: String

    let calendar = Calendar.current
    let formatter = DateFormatter()

    init() {
        date = Date()
        dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        utcString = dateFormatter.string(from: date)
   
   }
    
    func newDate(dayToAdd: Int) -> String {
        var date = Date()
        date = calendar.date(byAdding: .day, value: dayToAdd, to: date)!
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
        ZStack {
            Image("BG")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height:
                        UIScreen.main.bounds.height)
                .edgesIgnoringSafeArea(.all)
                
            VStack(alignment: .center){
        
                Text("Today is \(utcString)").foregroundColor(.white)
                    .font(.headline)
                    .frame(width:300,height: 40)
                    .background(Color(hue: 0.582, saturation: 0.949, brightness: 0.982))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Spacer().frame(height: 50)
                
                
                Text("Cat B: \(newDate(dayToAdd: 3))")
                    .font(.headline)
                    .frame(width:300,height: 40)
                    .background(Color(red: 0.982, green: 0.64, blue: 0.05))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text("Cat C: \(newDate(dayToAdd: 10))")
                    .font(.headline)
                    .frame(width:300,height: 40)
                    .background(Color(red: 0.982, green: 0.64, blue: 0.05))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text("Cat D: \(newDate(dayToAdd: 120))")
                    .font(.headline)
                    .frame(width:300,height: 40)
                    .background(Color(red: 0.982, green: 0.64, blue: 0.05))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text("180 days: \(newDate(dayToAdd: 180))")
                    .font(.headline)
                    .frame(width:300,height: 40)
                    .background(Color(red: 0.982, green: 0.64, blue: 0.05))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity, alignment: .center)           
                
            }
            }
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
                }
        
    }

struct Mel_Previews: PreviewProvider {
    static var previews: some View {
        Mel()
    }
}
