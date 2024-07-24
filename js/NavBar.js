document.addEventListener('DOMContentLoaded', function () {
  const navBar = document.querySelector('.menu');
  const menuItems = document.querySelectorAll('.menu li');
  const Icons= document.querySelectorAll('.lien');
  const lvHeading = document.getElementById('LV');
  const Menu = document.getElementsByClassName('bi bi-list');
  const MenuContent = document.getElementsByClassName('Menucontent');
    // Sélection de l'icône du menu
    const menuIcon = document.getElementById('Menu');
    // Sélection du contenu du menu à afficher
    const menuContent = document.querySelector('.Menucontent');
   
  
    // Ajout d'un écouteur d'événements pour le clic sur l'icône du menu
    menuIcon.addEventListener('click', function() {
        // Vérifie si le contenu du menu est visible
        const isVisible = window.getComputedStyle(menuContent).display !== 'none';
     
        // Si le menu est visible, le cache ; sinon, l'affiche
        if (isVisible ) {
            menuContent.style.display = 'none';
        } else {
            menuContent.style.display = 'block';
         
        }
    });
  function updateStyles() {
   
    const scrollThreshold = 50;
   
    if (window.scrollY > scrollThreshold || navBar.classList.contains('hovered')||(isVisible)) {
    
      lvHeading.style.color = '#000'; // Set text color of LV heading to black
      navBar.style.backgroundColor = ' #fff';// Change background color when scrolling or hovering
      menuItems.forEach(item => item.style.color = '#000'); // Set text color of menu items to black
      Icons.forEach(icon => icon.style.color = '#000'); // Set text color of menu items to black
      menuContent.style.display = 'none';



    } else {
      navBar.style.backgroundColor ='transparent'; // Revert background color to transparent when not scrolling or hovering
      menuItems.forEach(item => item.style.color = '#fff'); // Set text color of menu items to white
      lvHeading.style.color = '#fff'; // Set text color of LV heading to white
      Icons.forEach(icon => icon.style.color = '#fff'); 
    }
  }

  window.addEventListener('scroll', updateStyles);
  navBar.addEventListener('mouseenter', function () {
    navBar.classList.add('hovered'); // Add a class for hover state
    updateStyles();
  });

  navBar.addEventListener('mouseleave', function () {
    navBar.classList.remove('hovered'); // Remove the class for hover state
    updateStyles();
  });
});

