//
//  ContentView.swift
//  WeConvert
//
//  Created by Vitko Raykov on 10/03/2020.
//  Copyright © 2020 Vitko Raykov - Flyt. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let unitTypes = ["Centimeters", "Meters", "Kilometers", "Feet", "Yards", "Inches", "Miles"]
    
    @State var unitType1 = 0
    @State var unitType2 = 0
    @State var valueToConvert = ""
    
    var convertedValue: Double {
        // convert String to Double
        let value = Double(valueToConvert) ?? 0
        
        // first type here
        var unit1: UnitLength {
            switch unitType1 {
                case 0: return .centimeters
                case 1: return .meters
                case 2: return .kilometers
                case 3: return .feet
                case 4: return .yards
                case 5: return .inches
            default: return .miles
            }
        }

        // second type here
        var unit2: UnitLength {
            switch unitType2 {
                    case 0: return .centimeters
                    case 1: return .meters
                    case 2: return .kilometers
                    case 3: return .feet
                    case 4: return .yards
                    case 5: return .inches
                default: return .miles
            }
        }
        
        let valueBeforeConversion = Measurement(value: value, unit: unit1)
        let valueAfterConversion = valueBeforeConversion.converted(to: unit2)
        
        return valueAfterConversion.value
    }
        
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter value to convert", text: $valueToConvert)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Choose unit to convert from")) {
                    Picker("From", selection: $unitType1) {
                        ForEach(0 ..< unitTypes.count) {
                            Text("\(self.unitTypes[$0])")
                        }
                    }
                }
                
                Section(header: Text("Choose unit to convert to")) {
                    Picker("To", selection: $unitType2) {
                        ForEach(0 ..< unitTypes.count) {
                            Text("\(self.unitTypes[$0])")
                        }
                    }
                }
                
                Section(header: Text("Converted value")) {
                    Text("\(convertedValue, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeConvert", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

