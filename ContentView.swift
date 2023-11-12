//
//  ContentView.swift
//  MeasureEngine
//
//  Created by Brent Beamer on 11/12/23.
//

import SwiftUI

struct ContentView: View {

    @State private var input = 100.0
    @State private var selectedUnits = 0
    @State private var inputValue: Dimension = UnitVolume.fluidOunces
    @State private var outputValue: Dimension = UnitVolume.gallons
    @FocusState private var inputIsFocused: Bool
    
    let conversions = ["Volume","Distance", "Mass", "Temperature", "Time"]
    
    let unitTypes = [
        [UnitVolume.fluidOunces, UnitVolume.cups, UnitVolume.pints, UnitVolume.quarts, UnitVolume.gallons],
        [UnitLength.feet, UnitLength.kilometers, UnitLength.meters, UnitLength.miles, UnitLength.yards],
        [UnitMass.grams, UnitMass.kilograms, UnitMass.ounces, UnitMass.pounds],
        [UnitTemperature.celsius, UnitTemperature.fahrenheit, UnitTemperature.kelvin],
        [UnitDuration.hours, UnitDuration.minutes, UnitDuration.seconds]
        
    ]
    
    
    let formatter: MeasurementFormatter
    
    var result: String {
        let inputVolume = Measurement(value: input, unit: inputValue)
        let outputVolume = inputVolume.converted(to: outputValue)
        return formatter.string(from: outputVolume)
    }
    
    
    var body: some View {
        NavigationView {
                Form {
                    Section {
                        TextField("Amount", value: $input, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($inputIsFocused)
                    } header: {
                        Text("Amount to convert")
                            .font(.custom("Acme-Regular", size: 18))
                    }
                    .listRowBackground(Color.cyan)
                   
                    Picker("Unit of Measurement?", selection: $selectedUnits) {
                        ForEach(0..<conversions.count) {
                            Text(conversions[$0])
                        
                        }
                    }
                    .listRowBackground(Color.cyan)
                    
                    Picker("Convert from", selection: $inputValue) {
                        ForEach(unitTypes[selectedUnits], id: \.self) {
                            Text(formatter.string(from: $0).capitalized)
                        }
                    }
                    .listRowBackground(Color.cyan)
                    
                    Picker("Convert to", selection: $outputValue) {
                        ForEach(unitTypes[selectedUnits], id: \.self) {
                            Text(formatter.string(from: $0).capitalized)
                        }
                    }
                    .listRowBackground(Color.cyan)
                    
                    Section {
                        Text(result)
                    } header: {
                        Text("Engine Result")
                    }
                    .listRowBackground(Color.cyan)
                }
                .font(.custom("Acme-Regular", size: 20))
                .navigationTitle("MeasureEngine")
                .scrollContentBackground(.hidden)
                .background(.orange.opacity(0.6))
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            inputIsFocused = false
                        }
                    }
                }
                .onChange(of: selectedUnits, initial: true) { oldSelection, newSelection in
                    let units = unitTypes[newSelection]
                    inputValue = units[0]
                    outputValue = units[1]
                }

        }
    
    }
    
    init() {
        formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .long
    }
    
    
    
    
}
#Preview {
    ContentView()
}
