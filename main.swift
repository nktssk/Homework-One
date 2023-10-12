import UIKit

protocol HomeWorkService{
    func dividWithRemainder(_ x: Int, _ y: Int) -> (Int,Int)
    
    func fibonacci(n: Int) -> [Int]
    
    func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int]
    
    func firstLetter(strings: [String]) -> [Character]
    
    func sumArrays(firstArray:[Int], secondArray:[Int]) -> Int
}


struct homeWork: HomeWorkService{
    func dividWithRemainder(_ x: Int, _ y: Int) -> (Int, Int) {
        (((x-(x % y))/y),(x % y))
    }
    
    func fibonacci(n: Int) -> [Int] {
        var numbers = [Int]()
        numbers.append(0)
        numbers.append(1)

        for _ in 2..<n {
            numbers.append(numbers[numbers.endIndex - 2] + numbers[numbers.endIndex - 1])
        }

        return numbers
    }
    
    func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int] {
        array.filter(condition)
    }
    
    func firstLetter(strings: [String]) -> [Character] {
        var characters = [Character]()
        for string in strings{
            if string != "" {
                characters.append(string.first!)
            }
            else{
                continue
            }
        }
        return characters
    }
    
    func sumArrays(firstArray: [Int], secondArray: [Int]) -> Int {
        var a = ""
        var b = ""
        for i in firstArray{
            a+=String(i)
        }
        for i in secondArray{
            b+=String(i)
        }
        return (Int(a)! + Int(b)!)
    }
}

var dz = homeWork()

dz.dividWithRemainder(21, 4)
dz.firstLetter(strings: ["asd","dssd","jdf","fhd"])
dz.sumArrays(firstArray: [1,2,3,4], secondArray: [3,4])
dz.filter(array: [1,2,3,4,5,6], condition: {$0 % 2 == 0})
dz.fibonacci(n: 4)





//MARK: 2 part ----------------------------------------

protocol Hospital {
    var idCode: Int { get set }
    func beingInHospital()
}

protocol DoctorsInHospital {
    var specialization: String { get set}
    func healPeople()
}

class PeopleInHospital: Hospital {
    var idCode: Int

    init(idCode: Int) {
        self.idCode = idCode
    }

    func beingInHospital() {
        print("I'm in the hospital")
    }
}

class Doctors: PeopleInHospital, DoctorsInHospital {
    var specialization: String

    init(idCode: Int, specialization: String) {
        self.specialization = specialization
        super.init(idCode: idCode)
    }

    func healPeople() {
        print("I heal people")
    }

    override func beingInHospital() {
        print("I'm in the hospital, but I'm a Doctor")
    }
}

class Patients: PeopleInHospital {
    override func beingInHospital() {
        print("I'm in the hospital, and I'm a patient")
    }
}

struct Dantist: DoctorsInHospital , Hospital{
    var idCode: Int
    var specialization: String
    func beingInHospital(){
        print("im in hospital but im a doctor and dantist")
    }
    func healPeople() {
        print("i heal teeth")
    }
}

struct Optometrist: DoctorsInHospital , Hospital{
    var idCode: Int
    var specialization: String
    func beingInHospital(){
        print("im in hospital but im a doctor and optometrist")
    }
    func healPeople() {
        print("i heal eyes")
    }
    
}

private struct Therapist: DoctorsInHospital , Hospital{
    var idCode: Int
    var specialization: String
    func beingInHospital(){
        print("im in hospital but im a doctor and therapist")
    }
    func healPeople() {
        print("i heal people")
    }
    
}

enum Equipment: Int{
    case equipForDantist
    case equipForOptometrist
    case equipForTherapist
}

enum People: Int{
    case doctors
    case patients
    case cleaners
    case security
}
