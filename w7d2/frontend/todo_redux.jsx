import React from 'react';
import applyMiddleware from 'redux';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

// const applyMiddlewares = (store, ...middlewares) => {
//   let dispatch = store.dispatch;
//   middlewares.forEach(middleware => {
//     dispatch = middleware(store)(dispatch);
//   })
//   return Object.assign({}, store, { dispatch });
// }

// const addLoggingToDispatch = (store) => {
//     let storeDispatch = store.dispatch;
//     return (action) => {
//         console.log(store.getState());
//         console.log(action);
//         storeDispatch(action);
//         console.log(store.getState());
//     }
// }

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);
  const root = document.getElementById('content');

  // store = applyMiddlewares(store, addLoggingToDispatch);
  ReactDOM.render(<Root store={store} />, root);
});
