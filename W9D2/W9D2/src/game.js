const Asteroid = require('./asteroid.js')
const Util = require('./utils.js')

const DIM_X = 1000;
const DIM_Y = 600;
const NUM_ASTEROIDS = 10;

function Game(){
    this.asteroids = [];
    this.addAsteroids();
}

Game.prototype.addAsteroids = function(){
    for(let i = 0; i < NUM_ASTEROIDS; i++){
        let randomPos = this.randomPos();
        this.asteroids.push(new Asteroid({pos: randomPos, game: this}))
    }
}

Game.prototype.randomPos = function() {
    let randPos = [Math.random() * DIM_X, Math.random() * DIM_Y];
    return randPos;
}

Game.prototype.draw = function(ctx) {
    ctx.clearRect(0, 0, DIM_X, DIM_Y);
    // ctx.fillStyle = "#0000FF"
    // ctx.fillRect(0, 0, DIM_X, DIM_Y);
    this.asteroids.forEach(asteroid => {
        asteroid.draw(ctx);
    });
};

Game.prototype.moveObjects = function(){
    this.asteroids.forEach(asteroid => {
        asteroid.move();
    })
}

Game.prototype.wrap = function(pos){
    debugger;
    return [Util.wrap(pos[0], DIM_X), Util.wrap(pos[1], DIM_Y)];
};

module.exports = Game;