import UIKit

//옵셔널 바인딩:if - let, guard

enum UserMissionState: String {
    case missionFailed = "실패"
    case missionSucceed = "성공"
}

//func checkNumber(number:Int?) -> (UserMissionState, Int?){
//
//    if number != nil {
//        return (.missionSucceed, number!)
//    } else {
//        return (.missionFailed, nil)
//    }
//}

func checkNumber2(number:Int?) -> (UserMissionState, Int?){
    if let value = number {
        return (.missionSucceed, value)
    } else {
        return (.missionFailed, nil)
    }
}

func checkNumber3(number:Int?) -> (UserMissionState, Int?){
    
    guard let value = number else {
        return (.missionFailed, nil)
    }
    
    return (.missionSucceed, value)
}

//타입캐스팅~~함찾아보기!

let array: [Any] = [1, true, "안녕"]

let arryInt = array as? [Int]

//let arryInt2 = array as! [Int] -> 타입캐스팅 특: 메모리의 인스턴스 타입은 바뀌지 않는다.

class Mobile {
    let name: String
    
    init(name:String){
        self.name = name
    }
}

class AppleMobile: Mobile {
    var company = "애플"
}

class GoogleMobile: Mobile {
    
}

let mobile = Mobile(name: "PHONE")
let apple = AppleMobile(name: "Iphone")
let google = GoogleMobile(name: "Galaxy")

mobile is Mobile
mobile is AppleMobile
mobile is GoogleMobile

apple is Mobile
apple is AppleMobile
apple is GoogleMobile

let iPhone:Mobile = AppleMobile(name: "Ipad")
iPhone.name

if let value = iPhone as? AppleMobile{
    print("성공",value.company)
}


//클래스 , 구조체

enum DrinkSize{
    case short, tall, grande, venti
}

struct DrinkStruct {
    let name: String
    var count: Int
    var size: DrinkSize
}

class DrinkClass {
    let name: String
    var count: Int
    var size: DrinkSize
    
    init(name:String, count: Int, size: DrinkSize){
        self.name = name
        self.count = count
        self.size = size
    }
}

var drinkStruct = DrinkStruct(name: "아메리카노", count: 3, size: .tall)

drinkStruct.count = 2
drinkStruct.size = .venti

print(drinkStruct.name, drinkStruct.count, drinkStruct.size)

let drinkClass = DrinkClass(name: "블루베리스무디", count: 2, size: .venti)

drinkClass.count = 5
drinkClass.size = .tall

print(drinkClass.name, drinkClass.count, drinkClass.size)


//지연 저장 프로퍼티
struct Poster {
    var image: UIImage = UIImage(systemName: "star") ?? UIImage()
    
    init(){
        print("1000 Poster Initialized")
    }
}

struct MediaInfo{
    var mediaTitle:String
    var mediaRuntime:Int
    lazy var mediaPoster: Poster = Poster()
}

var media = MediaInfo(mediaTitle: "오징어게임", mediaRuntime: 333)
print("1")
media.mediaPoster
print("2")


//연산 프로퍼티 & 프로퍼티 감시자 -> Swift5.1 PropertyWrapper(@Enviroment)
//타입알리어스
class BMI {
    typealias BMIValue = Double
    
    var userName: String {
        willSet{
            print("닉네임 바뀔예정: \(userName) -> \(newValue)")
        }
        didSet{
            changeNameCount += 1
            print("닉네임 변경결과: \(oldValue) -> \(userName) .")
        }
    }
    
    var changeNameCount = 0
    
    var userWeight: BMIValue
    var userHeight: BMIValue
    
    var bmiResult: String {
        get{
            let bmiValue = (userWeight * userWeight) / userHeight
            let bmiStatus = bmiValue < 18.5 ? "저체중" : "정상 or 이상"
            return "\(userName)의 BMI지수는 \(bmiValue)으로, \(bmiStatus)입니다."
        }
        set(nickname){
            userName = nickname
        }
    }
    
    init(userName:String, userWeight:Double, userHeight:Double){
        self.userName = userName
        self.userWeight = userWeight
        self.userHeight = userHeight
    }
}

let bmi = BMI(userName: "Jack", userWeight: 50, userHeight: 160)

let result = bmi.bmiResult
print(result)

bmi.bmiResult = "MiNJI"

bmi.bmiResult = "CL"

bmi.bmiResult = "BOM"

bmi.bmiResult = "DARA"

print(bmi.bmiResult)
print(bmi.changeNameCount)



//iOS 011회차 과제

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
