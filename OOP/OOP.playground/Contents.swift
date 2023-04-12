/// Class vs Structure
/// -Her iki yapıda benzer özelliklere sahiptir.
/// -Class, referans tipidir.
/// -Structure, değer tipidir.
/// -Structure için miras özelliği yoktur.
///
/// ·Referans Tipi: Dosya içindeki veri değişirse tüm veri değişir.
/// ·Değer Tipi: Dosya içindeki veri değişirse diğer veriler etkilenmez.
///
/// Static değişkenler: Bir değişkenin veya metodun, bulunduğu sınıftan nesne oluşturmaya gerek kalmadan erişilmek istenirse kullanılır.
///
/// Composition: Başka sınıflardan oluşmuş nesneler bir sınıfın değişkeni olabilir.
///
/// Inheritance (Kalıtım):
/// -Mevcut bir sınıftan başka bir sınıf türetmek için kullanılır,
/// -Kodun tekrar kullanılabilirliğini arttırır.
/// -Sadece class için geçerlidir.
/// -Bir sınıfın tek kalıtımı olabilir.
/// -Bir sınıfa birden fazla sınıf kalıtım yolu ile bağlanamaz.
///
/// Üst sınıfa superclass denir.
/// Alt sınıfa subclass denir.
///
/// Overriding: Kalıtım ilişkisinde üst sınıfın metodlarının alt sınıf tarafından tekrar kullanılmasıdır.
///
/// PolyMorphism (Çok biçimlilik):
/// -İki sınıf arasında kalıtım ilişkisi olmalıdır.
/// -Daha kapsayıcı bir kullanım sağlamak için kullanılır.
/// -Özellikle methodların parametrelerinde PolyMorphism kullanılarak daha kapsayıcı veriler alınabilir.
/// -Superclass gibi görünüp subclass gibi davranır.
///
/// is (Type Checking): Tip kontrolü için kullanılır.
/// as (Upcasting): Bir tipi başka bir tipe dönüştürmek için kullanılır.
/// as! (Force Downcasting): Bir tipi başka bir tipe dönüştürmek için kullanılır. Dönüşüm sırasında başarısız olursa hata, başarılı ise değeri dönüştürür.
/// as? (For Optional Downcasting): Dönüşüm sırasında optional bir veri geliyorsa. Dönüşüm sırasında başarısız olursa nil, başarılı ise değeri dönüştürür.

import UIKit

// MARK: VehicleType
enum VehicleType {
    case Motorcycle
    case Car
    case Truck
    case Train
    case Plane
}

// MARK: CarType
enum CarType {
    case BMW
    case Mercedes
    case Audi
    case Renault
    case Tesla
    case TOGG
    case Volkswagen
    case RangeRover
    case JEEP
}

// MARK: Vehicle
class Vehicle {
    var vehicleType: VehicleType
    var capacity: Int?
    var speed = 0
    var running = false
    var accidents = [String]()
    var color: UIColor
    
    init(vehicleType: VehicleType, capacity: Int, speed: Int, running: Bool, accidents: [String], color: UIColor) {
        self.vehicleType = vehicleType
        self.capacity = capacity
        self.speed = speed
        self.running = running
        self.accidents = accidents
        self.color = color
    }
    
    var increaseSpeed: Int{
        get {
            speed += 10
            print("Speed: \(speed) km/s (+10 km/s)")
            return speed
        }
        set(count){
            speed += count
        }
    }
    
    var decreaseSpeed: Int{
        get {
            speed -= 10
            print("Speed: \(speed) km/s (-10 km/s)")
            return speed
        }
        set(count){
            speed -= count
        }
    }
    
    func stop(){
        running = false
    }
    
    func run(){
        running = true
    }
    
    func addAccident(accidents all: String...){
        for accident in all{
            self.accidents.append(accident)
            print("Add accident: \(accident)")
        }
        print("Total accidents count: \(self.accidents.count)")
    }
    
    // Static olduğu için nesne olmadan da Car.generalCarsInfo() olarak erişilebilir. (Performans çok düşer.)
    static func generalCarsInfo(){
        print("Cars are ...")
    }
    
    func myKind(){
        print("My kind is not.")
    }
}

// MARK: - Car
class Car: Vehicle {
    var carType : CarType
    
    // Constructor
    init(vehicleType: VehicleType, capacity: Int, speed: Int, running: Bool, accidents: [String], color: UIColor, carType: CarType) {
        // Shadowing
        self.carType = carType
        super.init(vehicleType: vehicleType, capacity: capacity, speed: speed, running: running, accidents: accidents, color: color)
    }
}

// MARK: - BMW
class BMW: Car, Repair{
    var model = String()
    var transmission = String()
    
    init(vehicleType: VehicleType, carType: CarType, color: UIColor, capacity: Int, model: String, transmission: String, speed: Int, running: Bool, accidents: [String]) {
        self.model = model
        self.transmission = transmission
        super.init(vehicleType: vehicleType, capacity: capacity, speed: speed, running: running, accidents: accidents, color: color, carType: carType)
    }
    
    override func myKind(){
        print("My kind is BMW.")
    }
    
    func repair() {
        print("BMW repaired.")
    }
}

// MARK: - Renault
class Renault: Car, Repair{
    var model = String()
    var transmission = String()
    var km = Double()
    
    init(vehicleType: VehicleType, carType: CarType, color: UIColor, capacity: Int, model: String, transmission: String, speed: Int, running: Bool, accidents: [String], km: Double) {
        self.model = model
        self.transmission = transmission
        self.km = km
        super.init(vehicleType: vehicleType, capacity: capacity, speed: speed, running: running, accidents: accidents, color: color, carType: carType)
    }
    
    override func myKind(){
        print("My kind is Renault.")
    }
    
    func repair() {
        print("Renault repaired.")
    }
}

// MARK: - Main

// PolyMorphism
var bmw =  BMW(vehicleType: .Car, carType: .BMW, color: .black, capacity: 30, model: "M3", transmission: "Manual", speed: 0, running: false, accidents: [])
var renault = Renault(vehicleType: .Car, carType: .Renault, color: .black, capacity: 30, model: "M3", transmission: "Manual", speed: 0, running: false, accidents: [], km: 56.km)

renault.repair()
bmw.repair()




// MARK: - Extensions
// Metreye çevirir.
extension Double{
    var km: Double { return self * 1000.0 }
    var m:  Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1000.0 }
}

protocol Repair{
    func repair()
}
