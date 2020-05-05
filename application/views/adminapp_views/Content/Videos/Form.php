<div id="content" class="content">
	<!-- begin page-header -->
	<h1 class="page-header">Management Videos</h1>
	<!-- end page-header -->

	<!-- begin row -->
	<div class="row">
	    <!-- begin col-12 -->
	    <div class="col-md-12">
	        <!-- begin panel -->
	        <div class="panel panel-inverse" data-sortable-id="form-validation-2">
	            <div class="panel-heading">
	                <div class="panel-heading-btn">
	                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
	                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-repeat"></i></a>
	                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
	                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
	                </div>
	                <h4 class="panel-title"><?= $action == 'add' ? 'Add' : 'View Detail '.$video->title ?></h4>
	            </div>
	            <div class="panel-body panel-form">
	                <form class="form-horizontal form-bordered" data-parsley-validate="true" method="POST" action="<?= base_url('adminapp/Content/Videos/Store'); ?>">
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4">Interests :</label>
							<div class="col-md-6 col-sm-6">
								<select class="form-control" id="interest" name="interest" data-parsley-required="true" <?php echo $action === 'edit' ? 'disabled' : 'required';?>>
									<option value=""> ---- Select Interest ---- </option>
									<?php foreach ($interests as $key => $value) { ?>
										<option value="<?php echo $value->id;?>" <?php echo $value->id === $video->interest_id ? 'selected' : '';?>><?php echo $value->name;?></option>
									<?php } ?>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4">Channel :</label>
							<div class="col-md-6 col-sm-6">
								<select class="form-control" id="channel" name="channel" data-parsley-required="true" <?php echo $action === 'edit' ? 'disabled' : 'required';?>>
									<option value=""> ---- Select Channel ---- </option>
									<?php foreach ($channels as $key => $value) { ?>
										<option value="<?php echo $value->id;?>" <?php echo $value->id === $video->channel_id ? 'selected' : '';?>><?php echo $value->name;?></option>
									<?php } ?>
								</select>
							</div>
						</div>
						<?php if ($action == 'edit') { ?>
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4">Title :</label>
							<div class="col-md-6 col-sm-6">
								<input type="text" name="title" class="form-control" value="<?php echo $video->title;?>" readonly>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4">Description :</label>
							<div class="col-md-6 col-sm-6">
								<textarea class="form-control" name="description" readonly><?php echo $video->description;?></textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4">Url :</label>
							<div class="col-md-6 col-sm-6">
								<input type="text" name="title" class="form-control" value="<?php echo $video->url;?>" readonly>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4">Thumbnails Url :</label>
							<div class="col-md-6 col-sm-6">
								<input type="text" name="title" class="form-control" value="<?php echo $video->thumbnails;?>" readonly>
							</div>
						</div>
						<?php } ?>
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4"></label>
							<div class="col-md-6 col-sm-6">
								<a href="<?php echo base_url('adminapp/Content/Videos');?>" class="btn btn-default">Cancel</a>
								<?php if ($action === 'add') { ?>
									<button type="submit" class="btn btn-danger">Save</button>
								<?php } ?>
							</div>
						</div>
	                </form>
	            </div>
	        </div>
	        <!-- end panel -->
	    </div>
	    <!-- end col-6 -->
	</div>
	<!-- end row -->
</div>