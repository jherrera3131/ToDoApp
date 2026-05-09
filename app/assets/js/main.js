$(document).ready(function() {

  //stagger category cards
  $('.category-card').each(function(i) {
    $(this).css({
      'animation': 'fadeSlideIn 0.35s ease both',
      'animation-delay': (i * 0.07) + 's'
    });
  });

  //stagger stat cards
  $('.stat-card').each(function(i) {
    $(this).css({
      'animation': 'fadeSlideIn 0.4s ease both',
      'animation-delay': (i * 0.1 + 0.1) + 's'
    });
  });

  //auto dismiss flash after 4s
  setTimeout(function() {
    $('.alert.alert-success, .alert.alert-info').fadeOut(600);
  }, 4000);

  //highlight label on focus
  $('.form-control, .form-select').on('focus', function() {
    $(this).closest('.mb-3, .mb-4, .col-md-6, .col-12').find('.form-label').css('color', 'var(--nb-orange)');
  }).on('blur', function() {
    $(this).closest('.mb-3, .mb-4, .col-md-6, .col-12').find('.form-label').css('color', '');
  });

  //bold priority label when on
  $('#priority_toggle').on('change', function() {
    $(this).next('label').css('font-weight', $(this).is(':checked') ? '700' : '');
  }).trigger('change');

  //color completed label when on
  $('#completed_toggle').on('change', function() {
    $(this).next('label').css('color', $(this).is(':checked') ? 'var(--nb-olive)' : '');
  }).trigger('change');

  //replay animations after turbo nav
  document.addEventListener('turbo:load', function() {
    ['.notebook-page', '.nb-form-page', '.hero-section',
     '.nb-detail-card', '.nb-profile-card'].forEach(function(sel) {
      $(sel).each(function() {
        var el = this;
        el.style.animation = 'none';
        el.getBoundingClientRect();
        el.style.animation = '';
      });
    });
  });

});
