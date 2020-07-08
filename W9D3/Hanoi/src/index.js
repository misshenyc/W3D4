const HanoiGame = require('./game.js');
const View = require('./hanoi-view.js');


$(()=>{
  let game = new HanoiGame();
  let view = new View(game, $('.hanoi'));
})
console.log("THis is working...");