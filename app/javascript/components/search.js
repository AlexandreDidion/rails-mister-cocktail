import Typed from 'typed.js';


const loadDynamicSearchText = () => {
  new Typed('.typed-form', {
    strings: ["Whiskey Sour", "Rhum", "Moscow Mule", "Your Darkest Desire"],
    typeSpeed: 50,
    backSpeed: 0,
    attr: 'placeholder',
    bindInputFocusEvents: true,
    loop: true
  });
}

export { loadDynamicSearchText };
