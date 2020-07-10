

class DOMNodeCollection {
    constructor(arr) {
        this.arr = arr;
    }

    html(str) {
        if (typeof str === 'string'){
            this.arr.forEach(ele => {
                ele.innerHTML = str;
                // debugger
            });
        } else if (this.arr.length > 0){
            return this.arr[0].innerHTML;
        };
    };

    empty(){
        this.arr.forEach(ele => {
            ele.innerHTML = "";
        })
    }

    append(children) {
        if (this.arr.length === 0) return;

        if (typeof children === 'string') {
            this.arr.forEach(ele => {
                ele.innerHTML += children;
            });
        } else if (typeof children === 'object' && !(children instanceof DOMNodeCollection)) {
            this.arr.forEach(parent => {
                debugger
                parent.appendChild(children);
            })
        } else if (children instanceof DOMNodeCollection) {
            this.arr.forEach(parent => {
                children.arr.forEach(child => {
                    debugger;
                    parent.appendChild(child.cloneNode(true));
                })
            });
        }
    }

    attr(attrName, attrValue){
        if(!attrValue) {
            return this.arr[0].getAttribute(attrName);
        } else {
            this.arr.forEach(ele => {
                ele.setAttribute(attrName, attrValue);
            })
        }
    }

    addClass(...className){
        this.arr.forEach(el => el.classList.add(...className));
    }

    removeClass(...className){
        this.arr.forEach(el => el.classList.remove(...className));
    }

    children(arg){
        let selected = [];
        let children = [];
        this.arr.forEach(el => {
            const childArr = Array.prototype.slice.call(el.children)
            children = children.concat(childArr);
            if (childArr.includes($(arg))) selected = selected.concat();
        })
        
        return !arg ? children : selected;
    }

    parent(){
        let parents = [];
        this.arr.forEach(el => {
            if (!parents.includes(el.parentNode)) parents.push(el.parentNode)
        })
        return new DOMNodeCollection(parents);
    }

    find(selector){
        let result =[];
        this.arr.forEach(el => {
            const selectedNodeList = el.querySelectorAll(selector);
            const selectedArry = Array.prototype.slice.call(selectedNodeList);
            result = result.concat(selectedArry);
        })
        return result;
    }


    remove(){
        this.arr.forEach(el => el.remove());
    }

    on(type, callback){
        this.arr.forEach(el => {
            el.addEventListener(type, callback);
            if (!callback) {
                el[type] = [];
            } else {
                el[type].push(callback);
            }
            // el.setAttribute(type, callback)
        })
    }

    off(type){
        this.arr.forEach(el => {
            el.removeEventListener(type);
            el[type] = "";
        })
    }

}

module.exports = DOMNodeCollection;