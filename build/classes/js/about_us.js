const faqItems = document.querySelectorAll('.faq-item');

faqItems.forEach(item => {
    const question = item.querySelector('.que');
    const answer = item.querySelector('.answer');
    const icon = item.querySelector('.icon');
    const closeIcon = item.querySelector('.close-icon');

    question.addEventListener('click', () => {
        answer.classList.toggle('show');
        icon.textContent = answer.classList.contains('show') ? 'X' : '+';
    });

    closeIcon.addEventListener('click', () => {
        answer.classList.toggle('show');
        icon.textContent = answer.classList.contains('show') ? 'X' : '+';
    });
});
