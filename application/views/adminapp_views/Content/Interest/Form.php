<div id="content" class="content">
	<!-- begin page-header -->
	<h1 class="page-header">Interest</h1>
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
	                <h4 class="panel-title"><?= $action == 'add' ? 'Add' : 'Edit '.$interest->name ?></h4>
	            </div>
	            <div class="panel-body panel-form">
	                <form class="form-horizontal form-bordered" data-parsley-validate="true" method="POST" action="<?= base_url('adminapp/Content/Interest/Store') ?>">
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4">Interest :</label>
							<div class="col-md-6 col-sm-6">
								<input class="form-control" type="text" id="name" name="name" placeholder="Interest"  data-parsley-required="true" value="<?= $action == 'edit' ? $interest->name : '' ?>" required />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4"></label>
							<div class="col-md-6 col-sm-6">
								<a href="<?php echo base_url('adminapp/Content/Interest');?>" class="btn btn-default">Cancel</a>
								<button type="submit" class="btn btn-danger">Save</button>
							</div>
						</div>
						<input type="hidden" name="method" value="<?= $action ?>">
						<?php
							if ($action == 'edit') {
						?>
								<input type="hidden" name="id" value="<?= $interest->id ?>">
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