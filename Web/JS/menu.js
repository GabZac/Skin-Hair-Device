document.addEventListener('DOMContentLoaded', () => {
    const sidebar = document.getElementById('sidebar');
    const toggle = document.getElementById('toggle-sidebar');
    const icon = document.getElementById('toggle-icon');
    if (!sidebar || !toggle) return;
    function collapse(value) {
        sidebar.classList.toggle('collapsed', value);
        document.body.classList.toggle('menu-collapsed', value);
        toggle.setAttribute('aria-expanded', String(!value));
        toggle.setAttribute('aria-label', value ? 'Abrir menú' : 'Contraer menú');
        icon.textContent = value ? '›' : '‹';
    }
    collapse(window.matchMedia('(max-width: 700px)').matches);
    toggle.addEventListener('click', () => collapse(!sidebar.classList.contains('collapsed')));
    document.querySelectorAll('.menu-link, .menu-link-interno').forEach(link => {
        const submenu = link.nextElementSibling;
        const active = submenu.querySelector('[aria-current="page"]');
        function expand(value) {
            submenu.classList.toggle('show', value);
            link.setAttribute('aria-expanded', String(value));
            const arrow = link.querySelector('.flecha-sub');
            if (arrow) arrow.style.transform = value ? 'rotate(180deg)' : '';
        }
        expand(Boolean(active));
        link.addEventListener('click', event => {
            event.preventDefault();
            collapse(false);
            expand(!submenu.classList.contains('show'));
        });
        link.addEventListener('keydown', event => {
            if (event.key === ' ') { event.preventDefault(); link.click(); }
        });
    });
    const fallback = new URL('../IMG/favicon.png', document.querySelector('script[src$="JS/menu.js"]').src).href;
    document.querySelectorAll('.producto-img').forEach(img => img.addEventListener('error', () => {
        if (img.dataset.fallback) return;
        img.dataset.fallback = '1';
        img.src = fallback;
    }));
});
