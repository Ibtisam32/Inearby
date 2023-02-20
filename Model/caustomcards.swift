//
//  caustomcards.swift
//  sad
//
//  Created by Alanoud Saleh on 28/07/1444 AH.
//


import SwiftUI


struct casutomcards<Content: View,Item,ID>: View where Item: RandomAccessCollection,ID: Hashable,Item.Element: Equatable {
    var content: (Item.Element,CGSize)->Content
    var id: KeyPath<Item.Element,ID>
    

    var s1pacing: CGFloat
    var cardpadd1ng: CGFloat
    var items: Item
    @Binding var index: Int
    
    init(index: Binding<Int>,items: Item,spacing: CGFloat = 30,cardPadding: CGFloat = 80,id: KeyPath<Item.Element, ID>,@ViewBuilder content: @escaping (Item.Element,CGSize) -> Content) {
        self.content = content
        self.id = id
        self._index = index
        self.s1pacing = spacing
        self.cardpadd1ng = cardPadding
        self.items = items
    }
    
 
    @GestureState var tt1: CGFloat = 0
    @State var offset: CGFloat = 0
    @State var lastStoredOffset: CGFloat = 0
    
    @State var currentIndex: Int = 0
    // MARK: Rotation
    @State var rotation: Double = 0
    var body: some View {
        GeometryReader{proxy in
            let size = proxy.size
            
            let cardWidth = size.width - (cardpadd1ng - s1pacing)
            LazyHStack(spacing: s1pacing){
                ForEach(items,id: id){game in
                 
                    
                    let index = ndex(item: game)
                    content(game,CGSize(width: size.width - cardpadd1ng, height: size.height))
                      
                    
                    
                        .rotationEffect(.init(degrees: Double(index) * 5), anchor: .bottom)
                        .rotationEffect(.init(degrees: rotation), anchor: .bottom)
                       
                    
                        .offset(y: offset(index: index, cardWidth: cardWidth))
                        .frame(width: size.width - cardpadd1ng, height: size.height)
                        .contentShape(Rectangle())
                }
            }
            .padding(.horizontal,s1pacing)
            .offset(x: scrolllim())
            .contentShape(Rectangle())
            .gesture(
                DragGesture(minimumDistance: 5)
                    .updating($tt1, body: { value, out, _ in
                        out = value.translation.width
                    })
                    .onChanged{changedd(value: $0, cardWidth: cardWidth)}
                    .onEnded{End(value: $0, cardWidth: cardWidth)}
            )
        }
        .padding(.top,130)
        .onAppear{
            let extraSpace = (cardpadd1ng / 2) - s1pacing
            offset = extraSpace
            lastStoredOffset = extraSpace
        }
        .animation(.easeInOut, value: tt1 == 0)
    }
    
    // MARK: Moving Current Item Up
    func offset(index: Int,cardWidth: CGFloat)->CGFloat{
    
        
       
        let progress = ((tt1 < 0 ? tt1 : -tt1) / cardWidth) * 60
        let yOffset = -progress < 60 ? progress : -(progress + 120)
        
     
        let previous = (index - 1) == self.index ? (tt1 < 0 ? yOffset : -yOffset) : 0
        let next = (index + 1) == self.index ? (tt1 < 0 ? -yOffset : yOffset) : 0
        let In_Between = (index - 1) == self.index ? previous : next
        
        return index == self.index ? -60 - yOffset : In_Between
    }
    

    func ndex(item: Item.Element)->Int{
        let array = Array(items)
        if let index = array.firstIndex(of: item){
            return index
        }
        return 0
    }
    
   
    func scrolllim()->CGFloat{
        let extraSpace = (cardpadd1ng / 2) - s1pacing
        if index == 0 && offset > extraSpace{
            return extraSpace + (offset / 4)
        }else if index == items.count - 1 && tt1 < 0{
            return offset - (tt1 / 2)
        }else{
            return offset
        }
    }
    
    func changedd(value: DragGesture.Value,cardWidth: CGFloat){
        let translationX = value.translation.width
        offset = translationX + lastStoredOffset
        
        // MARK: Calculating Rotation
        let progress = offset / cardWidth
        rotation = progress * 5
    }
    
    func End(value: DragGesture.Value,cardWidth: CGFloat){
        // MARK: Finding Current Index
        var _index = (offset / cardWidth).rounded()
        _index = max(-CGFloat(items.count - 1), _index)
        _index = min(_index, 0)
        
        currentIndex = Int(_index)
  
        
        index = -currentIndex
        withAnimation(.easeInOut(duration: 0.25)){
        
            
            
            let extraSpace = (cardpadd1ng / 2) - s1pacing
            offset = (cardWidth * _index) + extraSpace
            
            
            let progress = offset / cardWidth
        
            
            
            rotation = (progress * 5).rounded() - 1
        }
        lastStoredOffset = offset
    }
}

struct casutomcards_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
