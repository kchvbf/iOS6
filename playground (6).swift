import Foundation

struct Card {
    let suit: String
    let rank: String
    
    init(suit: String, rank: String) {
        self.suit = suit
        self.rank = rank
    }
}

func generateDeck() -> [Card] {
    let suits = ["Пики", "Трефы", "Червы", "Бубны"]
    let ranks = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Валет", "Дама", "Король", "Туз"]
    var deck = [Card]()
    
    for suit in suits {
        for rank in ranks {
            deck.append(Card(suit: suit, rank: rank))
        }
    }
    
    return deck
}

func drawHand(from deck: [Card]) -> [Card] {
    var shuffledDeck = deck.shuffled()
    var hand = [Card]()
    
    for _ in 0..<5 {
        let card = shuffledDeck.removeLast()
        hand.append(card)
    }
    
    return hand
}

func checkHand(_ hand: [Card]) -> String {
    var ranks = hand.map { $0.rank }
    let suits = hand.map { $0.suit }
    

    if Set(suits).count == 1 && Set(ranks).count == 5 && ranks.contains("10") && ranks.contains("Валет") && ranks.contains("Дама") && ranks.contains("Король") && ranks.contains("Туз") {
        return "Роял-флеш"
    }
    
    for i in 0...4{
        switch ranks[i] {
        case "Валет":
            ranks[i]="11"
        case "Дама":
            ranks[i]="12"
        case "Король":
            ranks[i]="13"
        case "Туз":
            ranks[i]="14"
        default:
            continue
        }
    }
    
    let sortedRanks = ranks.compactMap { Int($0) }.sorted()
    var isStraight = true
    for i in 0..<sortedRanks.count-1 {
        if sortedRanks[i+1] - sortedRanks[i] != 1 {
            isStraight = false
            break
        }
    }
    let isFlush = Set(suits).count == 1
    
    if isStraight && isFlush  {
        return "Стрит-флеш"
    }
    
    if isStraight {
        return "Стрит"
    }
    if isFlush {
        return "Флеш"
    }

    var rankCounts = [String: Int]()
    for rank in ranks {
        rankCounts[rank, default: 0] += 1
    }
    if rankCounts.values.contains(4) {
        return "Каре"
    }
    
    if rankCounts.values.contains(3) && rankCounts.values.contains(2) {
        return "Фулл-хаус"
    }
    
    if rankCounts.values.contains(3) {
        return "Тройка"
    }
    
    let pairCount = rankCounts.values.filter { $0 == 2 }.count
    if pairCount == 2 {
        return "Две пары"
    }
    
    if pairCount == 1 {
        return "Пара"
    }
    
    return "Старшая карта"
}

let deck = generateDeck()

// Тут можно вводить карты чтобы проверять работу комбинаций
// let card1=Card(suit: "Трефы", rank: "10")
// let card2=Card(suit: "Бубны", rank: "10")
// let card3=Card(suit: "Червы", rank: "10")
// let card4=Card(suit: "Пики", rank: "9")
// let card5=Card(suit: "Трефы", rank: "9")

// var deck1 = [Card]()
// deck1.append(card1)
// deck1.append(card2)
// deck1.append(card3)
// deck1.append(card4)
// deck1.append(card5)

// чтобы проверять комбинацию заменить deck на deck1

let hand = drawHand(from: deck)

let combination = checkHand(hand)

print("Ваша комбинация: \(combination)")
print("Карты в вашей руке:")
for card in hand {
    print("\(card.suit) - \(card.rank)")
}