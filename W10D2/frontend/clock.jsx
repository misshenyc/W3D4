import React from 'react';
import ReactDOM from 'react-dom';

class Clock extends React.Component {
    constructor() {
        super();
        this.state = {
          time: new Date()
        };
        this.tick = this.tick.bind(this);
        
    }
    
    tick() {
        //   console.log(new Date())
        this.setState({
            time: new Date()
        });
    }
    
    componentDidMount() {
        this.intervalId = setInterval(this.tick, 1000);
    }
    
    
    componentWillUnmount() {
        clearInterval(this.intervalId)
    }
        
        
    render() {
        this.day = this.state.time.toDateString()
        this.hours = this.state.time.getHours()
        this.minutes = this.state.time.getMinutes()
        this.seconds = this.state.time.getSeconds()
        return(
            <div>
                <h1> Clock </h1>
                <div className = 'clock'>
                    <h2>Time: {this.hours} : {this.minutes} : {this.seconds} </h2>
                    <h2>Date: {this.day}</h2> 
                </div>
            </div> 
        )
    }
}



export default Clock;