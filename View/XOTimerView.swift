import SwiftUI
 
let timer = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()
 
struct XOTimerView: View {
     
    @State var counter: Int = 0
    var countTo: Int = 10
    
    var body: some View {
        VStack{
            ZStack{
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: 330, height: 355)
                    .overlay(
                        Rectangle().stroke(Color.clear, lineWidth: 25)
                )
                 
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: 330, height: 355)
                    .overlay(
                        Rectangle().trim(from:0, to: progress())
                            .stroke(
                                style: StrokeStyle(
                                    lineWidth: 40,
                                    lineCap: .round,
                                    lineJoin:.round
                                )
                            )
                            .foregroundColor(
                                (completed() ? Color.clear : Color("isPlay"))
                            ).animation(
                                .easeInOut(duration: 0.2)
                            )
                    ).cornerRadius(20)
                 
             
            }
        }.onReceive(timer) { time in
            if (self.counter < self.countTo) {
                self.counter += 1
            }
        }
    }
     
    func completed() -> Bool {
        return progress() == 1
    }
     
    func progress() -> CGFloat {
        return (CGFloat(counter) / CGFloat(countTo))
    }
}
 
struct clock: View {
    var coun: Int
    var couTo: Int
     
    var body: some View {
        VStack {
            Text(counterToMinutes())
                .font(.system(size: 60))
                .fontWeight(.black)
        }
    }
     
    func counterToMinutes() -> String {
        let currentTime = couTo - coun
        let seconds = currentTime % 60
        let minutes = Int(currentTime / 60)
         
        return "\(seconds < 10 ? "0" : "")\(seconds)"
    }
}
 
struct XOTimerView_Previews: PreviewProvider {
    static var previews: some View {
        XOTimerView()
    }
}
