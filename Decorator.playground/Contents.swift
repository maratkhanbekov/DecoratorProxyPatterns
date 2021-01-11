import Foundation

// Создайте протокол Coffee и класс SimpleCoffee, реализующий протокол Coffee. Создайте протокол CoffeeDecorator, который «наследуется» от протокола Coffee. Далее создайте реализации декоратора — Milk, Whip, Sugar и другие, которые будут ингредиентами, которые добавляют в кофе. В протоколе Coffee объявите переменную cost: Int — это цена кофе. Каждый ингредиент должен увеличивать цену кофе на свою стоимость. Реализуйте описанную систему объектов с помощью паттерна Decorator аналогично тому, как это было сделано на уроке.

// Протокол кофе
protocol Coffee {
    var cost: Float { get }
}


// Реализация простого кофе
class SimpleCoffee: Coffee {
    var cost: Float {
        return 10
    }
}

// Общий для всех декораторов протокол
protocol CoffeeDecorator: Coffee {
    var coffe: Coffee { get }
    init(coffe: Coffee)
}

// Реализация декоратора
class Milk: CoffeeDecorator {
    let coffe: Coffee
    required init(coffe: Coffee) {
        self.coffe = coffe
    }
    var cost: Float {
        return coffe.cost + 5
    }
}

// Реализация декоратора
class Sugar: CoffeeDecorator {
    let coffe: Coffee
    required init(coffe: Coffee) {
        self.coffe = coffe
    }
    var cost: Float {
        return coffe.cost + 3
    }
}


// Реализация декоратора
class Whip: CoffeeDecorator {
    let coffe: Coffee
    required init(coffe: Coffee) {
        self.coffe = coffe
    }
    var cost: Float {
        return coffe.cost + 10
    }
}

let simpleCoffee = SimpleCoffee()

let coffeWithMilk = Milk(coffe: simpleCoffee)
let coffeWithMilkAndSugar = Sugar(coffe: coffeWithMilk)
let coffeWithMilkAndSugarandWhip = Whip(coffe: coffeWithMilkAndSugar)
let coffeeWithDoubleMilk = Milk(coffe: coffeWithMilk)

print(simpleCoffee.cost)
print(coffeWithMilk.cost)
print(coffeWithMilkAndSugar.cost)
print(coffeWithMilkAndSugarandWhip.cost)

print(coffeeWithDoubleMilk.cost)


