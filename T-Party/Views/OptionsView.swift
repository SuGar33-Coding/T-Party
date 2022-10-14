import Foundation
import SwiftUI
import MapKit

struct OptionsView: View {
    
    @State var schedulePressed = false
    @State var isActive = false
    @State var sendKey =
    ListData(
        transportType: "OL",
        destination: "Forest Hills",
        currentStation: "Ruggles",
        sched: [
            "4 min",
            "16 min",
            "21 min"
        ]
    )
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 40){
                ForEach(tList, id: \.transportType) {  option in
                    NavigationLink(destination: ScheduleView(senderKey: sendKey), isActive: $isActive) {
                        Button(action: {sendKey = option
                            isActive = true}){
                                SingleListItemView(thisOne: option)
                            }
                        }
                    .navigationTitle("")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
            .sheet(isPresented: $schedulePressed) {
                ScheduleView(senderKey: sendKey)
            }
        }
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView()
    }
}

