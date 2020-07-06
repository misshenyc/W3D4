// Version 1//
function sum() {
    let sum = 0;

    for (let i = 0; i < arguments.length; i++) {
        sum += arguments[i];
    }
    return sum;
}

// console.log(sum(1, 2, 3, 4));
// console.log(sum(1, 2, 3, 4, 5));

//version 2//
function sum(...args) {
    let sum = 0;

    for (let i = 0; i < args.length; i++) {
        sum += args[i];
    }
    return sum;
}

// console.log(sum(1, 2, 3, 4));
// console.log(sum(1, 2, 3, 4, 5));

Function.prototype.myBind = function(){
    let that = this;
    let bindArgs = Array.prototype.slice.call(arguments);
    // let bindLength = bindArgs.length;
    return function () {
        let callArgs = Array.prototype.slice.call(arguments);
        // if (bindLength > 1) {
            return that.apply(bindArgs[0],bindArgs.slice(1).concat(callArgs));
        // } else {
            // return that.apply(bindArgs[0],callArgs);
        // }
    }
}

Function.prototype.myBind = function (...bindArgs) {
    let that = this;
    // let bindArgs = Array.prototype.slice.call(arguments);
    return function (...callArgs) {
        // let callArgs = Array.prototype.slice.call(arguments);
        return that.apply(bindArgs[0], bindArgs.slice(1).concat(callArgs));
    }
}

class Cat {
    constructor(name) {
        this.name = name;
    }

    says(sound, person) {
        console.log(`${this.name} says ${sound} to ${person}!`);
        return true;
    }
}

class Dog {
    constructor(name) {
        this.name = name;
    }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

// console.log(markov.says("meow", "Ned"));
// console.log(markov.says.myBind(pavlov, "meow", "Kush")());
// console.log(markov.says.myBind(pavlov)("meow", "a tree"));
// console.log(markov.says.myBind(pavlov, "meow")("Markov"));

// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");

// function curriedSum(numArgs) {
//     let numbers = [];
    
//     return function _curriedSum(num) {
//         numbers.push(num);
//         if (numbers.length === numArgs) {
//             let sum = 0;
//             numbers.forEach(element => {
//                 sum += element;
//             });
//             return sum;
//         } else {
//             return _curriedSum;
//         }
//     }

// }

// const summed = curriedSum(4);
// console.log(summed(5)(30)(20)(1));


Function.prototype.curry = function(numArgs) {
    let numbers = [];
    let that = this;
    return function _curriedSum(num) {
        numbers.push(num);
        if (numbers.length === numArgs) {
            return that.apply(null, numbers);
        } else {
            return _curriedSum;
        }
        
    }
}

function sumThree(num1, num2, num3) {
    return num1 + num2 + num3;
}

const newSum = sumThree.curry(3);
console.log(newSum(1)(2)(3));


