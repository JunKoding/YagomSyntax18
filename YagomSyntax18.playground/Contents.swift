import Cocoa

// property 프로퍼티

// 프로퍼티
// 저장 프로퍼티 (stored property)
// 연산 프로퍼티 (computed property)
// 인스턴스 프로퍼티 (instance property)
// 타입 프로퍼티 (type property)

// 프로퍼티는 구조체, 클래스, 열거형 내부에 구현할 수 있다.
// 다만 열거형 내부에는 연산 프로퍼티만 구현할 수 있다.
// 연산 프로퍼티는 var로만 선언할 수 있다.





// 정의

struct Student {
    var name: String = ""
    var `class`: String = "swift"
    var koreanAge: Int = 0
    // 인스턴스 저장 프로퍼티
    
    var westernAge: Int {
        get {
            return koreanAge - 1
        }
        
        set(inputValue) {
            koreanAge = inputValue + 1
        }
    }
    // 인스턴스 연산 프로퍼티
    
    static var typeDescription: String = "학생"
    // 타입 저장 프로퍼티
    
    /*
     func selfIntroduce() {
     print("저는 \(self.class)반 \(name)입니다.")
     }
     // 인스턴스 메소드
     */
    
    var selfIntroduction: String {
        get {
            return "저는 \(self.class)반 \(name)입니다."
        }
    }
    // 읽기 전용 인스턴스 연산 프로퍼티 - get으로만 구현되어있으면 읽기 전용.
    
    /*
     static func selfIntroduce() {
     print("학생타입입니다.")
     */
    // 타입 메소드
    
    static var selfIntroduction: String {
        return "학생타입입니다."
    }
    // 읽기전용 타입 연산 프로퍼티
    // 읽기전용에서는 get을 생략할 수 있다.
}





// 사용

// 타입 연산 프로퍼티 사용
print(Student.selfIntroduction)
// 학생타입입니다.

// 인스턴스 생성
var jun: Student = Student()
jun.koreanAge = 26

// 인스턴스 저장 프로퍼티 사용
jun.name = "jun"
print(jun.name)
// yagom

// 인스턴스 연산 프로퍼티 사용
print(jun.selfIntroduction)
// 저는 swift반 yagom입니다.

print("제 한국나이는 \(jun.koreanAge)살 이고, 미국나이는 \(jun.westernAge)살 입니다.")
// 제 한국나이는 26살 이고, 미국나이는 25살 입니다.





// 응용

struct Money {
    var currencyRate: Double = 1100
    var dollar: Double = 0
    var won: Double {
        get {
            return dollar * currencyRate
        }
        set {
            dollar = newValue / currencyRate
        }
    }
}

var moneyInMyPocket = Money()

moneyInMyPocket.won = 11000

print(moneyInMyPocket)
// 11000

moneyInMyPocket.dollar = 20

print(moneyInMyPocket.won)
// 22000





// 지역변수, 전역변수

// 저장 프로퍼티와 연산 프로퍼티의 기능은
// 함수, 메소드, 클로저, 타입 등의 외부에 위치한
// 지역,전역 변수에도 모두 사용 가능하다.

var a: Int = 100
var b: Int = 200
var sum: Int {
    return a + b
}

print(sum)
// 300

