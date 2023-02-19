//
//  MapPopUpView.swift
//  T-Party
//
//  Created by Emily Mallaber on 2/18/23.
//

import SwiftUI

struct MapPopUpView: View {
    
    @State var trainChecked: Bool
    @State var busChecked: Bool
    @Binding var showFilterOptions: Bool
    
    var body: some View {
        if showFilterOptions{
            ZStack{
                Color.white
                    .frame(width: 300, height: 200, alignment: .center)
                    .border(.black)
                VStack(alignment: .trailing){
                    Button() {
                        showFilterOptions.toggle()
                    } label: {
                        Image(systemName: "xmark.app")
                            .font(.system(size: 25))
                    }
                    .padding()
                    VStack{
                        HStack {
                            CheckBoxView(checked: $trainChecked)
                            Text("T Stops")
                        }
                        HStack{
                            CheckBoxView(checked: $busChecked)
                            Text("Bus Stops")
                        }
                        
                    }
                    
                }
            }
        }
    }

}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapPopUpView(trainChecked: false, busChecked: false, showFilterOptions: true)
//    }
//}

struct CheckBoxView: View {
    @Binding var checked: Bool

    var body: some View {
        Image(systemName: checked ? "checkmark.square.fill" : "square")
            .foregroundColor(checked ? Color(UIColor.black) : Color.secondary)
            .onTapGesture {
                self.checked.toggle()
            }
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    struct CheckBoxViewHolder: View {
        @State var checked = false

        var body: some View {
            CheckBoxView(checked: $checked)
        }
    }

    static var previews: some View {
        CheckBoxViewHolder()
    }
}
