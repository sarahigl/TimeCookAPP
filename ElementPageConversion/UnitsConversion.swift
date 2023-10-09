//
//  UnitsConversion.swift
//  RatatouillePrototype
//
//  Created by Apprenant 16 on 27/03/2023.
//

import SwiftUI

struct UnitsConversion: View {
    
    
    @State private var inputValue = ""
    @State private var outputValue = ""
    
    @State private var inputUnitValue = 2
    let inputUnits = ["millilitre", "centilitre", "décilitre", "litre"]
    
    @State private var outputUnitValue = 2
    let outputUnits = ["millilitre", "centilitre", "décilitre", "litre"]
    
    var inputUnitAfterConversionToOutput: String {
        
        var output = ""
        var input = Measurement(value: 0, unit: UnitVolume.milliliters)
        
        switch inputUnits[inputUnitValue] {
        case "millilitre":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitVolume.milliliters)
        case "centilitre":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitVolume.centiliters)
        case "décilitre":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitVolume.deciliters)
        case "litre":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitVolume.liters)
        default:
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitVolume.milliliters)
        }
        
        switch outputUnits[outputUnitValue] {
        case "millilitre":
            output = String(describing: input.converted(to: UnitVolume.milliliters))
        case "centilitre":
            output = String(describing: input.converted(to: UnitVolume.centiliters))
        case "décilitre":
            output = String(describing: input.converted(to: UnitVolume.deciliters))
        case "litre":
            output = String(describing: input.converted(to: UnitVolume.liters))
        default:
            output = String(describing: input.converted(to: UnitVolume.milliliters))
        }
        
        return output
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header:Text("Unité de volume")) {
                    Picker("Input Unit -", selection: $inputUnitValue) {
                        ForEach(0..<inputUnits.count) {
                            Text("\(inputUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(height: 40)
                    .background(Color("CouleurVert"))
                    .cornerRadius(5)
                }
                
                Section(header:Text("Quantité") .padding(.top, -20)) {
                    TextField("Entrez une quantité...", text: $inputValue)
                        .cornerRadius(30)
                        .frame(width: 300, height: 0)
                }
                
                Section(header:Text("Convertir en") .padding(.top, -20)) {
                    Picker("Output Unit -", selection: $outputUnitValue) {
                        ForEach(0..<outputUnits.count) {
                            Text("\(outputUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(height: 40)
                    .background(Color("CouleurVert"))
                    .cornerRadius(5)
                }
                
                Section(header:Text("Résultat") .padding(.top, -20)) {
                    Text(inputUnitAfterConversionToOutput)
                        .frame(width: 100, height: 50)
                        .background(Color.black)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.top, -10)
                }
            }
            .scrollContentBackground(.hidden)
            
        }
    }
}

func doubleFormat(_ val:Double) -> String {
  let formattedString = String(format: "%.2f", val)
  let replacedString = formattedString.replacingOccurrences(of: ",", with: "")
  return "\(replacedString)"
}

//extension Double {
//    func string2f () -> String {
//        return String(format: "%.2f", self)
//    }
//}
//
//extension Double {
//    func rounded(toPlaces places: Int) -> Double {
//        let divisor = pow(10.0, Double(places))
//        return (self * divisor).rounded() / divisor
//    }
//}
//

struct UnitsConversion_Previews: PreviewProvider {
    static var previews: some View {
        UnitsConversion()
    }
}

//Text("\(self.centilitre.string2f())")
