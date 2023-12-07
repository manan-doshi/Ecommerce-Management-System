// Stock 

function add_to_cart(pid, pname, price, stock) {
    let cart = localStorage.getItem("cart");
    if (cart == null) {
        let products = [];
        let product = { 
            productId: pid, 
            productName: pname, 
            productQuantity: 1, 
            productPrice: price, 
            productStock: stock 
        };
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        console.log("1st time");
        alert("Success");
    }
    else {
        let pcart = JSON.parse(cart);
        let oldProduct = pcart.find((item) => item.productId == pid)
        if (oldProduct) {
            if (oldProduct.productQuantity < oldProduct.productStock) {
                oldProduct.productQuantity = oldProduct.productQuantity + 1;
                pcart.map((item) => {
                    if (item.productId == oldProduct.productId) {
                        item.productQuantity = oldProduct.productQuantity;
                    }
                });
                localStorage.setItem("cart", JSON.stringify(pcart));
                console.log("quantity increased");
                alert("Quantity Increased!");
            } 
            
            else {
				alert("no more item can be add stock is full...");
                console.log("Cannot add more, stock limit reached.");
            }
        } else {
            let product = { 
                productId: pid, 
                productName: pname, 
                productQuantity: 1, 
                productPrice: price, 
                productStock: stock 
            };
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("addded");
            alert("Success");
        }
    }
    updateCart();
}
//update cart
function updateCart() {
	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString);
	if (cart == null || cart.length == 0) {
		//console.log("cart is empty");
		$(".cart-items").html("(0)");
		$(".cart-body").html("<p style='font-family: Poppins, sans-serif; font-size: 27px'; font-weight: 400;>Your cart is empty!</p><br><p style='font-family: Poppins, sans-serif; font-size: 20px';>Add items to it now.</p>");
		$(".checkout-btn").attr('disabled', true);
	}
	else {
		console.log(cart);
		$(".cart-items").html(`(${cart.length})`);
		let table = `
				  <table class='table' style="font-size:18px; margin-top: 25px; font-family:Arial, Helvetica, sans-serif;  border-collapse: collapse; width:1000px; text-align: center; border: 1px solid black">
				  <thead class='thread-light'>
				  <tr>
				  <td style="background: radial-gradient(circle 815px at 23.4% -21.8%, rgba(9, 29, 85, 1) 0.2%, rgba(0, 0, 0, 1) 100.2%);
							 color:white; padding:8px; color:white; border-right: 1px solid black;">NAME</td>
							 
				  <td style="background: radial-gradient(circle 815px at 23.4% -21.8%, rgba(9, 29, 85, 1) 0.2%, rgba(0, 0, 0, 1) 100.2%);
                             color:white; padding:8px; color:white; border-right: 1px solid black;">PRICE</td>
				  
				  <td style="background: radial-gradient(circle 815px at 23.4% -21.8%, rgba(9, 29, 85, 1) 0.2%, rgba(0, 0, 0, 1) 100.2%);
                             color:white; padding:8px; color:white; border-right: 1px solid black;">QUANTITY</td>
				  
				  <td style="background: radial-gradient(circle 815px at 23.4% -21.8%, rgba(9, 29, 85, 1) 0.2%, rgba(0, 0, 0, 1) 100.2%);
                             color:white; padding:8px; color:white; border-right: 1px solid black;">TOTAL PRICE</td>
                             
				  <td style="background: radial-gradient(circle 815px at 23.4% -21.8%, rgba(9, 29, 85, 1) 0.2%, rgba(0, 0, 0, 1) 100.2%);
                             color:white; padding:8px; color:white; border:none;">ACTION</td>
				  </tr>
				  </thead>
				  				 				  
				  `;
		let totalPrice = 0;
		cart.map((item) => {
			table += `
					  <tr style='border: 1px solid black; background-color: white;'>
					  <td style='border: 1px solid black; padding-top: 30px;'>${item.productName}</td>
					  <td style='border: 1px solid black; padding-top: 30px;'>${item.productPrice}</td>
					  <td style='border: 1px solid black; padding-top: 30px;'>${item.productQuantity}</td>
					  <td style='border: 1px solid black; padding-top: 30px;'>${item.productQuantity * item.productPrice}</td>
					  <td ><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger' 
					  style="background:rgb(240 0 12); color:white; font-size:17px; border-right: 1px solid black; border-radius:3px; cursor:pointer; padding: 7px;
    				         margin: 13px 0;" onmouseover="this.style.backgroundColor='rgb(206 10 19)'" onmouseout="this.style.backgroundColor='rgb(240 0 12)'" 
					  >Remove</button> </td>
					  </tr>
					  
					  `
			totalPrice += item.productPrice * item.productQuantity;
		})

		table = table + `
				  <tr ><td colspan="5" style="background: radial-gradient(circle 815px at 23.4% -21.8%, rgba(9, 29, 85, 1) 0.2%, rgba(0, 0, 0, 1) 100.2%); color:white; text-align:right; padding:5px; font-size:22px;padding-right:20px;">
				  Total Amount&nbsp;  &#8377;  <b>${totalPrice}</b></td></tr>
				  </table>`
		$(".checkout-btn").attr('disabled', false);
		$(".cart-body").html(table);
	}

}
function deleteItemFromCart(pid) {
	
	if (confirm("Are you sure you want to remove this item from the cart?")) {
		
	let cart = JSON.parse(localStorage.getItem('cart')); 
	let newcart = cart.filter((item) => item.productId !== pid); 
	localStorage.setItem('cart', JSON.stringify(newcart));
	updateCart();
	
		return true;
	}
	else {
		return false;
	}
}

$(document).ready(function() {
	updateCart()
})

// Go to checkout page

function goToCheckout() {
	window.location = "user_checkout.jsp";
}

// Delete/Empty Items from cart

function emptyCart() {
	if(confirm("Are you sure you want to empty the cart?")){
			localStorage.removeItem('cart'); // Remove the cart data from localStorage
	        updateCart(); 		
	        return true;
	}else{
		return false;
	}	
}