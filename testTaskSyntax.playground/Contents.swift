import UIKit

/* ========================================
 1. Создайте протокол RunningCreature, в котором будут следующие свойства и функции:
 скорость бега (только на чтение)
 количество лап (только на чтение)
 признак бежит ли существо (на чтение и на запись)
 функция бежать
 функция остановиться
 2. Создайте протокол SpeakingCreature, в котором будут следующие свойства и функции:
 голос (низкий / средний / высокий). Только на чтение
 isMuted (лишен ли голоса). На чтение и на запись
 функция замутить
 функция говорить
 3. Создайте сущность Человек со следующим функционалом (подумайте что выбрать перечисление / класс / структура):
 имя (вложенная сущность, в которой есть имя, фамилия и отчество). Невозможно изменить
 возраст. Можно изменить извне после проверки на то, что новое значение возраста не равно текущему и больше нуля.
 признак взрослый ли человек: вычисляемое свойство
 замыкание happyBirthdayAction, которое вызывается после того, как вы установили новое значение возраста. Принимает возраст и ничего не возвращает
 инициализатор, который принимает сущность имени человека. А также проинициализируйте замыкание, которое должно поздравлять человека с днем рождения и его новым возрастом
 4. Создайте сущность Animal (подумайте что выбрать перечисление / класс / структура):
 признак isHerbivorous (травоядное животное или нет). Невозможно изменить
 имя. Невозможно изменить
 переменная класса numberOfInstances (примерное количество животных этого типа по всему миру). Доступно к переопределению
 инициализатор для травоядности и имени
 классовая функция вывода информации о животном (все доступные свойства)
 5. Создайте сущность Tiger, которая должна реализовывать функционал сущности Animal и подчиняться протоколу RunningCreature
 переопределите свойство numberOfInstances с соответствующим количеством тигров по всему миру
 реализуйте функцию бежать и остановиться . Соответствующие действия выполняются, меняя флаг isRunning, и выводя в консоль информацию о том, что Тигр делает. Обратите внимание, что если тигр уже бежит, то тело функции выполниться не должно. Аналогично и с остановиться
 переопределите функцию вывода информации о классе, добавив туда что-нибудь о Тигре
 реализуйте функцию съесть животное, которое ест животное только если оно не тигр. А если животное умеет бегать (подчиняется RunningCreature), то его скорость бега должна быть меньше скорости тигра. Выведите информацию о том, кого съел Тигр.
 6. Создайте сущность Parrot, которая является животным и умеет говорить (подчиняется соответствующему протоколу). Реализуйте все свойства и функции, которые необходимо. Попугай разговаривает, только если он не замючен. И мутиться, только если он до этого был размьючен.
 переопределите свойство numberOfInstances с соответствующим количеством попугаев по всему миру
 7. Создайте сущность Зоопарк. Недоступна к наследованию.
 maxNumberOfAnimals. Неизменяемое свойство
 имя зоопарка. Неизменяемое свойство
 totalNumberOfVisitors. Сколько всего посетителей пришло в зоопарок за всё его время существования. Доступно только для чтения извне. Перед изменением выведите консоль о том как рады вы, что к вам пришли посетители, обратившись к ним по имени.
 массив животных. По умолчанию пустой, недоступен к изменению извне.
 массив посетителей. По умолчанию пустой. Доступен только на чтение извне
 инициализатор с максимальным количеством животных и именем зоопарка
 инициализатор с именем зоопарка. максимальное количество животных - случайное значение.
 функция добавить животное. Добавляет новое животное, только если не превышено maxNumberOfAnimals. Если добавить животное не удалось, то возвращает строку с причиной неуспеха.
 функиция добавить посетителя. Добавляет посетителя.
 функция добавить посетителей. Добавляет несколько посетителей.
 функция удалить всех взрослых из посетителей. Удаляет только тех посетителей, которые старше 18.
 функция удалить всех тигров. Удаляет тигров из массива животных
 функция инфо о зоопарке. Недоступна извне. Выведите информацию о зоопарке, сколько животных в зоопарке, сколько посетителей, сколько всего посетителей было. Функция вызывается каждый раз, когда происходят изменения с животными или посетителями.
 функция покормить львов. Кормит всех львов, которые есть в зоопарке. Еда выбирается случайным образом из массива животных зоопарка.
 8. Создайте разных животных и зоопарк. Создайте посетителей.
 Добавьте животных в зоопарк
 Добавьте в зоопарк посетителей.
 Покормите тигров
 Измените возраст всем посетителям, которым 17 лет.
 Удалите всех взрослых
 Удалите всех тигров
 Пройдитесь по всем животных зоопарка.
 Если это говорящее создание, то заставьте его поговорить
 Если это бегающее создание, то выведите его скорость бега
 Во всех остальных случаях выведите травоядное животное или нет
 
================================================================================*/

