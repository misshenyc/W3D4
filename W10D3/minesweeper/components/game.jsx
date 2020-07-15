import React from 'react';
import ReactDOM from 'react-dom';
import * as Minesweeper from '../minesweeper';
import Board from './board';



export default class Game extends React.Component {
    constructor (props) {
        super(props);
        this.state = {
            board: new Minesweeper.Board(10,22)
        }
        this.updateGame = this.updateGame.bind(this);
    }

    updateGame(tilePiece, flag) {
        // debugger
        if (flag) {
            tilePiece.toggleFlag();
        } else {
            tilePiece.explore();
        }
        this.setState({ board: this.state.board })
    }

    render() {
        // debugger;
        return (
            <div>
                <p className = 'gamename'> Minesweeper </p>
                <Board 
                    board = {this.state.board}
                    updateGame = {this.updateGame} />
            </div>
        )
    }
}


