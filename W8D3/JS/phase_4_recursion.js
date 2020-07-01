function range(start, end){
    if (start === end) {
        return [];
    }

    let result = range(start, end-1);
    result.push(end-1);
    return result;
    // return (range(start, end-1) + [end]);
}


// range(2, 6)
// range(2,5) + [5]
// []+[3]
// [3]

console.log(range(2, 6));
console.log(range(2, 2));

// def range(start, end)
//     return [] if start == end
//     range(start, end-1) + [end]
// end 

// function bracket() {
//     return [];
// }

// console.log(bracket());