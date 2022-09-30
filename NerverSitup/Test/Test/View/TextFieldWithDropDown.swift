//
//  TextFieldWithDropDown.swift
//  Test
//
//  Created by Suriya on 29/9/2565 BE.
//

import SwiftUI

struct TextFieldWithDropDown: View {
    @Binding var text  : String
    @Binding var style : UNIT?
    var onCommit: ((String)->Void)? = nil
    var body: some View {
        ZStack {
            HStack {
                Menu{
                    ForEach(UNIT.allCases){ unit in
                        Button {
                            style = unit
                        } label: {
                            Text(unit.getName())
                                .font(.system(size: 16,weight: .bold,design: .rounded))
                        }
                    }

                }label: {
                    if style == nil {
                        Image(systemName: "banknote.fill")
                    }else{
                        Text("\(style!.getName())")
                    }
                    Image(systemName: "arrowtriangle.down.fill")
                }
                .font(.system(size: 18,weight: .bold,design: .rounded))
                .frame(width : 70)
                TextField("", text: $text)
                    .font(.system(size: 18,weight: .regular,design: .rounded))
                    .textContentType(.oneTimeCode)
                    .keyboardType(.numberPad)
                
                Button("Exchange", role: style == nil ? .cancel : .destructive) {
                    onCommit?(text)
                }.font(.system(size: 18,weight: .bold,design: .rounded))
                .allowsHitTesting(style == nil ? false : true)
                
                
            }
            .padding()
      
        }.background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray,lineWidth: 1)
        )
    }
}

struct TextFieldWithDropDown_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldWithDropDown(text: .constant(""), style: .constant(nil))
    }
}

enum UNIT :CaseIterable {
    case USD
    case GBP
    case EUR
}
extension UNIT : Identifiable {
    var id: Self { self }
    func getSymbol()->String{
        switch self {
            
        case .USD:
            return "&#36;".htmlToString
        case .GBP:
            return "&pound;".htmlToString
        case .EUR:
            return "&euro;".htmlToString
        }
    }
    func getName()->String{
        switch self {
            
        case .USD:
            return "USD"
        case .GBP:
            return "GBP"
        case .EUR:
            return "EUR"
        }
    }
}
