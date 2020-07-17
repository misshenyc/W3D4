import React from 'react';
import { uniqueId } from '../../util/util'
import receiveTodo from '../../actions/todo_actions'

class TodoForm extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            title: "",
            body: "",
            done: false
        };
        this.handleSubmit = this.handleSubmit.bind(this);
    }
    handleSubmit(e){
        e.preventDefault();
        const todo = Object.assign({}, this.state, {id: uniqueId()})
        this.props.receiveTodo(todo)
    }

    update(field) {
        return e => {
            this.setState({ [field]: e.target.value });
        };
    }

    render() {
        return (
            <form onSubmit = {this.handleSubmit}>
                <label>
                    Title 
                    <input type = 'text' 
                    id = 'title' 
                    onChange = {this.update('title')}
                    value = {this.state.title}>
                    </input>
                </label>
                <label>
                    Body 
                    <input type='textarea' 
                    id = 'body' 
                    onChange = {this.update('body')}
                    value = {this.state.body}>
                    </input>
                </label>
                <button> Create Todo! </button>
            </form>
        )
    }
}

export default TodoForm;