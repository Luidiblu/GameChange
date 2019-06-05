import Typed from 'typed.js';

const bannerText = () => {
  new Typed('#typed-text', {
    strings: ["Stress Less.", "Play Better.", "Find Players.", "Have fun!"],
    typeSpeed: 50,
    loop: true,
    backDelay: 1100,
    smartBackspace: true,
  });
}

export default bannerText;
