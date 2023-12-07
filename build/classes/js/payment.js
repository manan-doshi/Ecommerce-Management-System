// JavaScript to handle the radio button clicks and show/hide payment details

const paymentOptions = document.querySelectorAll('input[name="payment-option"]');
const paymentDetails = document.querySelectorAll('.payment-details');
const submitButton = document.getElementById('submit-button');
const errorMessage = document.getElementById('error-message');

// Function to hide all payment details initially
function hideAllPaymentDetails() {
    paymentDetails.forEach((details) => {
        details.style.display = 'none';
    });
}

// Function to disable the submit button
function disableSubmitButton() {
    submitButton.disabled = true;
}

  // Function to enable the submit button
  function enableSubmitButton() {
    submitButton.disabled = false;
}

// Function to handle radio button click
function handleRadioButtonClick(event) {
    const selectedOption = event.target.value;

    // Hide all payment details first
    hideAllPaymentDetails();

    // Show the payment details corresponding to the selected option
    switch (selectedOption) {
        case 'UPI':
            document.getElementById('upi-details').style.display = 'block';
            break;
        case 'Card':
            document.getElementById('card-details').style.display = 'block';
            break;
        case 'COD':
            document.getElementById('cod-details').style.display = 'block';
            break;
        default:
            // Handle any other cases or errors here
            break;
    }
}

// Add event listener for radio button clicks
paymentOptions.forEach((option) => {
    option.addEventListener('click', handleRadioButtonClick);
});

// Hide all payment details initially when the page loads
hideAllPaymentDetails();

// Function to validate that the input is numeric
function isNumeric(input) {
    return /^\d+$/.test(input);
}

// Function to handle input in the card number field
function handleCardNumberInput(event) {
    const cardNumberInput = event.target;
    const cardNumberValue = cardNumberInput.value;

    if (!isNumeric(cardNumberValue)) {
        // Clear the input or display an error message
        cardNumberInput.value = '';
    }
}

// Function to handle input in the CVV field
function handleCVVInput(event) {
    const cvvInput = event.target;
    const cvvValue = cvvInput.value;

    if (!isNumeric(cvvValue)) {
        // Clear the input or display an error message
        cvvInput.value = '';
    }
}

// Add input event listeners for card number and CVV
const cardNumberInput = document.querySelector('.card-number');
const cvvInput = document.querySelector('.cvv');

cardNumberInput.addEventListener('input', handleCardNumberInput);
cvvInput.addEventListener('input', handleCVVInput);

// Function to format the card number as groups of four digits
function formatCardNumber(cardNumber) {
    return cardNumber.replace(/\D/g, '').replace(/(\d{4})(?=\d)/g, '$1 ');
}

// Function to handle input in the card number field
function handleCardNumberInput(event) {
    const cardNumberInput = event.target;
    let cardNumberValue = cardNumberInput.value;

    // Remove non-numeric characters and format the card number
    cardNumberValue = formatCardNumber(cardNumberValue);

    // Set the formatted value back into the input field
    cardNumberInput.value = cardNumberValue;
}

// Add input event listener for the card number

cardNumberInput.addEventListener('input', handleCardNumberInput);

// Function to handle input in the card number field
function handleCardNumberInput(event) {
    const cardNumberInput = event.target;
    let cardNumberValue = cardNumberInput.value;

    // Remove non-numeric characters and format the card number
    cardNumberValue = cardNumberValue.replace(/\D/g, '').substring(0, 16); // Limit to 16 digits

    // Format the card number as groups of four digits
    cardNumberValue = formatCardNumber(cardNumberValue);

    // Set the formatted value back into the input field
    cardNumberInput.value = cardNumberValue;

    // Enable the submit button if the card number is valid
    if (cardNumberValue.length === 16) {
        enableSubmitButton();
    } else {
        disableSubmitButton();
    }
}
cardNumberInput.addEventListener('input', handleCardNumberInput);

