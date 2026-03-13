// Power Junk & Bins CO. LTD - Main JavaScript

// Mobile Menu Toggle
const menuToggle = document.querySelector('.menu-toggle');
const navMenu = document.querySelector('.nav-menu');

if (menuToggle) {
  menuToggle.addEventListener('click', () => {
    navMenu.classList.toggle('active');

    // Change icon
    const icon = menuToggle.querySelector('span');
    if (icon) {
      icon.textContent = navMenu.classList.contains('active') ? '✕' : '☰';
    }
  });

  // Close menu when clicking on a link
  const navLinks = document.querySelectorAll('.nav-menu a');
  navLinks.forEach(link => {
    link.addEventListener('click', () => {
      navMenu.classList.remove('active');
      const icon = menuToggle.querySelector('span');
      if (icon) {
        icon.textContent = '☰';
      }
    });
  });
}

// Smooth Scrolling for anchor links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
  anchor.addEventListener('click', function (e) {
    e.preventDefault();
    const target = document.querySelector(this.getAttribute('href'));
    if (target) {
      target.scrollIntoView({
        behavior: 'smooth',
        block: 'start'
      });
    }
  });
});

// Active Navigation Link — based on current page URL
const navLinks = document.querySelectorAll('.nav-menu a');
const currentPage = window.location.pathname.split('/').pop() || 'index.html';

navLinks.forEach(link => {
  const linkPage = link.getAttribute('href').replace('./', '');
  if (linkPage === currentPage || (currentPage === '' && linkPage === 'index.html')) {
    link.classList.add('active');
  }
});

// Header Scroll Effect
const header = document.querySelector('.header');
let lastScroll = 0;

window.addEventListener('scroll', () => {
  const currentScroll = window.pageYOffset;

  if (currentScroll > 100) {
    header.style.boxShadow = '0 4px 12px rgba(0,0,0,0.1)';
  } else {
    header.style.boxShadow = '0 2px 8px rgba(0,0,0,0.1)';
  }

  lastScroll = currentScroll;
});

// WhatsApp Click Tracking
const whatsappButton = document.querySelector('.whatsapp-float');
if (whatsappButton) {
  whatsappButton.addEventListener('click', () => {
    const phone = '12895885865';
    const message = encodeURIComponent('Hi *Power Junk*! I need more info about your services');
    const url = `https://wa.me/${phone}?text=${message}`;
    window.open(url, '_blank');
  });
}

// Intersection Observer for Animations
const observerOptions = {
  threshold: 0.1,
  rootMargin: '0px 0px -100px 0px'
};

const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.style.opacity = '1';
      entry.target.style.transform = 'translateY(0)';
    }
  });
}, observerOptions);

// Observe elements for animation
const animateElements = document.querySelectorAll('.feature-card, .service-card');
animateElements.forEach(el => {
  el.style.opacity = '0';
  el.style.transform = 'translateY(30px)';
  el.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
  observer.observe(el);
});

// Lazy Load Images
if ('loading' in HTMLImageElement.prototype) {
  const images = document.querySelectorAll('img[loading="lazy"]');
  images.forEach(img => {
    img.src = img.dataset.src || img.src;
  });
} else {
  // Fallback for browsers that don't support lazy loading
  const script = document.createElement('script');
  script.src = 'https://cdnjs.cloudflare.com/ajax/libs/lazysizes/5.3.2/lazysizes.min.js';
  document.body.appendChild(script);
}

// Log page load time (for performance monitoring)
window.addEventListener('load', () => {
  const loadTime = performance.now();
  console.log(`Page loaded in ${(loadTime / 1000).toFixed(2)} seconds`);
});

// ===== Interactive Pricing Slider V2 =====
document.addEventListener('DOMContentLoaded', function() {
  const slider = document.getElementById('pricingSlider');

  if (!slider) return;

  const loadLabel = document.getElementById('pricingLoadLabel');
  const cardLabel = document.getElementById('pricingCardLabel');
  const priceAmount = document.getElementById('pricingAmount');
  const examples = document.getElementById('pricingExamples');
  const image = document.getElementById('pricingImage');

  // Pricing data
  const pricingTiers = [
    {
      label: 'Min Load (1/8 Truck)',
      cardLabel: 'MIN LOAD',
      price: '$115 - $150',
      examples: 'Small furniture piece, few boxes, yard waste, small cleanup',
      visual: 'img/pricing/load-min.png'
    },
    {
      label: '1/4 Truck Load',
      cardLabel: '1/4 TRUCK',
      price: '$235 - $310',
      examples: 'Couch, chair, mattress, several boxes, small room cleanout',
      visual: 'img/pricing/load-quarter.png'
    },
    {
      label: '1/2 Truck Load',
      cardLabel: '1/2 TRUCK',
      price: '$350 - $450',
      examples: 'Multiple furniture pieces, appliances, garage cleanout, renovation debris',
      visual: 'img/pricing/load-half.png'
    },
    {
      label: '3/4 Truck Load',
      cardLabel: '3/4 TRUCK',
      price: '$460 - $560',
      examples: 'Full room furniture, large appliances, basement cleanout, estate items',
      visual: 'img/pricing/load-three-quarter.png'
    },
    {
      label: 'Full Truck Load',
      cardLabel: 'FULL TRUCK',
      price: '$565 - $680',
      examples: 'Complete home cleanout, multi-room furniture, major renovation debris, large estate',
      visual: 'img/pricing/load-full.png'
    }
  ];

  // Preload all images for smooth transitions
  pricingTiers.forEach(function(tier) {
    var img = new Image();
    img.src = tier.visual;
  });

  // Update slider fill visual
  function updateSliderFill(value) {
    var percent = (value / 4) * 100;
    slider.style.setProperty('--slider-progress', percent + '%');
  }

  // Update active slider label
  function updateActiveLabel(value) {
    var labels = document.querySelectorAll('.pricing-v2__slider-labels span');
    labels.forEach(function(label, i) {
      label.classList.toggle('active', i === value);
    });
  }

  // Update all dynamic content
  function updatePricing(value) {
    var tier = pricingTiers[value];

    // Fade out
    loadLabel.style.opacity = '0';
    priceAmount.style.opacity = '0';
    examples.style.opacity = '0';
    image.style.opacity = '0';

    setTimeout(function() {
      // Update content
      loadLabel.textContent = tier.label;
      cardLabel.textContent = tier.cardLabel;
      priceAmount.textContent = tier.price;
      examples.textContent = tier.examples;
      image.src = tier.visual;
      image.alt = tier.label;

      // Fade in
      loadLabel.style.opacity = '1';
      priceAmount.style.opacity = '1';
      examples.style.opacity = '1';
      image.style.opacity = '1';
    }, 250);

    updateSliderFill(value);
    updateActiveLabel(value);
  }

  // Initialize
  updatePricing(0);
  updateSliderFill(0);
  updateActiveLabel(0);

  // Listen for changes
  slider.addEventListener('input', function() {
    updatePricing(parseInt(this.value));
  });
});

