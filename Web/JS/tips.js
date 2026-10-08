(() => {
    const sources = {
        dry: 'https://www.aad.org/public/everyday-care/skin-care-basics/dry/dermatologists-tips-relieve-dry-skin',
        sun: 'https://www.aad.org/public/everyday-care/sun-protection/shade-clothing-sunscreen/how-to-apply-sunscreen',
        burn: 'https://www.aad.org/public/everyday-care/injured-skin/burns/treat-sunburn',
        lips: 'https://www.aad.org/public/everyday-care/skin-care-basics/dry/heal-dry-chapped-lips',
        hair: 'https://www.aad.org/public/everyday-care/hair-scalp-care/hair/healthy-hair-tips',
        style: 'https://www.aad.org/public/diseases/hair-loss/hair-care/styling/',
        skin: 'https://www.aad.org/public/everyday-care/skin-care-secrets/routine/healthier-looking-skin',
        heels: 'https://www.aad.org/public/everyday-care/skin-care-basics/dry/dry-heels'
    };
    const tips = [
        ['dry', 'Las duchas cortas con agua tibia ayudan a evitar que la piel se reseque.'],
        ['dry', 'Aplicar hidratante con la piel todavía húmeda ayuda a conservar la humedad.'],
        ['dry', 'Secá la piel con pequeños toques de la toalla, sin frotarla con fuerza.'],
        ['dry', 'Si tus manos están secas, aplicá crema después de lavarlas.'],
        ['dry', 'Los guantes protegen las manos del contacto frecuente con agua y detergentes.'],
        ['dry', 'Para piel seca, elegí limpiadores suaves y productos sin perfume.'],
        ['dry', 'Las cremas y ungüentos pueden resultar más hidratantes que las lociones para piel muy seca.'],
        ['dry', 'Si la sequedad no mejora con los cuidados diarios, consultá a un dermatólogo.'],
        ['sun', 'Elegí protector solar de amplio espectro, resistente al agua y con FPS 30 o superior.'],
        ['sun', 'Al aire libre, reaplicá el protector cada dos horas y después de nadar o transpirar.'],
        ['sun', 'Aplicá el protector solar antes de salir, siguiendo las indicaciones del envase.'],
        ['sun', 'No te olvides de proteger orejas, cuello, empeines y otras zonas expuestas al sol.'],
        ['sun', 'La sombra, la ropa y el sombrero complementan el uso del protector solar.'],
        ['sun', 'El protector solar también es necesario en días nublados cuando estás al aire libre.'],
        ['burn', '¿Sabías que una hidratante con aloe vera puede ayudar a calmar una quemadura solar? No reemplaza la atención médica.'],
        ['burn', 'Si te quemaste con el sol, evitá una nueva exposición mientras la piel se recupera.'],
        ['burn', 'Las duchas frescas pueden aliviar las molestias de una quemadura solar.'],
        ['burn', 'No revientes las ampollas de una quemadura: protegen la piel mientras se recupera.'],
        ['lips', 'Lamerse los labios puede empeorar la sequedad, aunque alivie por un instante.'],
        ['lips', 'Usá un bálsamo labial sin ingredientes que te provoquen ardor o irritación.'],
        ['lips', 'Al salir, protegé los labios con un bálsamo con FPS 30 o superior.'],
        ['lips', 'Si un producto labial arde o pica, dejá de usarlo. Esa sensación no significa que esté funcionando.'],
        ['lips', 'Aplicar bálsamo labial antes de dormir puede ayudar a cuidar los labios secos.'],
        ['lips', 'Si los labios siguen agrietados después de varias semanas de cuidados, consultá a un dermatólogo.'],
        ['hair', 'Concentrá el shampoo en el cuero cabelludo, en lugar de frotar todo el largo.'],
        ['hair', 'La frecuencia de lavado depende de cuánto se ensucie tu cabello y de sus características.'],
        ['hair', 'Usá acondicionador después del lavado para facilitar el desenredado.'],
        ['hair', 'En pelo fino o lacio, aplicar acondicionador en las puntas ayuda a evitar un acabado pesado.'],
        ['hair', 'Desenredá con suavidad: los tirones pueden quebrar la fibra capilar.'],
        ['hair', 'El cabello rizado puede necesitar cuidados y una frecuencia de lavado diferentes al cabello lacio.'],
        ['style', 'Reducir el uso de planchitas y rizadores ayuda a limitar el daño por calor.'],
        ['style', 'Usá las herramientas térmicas a la temperatura más baja que te permita peinarte.'],
        ['style', 'Las colas de caballo demasiado tirantes pueden dañar el cabello y el cuero cabelludo.'],
        ['style', 'Evitá frotar el pelo con fuerza al secarlo con la toalla.'],
        ['skin', 'Lavá tu rostro con suavidad; frotar intensamente puede irritar la piel.'],
        ['skin', 'Retirá el maquillaje antes de dormir para mantener una rutina de limpieza.'],
        ['skin', 'Elegí productos de cuidado según tu tipo de piel, en lugar de usar todo lo que está de moda.'],
        ['skin', 'Un bronceado no es una señal de salud: cuidá tu piel de la radiación solar.'],
        ['heels', 'Hidratar los talones de forma habitual ayuda a cuidar la piel seca de los pies.'],
        ['heels', 'Un calzado que ajuste bien ayuda a proteger los talones secos y agrietados.'],
        ['heels', 'Si tus talones presentan grietas profundas, dolor o sangrado, consultá a un profesional.'],
        ['heels', 'Para cuidar talones agrietados, evitá el calzado abierto atrás o demasiado gastado.']
    ];
    const interval = 10 * 60 * 1000;
    const key = 'shd.tips.v1';
    let memory = {};
    function read() {
        try { return JSON.parse(localStorage.getItem(key) || '{}') || {}; } catch { return memory; }
    }
    function write(value) {
        memory = value;
        try { localStorage.setItem(key, JSON.stringify(value)); } catch {}
    }
    let state = read();
    if (!Number.isFinite(state.next)) { state.next = Date.now() + interval; write(state); }
    const control = document.createElement('button');
    control.type = 'button';
    control.className = 'tips-control';
    const panel = document.createElement('aside');
    panel.className = 'tip-emergente';
    panel.hidden = true;
    panel.setAttribute('aria-label', 'Tip de cuidado');
    const close = document.createElement('button');
    close.type = 'button';
    close.className = 'tip-cerrar';
    close.textContent = '×';
    close.setAttribute('aria-label', 'Cerrar tip');
    const title = document.createElement('h2');
    title.textContent = 'Un momento para cuidarte';
    const text = document.createElement('p');
    text.setAttribute('role', 'status');
    text.setAttribute('aria-live', 'polite');
    const source = document.createElement('a');
    source.textContent = 'Fuente: Academia Americana de Dermatología';
    source.target = '_blank';
    source.rel = 'noopener noreferrer';
    const pause = document.createElement('button');
    pause.type = 'button';
    pause.className = 'tip-pausar';
    pause.textContent = 'Pausar tips';
    panel.append(close, title, text, source, pause);
    document.body.append(control, panel);
    function updateControl() {
        const paused = Boolean(read().paused);
        control.textContent = paused ? 'Activar tips' : 'Pausar tips';
        control.setAttribute('aria-label', paused ? 'Activar consejos cada 10 minutos' : 'Pausar consejos cada 10 minutos');
        if (paused) panel.hidden = true;
    }
    function setPaused(paused) {
        write({ ...read(), paused, next: Date.now() + interval });
        panel.hidden = true;
        updateControl();
        control.focus();
    }
    control.addEventListener('click', () => setPaused(!read().paused));
    pause.addEventListener('click', () => setPaused(true));
    close.addEventListener('click', () => { panel.hidden = true; control.focus(); });
    panel.addEventListener('keydown', event => { if (event.key === 'Escape') { panel.hidden = true; control.focus(); } });
    function check() {
        if (document.hidden) return;
        const current = read();
        if (current.paused || Date.now() < current.next) return;
        let bag = Array.isArray(current.bag) ? current.bag.filter(i => Number.isInteger(i) && i >= 0 && i < tips.length) : [];
        if (!bag.length) {
            bag = tips.map((_, i) => i);
            for (let i = bag.length - 1; i > 0; i--) { const j = Math.floor(Math.random() * (i + 1)); [bag[i], bag[j]] = [bag[j], bag[i]]; }
            if (bag[bag.length - 1] === current.last) [bag[0], bag[bag.length - 1]] = [bag[bag.length - 1], bag[0]];
        }
        const index = bag.pop();
        write({ ...current, bag, last: index, next: Date.now() + interval });
        text.textContent = tips[index][1];
        source.href = sources[tips[index][0]];
        panel.hidden = false;
    }
    function tick() {
        if (navigator.locks) navigator.locks.request('shd-tip', { ifAvailable: true }, lock => { if (lock) check(); });
        else check();
    }
    setInterval(tick, 1000);
    document.addEventListener('visibilitychange', tick);
    window.addEventListener('storage', event => { if (event.key === key) { updateControl(); if (Date.now() < read().next) panel.hidden = true; } });
    updateControl();
    tick();
})();
