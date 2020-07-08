const MovingObject = require('./moving_object.js');
const Asteroid = require('./asteroid.js');
const Game = require('./game.js')
const GameView = require("./game_view.js")

//for testing only

window.MovingObject = MovingObject;

document.addEventListener('DOMContentLoaded', () => {
    const canvasEl = document.getElementById('game-canvas'); // need to grab element from DOM
    canvasEl.height = 600;
    canvasEl.width = 1000;
    const ctx = canvasEl.getContext('2d'); // need to get ctx from canvasEl
    ctx.fillStyle = "#0000FF"
    ctx.fillRect(0, 0, 1000, 600);
    window.ctx = ctx;
    
    // const circle = new MovingObject({
    //     pos: [250, 250],
    //     vel: [10, 10],
    //     radius: 5,
    //     color: "#00FF00"
    // })
    // window.circle = circle;

    // circle.draw(ctx);
    // circle.move();
    // circle.draw(ctx);
    
    // const asteroid = new Asteroid({pos: [200, 200]});
    // window.asteroid = asteroid;
   
    // asteroid.draw(ctx);

    // const game = new Game();
    // window.game = game;
    // game.draw(ctx);
    // game.moveObjects();
    // game.draw(ctx);
    // game.moveObjects();
    // game.draw(ctx);
    const gameView = new GameView(ctx);
    gameView.start();
})

// const mooo = new MovingObject({
//     pos: [30, 30],
//     vel: [10, 10],
//     radius: 5,
//     color: "#00FF00"});

console.log("Webpack is working");