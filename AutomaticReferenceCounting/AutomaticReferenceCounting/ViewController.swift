//
//  ViewController.swift
//  AutomaticReferenceCounting
//
//  Created by Yakup on 31.08.2023.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Automatic Reference Counting -> ARC
    
    // Her nesnenin bir "Referans Sayısı" vardır, bu da nesneye kaç tane referans olduğunu belirtir.
    // Bir nesneye yeni bir referans oluşturulduğunda, referans sayısı bir arttırılır; bir referans kaldırıldığında ise referans sayısı bir azaltılır.
    // Referans sayısı sıfıra düştüğünde, nesne artık kullanılmıyor olarak kabul edilir ve hafızadan otomatik olarak serbest bırakılır.
    
    // Strong References (Güçlü Referanslar) -> Bir nesneye sahip olan bir referansın, nesnenin referans sayısını artırdığı unutulmamalıdır.
    // Bu nedenle, nesneyi referans alan tüm nesneler serbest bırakılmadan önce nesne bellekten serbest bırakılmaz.
    
    // Weak References (Zayıf Referanslar) -> Strong reference'lara ek olarak, weak reference'lar da kullanılabilir. Weak reference'lar, nesneye sahip olmadan
    // onun hakkında bilgi almanızı sağlar. Bu özellikle döngüsel referansları (retain cycle) önlemek için önemlidir.
    
    // Unowned References (Sahipsiz Referanslar) -> Zayıf referanslara benzerler, ancak referanslanan nesnenin her zaman var olduğunu varsayar. Bu nedenle
    // referanslanan nesne hiç nil olmamalıdır.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - STRONG
        
        var course : Course? = Course(name: "iOS Course", url: URL(string: "www.atilsamacioglu.com")!)
        var instructor : Instructor? = Instructor(name: "Atıl Samancıoğlu")
        
        // Strong Reference, Retain Cycle
        course?.instructor = instructor
        instructor?.course = course
        
        course = nil
        instructor = nil
        
        // MARK: - WEAK
        
        var weakCourse : WeakCourse? = WeakCourse(name: "iOS Course", url: URL(string: "www.atilsamacioglu.com")!)
        var weakInstructor : WeakInstructor? = WeakInstructor(name: "Atıl Samancıoğlu")
        
        // Weak Reference
        weakCourse?.instructor = weakInstructor
        weakInstructor?.course = weakCourse
        
        weakCourse = nil
        weakInstructor = nil
        
        // MARK: - WEAK2
        
        var weakCourse2 : WeakCourse2? = WeakCourse2(name: "iOS Course", url: URL(string: "www.atilsamacioglu.com")!)
        var weakInstructor2 : WeakInstructor2? = WeakInstructor2(name: "Atıl Samancıoğlu")
        
        // Weak Reference
        weakCourse2?.instructor = weakInstructor2
        weakInstructor2?.course = weakCourse2
        
        weakCourse2?.launch(launchCourse: LaunchedCourse(title: "iOS Course 2"))
        
        weakCourse2 = nil
        weakInstructor2 = nil
    }


}

