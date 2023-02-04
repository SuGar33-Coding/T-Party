import Foundation
import SwiftUI
import MapKit

struct ScheduleListView: View {
    
    @State var schedulePressed = false
    @State var isActive = false
        
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 40) {
                    ForEach(tList, id: \.transportType) { option in
                        NavigationLink(
                            destination: ScheduleDetailView(senderKey: option)
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

struct ScheduleListView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleListView()
    }
}

