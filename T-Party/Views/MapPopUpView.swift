//
//  MapPopUpView.swift
//  T-Party
//
//  Created by Emily Mallaber on 2/18/23.
//

import SwiftUI

struct MapPopUpView: View {
    
    @Binding var trainChecked: Bool
    @Binding var busChecked: Bool
    @Binding var showFilterOptions: Bool
    
    var body: some View {
        if showFilterOptions{
            ZStack{
                Color.white
                    .border(.black)
                VStack(alignment: .trailing){
                    Button() {
                        showFilterOptions.toggle()
                    } label: {
                        Image(systemName: "xmark.app")
                            .font(.system(size: 25))
                    }.padding()
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
                    .frame(width: 200, height: 100, alignment: .center)
                }
            }
            .frame(width: 200, height: 100, alignment: .center)
        }
    }

}
//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapPopUpView(trainChecked: false, busChecked: false, showFilterOptions: showFilterOptions)
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

//struct CheckBoxView_Previews: PreviewProvider {
//    struct CheckBoxViewHolder: View {
//        @State var checked = false
//
//        var body: some View {
//            CheckBoxView(checked: $checked)
//        }
//    }
//
//    static var previews: some View {
//        CheckBoxViewHolder()
//    }
//}
