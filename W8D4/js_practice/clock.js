class Clock {
    constructor() {
        // 1. Create a Date object.
        const time = new Date();
        // 2. Store the hours, minutes, and seconds.
        this.hours = time.getHours();
        this.minutes = time.getMinutes();
        this.seconds = time.getSeconds();
        // 3. Call printTime.
        this.printTime();
        // 4. Schedule the tick at 1 second intervals.
        // debugger
        setInterval(this._tick.bind(this), 1000);
    }

    printTime() {
        // Format the time in HH:MM:SS
        console.log(`${this.hours}:${this.minutes}:${this.seconds}`);
        // Use console.log to print it.
    }

    _tick() {
        debugger
        // 1. Increment the time by one second.
        this.seconds++;
            // if (this.seconds === 60) {
            //     this.seconds = 0;
            //     this.minutes++;
            //     if (this.minutes === 60) {
            //         this.minute = 0;
            //         this.hours++;
            //         if (this.hours === 24){
            //             this.hours = 0;
            //         };
            //     };
            // };

        if (this.seconds === 60) {
            this.seconds = 0;
            this.minutes++;
        }
        if (this.minutes === 60) {
            this.minute = 0;
            this.hours++;
        }
        if (this.hours === 24) {  
            this.hours = 0;
        }
        // 2. Call printTime.
       this.printTime();
    }
}

// const clock = new Clock();


// console.log("hello world")
// clock.printTime();
