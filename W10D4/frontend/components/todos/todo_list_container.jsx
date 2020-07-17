import { connect } from 'react-redux';
import TodoList from './todo_list';

// debugger
const mapStateToProps = state => ({
    todos: allTodos(state)
});
// debugger

const mapDispatchToProps = dispatch => ({
    receiveTodo: todo => dispatch(receiveTodo(todo))
});

const TodoContainer = connect( mapStateToProps, mapDispatchToProps)(TodoList);

export default TodoContainer;