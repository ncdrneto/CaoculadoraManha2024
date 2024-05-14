//
//  ContentView.swift
//  Caoculadora
//
//  Created by Newton Cardoso da Rocha Neto on 07/05/24.
//

import SwiftUI

//MARK: - View

struct ContentView: View {
    @State var years: Int?
    @State var months: Int?
    @State var result: Int?
    
    @State var porteSelected = Porte.pequeno
    @State var failedInput = false
    let tituloPreencherCampos = "Preencha os campos para cãocular!"
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20.0) {
                    Text("Qual a idade do seu cão?")
                        .font(.header5)
                    
                    Text("Anos")
                        .font(.body1)
                    
                    TextField("Quantos anos completos tem seu cão", value: $years, format: .number)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                    
                    Text("Meses")
                        .font(.body1)
                    
                    TextField("E quantos meses além disso ele tem", value: $months, format: .number)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                    
                    Text("Porte")
                        .font(.body1)
                    
                    Picker(selection: $porteSelected, label: Text("Portes")) {
                        ForEach(Porte.allCases, id: \.self) { porte in
                            Text(porte.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Divider()
                    
                    Spacer()
                    
                    if let result {
                        Text("Seu cachorro tem, em idade humana...")
                            .font(.body1)
                            
                        Text("\(result) anos")
                            .font(.display)
                    } else {
                        Image(ImageResource.clarinha)
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 150)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    }
                    
                    Spacer()
                    
                    Button("Cãocular", action: processYears)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(.indigo)
                    .foregroundStyle(.white)
                    .clipShape(.rect(cornerRadius: 10))
                    .bold()
                }
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .padding()
                .containerRelativeFrame(.vertical)
                .animation(.easeInOut, value: result)
            }
            .alert(tituloPreencherCampos, isPresented: $failedInput, actions: {
                Button("OK", role: .cancel, action: {})
            })
            .navigationTitle("Cãoculadora")
            .scrollDismissesKeyboard(.immediately)
            .toolbarBackground(.indigo, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
        .fontDesign(.rounded)
    }
    


}

//MARK: - Functions

extension ContentView {
    func processYears() {
        print("cãocular")
        
        guard let years, let months else {
            print("Campos não preenchidos!")
            failedInput = true
            return
        }
        
        guard months > 0 || years > 0 else {
            print("Pelo menos um campo deve ser maior que zero.")
            return
        }
        
        result = porteSelected.calcularIdade(deAnos: years, eMeses: months)
  
    }
}

#Preview {
    ContentView()
}
