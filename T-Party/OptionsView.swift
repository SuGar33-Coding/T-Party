import Foundation
import SwiftUI

struct OptionsView: View {
    var body: some View {
        ScrollView{
            ZStack {
                VStack(alignment: .leading, spacing: 40) {
                    ForEach(tList, id: \.sched) {  option in
                        makeStack(data:option)
                    }
                }
            }
        }
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
            OptionsView().preferredColorScheme(.dark)
        OptionsView()
    }
}
