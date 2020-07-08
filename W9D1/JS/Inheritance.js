Function.prototype.inherits = function(obj) {
    function Surrogate() {};
    Surrogate.prototype = obj.prototype;
    this.prototype = new Surrogate();
    this.prototype.constructor = this;
}

function MovingObject(name) { 
    this.name = name;
}

MovingObject.prototype.move = function () {
    console.log(this.name + ' is moving.');
};

function Ship(name) {
    this.name = name;
}
Ship.inherits(MovingObject);

function Asteroid(name) {
    this.name = name;
}
// Asteroid.inherits(MovingObject);

// const object = new MovingObject('Rosemary');
// const asteroid = new Asteroid('Kevin');

// object.move();
// asteroid.move();

// Ship.prototype = Object.create(MovingObject.prototype);
// Ship.prototype.constructor = Ship;

// const millie = new Ship('Millie');
// millie.move();