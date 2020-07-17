import React from "react";
import { allTodos } from "../../reducers/selectors";
// import TodoContainer from './todo_list_container'
import TodoListItem from './todo_list_item'

// const TodoList = ({todos}) => {
//     debugger
//     return (
//         <div>
//             <TodoListItem />
//         </div>
//         )

//     // debugger;
//     // const todoLis = todos.map ((todo) => { return <li key = {todo.id}> {todo.title} : {todo.body} </li>})
//     // return (
//     // <h3>Todo List goes here!</h3>,
//     // <ul> {todoLis} </ul> )
// };

class TodoList extends React.Component {
    
    // constructor () {
    //     super(props);
    // }

    render () { 
        // const this.todos = this.props.todos;
        // const this.receiveTodo = this.props.receiveTodo
        const todoLis = this.props.todos.map (todo => { 
            return <TodoListItem key = {todo.id} todo ={todo} />})

        return (
            <div>
                <h3>Todo List goes here!</h3>
                <ul>{todoLis}</ul>
            </div>
        )
    }
}



export default TodoList;