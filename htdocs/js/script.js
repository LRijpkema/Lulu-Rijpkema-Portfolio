const toggleButton = document.getElementsByClassName('toggle-button')[0];
const navbarLinks = document.getElementsByClassName('navbar-links')[0];

toggleButton.addEventListener('click', () => {
    navbarLinks.classList.toggle('active');
    toggleButton.classList.toggle('active');
    
})


const el = document.getElementById('imgOne');
const hiddenDiv = document.getElementById('imgTwo');

el.addEventListener('mouseover', function handleMouseOver() {
  hiddenDiv.style.display = 'block';
  el.style.display = 'none';



});

el.addEventListener('mouseout', function handleMouseOut() {
    hiddenDiv.style.display = 'none';
    el.style.display = 'block';
  
  });
  
