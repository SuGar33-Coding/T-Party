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
    @Binding var currAnnotation: AnnotationList
    
    var body: some View {
        if showFilterOptions{
            ZStack{
                Color.white
                    .border(.black)
                    VStack{
                        HStack {
                            CheckBoxView(checked: $trainChecked, currAnnotations: $currAnnotation, showT: $trainChecked, showBus: $busChecked)
                            Text("T Stops")
                        }
                        HStack{
                            CheckBoxView(checked: $busChecked, currAnnotations: $currAnnotation, showT: $trainChecked, showBus: $busChecked)
                            Text("Bus Stops")
                        }
                        
                    }
                    .frame(width: 200, height: 100, alignment: .center)
                
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
    @Binding var currAnnotations: AnnotationList
    @Binding var showT: Bool
    @Binding var showBus: Bool
    var body: some View {
        Image(systemName: checked ? "checkmark.square.fill" : "square")
            .foregroundColor(checked ? Color(UIColor.black) : Color.secondary)
            .onTapGesture {
                self.checked.toggle()
                currAnnotations.resetAnnotations(showT: showT, showBus: showBus)
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
