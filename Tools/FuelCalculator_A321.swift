//
//  test.swift
//  Tools
//
//  Created by Lady Ranni on 02/11/2023.
//

import SwiftUI

struct FuelCalculator_A321: View {
    @State private var numberFormatter: NumberFormatter = {
        var nf = NumberFormatter()
        nf.numberStyle = .none
        nf.zeroSymbol = ""
        return nf
    }()
    @State private var density_Formatter: NumberFormatter={
        var nf = NumberFormatter()
        nf.numberStyle = .none
        nf.zeroSymbol = ""
        return nf
    }()
    
    @State private var left_Before: Int = 0
    @State private var center_Before: Int  = 0
    @State private var right_Before: Int = 0
    @State private var sum_Before: Int = 0
    @State private var act_Before: Int = 0
    
    
    @State private var left_Sum: Int = 0
    @State private var center_Sum: Int = 0
    @State private var right_Sum: Int = 0
    @State private var sum_Sum: Int = 0
    @State private var act_Sum: Int = 0
    
    @State private var browser_Uplift = 0
    @State private var discrepancy = 0
    @State private var density:Double = 0
    @State private var volume_Galon:Double  = 0
    @State private var volume_Liter:Double  = 0
    @State private var volume_Kg:Double = 0
    
    
    
    func total_Fuel(_ value1: Int, _ value2: Int, _ value3: Int) -> Int {
        
        return value1 + value2 + value3
    }
    
    func minus_fuel(_ value1: Int, _ value2: Int)-> Int{
        
        return value1 - value2
    }
    
    func total_fuel_uplift() -> Int {
        return left_Sum - left_Before + center_Sum - center_Before + right_Sum - right_Before  + act_Sum - act_Before
    }
    
    func fuel_discrepancy() -> Int {
        return total_fuel_uplift() - Int(volume_Kg)
    }
    
