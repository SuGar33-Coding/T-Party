import Foundation
import SwiftUI
import MapKit

struct OptionsView: View {
    
    @State var schedulePressed = false
    @State var isActive = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 40) {
                ForEach(tList, id: \.transportType) { option in
                    NavigationLink(destination: ScheduleView(senderKey: option)) {
                            SingleListItemView(thisOne: option)
                    }
                    .navigationTitle("")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView()
    }
}

