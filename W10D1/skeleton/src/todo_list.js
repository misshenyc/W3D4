

const todos = JSON.parse(localStorage.getItem("todos")) || [];

const todosList = document.querySelector('.todos')
const todosForm = document.querySelector('.add-todo-form')

const addTodo = (e) => {
    e.preventDefault(); 
    const name = document.querySelector('input[name = "add-todo"]').value;
    const todo = {
        name, 
        done: false,
    };
    todos.push(todo);
    todosForm.reset();
    // debugger;
    populateList(todos);
    localStorage.setItem("todos", JSON.stringify(todos))

}

const populateList = (todos) => {
    todosList.innerHTML = "";
    todos.forEach(todo => {
        const label = document.createElement("label");
        label.textContent = todo.name;
        const checkbox = document.createElement("input");
        checkbox.setAttribute("type", "checkbox");
        const li = document.createElement('li')
        li.appendChild(checkbox);
        li.appendChild(label);
        todosList.appendChild(li);
    });
}

// debugger
todosForm.addEventListener('submit', addTodo);

