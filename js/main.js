document.addEventListener('DOMContentLoaded', () => {
  console.log("Ticker loaded!");

  const ticker = document.getElementById('ticker');
  if (!ticker){
    console.error("Ticker nicht gefunden");
    return;
  }

  const track = ticker.querySelector('.line');
  if (!track){
    console.error("Ticker Line nicht gefunden");
    return;
  }
  track.innerHTML += track.innerHTML;
});


// Kontaktformular Validierung
document.addEventListener('DOMContentLoaded', () => {
  const form = document.getElementById('contactForm');
  if (!form){
    return;
  };

  const status = document.getElementById('formStatus');
  const submitBtn = document.getElementById('submitBtn');
  if(!status || !submitBtn){
    return;
  }


  const validators = {
    name: {
      validate: (value) => value.trim().length >= 2,
      message: 'Bitte geben Sie Ihren Namen ein mit mindestens 2 Zeichen'
    },
    email: {
      validate: (value) => {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(value.trim());
      },
      message: 'Bitte geben Sie eine gültige Mail-Adresse ein'
    },
    phone: {
      validate: (value) => {
        if (!value) return true; // Optional
        const phoneRegex = /^[\d\s\-\+\(\)]+$/; // @todo auslandsnummer? Hier nochmal testen
        return value.length >= 6 && phoneRegex.test(value);
      },
      message: 'Bitte geben Sie eine gültige Telefonnummer ein'
    },
    message: {
      validate: (value) => value.trim().length >= 10,
      message: 'Ihre Nachricht sollte mindestens 10 Zeichen enthalten'
    },
    datenschutz: {
      validate: (value, element) => element.checked,
      message: 'Bitte akzeptieren Sie die Datenschutzbestimmungen'
    }
  };

  // Fehlermeldung anzeigen/verstecken
  function showError(field, message) {
    const errorEl = document.getElementById(`${field.id}-error`);
    if (errorEl) {
      errorEl.textContent = message;
      errorEl.classList.add('show');
    }
    field.classList.add('invalid');
    field.setAttribute('aria-invalid', 'true');
  }

  function clearError(field) {
    const errorEl = document.getElementById(`${field.id}-error`);
    if (errorEl) {
      errorEl.textContent = '';
      errorEl.classList.remove('show');
    }
    field.classList.remove('invalid');
    field.setAttribute('aria-invalid', 'false');
  }

  // Einzelnes Feld validieren
  function validateField(field) {
    const validator = validators[field.name];
    if (!validator) return true;

    const value = field.type === 'checkbox' ? field.checked : field.value;
    const isValid = validator.validate(value, field);

    if (!isValid) {
      showError(field, validator.message);
      return false;
    } else {
      clearError(field);
      return true;
    }
  }


  form.addEventListener('focusout', (e) => {
    if (e.target.tagName === 'INPUT' || e.target.tagName === 'TEXTAREA') {
      if (e.target.classList.contains('touched') || e.target.value) {
        validateField(e.target);
      }
    }
  });

  // Markiere Felder als "touched" bei Eingabe
  form.addEventListener('input', (e) => {
    if (e.target.tagName === 'INPUT' || e.target.tagName === 'TEXTAREA') {
      e.target.classList.add('touched');
      if (e.target.classList.contains('invalid')) {
        validateField(e.target);
      }
    }
  });

  // Checkbox sofort validieren
  const privacyCheckbox = form.querySelector('#datenschutz');
  if (privacyCheckbox) {
    privacyCheckbox.addEventListener('change', () => {
      validateField(privacyCheckbox);
    });
  }

  // Formular absenden
  form.addEventListener('submit', async (e) => {
    e.preventDefault();

    // Alle Felder validieren
    let isValid = true;
    const fields = form.querySelectorAll('input, textarea');

    fields.forEach(field => {
      field.classList.add('touched');
      if (!validateField(field)) {
        isValid = false;
      }
    });

    if (!isValid) {
      status.className = 'form-status error show';
      status.textContent = 'Bitte korrigieren Sie die markierten Felder.';

      // Fokus auf erstes fehlerhaftes Feld
      const firstInvalid = form.querySelector('.invalid');
      if (firstInvalid) {
        firstInvalid.focus();
      }
      return;
    }

    // Senden
    submitBtn.classList.add('loading');
    submitBtn.disabled = true;
    status.className = 'form-status';
    status.textContent = '';

    try {
      const formData = new FormData(form);
      const response = await fetch(form.action, {
        method: 'POST',
        body: formData
      });

      const result = await response.text();

      if (result==="1") {
        status.className = 'form-status success show';
        status.textContent = result.message || 'Ihre Nachricht wurde erfolgreich gesendet!';
        form.reset();

        // Felder als unberührt markieren
        fields.forEach(field => {
          field.classList.remove('touched', 'invalid');
          clearError(field);
        });
      } else {
        throw new Error(result.message || 'Ein Fehler ist aufgetreten');
      }
    } catch (error) {
      status.className = 'form-status error show';
      status.textContent = 'Leider ist ein Fehler aufgetreten. Bitte versuchen Sie es später erneut.';
    } finally {
      submitBtn.classList.remove('loading');
      submitBtn.disabled = false;
    }
  });
});
