const Util = {
    inherits: function inherits(childClass, parentClass) {
        childClass.prototype = Object.create(parentClass.prototype);
        childClass.prototype.constructor = childClass;
    },

    randomVec(length) {
        const deg = 2 * Math.PI * Math.random();
        return Util.scale([Math.sin(deg), Math.cos(deg)], length);
    },
    // Scale the length of a vector by the given amount.
    scale(vec, m) {
        return [vec[0] * m, vec[1] * m];
    },

    wrap(pos, max){
        if(pos < 0){
            return max - (pos % max);
        }else if(pos > max){
            return pos % max;
        }else{
            return pos;
        }
    }
};

module.exports = Util
