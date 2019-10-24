import { Elm } from './src/Main'

Elm.Main.init({
    node: document.querySelector('main'),
    flags: {
        height: window.innerHeight,
        width: window.innerWidth
    }
})