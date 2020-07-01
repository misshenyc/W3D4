Array.prototype.uniq = function() {
    const uniqueArray = [];

    for (let i = 0; i < this.length; i++) {
        if (!uniqueArray.includes(this[i])) {
            uniqueArray.push(this[i]);
        }

    }
    return uniqueArray;
};


Array.prototype.twoSum = function() {
    const pairs = [];
    for (let i = 0; i < this.length; i++) {
        for (let j = i + 1; j < this.length; j++) {
            if (this[i] + this[j] === 0){
                pairs.push([i, j]);
            }
        }
    }
    return pairs;
};

Array.prototype.transpose = function() {
    const transposed = []; //is there any other way to initailize 2d array
    for (let i = 0; i < this.length; i++) {
        const sub = [];
        for (let j = 0; j < this.length; j++) { //come back and ask about 'this' resetting inside block
           sub.push(this[j][i]);
         }
        transposed.push(sub);
    }
    return transposed;
};