// ===== Heavy Materials Pricing Accordion + Slider =====
document.addEventListener('DOMContentLoaded', function() {
  var toggle = document.querySelector('.heavy-pricing__toggle');
  var content = document.getElementById('heavyPricingContent');
  var heavySlider = document.getElementById('heavyPricingSlider');

  if (!toggle || !content) return;

  // Accordion toggle
  toggle.addEventListener('click', function() {
    var expanded = this.getAttribute('aria-expanded') === 'true';
    this.setAttribute('aria-expanded', !expanded);
    content.classList.toggle('open');
  });

  if (!heavySlider) return;

  var heavyLoadLabel = document.getElementById('heavyLoadLabel');
  var heavyCardLabel = document.getElementById('heavyCardLabel');
  var heavyPriceAmount = document.getElementById('heavyPriceAmount');

  var heavyTiers = [
    { label: 'Min Load (1/8 Truck)', cardLabel: 'MIN LOAD', price: '$219' },
    { label: '1/4 Truck Load', cardLabel: '1/4 TRUCK', price: '$449' },
    { label: '1/2 Truck Load', cardLabel: '1/2 TRUCK', price: '$649' },
    { label: '3/4 Truck Load', cardLabel: '3/4 TRUCK', price: '$799' },
    { label: 'Full Truck Load', cardLabel: 'FULL TRUCK', price: '$949' }
  ];

  function updateHeavySliderFill(value) {
    var percent = (value / 4) * 100;
    heavySlider.style.setProperty('--slider-progress', percent + '%');
  }

  function updateHeavyActiveLabel(value) {
    var labels = document.querySelectorAll('.heavy-pricing__slider-labels span');
    labels.forEach(function(label, i) {
      label.classList.toggle('active', i === value);
    });
  }

  function updateHeavyPricing(value) {
    var tier = heavyTiers[value];

    heavyLoadLabel.style.opacity = '0';
    heavyPriceAmount.style.opacity = '0';

    setTimeout(function() {
      heavyLoadLabel.textContent = tier.label;
      heavyCardLabel.textContent = tier.cardLabel;
      heavyPriceAmount.textContent = tier.price;

      heavyLoadLabel.style.opacity = '1';
      heavyPriceAmount.style.opacity = '1';
    }, 200);

    updateHeavySliderFill(value);
    updateHeavyActiveLabel(value);
  }

  updateHeavyPricing(0);
  updateHeavySliderFill(0);
  updateHeavyActiveLabel(0);

  heavySlider.addEventListener('input', function() {
    updateHeavyPricing(parseInt(this.value));
  });
});

// ===== Scroll to Top Button =====
(function() {
  var btn = document.querySelector('.scroll-to-top');
  if (!btn) return;
  window.addEventListener('scroll', function() {
    if (window.scrollY > 300) {
      btn.classList.add('visible');
    } else {
      btn.classList.remove('visible');
    }
  });
  btn.addEventListener('click', function() {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  });
})();

// ===== FAQ Accordion =====
document.addEventListener('DOMContentLoaded', function() {
  var faqItems = document.querySelectorAll('.aboutfaq__question');

  if (!faqItems.length) return;

  faqItems.forEach(function(btn) {
    btn.addEventListener('click', function() {
      var item = this.closest('.aboutfaq__item');
      var isActive = item.classList.contains('active');

      // Close all items
      document.querySelectorAll('.aboutfaq__item').forEach(function(el) {
        el.classList.remove('active');
        el.querySelector('.aboutfaq__question').setAttribute('aria-expanded', 'false');
      });

      // Open clicked item (if it was closed)
      if (!isActive) {
        item.classList.add('active');
        this.setAttribute('aria-expanded', 'true');
      }
    });
  });
});
