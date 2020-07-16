import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store'
import { receiveTodo, receiveTodos } from './actions/todo_actions';
import App from './components/app';
import Root from './components/root';
import {allTodos} from './reducers/selectors';



document.addEventListener('DOMContentLoaded', () => {
    const store = configureStore();
    
    //testing, remove later
    window.store = store;
    window.receiveTodos = receiveTodos;
    window.receiveTodo = receiveTodo;
    window.Root = Root;
    window.allTodos = allTodos;


    const root = document.getElementById('root');
   
    ReactDOM.render(<Root store={store}/>, root);

});