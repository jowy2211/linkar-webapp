<?php $module = $this->uri->segment(1); ?>
<div class="form-wrapper">
  <p class="title">Register</p>
  <form id="formRegister" data-parsley-validate="true" enctype="multipart/form-data">
    <div class="input-container style-bg">
      <div class="mdl-textfield mdl-js-textfield">
        <input class="mdl-textfield__input" autocomplete="off" type="text" id="fullname" maxlength="25" data-parsley-required="true" required="">
        <label class="mdl-textfield__label" style="color: white !important; opacity: 1 !important;" for="fullname">Fullname</label>
      </div>
    </div>
    <div class="input-container style-bg">
      <div class="mdl-textfield mdl-js-textfield">
        <input class="mdl-textfield__input" autocomplete="off" type="text" id="username" maxlength="18" data-parsley-required="true" required="">
        <label class="mdl-textfield__label" style="color: white !important; opacity: 1 !important;" for="username">Username</label>
      </div>
    </div>
    <div class="input-container style-bg">
      <div class="mdl-textfield mdl-js-textfield">
        <input class="mdl-textfield__input" autocomplete="off" type="email" id="email" maxlength="35" data-parsley-required="true" required="">
        <label class="mdl-textfield__label" style="color: white !important; opacity: 1 !important;" for="email">Email</label>
      </div>
    </div>
    <div class="input-container style-bg">
      <div class="mdl-textfield mdl-js-textfield">
        <input class="mdl-textfield__input" autocomplete="off" type="password" id="password" minlength="8" maxlength="14" data-parsley-required="true" required="">
        <label class="mdl-textfield__label" style="color: white !important; opacity: 1 !important;" for="password">Pasword</label>
      </div>
    </div>
    <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect style-bg submit-button">
      Register
    </button>
  </form>
  <p class="register-text">Already have an account?
    <?php if ($module === 'Signup') { ?>
      <a href="<?php echo base_url('Signin');?>" style="color: white !important;"><b>Login</b></a>
    <?php } else { ?>
      <a id="signinBtn">Login</a>
    <?php } ?>
  </p>
</div>