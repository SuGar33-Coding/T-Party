import Foundation
import SwiftUI

// this is all ugly and hardcoded rn but can be replaced lol idk

struct OptionsView: View {
    var body: some View {
            ScrollView{
                ZStack {
                VStack(alignment: .leading, spacing: 40) {
                HStack(spacing: 50) {
                VStack{
                Image("bus4")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(20)
                    .overlay(
                        Text("64")
                            .font(.system(size:18))
                            .foregroundColor(Color("BusYellow"))
                            .fontWeight(.bold)
                            .padding(5),
                        alignment: .bottom)
                Text("Oak Square")
                        .font(.system(size:16))
                        .fontWeight(.bold)
                }
                    VStack{
                        Text("<<Station Name>>")
                        Text("4 min")
                        .font(.system(size:35))
                        .fontWeight(.bold)
                        Text("7 min")
                        Text("11 min")
                        }
                    
                    }
                .onTapGesture {
                  print("You tapped the 64 bus.")
                
                
                    }
                HStack(spacing: 50) {
                VStack{
                Image("gl4")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(20)
                    .overlay(
                        Text("GL")
                            .font(.system(size:18))
                            .foregroundColor(Color("GLGreen"))
                            .fontWeight(.bold)
                            .padding(5),
                        alignment: .bottom)
                Text("Park Street")
                        .font(.system(size:16))
                        .fontWeight(.bold)
                }
                    VStack{
                        Text("<<Station Name>>")
                        Text("7 min")
                        .font(.system(size:35))
                        .fontWeight(.bold)
                        Text("500 min")
                        Text("1104 min")
                        }
                    .contentShape(Rectangle())
                    .onTapGesture {
                      print("You tapped the green line.")
                    }
                }
                HStack(spacing: 50) {
                VStack{
                Image("rl4")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(20)
                    .overlay(
                        Text("RL")
                            .font(.system(size:18))
                            .foregroundColor(Color("RLRed"))
                            .fontWeight(.bold)
                            .padding(5),
                        alignment: .bottom)
                Text("Braintree")
                        .font(.system(size:16))
                        .fontWeight(.bold)
                }
                VStack{
                    Text("<<Station Name>>")
                    Text("12 min")
                    .font(.system(size:35))
                    .fontWeight(.bold)
                    Text("16 min")
                    Text("19 min")
                    }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                      print("You tapped the red line.")
                    }
                HStack(spacing: 50) {
                VStack{
                Image("ol4")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(20)
                    .overlay(
                        Text("OL")
                            .font(.system(size:18))
                            .foregroundColor(Color("OLOrange"))
                            .fontWeight(.bold)
                            .padding(5),
                        alignment: .bottom)
                Text("Forest Hills")
                        .font(.system(size:16))
                        .fontWeight(.bold)
                }
                VStack{
                    Text("<<Station Name>>")
                    Text("16 min")
                    .font(.system(size:35))
                    .fontWeight(.bold)
                    Text("19 min")
                    Text("23 min")
                    }
                }
                    .contentShape(Rectangle())
                    .onTapGesture {
                      print("You tapped the orange line.")
                }
                HStack(spacing: 50) {
                VStack{
                Image("bl4")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(20)
                    .overlay(
                        Text("BL")
                            .font(.system(size:18))
                            .foregroundColor(Color("BLBlue"))
                            .fontWeight(.bold)
                            .padding(5),
                        alignment: .bottom)
                Text("Wonderland")
                        .font(.system(size:16))
                        .fontWeight(.bold)
            }
                VStack{
                    Text("<<Station Name>>")
                    Text("24 min")
                    .font(.system(size:35))
                    .fontWeight(.bold)
                    Text("29 min")
                    Text("32 min")
                }
            }
                    .contentShape(Rectangle())
                    .onTapGesture {
                    print("You tapped the blue line.")
                    }
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
