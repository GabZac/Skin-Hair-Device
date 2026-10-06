document.addEventListener("DOMContentLoaded", () => {
    const sidebar = document.getElementById("sidebar");
    const toggleSidebar = document.getElementById("toggle-sidebar");
    const toggleIcon = document.getElementById("toggle-icon");
    const menuLinks = document.querySelectorAll(".menu-link");
    const internoLinks = document.querySelectorAll(".menu-link-interno");

    if (toggleSidebar) {
        toggleSidebar.addEventListener("click", () => {
            sidebar.classList.toggle("collapsed");
            
            if (sidebar.classList.contains("collapsed")) {
                toggleIcon.className = "bx bx-chevron-right";
            } else {
                toggleIcon.className = "bx bx-chevron-left";
            }
        });
    }

    menuLinks.forEach(link => {
        link.addEventListener("click", (e) => {
            e.preventDefault();
            
            if (sidebar.classList.contains("collapsed")) {
                sidebar.classList.remove("collapsed");
                toggleIcon.className = "bx bx-chevron-left";
            }

            const subMenu = link.nextElementSibling;
            if (subMenu) {
                subMenu.classList.toggle("show");
                
                const flecha = link.querySelector(".flecha-sub");
                if (flecha) {
                    if (subMenu.classList.contains("show")) {
                        flecha.style.transform = "rotate(180deg)";
                    } else {
                        flecha.style.transform = "rotate(0deg)";
                    }
                }
            }
        });
    });

    internoLinks.forEach(link => {
        link.addEventListener("click", (e) => {
            e.preventDefault();
            e.stopPropagation(); 
            
            const subMenuInterno = link.nextElementSibling;
            if (subMenuInterno) {
                subMenuInterno.classList.toggle("show");
                
                const flecha = link.querySelector(".flecha-sub");
                if (flecha) {
                    if (subMenuInterno.classList.contains("show")) {
                        flecha.style.transform = "rotate(180deg)";
                    } else {
                        flecha.style.transform = "rotate(0deg)";
                    }
                }
            }
        });
    });
});
