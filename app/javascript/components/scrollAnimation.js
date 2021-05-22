const scrollAnimation = () => {

  const threshold = .1
  const options = {
    root: null,
    rootMargin: '0px',
    threshold
  }

  const handleIntersect = function (entries, observer) {
    entries.forEach(function (entry) {
      if (entry.intersectionRatio > threshold) {
        entry.target.classList.remove('invisible')
        entry.target.classList.add('visible')
        observer.unobserve(entry.target)
      }
    })
  }

  const observer = new IntersectionObserver(handleIntersect, options)
  const targets = document.querySelectorAll('.invisible')
  targets.forEach(function (target) {
    observer.observe(target)
  })
}

export { scrollAnimation };
