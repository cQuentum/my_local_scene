import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('user_adress');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
