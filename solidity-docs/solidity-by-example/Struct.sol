// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.4;

// Structs can be declared outside of a contract and imported in another contract.

contract Todos {
    
    struct Todo {
        string text;
        bool done;
    }
    
    Todo[] public todos;
    
    function create(string memory _text) public {
        // There are 3 ways to initialize a struct
        
        // 1) Calling it like a function
        todos.push(Todo(_text, false));
        
        // 2) Key value mapping
        todos.push(Todo({
            text: _text,
            done: false
        }));
        
        // 3) Initialize an empty struct and then update it
        Todo memory todo;
        todo.text = _text;
        // We didn't set `done`. So it is initialized to false by default
        todos.push(todo);
    }
    
    // Solidiy automatically created a getter for `todos` so you don't
    // actually need this function.
    function get(uint _index) public view returns (string memory text, bool completed) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.done);
    }
    
    // Update text 
    function update(uint _index, string memory _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }
    
    // Update done
    function toggleDone(uint _index) public {
        Todo storage todo = todos[_index];
        todo.done = !todo.done;
    }
}
