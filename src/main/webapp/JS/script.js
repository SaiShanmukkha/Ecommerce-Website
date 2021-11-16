/**
 * 
 *//**
 * 
 */

/**
 * 
 */

/**
 * 
 */



function add_to_cart(pId, pName, pPrice) {
	
	
	//1. create product object
	//2. Add product object to array
	//3.create a cart-local storage
	//4. Add array to the cart

	let cart = localStorage.getItem("cart");

	if (cart == null) {
	
		// create cart if not exists

		let products = [];
		let product = { productId: pId, productName: pName, productPrice: pPrice, productQty: 1 };

		// adding it to the array
		products.push(product);

		// create the cart
		localStorage.setItem("cart", JSON.stringify(products));

		// console.log("Cart is created. Product is added:" + pId);
	} else {
		// update product if it already in cart


		let pcart = JSON.parse(cart);

		let oldProduct = pcart.find((item) => item.productId === pId);

		if (oldProduct) {
			// console.log("Products exits");
			oldProduct.productQty = oldProduct.productQty + 1;

			pcart.map(item => {
				if (item.productId == oldProduct.productId) {
					item.productQty = oldProduct.productQty;
				}
			});

			// putting back in local storage
			localStorage.setItem("cart", JSON.stringify(pcart));

			// console.log("Product quantity to " + oldProduct.productQty + " increased for:" + pId);
		} else {

			// create object for new product getting added
			let product = { productId: pId, productName: pName, productPrice: pPrice, productQty: 1 };

			// adding it to the array
			pcart.push(product);

			// create the cart
			localStorage.setItem("cart", JSON.stringify(pcart));

			// console.log("New Product added.");

		}




	}
updateCart();
	// In cart, we are showing array of product objects.
}

$(document).ready(function(){
	updateCart();
});


function updateCart() {
	// console.log("Called");
	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString);
	var totalPrice=0;

	if (null != cart) {
		// console.log("Cart is not Null");
		$(".cart-items").html("(0)")
	}

	if (cart == null || cart.length == 0) {
		// Disable the button

		$(".cart-body").html("<h3>No products to display</h3>")

	$(".chkout-btn").attr("disabled", "disabled");
	$(".chkout-btn").addClass("btn btn-secondary");

	} else {
		// Enable the button
		$(".chkout-btn").removeAttr("disabled").removeClass("btn-secondary");
		$(".chkout-btn").addClass("btn btn-outline-primary");
		// console.log("Building table");
		
		//updating at cart-logo
		$(".cart-items").html(`(${cart.length})`);

		var table = `
		<table class="table">
      <thead>
        <tr>
          <th>Product Name</th>
          <th>Price</th>
          <th>Quantity</th>
          <th>Total</th>
          <th>Action</th>
        </tr>
      </thead>
		`;


		cart.map(item => {
			table +=
				`
				<tr>
					<td value=''${item.productName}"" name="pName">${item.productName}</td>
					<td value="${item.productPrice}" name="pPrice">${item.productPrice}</td>
					<td value="${item.productQty}" name="pQty"><span><button onclick="decQty(${item.productId})" class="btn btn-outline-warning">-</button></span><span class="px-2">${item.productQty}</span><span><button onclick="incQty(${item.productId})" class="btn btn-outline-warning">+</button></span></td>
					<td value="${item.productPrice * item.productQty}" name="pTotal">${item.productPrice * item.productQty}</td>
					<td>
							<button onclick="deleteProductFromCart(${item.productId})" class="btn btn-outline-danger">remove</button>					
					</td>
					<input type="hidden" id="productDetails" name="productDetails"  value="${item.productId}@${item.productName}@${item.productPrice}@${item.productQty}@${item.productPrice*item.productQty}">	
			
				</tr>
					`	;
			totalPrice += (item.productPrice * item.productQty); 
			console.log("$$$:"+document.getElementById("productDetails"));
		});

		table +=
			`
		<tr>
			<td></td>
			<td colspan="2"> <b>Total Price</b></td>
			<td>${totalPrice}</td>
		</tr>
		`;

		table += `</table>`;
		// console.log("Total Price="+totalPrice);
		$(".cart-body").html(table);
	}

}


function deleteProductFromCart(pId) {
		let cart = JSON.parse(localStorage.getItem("cart"));
		let newCart = cart.filter(item=>item.productId!=pId);
		console.log(newCart);
		localStorage.setItem("cart", JSON.stringify(newCart));
		updateCart();
}

function incQty(pId){
	let cartString = localStorage.getItem("cart");
	let pcart = JSON.parse(cartString);

		let oldProduct = pcart.find((item) => item.productId === pId);

		if (oldProduct) {
			// console.log("Products exits");
			oldProduct.productQty = oldProduct.productQty + 1;

			pcart.map(item => {
				if (item.productId == oldProduct.productId) {
					item.productQty = oldProduct.productQty;
				}
			});

			// putting back in local storage
			localStorage.setItem("cart", JSON.stringify(pcart));
			updateCart();
}
}

function decQty(pId){
	let cartString = localStorage.getItem("cart");
	let pcart = JSON.parse(cartString);

		let oldProduct = pcart.find((item) => item.productId === pId);

		if (oldProduct) {
			// console.log("Products exits");
			oldProduct.productQty = oldProduct.productQty - 1;

			pcart.map(item => {
				if (item.productId == oldProduct.productId) {
					item.productQty = oldProduct.productQty;
				}
			});

			// putting back in local storage
			localStorage.setItem("cart", JSON.stringify(pcart));
			updateCart();
}
}

function gotoCheckout() {
	window.location.href = "checkout.jsp";

}

function gotoHomePage() {
	// console.log("Going to Home Page");
	window.location.href = "homePage.jsp";
}
