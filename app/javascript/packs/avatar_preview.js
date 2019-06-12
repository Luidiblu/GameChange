import Typed from 'typed.js';

const bannerText = () => {
  const text = document.getElementById("typed-text")

  if (text !== null) {

  new Typed(text, {
    strings: ["Find Players.", "Play Better.", "Have fun!"],
    typeSpeed: 70,
    loop: true,
    backDelay: 1500,
    smartBackspace: true,
    backSpeed: 50,
    startDelay: 10,
  });
}
}

export default bannerText;
