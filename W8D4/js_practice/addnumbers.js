const readline = require("readline");
const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});


function addNumbers(sum, numsLeft, completionCallback) {
    if (numsLeft > 0) {
        reader.question("What us your num?", function (num) {
            const number = parseInt(num);
            sum += number;
            numsLeft -= 1;
            console.log(`your current sum is ${sum}`);
            addNumbers(sum, numsLeft, completionCallback);
        });
    } else{
        completionCallback(sum);
        reader.close();
    }
}

addNumbers(4, 2, sum => console.log(`Total Sum: ${sum}`));