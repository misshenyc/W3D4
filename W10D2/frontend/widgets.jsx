import React from 'react';
import ReactDOM from 'react-dom';
// import Congrats from './congrats';
import Clock from './clock';
import Tabs from './tabs'

function Root () {
  return (
  <div>
    <Clock />
    <Tabs tabs = {tabs}/> 
  </div>)
};

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");

  // const hello = React.createElement('h1', null, 'React is still up!')
  // const hello = <h1>React is Up!</h1>

  ReactDOM.render(<Root /> , root);
  // ReactDOM.render(<Tabs />, root);

});

const tabs = [
  {title: "One", content: "I am the first."},
  {title: "Two", content: "Second pane here."},
  {title: "Three", content: "Third pane here."}
] 