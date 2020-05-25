<div class="flex">
  <div class="center-box-card">
    <p class="title">Choose your interests genre movie</p>
    <div class="selected-wrapper" id="selectedInterest">
    	<p>Choose at least 3 interests</p>
    </div>
	<?php if (!empty($list)) { ?>
    <div>
		<?php foreach ($list as $key => $value) { ?>
			<div class="genre-wrapper" id="cardInterest_<?php echo $value->id;?>">
				<div class="name-container">
					<input type="checkbox" id="boxInterest_<?php echo $value->id;?>" name="boxData[]" onClick="selected(this.value);" value="<?php echo $value->id.'.'.$value->name;?>" class="checkbox-interest">
					<label for="selectedInterest"><p><?php echo $value->name; ?></p></label>
					
				</div>
				<div class="genre-image" style="background: url(<?php echo $value->image;?>);"></div>
			</div>
		<?php } ?>
    </div>
	<?php } ?>
  </div>
</div>


<script type="text/javascript">
	const dataInterest = <?php echo json_encode($list); ?>;
</script>