function animateValue(start, duration) {

  let startTimestamp = null;
  var kpiValue = document.querySelectorAll('span.kpi-value');
  kpiValue.forEach(element=> {
    let end = parseInt(element.innerHTML)
    let step = (timestamp) => {
      if (!startTimestamp) startTimestamp = timestamp;
      const progress = Math.min((timestamp - startTimestamp) / duration, 1);
      element.innerHTML = Math.floor(progress * (end - start) + start);
      if (progress < 1) {
        window.requestAnimationFrame(step);
      }
    };
  window.requestAnimationFrame(step);
  })
};



function scrollAnimateValue() {
  var kpi = document.querySelector('.kpi-section');

  if (kpi) {
    var element_position = $('.kpi-section').offset().top -1200;

    $(window).on('scroll', function() {
        var y_scroll_pos = window.pageYOffset;
        var scroll_pos_test = element_position;

        if(y_scroll_pos > scroll_pos_test) {
          var kpiValue = document.querySelectorAll('span.kpi-value');
          animateValue(0, 2000);
          $(window).off("scroll");
        }
    });
  }
};



export { scrollAnimateValue };
