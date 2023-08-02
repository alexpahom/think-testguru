document.addEventListener('turbolinks:load', () => {
    const timerContainer = document.getElementById('timer-container')
    if (timerContainer) {
        new TestPassageTimer(timerContainer).renderTimer()
    }
})

class TestPassageTimer {

    constructor(timerContainer) {
        this.timerContainer = timerContainer
        this.limit = timerContainer.dataset.limit
    }


    renderTimer = () => {
        const intervalId = setInterval(() => {

            if (this.limit) {
                this.limit -= 1
                this.timerContainer.innerText = this.timeLeftString(this.limit)

                if (this.limit < 20) this.timerContainer.classList.add('text-danger')
            } else {
                // document.querySelector('form[name="answer"]').submit()
                clearInterval(intervalId)
            }
        }, 1000)
    }

    timeLeftString = (secs) => {
        const minutes = Math.floor(secs / 60).toString().padStart(2, '0')
        const seconds = (secs - Math.round(minutes * 60)).toString().padStart(2, '0')
        return `${minutes}:${seconds}`
    }
}
