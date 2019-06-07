import Typed from 'typed.js';

const bannerText = () => {
  new Typed('#typed-text', {
    strings: ["Find Players.", "Play Better.", "Have fun!"],
    typeSpeed: 70,
    loop: true,
    backDelay: 1500,
    smartBackspace: true,
    backSpeed: 50,
    startDelay: 10,
  });
}

export default bannerText;
