import React from 'react';
import ReactDOM from 'react-dom';
import * as Minesweeper from '../minesweeper.js'
import Tile from './tile';
// import { debug } from 'webpack';

export default class Board extends React.Component {
    constructor(props) {
        super(props);
        // this.state = {
        //     // tiles: Array(9).fill(null)
        //     tiles: this.props.board.map()
        // }
        
    }

    render() {
        // debugger;
        const updateGame = this.props.updateGame;
        const tiles = this.props.board.grid.map((row,idx) => {
            const boardRow = row;
            const rowIdx = idx;
            // debugger
            const mappedRow = boardRow.map((piece, idx) => {
                const tilePiece = piece;
                const pos = [rowIdx, idx];
                const keyValue = rowIdx * this.props.board.gridSize + idx; 
                // debugger
                return (
                    <div key={keyValue}>
                        <Tile tilePiece={tilePiece}
                            updateGame={updateGame}
                            />
                    </div>
                ) 
            });
            return (
                <div className='row' key={rowIdx}>
                    {mappedRow}
                </div>
            )

        });
        // debugger
        
        return (
            <div className='tiles'>
                {tiles}
            </div>
        );
        // debugger


    }
    
}