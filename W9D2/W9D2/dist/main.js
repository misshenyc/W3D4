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

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\")\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\")\n\nconst DEFAULTS = {\n    COLOR: \"#3d2020\",\n    RADIUS: 20,\n}\n\nfunction Asteroid(options){\n \n    options.color = DEFAULTS.COLOR;\n    options.radius = DEFAULTS.RADIUS;\n    options.vel = Util.randomVec(5);\n    MovingObject.call(this, options);\n}\n\nUtil.inherits(Asteroid, MovingObject);\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\")\nconst Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\")\n\nconst DIM_X = 1000;\nconst DIM_Y = 600;\nconst NUM_ASTEROIDS = 10;\n\nfunction Game(){\n    this.asteroids = [];\n    this.addAsteroids();\n}\n\nGame.prototype.addAsteroids = function(){\n    for(let i = 0; i < NUM_ASTEROIDS; i++){\n        let randomPos = this.randomPos();\n        this.asteroids.push(new Asteroid({pos: randomPos, game: this}))\n    }\n}\n\nGame.prototype.randomPos = function() {\n    let randPos = [Math.random() * DIM_X, Math.random() * DIM_Y];\n    return randPos;\n}\n\nGame.prototype.draw = function(ctx) {\n    ctx.clearRect(0, 0, DIM_X, DIM_Y);\n    // ctx.fillStyle = \"#0000FF\"\n    // ctx.fillRect(0, 0, DIM_X, DIM_Y);\n    this.asteroids.forEach(asteroid => {\n        asteroid.draw(ctx);\n    });\n};\n\nGame.prototype.moveObjects = function(){\n    this.asteroids.forEach(asteroid => {\n        asteroid.move();\n    })\n}\n\nGame.prototype.wrap = function(pos){\n    debugger;\n    return [Util.wrap(pos[0], DIM_X), Util.wrap(pos[1], DIM_Y)];\n};\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\")\n\nfunction GameView(ctx) {\n    this.game = new Game();\n    this.ctx = ctx;\n}\n\nGameView.prototype.start = function() {\n    let that = this;\n    setInterval(function(){\n        that.game.moveObjects();\n        that.game.draw(that.ctx);\n    }, 20);\n}\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\")\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\")\n\n//for testing only\n\nwindow.MovingObject = MovingObject;\n\ndocument.addEventListener('DOMContentLoaded', () => {\n    const canvasEl = document.getElementById('game-canvas'); // need to grab element from DOM\n    canvasEl.height = 600;\n    canvasEl.width = 1000;\n    const ctx = canvasEl.getContext('2d'); // need to get ctx from canvasEl\n    ctx.fillStyle = \"#0000FF\"\n    ctx.fillRect(0, 0, 1000, 600);\n    window.ctx = ctx;\n    \n    // const circle = new MovingObject({\n    //     pos: [250, 250],\n    //     vel: [10, 10],\n    //     radius: 5,\n    //     color: \"#00FF00\"\n    // })\n    // window.circle = circle;\n\n    // circle.draw(ctx);\n    // circle.move();\n    // circle.draw(ctx);\n    \n    // const asteroid = new Asteroid({pos: [200, 200]});\n    // window.asteroid = asteroid;\n   \n    // asteroid.draw(ctx);\n\n    // const game = new Game();\n    // window.game = game;\n    // game.draw(ctx);\n    // game.moveObjects();\n    // game.draw(ctx);\n    // game.moveObjects();\n    // game.draw(ctx);\n    const gameView = new GameView(ctx);\n    gameView.start();\n})\n\n// const mooo = new MovingObject({\n//     pos: [30, 30],\n//     vel: [10, 10],\n//     radius: 5,\n//     color: \"#00FF00\"});\n\nconsole.log(\"Webpack is working\");\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\")\n\nfunction MovingObject(obj){\n    this.pos = obj.pos;\n    this.vel = obj.vel;\n    this.radius = obj.radius;\n    this.color = obj.color;\n    this.game = obj.game;\n}\n\nMovingObject.prototype.draw = function(ctx){\n    // draw red circle\n    ctx.beginPath();\n    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);\n    ctx.strokeStyle = this.color;\n    ctx.stroke();\n}\n\nMovingObject.prototype.move = function() {\n    this.pos[0] += this.vel[0];\n    this.pos[1] += this.vel[1];\n    this.pos = this.game.wrap(this.pos);\n}\n\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Util = {\n    inherits: function inherits(childClass, parentClass) {\n        childClass.prototype = Object.create(parentClass.prototype);\n        childClass.prototype.constructor = childClass;\n    },\n\n    randomVec(length) {\n        const deg = 2 * Math.PI * Math.random();\n        return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n    // Scale the length of a vector by the given amount.\n    scale(vec, m) {\n        return [vec[0] * m, vec[1] * m];\n    },\n\n    wrap(pos, max){\n        if(pos < 0){\n            return max - (pos % max);\n        }else if(pos > max){\n            return pos % max;\n        }else{\n            return pos;\n        }\n    }\n};\n\nmodule.exports = Util\n\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ });