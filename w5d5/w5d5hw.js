// setTimeout(function (){
//   alert("HAMMERTIME");
// }, 5000);

// function hammerTime(time){
//   alert(`${time} is HAMMERTIME!`);
// };

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits() {
  reader.question('Would you like some tea?', function(ans1){
    console.log(`You replied ${ans1}`);
    reader.question('Would you like some biscuits?', function(ans2){
      console.log(`You replied ${ans2}`);
      
      const firstAns = (ans1 === 'yes') ? 'do' : 'don\'t';
      const secondAns = (ans2 === 'yes') ? 'do' : 'don\'t';
      
      console.log(`So you ${firstAns} want some tea, and you ${secondAns} want some biscuits.`);
      reader.close();
    });
  });
}

// function Cat() {
//   this.name = 'Markov';
//   this.age = 3;
// }

// function Dog() {
//   this.name = 'Noodles';
//   this.age = 4;
// }

// Dog.prototype.chase = function (cat) {
//   console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
// };

// const Markov = new Cat();
// const Noodles = new Dog();
