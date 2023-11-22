import SwiftUI

struct ContentView: View {
    init() {
        let navbarAppearance = UINavigationBarAppearance()
        navbarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navbarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = navbarAppearance
        UINavigationBar.appearance().compactAppearance = navbarAppearance
       
    }
    var body: some View {
        
        NavigationView {
            ZStack{
                Image("BG")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height:
                            UIScreen.main.bounds.height)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    NavigationLink(destination: AcCheckList()) {
                        Text("Aircraft Checklist")
                            .font(.headline)
                            .frame(width:250,height: 40)
                            .background(Color(red: 0.982, green: 0.64, blue: 0.05))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                    }
                    NavigationLink(destination: FuelCalculator_A321()) {
                        Text("Fuel Calc")
                            .font(.headline)
                            .frame(width:250,height: 40)
                            .background(Color(red: 0.982, green: 0.64, blue: 0.05))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                    }
                    NavigationLink(destination: Mel()) {
                        Text("Mel Calc")                    .font(.headline)
                            .frame(width:250,height: 40)
                            .background(Color(red: 0.982, green: 0.64, blue: 0.05))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                    }
                    NavigationLink(destination: test()) {
                        Text("Testing")                    .font(.headline)
                            .frame(width:250,height: 40)
                            .background(Color(red: 0.982, green: 0.64, blue: 0.05))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
            }
            .preferredColorScheme(.light)
            .navigationTitle("Aircraft tools")
            .foregroundColor(.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
            ContentView()
        
    }
}


