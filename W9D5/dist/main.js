/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/dom_node_collection.js":
/*!************************************!*\
  !*** ./src/dom_node_collection.js ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("\n\nclass DOMNodeCollection {\n    constructor(arr) {\n        this.arr = arr;\n    }\n\n    html(str) {\n        if (typeof str === 'string'){\n            this.arr.forEach(ele => {\n                ele.innerHTML = str;\n                // debugger\n            });\n        } else if (this.arr.length > 0){\n            return this.arr[0].innerHTML;\n        };\n    };\n\n    empty(){\n        this.arr.forEach(ele => {\n            ele.innerHTML = \"\";\n        })\n    }\n\n    append(children) {\n        if (this.arr.length === 0) return;\n\n        if (typeof children === 'string') {\n            this.arr.forEach(ele => {\n                ele.innerHTML += children;\n            });\n        } else if (typeof children === 'object' && !(children instanceof DOMNodeCollection)) {\n            this.arr.forEach(parent => {\n                debugger\n                parent.appendChild(children);\n            })\n        } else if (children instanceof DOMNodeCollection) {\n            this.arr.forEach(parent => {\n                children.arr.forEach(child => {\n                    debugger;\n                    parent.appendChild(child.cloneNode(true));\n                })\n            });\n        }\n    }\n\n    attr(attrName, attrValue){\n        if(!attrValue) {\n            return this.arr[0].getAttribute(attrName);\n        } else {\n            this.arr.forEach(ele => {\n                ele.setAttribute(attrName, attrValue);\n            })\n        }\n    }\n\n    addClass(...className){\n        this.arr.forEach(el => el.classList.add(...className));\n    }\n\n    removeClass(...className){\n        this.arr.forEach(el => el.classList.remove(...className));\n    }\n\n    children(arg){\n        let selected = [];\n        let children = [];\n        this.arr.forEach(el => {\n            const childArr = Array.prototype.slice.call(el.children)\n            children = children.concat(childArr);\n            if (childArr.includes($(arg))) selected = selected.concat();\n        })\n        \n        return !arg ? children : selected;\n    }\n\n    parent(){\n        let parents = [];\n        this.arr.forEach(el => {\n            if (!parents.includes(el.parentNode)) parents.push(el.parentNode)\n        })\n        return new DOMNodeCollection(parents);\n    }\n\n    find(selector){\n        let result =[];\n        this.arr.forEach(el => {\n            const selectedNodeList = el.querySelectorAll(selector);\n            const selectedArry = Array.prototype.slice.call(selectedNodeList);\n            result = result.concat(selectedArry);\n        })\n        return result;\n    }\n\n\n    remove(){\n        this.arr.forEach(el => el.remove());\n    }\n\n    on(type, callback){\n        this.arr.forEach(el => {\n            el.addEventListener(type, callback);\n            if (!callback) {\n                el[type] = [];\n            } else {\n                el[type].push(callback);\n            }\n            // el.setAttribute(type, callback)\n        })\n    }\n\n    off(type){\n        this.arr.forEach(el => {\n            el.removeEventListener(type);\n            el[type] = \"\";\n        })\n    }\n\n}\n\nmodule.exports = DOMNodeCollection;\n\n//# sourceURL=webpack:///./src/dom_node_collection.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const DOMNodeCollection = __webpack_require__(/*! ./dom_node_collection */ \"./src/dom_node_collection.js\")\n\n//TEST ONLY\nwindow.DOMNodeCollection = DOMNodeCollection;\n\nwindow.$l = function(arg) {\n    if (typeof(arg) === 'string') { //arg typeof String\n        const nodeList = document.querySelectorAll(arg);\n        const nodeArr = Array.prototype.slice.call(nodeList);\n        return new DOMNodeCollection(nodeArr); \n    }\n    else if (arg instanceof HTMLElement) {\n        return new DOMNodeCollection([arg]);\n    }\n};\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ })

/******/ });