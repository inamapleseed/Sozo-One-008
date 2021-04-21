<h2 ><?php echo $text_instruction; ?></h2>
<p><b><?php echo $text_description; ?></b></p>
<div class="well well-sm text-center">
  <p><?php echo $bank; ?></p>
  <img src="<?php echo "image/".$image; ?>" title="<?php echo $bank; ?>" alt="<?php echo $bank; ?>" class="img-responsive" style = "margin:auto;">
</div>
<div class="contain-receipt">
	<p><?php echo $text_payment; ?></p>
	<form id="enquiry-form123" name="myform" action="index.php?route=information/contact/enquiry" method="POST">
		<div class="row">
			<div class="col-sm-6">
				<div class="form-group">
					<input type="text" name="from_name" placeholder="Name of Payor" class="form-control" id="q-from_name">
					<div class="error_name"></div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6">
				<div class="form-group">
					<input type="text" name="ref_no" placeholder="Payment Reference No." class="form-control" id="q-ref-no">
					<div class="error_ref_no"></div>
				</div>
			</div>
		</div>

<div class="form-group">
    <div class="inner-upload">
            <input type="file" name="upload" id="input-upload">
    </div>
	<div class="error_upload"></div>
</div>

		<div class="row book-pop">
			<div class="col-sm-6 button text-right">
				<button id="btn-validate" type="submit" class="btn btn-primary" data-loading-text="<?php echo $text_loading; ?>">SUBMIT</button>
			</div>
		</div>
	</form>
</div>

<style type="text/css">
	.contain-receipt {
		text-align: center;
		margin: auto;
	}
	.contain-receipt form {
		text-align: center;
		margin: auto;
	}

	.contain-receipt .col-sm-6 {
		margin: auto;
		text-align: center;
	}

	#btn-validate {
		background: transparent;
		color: #000;
		border-color: #000;
	}
	#btn-validate:hover {
		background: #000;
		color: #fff;
	}

	.payment ~ .pull-sm-left {
		height: 4em;
		width: 100%;
		display: flex;
		align-items: center;
		justify-content: center;		
	}

	.btn {
		min-width: 6em;
	}
</style>

<script type="text/javascript">
	$(document).on("submit","#enquiry-form123",function(e) {
		console.log('teeest');
		e.preventDefault(); 
		var form = $(this),
		$unq = $('#enquiry-form123'),
		url = form.attr('action'),
		type = form.attr('method');

form.find('.text-danger').remove();//reset the error 
$.ajax({
	type: type,
	url: url,
	data: form.serialize(), // serializes the form's elements.
	dataType: 'json',
beforeSend: function(result) {
	// console.log(result);

	// $('body').loadingModal({
	// 	position: 'center',
	// 	text: 'Loading...',
	// 	color: '#5e5e5e',
	// 	opacity: '1',
	// 	animation: 'wave'
	// });
},
success: function(result)
{
	// $($unq).addClass('hide');
	// $('body').loadingModal('destroy');
	if(result['success'] == 1){ 
		
	// console.log('successs');
// $('#enquiry-modal').modal('hide');
		parent.$('.mfp-close').trigger("click");
		form.trigger('reset');//reset data after send
		swal({
			title: result['success_title'],
			html: result['success_msg'],
			type: "success"
		});
		// window.location='index.php?route=information/contact/success'

		ajax1();
		
		}else{
			console.log('fail');
			if(typeof(result['error']) != "undefined" && result['error'] !== null) {

				$.each(result['error'], function( index, value ) {
					$('.error_'+index).append('<div class="text-danger">'+value+'</div>');
				});
			}else{
		alert('Something went wrong please refresh the page and try again.'); // show response from the php script.
		}
		}
		}
});
});
</script>

<script type="text/javascript">
	function ajax1(){
		$.ajax({
			type: 'get',
			url: 'index.php?route=extension/payment/paynow/confirm',
			cache: false,
			beforeSend: function() {
				// $('#button-confirm').button('loading');
			},
			complete: function() {
				// $('#button-confirm').button('reset');
			},
			success: function() {
				location = '<?php echo $continue; ?>';
			}
		});
	}
</script>