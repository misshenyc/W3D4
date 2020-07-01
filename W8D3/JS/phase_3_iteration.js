const arr = [3, 2, 9, 5, 7];

Array.prototype.bubbleSort = function(){
    sorted = false;
    while (!sorted) {
        sorted = true;
        for (let i = 0; i < (this.length-1); i++) {
            if (this[i] > this[i+1]){
                [this[i], this[i+1]] = [this[i+1], this[i]];
                sorted = false;
            }
        }
    }
    return this;
};

// console.log(arr.bubbleSort());
const string = "appacademy"

String.prototype.substrings = function() {
    let substrings = [];
    for (let i = 0; i < string.length; i++) {
        for (let j = i + 1; j < string.length; j++) {
            substrings.push(this.slice(i, j));
        }
    }
    return substrings;
};

// console.log(string.substrings());