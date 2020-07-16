


// const allTodos = ({state}) => {
//     debugger;
//     const keys = Object.keys(state.todos);
//     return keys.map(key => state.todos[key]);
// }
// export default allTodos;

export const allTodos = ({ todos }) => (
    Object.keys(todos).map(id => todos[id])
);


// this example was in the reading:
// export const getAllTodos = ({ todos }) => (
//     Object.keys(todos).map(id => todos[id]) 

