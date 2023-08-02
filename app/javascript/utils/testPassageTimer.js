document.addEventListener('turbolinks:load', () => {
    const timerContainer = document.getElementById('timer-container')
    if (timerContainer) {
        new TestPassageTimer(timerContainer).renderTimer()
    }
})

class TestPassageTimer {

    constructor(timerContainer) {
        this.cookieKey = 'finish_by'
        this.timerContainer = timerContainer
    }


    renderTimer = () => {
        this.limit = this.calculateLimit()
        const intervalId = setInterval(() => {

            if (this.limit) {
                this.limit -= 1
                this.timerContainer.innerText = this.timeLeftString(this.limit)

                if (this.limit < 20) this.timerContainer.classList.add('text-danger')
            } else {
                document.querySelector('form#attempt').submit()
                clearInterval(intervalId)
            }
        }, 1000)
    }

    timeLeftString = (secs) => {
        const minutes = Math.floor(secs / 60).toString().padStart(2, '0')
        const seconds = (secs - Math.round(minutes * 60)).toString().padStart(2, '0')
        return `${minutes}:${seconds}`
    }

    calculateLimit = () => {
        const msDifference = new Date(this.finishTimeCookie()) - new Date()
        const secondsRaw = msDifference / 1000
        return Math.floor(secondsRaw)
    }

    finishTimeCookie = () => {
        let rawCookie = document.cookie.match(new RegExp(`(^| )${this.cookieKey}=([^;]+)`))[2]
        return decodeURIComponent(rawCookie)
    }
}
