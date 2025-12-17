function goTo(sectionId) {
  document.querySelectorAll('section').forEach(s => s.classList.remove('active'));
  document.getElementById(sectionId).classList.add('active');

  document.querySelectorAll('nav a').forEach(a => a.classList.remove('active'));
  document.querySelectorAll('nav a').forEach(a => {
    if (a.textContent.toLowerCase().includes(sectionId)) {
      a.classList.add('active');
    }
  });
}

