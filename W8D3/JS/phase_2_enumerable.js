// Array.prototype.myEach = function() {
    
//     function callBack(arg) {
//         return console.log(`${arg}`);
//     };

//     for (let i = 0; i < this.length; i++) {
//         callBack(this[i]);
//     }
// };



// Array.prototype.myMap = function () {

//     const mapped = [];
//     function callBack(arg) {
//         return arg * 2;
//     };

//     for (let i = 0; i < this.length; i++) {
//         mapped.push(callBack(this[i]));
//     }
//     return mapped;
// };


Array.prototype.myEach = function(callBackForEach){
    for (let i = 0; i < this.length; i++) {
        callBackForEach(this[i]);
    }
}

function callBackForEach(arg) {
    return arg + 1; //can be anything because myEach does not return a value, simply does iteration
};

function callBackForMap(arg) {
    return arg * 2;
};

Array.prototype.myMap = function (method) {
    debugger
    const mapped = [];
    this.myEach(x => mapped.push(method(x)));
    return mapped;
};


function callBack(acc, el) {
    return acc *= el;
};

Array.prototype.myReduce = function (callBack, initialValue) {
    
    let acc = initialValue;

    if (!initialValue){
        acc = this[0];
    }
    
    this.forEach(function(x){
        acc = callBack(acc, x);
    });
    
    return acc;
};

