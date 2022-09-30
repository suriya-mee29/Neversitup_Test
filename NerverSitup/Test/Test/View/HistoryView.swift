//
//  HistoryView.swift
//  Test
//
//  Created by Suriya on 30/9/2565 BE.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var vc : CurrenencyViewModel
    var body: some View {
        VStack (alignment:.leading){
            HStack {
                Text("History")
                    .padding(.horizontal)
                    .font(.system(size: 30,weight: .bold, design: .rounded))
                Spacer()
            }
            List{
                ForEach(Array(vc.historyData.enumerated()),id: \.offset){ index , item in
                    Section{
                        HStack{
                            Text(item.bpi?.USD.code ?? "")
                            Spacer()
                            Text(item.bpi?.USD.rate ?? "")
                        }
                        HStack{
                            Text(item.bpi?.GBP.code ?? "")
                            Spacer()
                            Text(item.bpi?.GBP.rate ?? "")
                        }
                        HStack{
                            Text(item.bpi?.EUR.code ?? "")
                            Spacer()
                            Text(item.bpi?.EUR.rate ?? "")
                        }
                    } footer: {
                        HStack {
                            Spacer()
                            Text("updated \(item.time?.updatedISO?.dateISO.getFormattedByLocal(format: "dd MMMM yyyy hh:mm", local: "th") ?? "")")
                        }
                    }
                }
           
            }
          
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
            .environmentObject(CurrenencyViewModel())
    }
}
