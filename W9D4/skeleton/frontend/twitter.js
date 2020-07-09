const FollowToggle = require('./follow_toggle.js');


$(()=>{
    const $followToggle = $('button.follow-toggle');
    // debugger
    $followToggle.each((i)=>{
        // debugger
        let element = new FollowToggle($followToggle[i]);
        console.log(element);
    })
})


// example
// $followToggle.each(function (index) {
//     console.log(index + ": " + $(this).text());
// });