protocol RunningCreature {
    var runningSpeed: Int {get}
    var numberOfPaws: Int {get}
    var runningCreature: Bool {get set}
    
    func runn()
    
    func willStop()
}

protocol SpeakingCreature {
    var voice: String {get}
    var isMuted: Bool {get set}
    
    func stirUp()
    
    func voices()
}

struct Human {
    enum Name: String {
        case name, surName, secondName
    }
    
    let name: Name
    
    var age: Int {
        get {
            self._age
        }
        set {
            if newValue >= 0 {
                self._age = newValue
            }
        }
    }
    private var _age: Int = 0
    
    var singAge: String {
        get {
            age >= 18
            return "взрослый"
        }
        set {
            age < 18
            print("ребенок")
        }
    }
    
    let happyBirthdayAction = {(age: Int) -> Void in
        print(age)
    }
    
    init(name: Name) {
        self.name = name
    }
}

class Animal {
    let name: String
    private(set) var isHerbivorous: String
    var numberOfInstances: Int {
        get {
            return 0
        }
    }
    
    init(name: String, isHerbivorous: String) {
        self.name = name
        self.isHerbivorous = isHerbivorous
    }
    
    func printInfo () {
        print("\(name) \(isHerbivorous) \(numberOfInstances)")
    }
}

class Tiger: Animal, RunningCreature {
    var runningSpeed: Int
    
    var numberOfPaws: Int
    
    var runningCreature: Bool
    
    override var numberOfInstances: Int {
        get {
            return 100
        }
    }
    
    init(runningSpeed: Int, numberOfPaws: Int, runningCreature: Bool, name: String, isHerbivorous: String) {
        self.runningSpeed = runningSpeed
        self.numberOfPaws = numberOfPaws
        self.runningCreature = runningCreature
        
        super.init(name: <#T##String#>, isHerbivorous: <#T##String#>)
    }
    
    func runn() {
        if runningCreature == true {
            print("Tiger runinig")
        }
    }
    
    func willStop() {
        if runningCreature == false {
            print("Tiger stop")
        }
    }
    
    func eatAnimal() {
        
    }
    
    override func printInfo() {
        print("\(name) \(isHerbivorous) \(numberOfInstances) \(numberOfPaws)")
    }
    
}

class Parrot: Animal, SpeakingCreature {
    var voice: String = "medium"
    
    var isMuted: Bool = true
    
    override var numberOfInstances: Int {
        return 100000
    }
    
    func stirUp() {
        if isMuted == true {
            print("Parrot is not voice")
        }
    }
    
    func voices() {
        if isMuted == false {
            print("Parrot voice")
        }
    }
}

final class Zoo {
    static var maxNumberOfAnimals: Int {
        get {
            1000
        }
    }
    static var nameZoo: String {
        get {
            ""
        }
    }
    
    private(set) var totalNumberOfVisitors: Int {
        willSet {
            print("Мы рады вас приветствовать, вы \(newValue) поситетель")
        }
    }
    
    private(set) var animals: [Animal] = []
    private(set) var visitors: [Human] = []
    
    init(maxNumberOfAnimals: Int = 1000, nameZoo: String = "") {
    }
    
    func addAnimalInZoo() {
        if  animals.count >= 1000 {
            animals.append(<#Animal#>)
        } else {
            print("Не удолось добавить")
        }
    }
    
    func addVisitor() {
        visitors.append(<#T##newElement: Human##Human#>)
    }
}
