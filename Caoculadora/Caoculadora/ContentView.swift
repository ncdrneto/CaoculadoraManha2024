//
//  ContentView.swift
//  Caoculadora
//
//  Created by Newton Cardoso da Rocha Neto on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    @State var years: Int?
    @State var months: Int?
    @State var result: Int?
    @State var porteSelecionado = "Pequeno"
    let portes = ["Pequeno", "Médio", "Grande"]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Qual a idade do seu cão?")
            
            Text("Anos")
            TextField("Quantos anos completos tem seu cão", value: $years, format: .number)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            
            Text("Meses")
            TextField("E quantos meses além disso ele tem", value: $months, format: .number)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            
            Text("Porte")
            
            Picker(selection: $porteSelecionado, label: Text("Portes")) {
                ForEach(portes, id: \.self) { porte in 
                    Text(porte)
                }
            }
            .pickerStyle(.segmented)
            
            if let result {
                Text("Seu cachorro tem, em idade humana...")
                Text("\(result) anos")
            } else {
                Image(ImageResource.clarinha)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 150)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
            
            Button("Cãocular", action: processYears)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(.indigo)
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: 10))
            .bold()
        }
        .padding()
        
    }
    
    func processYears() {
        print("cãocular")
        
        guard let years, let months else {
            print("Campos não preenchidos!")
            return
        }
        
        guard months > 0 || years > 0 else {
            print("Pelo menos um campo deve ser maior que zero.")
            return
        }
        
        let multiplicador: Int
        
        switch porteSelecionado {
        case "Pequeno":
            multiplicador = 6
        case "Médio":
            multiplicador = 7
        case "Grande":
            multiplicador = 8
        default:
            multiplicador = 0
        }
        
        result = years * multiplicador + months * multiplicador / 12
  
        
    }

}

#Preview {
    ContentView()
}
