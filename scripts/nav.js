const sections = [...document.querySelectorAll('section')];
const link = (id) => document.querySelector(`a[href="${id}"]`);

const inView = (element) => {
    var top = element.offsetTop;
    var height = element.offsetHeight;

    while (element.offsetParent) {
        element = element.offsetParent;
        top += element.offsetTop;
    }

    return (
        top < (window.pageYOffset + window.innerHeight) &&
        (top + height) > window.pageYOffset
    );
};

const init = () => {
    function update() {
        let next = false;

        sections.forEach(section => {
            const current = link(section.id);
            if (inView(section && !next)){
                current.classList.add('current');
                next = true;
            }
            else current.classList.remove('current');
        })
    }
    console.log('Hle')
    update();
    window.addEventListener('scroll',update);
}

window.onload = () => {init()}