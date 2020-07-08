const MoveError = require("../solution/moveError");

class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;

    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    this.$el.on("click", 'li', e => {
      const $square = $(e.currentTarget);
      this.makeMove($square);
    })
  }

  makeMove($square) {
    // $square = where the person clicked. we use this square to put an o.
      //if not valid
      //alert'notvalid'
      //if current user.symbol = x;
      //change background to white & display x;
      //else 
      //change background to white and display o;

      const pos =$square.data('pos');
      const currentPlayer = this.game.currentPlayer;

      
      try {
        this.game.playMove(pos);
        $square.addClass(currentPlayer);
      } catch(e) {
        if (e instanceof MoveError) {
          alert(e.msg);
        } else {
          throw e;
        }
      }

    if (this.game.isOver()) {
      const $figCaption = $('<figcaption>');
      this.$el.off('click');
      const winner = this.game.winner();
      if (winner) {
        $figCaption.text(`${winner.toUpperCase()} has won!` )
      } else {
        $figCaption.text('it\'s tied!')
      }
      this.$el.append($figCaption);
      this.$el.addClass('game-over');
      this.$el.addClass('winner-'+winner);
      return;
    } 

  }

  setupBoard() {
    const $ul = $('<ul class= group>');
    
    for (let row = 0; row < 3; row++) {
      for (let col = 0; col < 3; col++) {
        const $li = $('<li>');
        $li.data('pos', [row, col])
        $ul.append($li);
      } 
    }
    this.$el.append($ul)
  }
}

module.exports = View;