function handleExpirationDateInput(event) {
    const expirationDateInput = event.target;
    let expirationDateValue = expirationDateInput.value;

    // Remove non-numeric characters and format the expiration date as MM/YY
    expirationDateValue = expirationDateValue.replace(/\D/g, '').substring(0, 4); // Limit to 4 characters (MMYY)

    if (expirationDateValue.length >= 2) {
        if (expirationDateValue.charAt(2) !== '/') {
            // Add a slash after the second character (MM/YY)
            expirationDateValue = expirationDateValue.slice(0, 2) + '/' + expirationDateValue.slice(2);
        }
    }

    // Set the formatted value back into the input field
    expirationDateInput.value = expirationDateValue;

    // Enable the submit button if the expiration date is valid (MM/YY format)
    if (expirationDateValue.length === 5 && /^\d{2}\/\d{2}$/.test(expirationDateValue)) {
        enableSubmitButton();
    } else {
        disableSubmitButton();
    }
}

    const expirationDateInput = document.querySelector('.expiration-date');
    expirationDateInput.addEventListener('input', handleExpirationDateInput);

        // Function to check if at least one payment option is filled
        function isAtLeastOneOptionFilled() {
            for (const details of paymentDetails) {
                const inputs = details.querySelectorAll('input[type="text"]');
                for (const input of inputs) {
                    if (input.value.trim() !== '') {
                        return true; // At least one option is filled
                    }
                }
            }
            return false; // No option is filled
        }


    // Function to handle form submission
    function handleSubmit(event) {
        // Prevent the default form submission behavior (page reload)
        event.preventDefault();

        const selectedOption = document.querySelector('input[name="payment-option"]:checked');

        if (selectedOption && isAtLeastOneOptionFilled()) {
            // At least one payment option is filled, and a radio button is selected, proceed to the next page
            window.location.href = 'payment-success.html';
        } else {
            // No payment option is filled or no radio button is selected, display the error message
            errorMessage.style.display = 'block';
        }
    }

    document.addEventListener('DOMContentLoaded', function() {
        const submitButton = document.getElementById('submit-button');
        const paymentOptions = document.querySelectorAll('input[name="payment-option"]');
        const upiInput = document.querySelector('#upi-details input[type="text"]');
        const codInput = document.querySelector('#cod-details input[type="text"]');
        const cardDetails = document.querySelector('#card-details'); // Container for card details
        const cardNumberInput = cardDetails.querySelector('.card-number');
        const expirationDateInput = cardDetails.querySelector('.expiration-date');
        const cvvInput = cardDetails.querySelector('.cvv');
    
        // Add event listener for UPI input
        upiInput.addEventListener('input', function() {
            const selectedOption = document.querySelector('input[name="payment-option"]:checked');
    
            if (selectedOption && selectedOption.value === 'UPI') {
                const inputValue = upiInput.value.trim();
    
                // Enable the submit button if UPI input has more than 5 characters
                submitButton.disabled = inputValue.length <= 5;
            }
        });
    
        // Add event listener to the card details container
        cardDetails.addEventListener('input', function() {
            const selectedOption = document.querySelector('input[name="payment-option"]:checked');
    
            if (selectedOption && selectedOption.value === 'Card') {
                const cardNumberValue = cardNumberInput.value.replace(/\s/g, ''); // Remove spaces
                const expirationDateValue = expirationDateInput.value.trim();
                const cvvValue = cvvInput.value.trim();
    
                // Validate card number (exactly 16 digits without spaces)
                const isCardNumberValid = /^[0-9]{16}$/.test(cardNumberValue);
    
                // Validate expiration date (exactly 5 characters with '/')
                const isExpirationDateValid = /^[0-9]{2}\/[0-9]{2}$/.test(expirationDateValue);
    
                // Validate CVV (exactly 3 digits)
                const isCvvValid = /^[0-9]{3}$/.test(cvvValue);
    
                // Enable the submit button only if all fields are valid
                submitButton.disabled = !(isCardNumberValid && isExpirationDateValid && isCvvValid);
            }
        });
    
        // Add event listener for radio button clicks
        paymentOptions.forEach((option) => {
            option.addEventListener('click', function() {
                // Check if the selected option is 'COD'
                const selectedOption = document.querySelector('input[name="payment-option"]:checked');
                submitButton.disabled = !selectedOption || (selectedOption.value === 'Card' && !isCardValid()) || (selectedOption.value === 'UPI' && !isUpiValid());
            });
        });
    
        // Function to validate card details
        function isCardValid() {
            const cardNumberValue = cardNumberInput.value.replace(/\s/g, ''); // Remove spaces
            const expirationDateValue = expirationDateInput.value.trim();
            const cvvValue = cvvInput.value.trim();
    
            // Validate card number (exactly 16 digits without spaces)
            const isCardNumberValid = /^[0-9]{16}$/.test(cardNumberValue);
    
            // Validate expiration date (exactly 5 characters with '/')
            const isExpirationDateValid = /^[0-9]{2}\/[0-9]{2}$/.test(expirationDateValue);
    
            // Validate CVV (exactly 3 digits)
            const isCvvValid = /^[0-9]{3}$/.test(cvvValue);
    
            return isCardNumberValid && isExpirationDateValid && isCvvValid;
        }
    
        // Function to validate UPI input
        function isUpiValid() {
            const inputValue = upiInput.value.trim();
            return inputValue.length > 5;
        }
    
        // Rest of your code...
    });             