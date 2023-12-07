/* login first alert box */

function loginFirst() {
	//alert("To continue with your purchase, please either log in to your existing account or create a new account!");
	alert('Please log in or create an account to add this product to your cart.');
}

function doLogin() {
	alert("Please Log In or Create an Account to Access Your Cart.");
}

/* Login Success */

function success() {
	alert("Success! Item added to your cart.");
}

/* down to top button */

const scrollButton = document.getElementById('scrollButton');

window.onscroll = function() {
	if (document.body.scrollTop > 800 || document.documentElement.scrollTop > 800) {
		scrollButton.classList.add('visible');
	} else {
		scrollButton.classList.remove('visible');
	}
};

scrollButton.addEventListener('click', function() {
	document.body.scrollTop = 0; // For Safari
	document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE, and Opera
});



// POP-UP FOR LOGIN

document.addEventListener("DOMContentLoaded", function() {
	const popup = document.querySelector('.popup');

	setTimeout(() => {
		popup.style.display = 'block'; 
	}, 2000);   // After 2 second it will appear

	setTimeout(() => {
		popup.style.display = 'none'; 
	}, 6000); // After 6 second it will hide
});


// User Search options

function scrollToSection(sectionId) {
	const targetSection = document.getElementById(sectionId);

	if (targetSection) {
		targetSection.scrollIntoView({ behavior: 'smooth' });
	}
}

function scrollToProduct() {
	var searchTerm = document.getElementById("searchInput").value.toLowerCase();
	var products = document.querySelectorAll(".product");

	for (var i = 0; i < products.length; i++) {
		var product = products[i];
		var productNames = product.getAttribute("data-names").toLowerCase().split(",");
		var productCategory = product.classList[1]; // Get the second class which indicates the category

		if (productNames.includes(searchTerm)) {
			scrollElementIntoView(product);
			return;
		}
	}

	alert("Sorry, no results found! Please check the spelling or try searching for something else.");
}

function scrollElementIntoView(element) {
	if (element) {
		element.scrollIntoView({ behavior: 'smooth' });
	}
}


// upper progress bar

function updateProgressBar() {
	let progressBar = document.getElementById("progress-bar");
	let windowHeight = window.innerHeight;
	let documentHeight = document.body.clientHeight;
	let scrollableHeight = documentHeight - windowHeight;
	let scrollAmount = window.scrollY;

	let width = (scrollAmount / scrollableHeight) * 100;
	progressBar.style.width = width + "%";
}

// Call the function to start the progress bar
updateProgressBar();

// Add an event listener for the scroll event
window.addEventListener("scroll", updateProgressBar);


//Auto-Slider For Banner Image   

document.addEventListener("DOMContentLoaded", function() {
	const sliderContainer = document.querySelector(".slider-container");
	const prevButton = document.querySelector(".prev-button");
	const nextButton = document.querySelector(".next-button");

	let scrollInterval;
	let isScrolling = false;

	const autoScrollDelay = 5000; // Adjust the delay for displaying each image

	function scrollToNext() {
		if (!isScrolling) {
			isScrolling = true;
			const itemWidth = sliderContainer.querySelector(".slider-item").offsetWidth;
			sliderContainer.scrollBy({
				left: itemWidth,
				behavior: "smooth",
			});
			setTimeout(() => {
				isScrolling = false;
			}, 500); // Adjust the delay as needed
		}
	}

	function scrollToPrev() {
		if (!isScrolling) {
			isScrolling = true;
			const itemWidth = sliderContainer.querySelector(".slider-item").offsetWidth;
			sliderContainer.scrollBy({
				left: -itemWidth,
				behavior: "smooth",
			});
			setTimeout(() => {
				isScrolling = false;
			}, 500); // Adjust the delay as needed
		}
	}

	function startAutoScroll() {
		scrollInterval = setInterval(() => {
			scrollToNext();
			checkLastImage();
		}, autoScrollDelay);
	}

	function stopAutoScroll() {
		clearInterval(scrollInterval);
	}

	function checkLastImage() {
		const items = document.querySelectorAll(".slider-item");
		const lastItem = items[items.length - 1];
		if (sliderContainer.scrollLeft + sliderContainer.clientWidth >= lastItem.offsetLeft) {
			sliderContainer.scrollTo({ left: 0, behavior: "smooth" });
		}
	}

	nextButton.addEventListener("click", scrollToNext);
	prevButton.addEventListener("click", scrollToPrev);

	sliderContainer.addEventListener("mouseenter", stopAutoScroll);
	sliderContainer.addEventListener("mouseleave", startAutoScroll);

	startAutoScroll(); // Start auto-scrolling initially
})

/* Search button */

 const searchFun = () => {
	    let filter = document.getElementById('searchInput').value.toUpperCase();
	    let banner = document.querySelector('.banner');
	    let data = document.querySelector('.dataa'); // Corrected typo here
	    let sectionTitles = document.querySelectorAll('.section-title');
	    let productBoxes = document.querySelectorAll('.product-box');
	    let noItemsFoundMessage = document.querySelector('.no-items-found-message');

	    let foundItems = false;

	    productBoxes.forEach(product => {
	        let textValue = product.textContent || product.innerText;

	        if (textValue.toUpperCase().includes(filter)) {
	            product.style.display = "";
	            foundItems = true;
	        } else {
	            product.style.display = "none";
	        }
	    });

	    if (filter.trim() === "") {
	        banner.style.display = "block";
	        sectionTitles.forEach(title => {
	            title.style.display = "block";
	        });
	    } else {
	        banner.style.display = "none";
	        sectionTitles.forEach(title => {
	            title.style.display = "none";
	        });
	    }

	    if (!foundItems) {
	        noItemsFoundMessage.style.display = "block";
	        data.style.display = "none";
	    } else {
	        noItemsFoundMessage.style.display = "none";
	        data.style.display = "block";
	    }
	}