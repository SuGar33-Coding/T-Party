import SwiftUI

struct StopItemView: View {
    @ObservedObject var conductor: LiveSchedule
    
    
    init() {
        self.conductor = try! LiveSchedule(stopId: "70146")
    }
    
    var body: some View {
        HStack(spacing: 100) {
            VStack{
                Image(conductor.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(20)
                    .overlay(
                        Text(conductor.fullName)
                            .font(.system(size:18))
                            .foregroundColor(conductor.color)
                            .fontWeight(.bold)
                            .padding(5),
                        alignment: .bottom)
                Text(conductor.direction)
                    .font(.system(size:16))
                    .fontWeight(.bold)
                }
            .task {
                try! await self.conductor.update()
            }
            VStack{
                Text(conductor.oneArrivalDate.formatted(Date.RelativeFormatStyle()))
                    .font(.system(size:35))
                    .fontWeight(.bold)
            }
        }
    }
}

struct StopItemView_Previews: PreviewProvider {
    static var previews: some View {
        StopItemView()
    }
}
