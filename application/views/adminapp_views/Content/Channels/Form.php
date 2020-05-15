<div id="content" class="content">
	<!-- begin page-header -->
	<h1 class="page-header">Management Channels</h1>
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
	                <h4 class="panel-title"><?= $action == 'add' ? 'Add' : 'Edit '.$channel->name ?></h4>
	            </div>
	            <div class="panel-body panel-form">
	                <form class="form-horizontal form-bordered" data-parsley-validate="true" method="POST">
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4">Channel :</label>
							<div class="col-md-6 col-sm-6">
								<input class="form-control" type="text" id="name" name="name" readonly placeholder="Channel" data-parsley-required="true" value="<?= $action == 'edit' ? $channel->name : '' ?>" required />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4">Channel ID:</label>
							<div class="col-md-6 col-sm-6">
								<input class="form-control" type="text" id="channel" name="channel" placeholder="Channel ID" readonly data-parsley-required="true" value="<?= $action == 'edit' ? $channel->channel_id : '' ?>" required />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4"></label>
							<div class="col-md-6 col-sm-6">
								<a href="<?php echo base_url('adminapp/Content/Channels');?>" class="btn btn-default">Cancel</a>
							</div>
						</div>
						<input type="hidden" name="method" value="<?= $action ?>">
						<?php
							if ($action == 'edit') {
						?>
								<input type="hidden" name="id" value="<?= $channel->id ?>">
						<?php } ?>
	                </form>
	            </div>
	        </div>
	        <!-- end panel -->
	    </div>
	    <!-- end col-6 -->
	</div>
	<!-- end row -->
</div>