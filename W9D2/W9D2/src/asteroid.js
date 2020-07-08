const Util = require("./utils.js")
const MovingObject = require("./moving_object.js")

const DEFAULTS = {
    COLOR: "#3d2020",
    RADIUS: 20,
}

function Asteroid(options){
 
    options.color = DEFAULTS.COLOR;
    options.radius = DEFAULTS.RADIUS;
    options.vel = Util.randomVec(5);
    MovingObject.call(this, options);
}

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;