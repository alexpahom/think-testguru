document.addEventListener('turbolinks:load', () => {
    const progressBar = document.querySelector('.progress')
    if (progressBar) testPassageProgressBar()
})

function testPassageProgressBar() {
    let progressBar = document.querySelector('.progress-bar')
    const width = progressBar.dataset.progressPercent
    progressBar.style.width = `${width}%`
}
