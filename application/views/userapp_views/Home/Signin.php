<?php $module = $this->uri->segment(1); ?>
<div class="form-wrapper">
	<p class="title">Login</p>
	<form id="formLogin" data-parsley-validate="true" enctype="multipart/form-data">
		<div class="input-container style-bg">
		  <div class="mdl-textfield mdl-js-textfield">
		    <input class="mdl-textfield__input" type="text" id="usrname" data-parsley-required="true" required="">
		    <label class="mdl-textfield__label" style="color: white !important; opacity: 1 !important;" for="usrname">Username</label>
		  </div>
		</div>
		<div class="input-container style-bg">
		  <div class="mdl-textfield mdl-js-textfield">
		    <input class="mdl-textfield__input" type="password" id="pswd" data-parsley-required="true" required="">
		    <label class="mdl-textfield__label" style="color: white !important; opacity: 1 !important;" for="pswd">Pasword</label>
		  </div>
		</div>
		<button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect style-bg submit-button">
		  Login
		</button>
	</form>
	<p class="register-text">Don't have an account?
		<?php if ($module === 'Signin') { ?>
			<a href="<?php echo base_url('Signup');?>" style="color: white !important;">Register</a>
		<?php } else { ?>
	  		<a id="signupBtn">Register</a>
		<?php } ?>
	</p>
</div>