const readline = require('readline');
const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function askIfGreaterThan(el1,el2,callback){
    reader.question(`Is ${el1} greater than ${el2}?`, function (reply) {
        if (reply === 'yes') {
            callback(true);
        }
        else{
            callback(false);
            reader.close();
        }
    });    
}

askIfGreaterThan(4, 2, console.log);

// function absurbBubbleSort(arr, sortcompletionCallback){
// }

// function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop){
//     if (i < arr.length-1){
//         askIfGreaterThan(arr[i],arr[i+1], function (isGreaterThan) {
//             if (isGreaterThan){
//                 [arr[i], arr[i+1]] = [arr[i+1], arr[i]];
//                 madeAnySwaps = true;
//                 innerBubbleSortLoop(arr, ++i, madeAnySwaps, outerBubbleSortLoop);
//             } 
//             else{
//                 madeAnySwaps = false;
//             }
//         });
//     }

    // if (i == arr.length - 1) {
    //      outerBubbleSortLoop(()=> console.log("done"));
    // }

//     if (i == arr.length - 1) {
//          outerBubbleSortLoop;
//          return;
//     }
// }



// innerBubbleSortLoop([3, 2, 1], 0, false, console.log("done"));