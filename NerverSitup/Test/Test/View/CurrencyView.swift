//
//  CurrencyView.swift
//  Test
//
//  Created by Suriya on 28/9/2565 BE.
//

import SwiftUI

struct CurrencyView: View {
    @StateObject var vc = CurrenencyViewModel()
    @State var text = ""
    @State var unit : UNIT? = nil
    @State var calculated = ""
    private func display(with label : String , and value : String)->String{
        return "\(label) \(value)"
    }
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (alignment:.leading){
                    // MARK: -  HEADER
                    VStack {
                        HStack {
                            Text("\(vc.currentprice?.chartName ?? "")")
                                .font(.system(size: 50,weight: .bold,design: .rounded))
                                
                            Spacer()
                        }
                        Text(vc.currentprice?.disclaimer ?? "")
                            .font(.system(size: 12,weight: .light,design: .rounded))
                    }.padding()
                        .foregroundColor(.black)
                    // MARK: - PRICE
                    VStack(spacing : -4){
                        Text(display(with:vc.currentprice?.bpi?.USD.code ?? "", and:vc.currentprice?.bpi?.USD.rate ?? ""))
                            .foregroundColor(vc.isUpdate ? .blue:.black)
                        Text(display(with:vc.currentprice?.bpi?.GBP.code ?? "", and:vc.currentprice?.bpi?.GBP.rate ?? ""))
                            .foregroundColor(vc.isUpdate ? .blue:.black)
                        Text(display(with:vc.currentprice?.bpi?.EUR.code ?? "", and:vc.currentprice?.bpi?.EUR.rate ?? ""))
                            .foregroundColor(vc.isUpdate ? .blue:.black)
                    }.padding(.horizontal)
                    .font(.system(size: 25,weight: .medium,design: .rounded))
                    
                    // MARK: - UPDATED
                    VStack (spacing : 8){
                        HStack{
                            Spacer()
                            Image(systemName: "calendar")
                            Text(vc.currentprice?.time?.updatedISO?.dateISO.getFormattedByLocal(format: "dd MMMM yyyy", local: "th") ?? "")
                        }
                        HStack{
                            Spacer()
                            Image(systemName: "clock")
                            Text(vc.currentprice?.time?.updatedISO?.dateISO.getFormattedByLocal(format: "hh:mm aa ", local: "th") ?? "")
                        }
                        HStack {
                            Spacer()
                            NavigationLink("history data->") {
                                HistoryView()
                                    .environmentObject(vc)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .font(.system(size: 16,weight: .regular,design: .rounded))
                    
                  
                    
                    VStack (alignment:.leading,spacing: -16){
                        Text("Bitcoin")
                            .font(.system(size: 16,weight: .regular,design: .rounded)).padding()
                        Text(calculated.isEmpty ? "0.000" : calculated)
                            .font(.system(size: 50,weight: .bold,design: .rounded))
                            .padding(.leading)
                        

                      
                        
                    }
                    
                    
              
                    TextFieldWithDropDown(text: $text, style: $unit){ tx in
                        let val = Double(text) ?? 0.0
                        var op : Double = 0.0
                        guard let unit = self.unit else {
                            return
                        }
                        switch unit {
                            
                        case .USD:
                            if let rate_float = vc.currentprice?.bpi?.USD.rate_float{
                                op = val / rate_float
                            }
                          
                        case .GBP:
                            if let rate_float = vc.currentprice?.bpi?.GBP.rate_float{
                                 op = val / rate_float
                             }
                        case .EUR:
                            if let rate_float = vc.currentprice?.bpi?.EUR.rate_float{
                                 op = val / rate_float
                             }
                        }
                      
                        let formated = String(format: "%.4f", op)
                        self.calculated = formated
                    }
                        .padding(.horizontal)
                    
                  Spacer()
                    
                }.onTapGesture {
                    hideKeyboard()
                }
                .background(Color.white)
                .onReceive(NotificationCenter.default.publisher(for: .CNReceiveRefresh)) { _ in
                    vc.fetchCurrentprice()
                    vc.isUpdate = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                        vc.isUpdate = false
                    }
            }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyView()
    }
}
