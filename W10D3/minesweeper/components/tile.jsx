import React from 'react';
import ReactDOM from 'react-dom';
import * as Minesweeper from '../minesweeper.js'

export default class Tile extends React.Component {
    constructor(props) {
        // debugger
        super(props);
        this.state = {

        }       
        this.handleClick = this.handleClick.bind(this);
    }

    handleClick(e) {
        // debugger
        const flagged = e.altkey ? true : false;
        this.props.updateGame(this.props.tilePiece, flagged);
    }

    render() {
        // debugger;
        const { flagged, bombed, explored } = this.props.tilePiece;
        const tile = this.props.tilePiece;

        // const flagged = flagged ? 'flagged' : '';
        // const bombed = bombed ? 'bombed' : '';
        // const explored = explored ? 'explored' : '';
        
        // const flagIcon = flagged ?  'flagged' : '';
        // const bombIcon = bombed ? 'bombed' : '';

        // if (explored) {
        //     const bombNum = tile.adjacentBombCount();
        // }

        let klass = '';
        let icon = '';
        
        if (explored) {
            if (bombed) {
                klass = 'bombed';
                icon = '&#128163;';
            } else {
                const bombNum = tile.adjacentBombCount();
                if (bombNum > 0) {
                    icon = bombNum.toString(); 
                } else {
                    icon = ' ';
                }
            }
        }
         else if (flagged) {
            klass = 'flagged';
            icon = '&#9872;';
        } 
        
        return (
            <div className = 'tile'>
                <p className={klass} onClick = {this.handleClick}>  
                    {icon}
                </p>
            </div>
        );
    }

}

