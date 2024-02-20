class Vehicle {
    var model: String
    init(model: String) {
        self.model = model
    }
    func drive() {
        print("...")
    }
}

class Car: Vehicle {
    override func drive() {
        print("Намотаться на столб зимой на летней резине") 
    }
}

class Bike: Vehicle {
    override func drive() {
        print("Приехать в Царство Небесное")
    }
}

let car = Car(model: "Mark II")
car.drive()

let bike = Bike(model: "KAWASAKI NINJA")
bike.drive()

class House {
    var width: Double
    var height: Double
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    func create() {
        let area = width * height
        print("Плошадь дома: \(area)")
    }
    func destroy() {
        print("Дом разрушен!")
    }
}

let home=House(width: 777.0, height: 228.0)
home.create()
home.destroy()

struct Student {
    var name: String
    var age: Int
    var growth: Double
}

class Sorter {
    func sortByName(students: [Student]) -> [Student] {
        return students.sorted(by: { $0.name < $1.name })
    }
    func sortByAge(students: [Student]) -> [Student] {
        return students.sorted(by: { $0.age > $1.age })
    }
    func sortByGrowth(students: [Student]) -> [Student] {
        return students.sorted(by: { $0.growth < $1.growth })
    }
}

var students = [Student]()

let student1 = Student(name: "Кавасаки", age: 19, growth: 120)
let student2 = Student(name: "Шкипер", age: 18, growth: 110)
let student3 = Student(name: "Кавальски", age: 20, growth: 123)
let student4 = Student(name: "Рядовой", age: 21, growth: 80)
let student5 = Student(name: "Рико", age: 22, growth: 66)

students.append(student1)
students.append(student2)
students.append(student3)
students.append(student4)
students.append(student5)

print("До сортировки:")
for student in students {
    print(student)
}

let sorter = Sorter()

students = sorter.sortByName(students: students)
print("Сортировка по имени:")
for student in students {
    print(student)
}

students = sorter.sortByAge(students: students)
print("Сортировка по возрасту:")
for student in students {
    print(student)
}

students = sorter.sortByGrowth(students: students)
print("Сортировка по росту:")
for student in students {
    print(student)
}

struct CarStruct {
    var model: String
    var maxSpeed: Int

    func drive(){
        print("\(model) разложился на скорости в \(maxSpeed)")
    }
}

class CarClass {
    var model: String
    var maxSpeed: Int

    init(model: String, maxSpeed: Int){
        self.model = model
        self.maxSpeed = maxSpeed
    } 

    func drive(){
        print("\(model) разложился на скорости в \(maxSpeed)")
    }
}

let car1 = CarStruct(model: "BMW", maxSpeed: 666)
car1.drive()

let car2 = CarStruct(model: "Audi", maxSpeed: 350)
car2.drive()

let car3 = CarClass(model: "Toyota", maxSpeed: 280)
car3.drive()

let car4 = CarClass(model: "Mark II", maxSpeed: 220)
car4.drive()

/* Классы имеют дополнительные возможности, которых нет у структур:
    Наследование позволяет одному классу наследовать характеристики другого
    Приведение типов позволяет проверить и интерпретировать тип экземпляра класса в процессе выполнения
    Деинициализаторы позволяют экземпляру класса освободить любые ресурсы, которые он использовал
    Подсчет ссылок допускает более чем одну ссылку на экземпляр класса.*/