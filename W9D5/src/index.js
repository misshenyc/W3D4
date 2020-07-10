const DOMNodeCollection = require('./dom_node_collection')

//TEST ONLY
window.DOMNodeCollection = DOMNodeCollection;

window.$l = function(arg) {
    if (typeof(arg) === 'string') { //arg typeof String
        const nodeList = document.querySelectorAll(arg);
        const nodeArr = Array.prototype.slice.call(nodeList);
        return new DOMNodeCollection(nodeArr); 
    }
    else if (arg instanceof HTMLElement) {
        return new DOMNodeCollection([arg]);
    }
};
