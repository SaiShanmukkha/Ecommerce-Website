<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<div  class="modal fade" id="cart" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog  mw-100 w-75" role="document">
		<div class="modal-content">
			<div class="modal-header custom-bg">
				<h5 class="modal-title text-white">Cart Items</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="cart-body">
				<!-- Cart Body -->
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="chkout-btn" onclick="gotoCheckout();">Checkout</button>
			</div>
		</div>
	</div>
</div>




