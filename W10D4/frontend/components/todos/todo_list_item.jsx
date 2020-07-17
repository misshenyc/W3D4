import React from 'react';
import { allTodos } from "../../reducers/selectors";

class TodoListItem extends React.Component {

     constructor (props) {
        super(props);
        // debugger
    }

    render() {
        
        return (
            <li> {this.props.todo.title} : {this.props.todo.body} </li>
        );
    }
}




export default TodoListItem;