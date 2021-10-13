
import UIKit

struct ExchangeRate {
    
    var currencyRate: Double{
        
        willSet{
            print("환율 변동 예정\(currencyRate)->\(newValue)")
        }
        didSet{
            print("환율 변동 완료\(currencyRate)->\(oldValue)")
        }
        
    }
    
    var USD: Double {
        willSet{
            print("환전 금액: USD:\(USD)달러로 환전될 예정")
        }
        didSet{
            print("KRW:\(KRW)원->\(USD)달러로 환전되었음")
        }
    }
    
    var KRW: Double {
        get {
                 return USD * currencyRate
             }

             set(KRW) {
                 USD = KRW / currencyRate
             }
    }
}

var rate: ExchangeRate = ExchangeRate(currencyRate: 1000, USD: 10)
rate.KRW = 50000
rate.USD = 1000
rate.currencyRate=1350

