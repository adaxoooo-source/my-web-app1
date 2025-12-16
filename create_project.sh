#!/bin/bash

# Créer le dossier du projet
mkdir -p my-web-app
cd my-web-app

# --- index.html ---
cat <<EOL > index.html
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Web App - Docker CI/CD</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h1>🚀 My Web App</h1>
        <p>Pipeline CI/CD et Docker Desktop en action !</p>

        <div class="buttons">
            <button onclick="location.href='page1.html'">Page 1</button>
            <button onclick="location.href='page2.html'">Page 2</button>
            <button onclick="location.href='page3.html'">Page 3</button>
        </div>

        <p>Le site est servi depuis un container Docker sur le port <strong>80</strong>.</p>
    </div>
    <script src="script.js"></script>
</body>
</html>
EOL

# --- page1.html (fond dégradé animé + titre animé) ---
cat <<EOL > page1.html
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Page 1 - My Web App</title>
    <link rel="stylesheet" href="style.css">
</head>
<body class="page1">
    <div class="container">
        <h1>Page 1 ✨</h1>
        <p>Bienvenue sur la page 1 avec un superbe dégradé animé !</p>
        <button onclick="location.href='index.html'">Retour à l'accueil</button>
    </div>
</body>
</html>
EOL

# --- page2.html (particules animées + boutons lumineux) ---
cat <<EOL > page2.html
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Page 2 - My Web App</title>
    <link rel="stylesheet" href="style.css">
</head>
<body class="page2">
    <canvas id="particles"></canvas>
    <div class="container">
        <h1>Page 2 ✨</h1>
        <p>Bienvenue sur la page 2 avec un fond de particules animé !</p>
        <button onclick="location.href='index.html'">Retour à l'accueil</button>
    </div>

    <script>
        const canvas = document.getElementById('particles');
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;
        const ctx = canvas.getContext('2d');

        let particles = [];
        for(let i=0;i<100;i++){
            particles.push({
                x: Math.random()*canvas.width,
                y: Math.random()*canvas.height,
                r: Math.random()*3+1,
                dx: Math.random()*2-1,
                dy: Math.random()*2-1
            });
        }

        function animate(){
            ctx.clearRect(0,0,canvas.width,canvas.height);
            particles.forEach(p=>{
                ctx.beginPath();
                ctx.arc(p.x,p.y,p.r,0,Math.PI*2);
                ctx.fillStyle="white";
                ctx.fill();
                p.x+=p.dx;
                p.y+=p.dy;
                if(p.x<0 || p.x>canvas.width) p.dx*=-1;
                if(p.y<0 || p.y>canvas.height) p.dy*=-1;
            });
            requestAnimationFrame(animate);
        }

        animate();
    </script>
</body>
</html>
EOL

# --- page3.html (effet glitch) ---
cat <<EOL > page3.html
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Page 3 - My Web App</title>
    <link rel="stylesheet" href="style.css">
</head>
<body class="page3">
    <div class="container">
        <h1 class="glitch" data-text="Page 3">Page 3</h1>
        <p>Bienvenue sur la page 3 avec effet “glitch” sur le titre !</p>
        <button onclick="location.href='index.html'">Retour à l'accueil</button>
    </div>
</body>
</html>
EOL

# --- style.css ---
cat <<EOL > style.css
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    text-align: center;
    padding: 50px;
    color: white;
}

/* Boutons communs */
button {
    border: none;
    padding: 12px 25px;
    font-size: 1em;
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.4s ease;
}
button:hover {
    transform: scale(1.1);
}

/* Container */
.container {
    position: relative;
    z-index: 1;
    background: rgba(0,0,0,0.5);
    padding: 30px;
    border-radius: 15px;
    display: inline-block;
}

/* ---- Page 1 ---- */
body.page1 {
    background: linear-gradient(-45deg, #ff512f, #dd2476, #1d2671, #c33764);
    background-size: 400% 400%;
    animation: gradientBG 15s ease infinite;
}
@keyframes gradientBG {
    0% {background-position: 0% 50%;}
    50% {background-position: 100% 50%;}
    100% {background-position: 0% 50%;}
}
body.page1 h1 {
    font-size: 3em;
    margin-bottom: 20px;
    opacity: 0;
    animation: slideIn 1.5s ease forwards;
}
@keyframes slideIn {
    0% {transform: translateY(-50px); opacity:0;}
    100% {transform: translateY(0); opacity:1;}
}

/* ---- Page 2 ---- */
body.page2 canvas#particles {
    position: fixed;
    top:0;
    left:0;
    z-index:0;
}
body.page2 button {
    background: linear-gradient(90deg, #ff512f, #dd2476);
    box-shadow: 0 0 5px #ff512f, 0 0 25px #dd2476, 0 0 50px #ff512f;
    color:white;
}
body.page2 button:hover {
    box-shadow: 0 0 20px #ff512f, 0 0 40px #dd2476, 0 0 80px #ff512f;
}

/* ---- Page 3 ---- */
body.page3 {
    background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
    background-size: 400% 400%;
    animation: gradientBG 15s ease infinite;
}
.glitch {
    font-size: 3em;
    position: relative;
    color: #fff;
    animation: glitch 1s infinite;
}
.glitch::before,
.glitch::after {
    content: attr(data-text);
    position: absolute;
    left: 0;
}
.glitch::before {
    animation: glitchTop 1s infinite;
    clip: rect(0, 900px, 50px, 0);
    color: #f0f;
}
.glitch::after {
    animation: glitchBottom 1s infinite;
    clip: rect(50px, 900px, 100px, 0);
    color: #0ff;
}
@keyframes glitch {
    0% { transform: none; }
    20% { transform: skew(-0.5deg); }
    40% { transform: skew(0.5deg); }
    60% { transform: skew(-0.5deg); }
    80% { transform: skew(0.5deg); }
    100% { transform: none; }
}
@keyframes glitchTop {
    0% { transform: translate(0); }
    20% { transform: translate(-2px, -2px); }
    40% { transform: translate(-2px, 2px); }
    60% { transform: translate(2px, -2px); }
    80% { transform: translate(2px, 2px); }
    100% { transform: translate(0); }
}
@keyframes glitchBottom {
    0% { transform: translate(0); }
    20% { transform: translate(2px, 2px); }
    40% { transform: translate(2px, -2px); }
    60% { transform: translate(-2px, 2px); }
    80% { transform: translate(-2px, -2px); }
    100% { transform: translate(0); }
}

/* Buttons on index.html */
body:not(.page1):not(.page2):not(.page3) button {
    background-color: #4caf50;
    color: white;
}
body:not(.page1):not(.page2):not(.page3) button:hover {
    background-color: #45a049;
}
