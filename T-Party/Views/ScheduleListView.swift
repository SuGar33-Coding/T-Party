import Foundation
import SwiftUI
import MapKit

struct ScheduleListView: View {
    
    @State var schedulePressed = false
    @State var isActive = false
    @State var currStops = Stops()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 40) {
                    ForEach(tList, id: \.transportType) { option in
                        NavigationLink(
                            destination: ScheduleDetailView(schedule: option)
                                .navigationTitle(option.fullName)
                        ) {
                            SingleListItemView(thisOne: option)
                        }
                    }
                }.task{
                    try!await currStops.update()
                }
                
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

#Preview {
    ScheduleListView()
}
