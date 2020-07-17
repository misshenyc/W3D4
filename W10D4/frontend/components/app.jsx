import React from "react";
import { render } from "react-dom";
import TodoContainer from './todos/todo_list_container';
import TodoForm from './todos/todo_form'


const App = () => {
    return (
    <div>
        <TodoContainer />
        <TodoForm />
    </div>
    );
};

export default App;