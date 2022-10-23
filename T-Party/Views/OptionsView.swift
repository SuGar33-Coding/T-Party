import Foundation
import SwiftUI
import MapKit

struct OptionsView: View {
    
    @State var schedulePressed = false
    @State var isActive = false
        
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 40) {
                    StopItemView()
                    ForEach(tList, id: \.transportType) { option in
                        NavigationLink(
                            destination: ScheduleView(senderKey: option)
                                .navigationTitle(option.fullName)
                        ) {
                            SingleListItemView(thisOne: option)
                        }
                    }
                }
                
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView()
    }
}

