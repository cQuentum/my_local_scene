const rememberScroll = () => {
  document.querySelectorAll('.remember-scroll').forEach(item => {
    item.addEventListener('click', event => {
      document.cookie = window.scrollY;
    });
  });
};

const goToScrollLocation = () => {
  if (document.getElementById("homepage-proof")!=null) {
     window.scrollTo(0, document.cookie);
  };
};

export { rememberScroll }
export { goToScrollLocation }
