import Typed from 'typed.js';

const bannerText = () => {
  new Typed('#typed-text', {
    strings: ["Find Players...", "Play Better...", "Have fun!"],
    typeSpeed: 50,
    loop: true,
    backDelay: 1100,
    smartBackspace: true,
  });
}

export default bannerText;