    var body: some View {
        ScrollView{
            ZStack{
                Image("BG")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height:
                            UIScreen.main.bounds.height)
                    .edgesIgnoringSafeArea(.all)
                    .blur(radius: /*@START_MENU_TOKEN@*/7.0/*@END_MENU_TOKEN@*/)
                VStack {
                    Text("Fuel uplift calculator")
                    //  .frame(width: 200, height: 50)
                    //  .background(Color(red: 0.982, green: 0.64, blue: 0.05))
                        .bold()
                        .font(.system(size:30))
                    Spacer().frame(height: 50)
                    
                    HStack(spacing: 70){
                        Text("Remain")
                            .padding(.leading, 30)
                        Text("Uplift")
                        Text("Total")
                    }
                    HStack(spacing: 20){
                        Text("L")
                            .frame(width: 35)
                        TextField("L", value: $left_Before, formatter: numberFormatter)
                            .keyboardType(.decimalPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading, 10)
                            .frame(width: 100)
                            .foregroundColor(.blue)
                            .multilineTextAlignment(.center)
                        
                        
                        Text("\(left_Sum - left_Before)")
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 90)
                            .padding(6.5)
                            .border(Color(red: 0.867, green: 0.867, blue: 0.867))
                            .disabled(true)
                            .foregroundColor(.blue)
                            .background(Color(hue: 0.059, saturation: 0.011, brightness: 0.805))
                            .cornerRadius(6)
                        
                        
                        TextField("L", value: $left_Sum, formatter: numberFormatter)
                            .keyboardType(.decimalPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.trailing, 10)
                            .frame(width: 100)
                            .foregroundColor(.blue)
                            .foregroundColor(.blue)
                            .multilineTextAlignment(.center)
                        
                        
                        
                    }
                    HStack(spacing: 20){
                        Text("C")
                            .frame(width: 35)
                        TextField("C", value: $center_Before,formatter: numberFormatter)
                            .keyboardType(.decimalPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading, 10)
                            .frame(width: 100)
                            .foregroundColor(.blue)
                            .multilineTextAlignment(.center)
                        
                        
                        Text("\(center_Sum - center_Before)")
                            .multilineTextAlignment(.leading)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 85)
                            .padding(6.5)
                            .border(Color(red: 0.867, green: 0.867, blue: 0.867))
                            .foregroundColor(.blue)
                            .background(Color(red: 0.804, green: 0.799, blue: 0.796))
                            .cornerRadius(6)
                        
                        
                        TextField("C", value: $center_Sum,formatter: numberFormatter)
                            .keyboardType(.decimalPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.trailing, 10)
                            .frame(width: 100)
                            .foregroundColor(.blue)
                            .multilineTextAlignment(.center)
                        
                        
                        
                    }
                    HStack(spacing: 20){
                        Text("R")
                            .frame(width: 35)
                        TextField("R", value: $right_Before,formatter: numberFormatter)
                            .keyboardType(.decimalPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading, 10)
                            .frame(width: 100)
                            .foregroundColor(.blue)
                            .multilineTextAlignment(.center)
                        
                        
                        Text("\(right_Sum - right_Before)")
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 85)
                            .padding(6.5)
                            .border(Color(red: 0.867, green: 0.867, blue: 0.867))
                            .foregroundColor(.blue)
                            .background(Color(red: 0.804, green: 0.799, blue: 0.796))
                            .cornerRadius(6)
                        
                        
                        TextField("R", value: $right_Sum,formatter: numberFormatter)
                            .keyboardType(.decimalPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.trailing, 10)
                            .frame(width: 100)
                            .foregroundColor(.blue)
                            .multilineTextAlignment(.center)
                        
                        
                    }
                    HStack(spacing: 20){
                        Text("ACT")
                            .frame(width: 35)
                        TextField("Act", value: $act_Before,formatter: numberFormatter)
                            .keyboardType(.decimalPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading, 10)
                            .frame(width: 100)
                            .foregroundColor(.blue)
                            .multilineTextAlignment(.center)
                        
                        
                        Text("\(act_Sum - act_Before)")
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 85)
                            .padding(6.5)
                            .border(Color(red: 0.867, green: 0.867, blue: 0.867))
                            .foregroundColor(.blue)
                            .background(Color(red: 0.804, green: 0.799, blue: 0.796))
                            .cornerRadius(6)
                        
                        
                        TextField("Act", value: $act_Sum,formatter: numberFormatter)
                            .keyboardType(.decimalPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.trailing, 10)
                            .frame(width: 100)
                            .foregroundColor(.blue)
                            .multilineTextAlignment(.center)
                        
                        
                    }
                    
                    HStack(spacing:20){
                        Text("Sum").frame(width: 35)
                        
                        Text("\(left_Before + center_Before + right_Before + act_Before)")
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 80)
                            .padding(6.5)
                            .border(Color(red: 0.867, green: 0.867, blue: 0.867))
                            .background(Color(red: 0.804, green: 0.799, blue: 0.796))
                            .foregroundColor(.blue)
                            .cornerRadius(6)
                        
                        Text("\(left_Sum - left_Before + center_Sum - center_Before + right_Sum - right_Before  + act_Sum - act_Before)")
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 80)
                            .padding(6.5)
                            .border(Color(red: 0.867, green: 0.867, blue: 0.867))
                            .foregroundColor(.blue)
                            .background(Color(red: 0.804, green: 0.799, blue: 0.796))
                            .cornerRadius(6)
                        
                        Text("\(left_Sum + center_Sum + right_Sum + act_Sum)")
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 75)
                            .padding(6.5)
                            .padding(.trailing, 5)
                            .border(Color(red: 0.867, green: 0.867, blue: 0.867))
                            .background(Color(red: 0.804, green: 0.799, blue: 0.796))
                            .foregroundColor(.blue)
                            .cornerRadius(6)
                        
                    }.padding()
                    
                    VStack{
                        HStack(spacing: 50){
                            
                            VStack{
                                Text("Discrepancy")
                                Text("\(fuel_discrepancy())")
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(width: 80)
                                    .padding(6.5)
                                    .border(Color(red: 0.867, green: 0.867, blue: 0.867))
                                    .background(Color(red: 0.804, green: 0.799, blue: 0.796))
                                    .foregroundColor(.blue)
                                    .cornerRadius(6)
                                
                            }
                            VStack{
                                Text("Density")
                                TextField(" Density " , value: $density, formatter: density_Formatter)
                                    .keyboardType(.decimalPad)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(width: 90)
                                    .onAppear {
                                        density_Formatter.minimumFractionDigits = 0
                                        density_Formatter.maximumFractionDigits = 3
                                    }
                                    .onChange(of: density){ value in
                                        volume_Kg = volume_Liter * density
                                    }
                                    .foregroundColor(.blue)
                                    .multilineTextAlignment(.center)
                                
                            }
                        }
                        HStack{
                            
                            VStack{
                                Text("Galon")
                                TextField(" Galon ", value: $volume_Galon, formatter: numberFormatter)
                                    .onChange(of: volume_Galon){value in
                                        volume_Liter = volume_Galon * 3.78541
                                        volume_Kg = volume_Liter * density
                                    }
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(width: 90)
                                    .foregroundColor(.blue)
                                    .multilineTextAlignment(.center)
                                    .keyboardType(.decimalPad)
                                
                                
                            }
                            VStack{
                                Text("Liter")
                                TextField(" Liter ", value: $volume_Liter, formatter: numberFormatter)
                                    .onChange(of: volume_Liter) { value in
                                        volume_Galon = volume_Liter / 3.78541
                                        volume_Kg = volume_Liter * density
                                    }
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(width: 90)
                                    .foregroundColor(.blue)
                                    .multilineTextAlignment(.center)
                                    .keyboardType(.decimalPad)
                                
                                
                            }
                            VStack{
                                Text("Kg")
                                TextField(" KG ", value: $volume_Kg, formatter: numberFormatter)
                                    .onAppear {
                                        numberFormatter.minimumFractionDigits = 0
                                 //       numberFormatter.maximumFractionDigits = 0
                                    }
                                    .onChange(of: volume_Kg) { value in
                                        if density != 0{
                                            volume_Liter = volume_Kg / density
                                        } else {
                                            volume_Liter = 0
                                        }
                                    }                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(width: 90)
                                    .foregroundColor(.blue)
                                    .multilineTextAlignment(.center)
                                    .keyboardType(.decimalPad)
                                
                                
                                
                            }
                        }
                        
                        Button("Clear") {
                            left_Before = 0
                            center_Before  = 0
                            right_Before = 0
                            sum_Before = 0
                            
                            left_Sum = 0
                            center_Sum = 0
                            right_Sum = 0
                            sum_Sum = 0
                            act_Sum = 0
                            
                            discrepancy = 0
                            density = 0
                            volume_Galon  = 0
                            volume_Liter  = 0
                            volume_Kg = 0
                        }
                        .frame(width: 100.0, height: 40.0)
                        .background(.blue)
                        .cornerRadius(15)
                    }
                }
                .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
            }
        }
        .ignoresSafeArea(edges: .top)
        .scrollDismissesKeyboard(.immediately)
         //.preferredColorScheme(.light)
    }
}
struct FuelCalculator_A321_Previews: PreviewProvider {
    static var previews: some View {
        FuelCalculator_A321()
    }
}


