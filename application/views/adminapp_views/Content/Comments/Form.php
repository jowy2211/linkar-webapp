<div id="content" class="content">
	<!-- begin page-header -->
	<h1 class="page-header">Management Comments</h1>
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
	                </div>
	                <h4 class="panel-title">Set status comment</h4>
	            </div>
	            <div class="panel-body panel-form">
	                <form class="form-horizontal form-bordered" data-parsley-validate="true" method="POST" action="<?= base_url('adminapp/Content/Comments/Store') ?>">
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4">Text :</label>
                            <div class="col-md-6 col-sm-6">
                                <textarea class="form-control" id="text" name="text" placeholder="Text" rows="5" data-parsley-required="true" disabled="" required><?= $action == 'edit' ? $comment->text : '' ?></textarea>
                            </div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4">User :</label>
							<div class="col-md-6 col-sm-6">
								<input class="form-control" type="text" id="user" name="user" placeholder="User" data-parsley-required="true" value="<?= $action == 'edit' ? $comment->user : '' ?>" disabled="" required />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4">Video :</label>
							<div class="col-md-6 col-sm-6">
								<input class="form-control" type="text" id="video" name="video" placeholder="Video" data-parsley-required="true" value="<?= $action == 'edit' ? $comment->video : '' ?>" disabled="" required />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4">Datetime</label>
							<div class="col-md-6 col-sm-6">
								<input class="form-control" type="text" id="datetime" name="datetime" placeholder="Datetime" data-parsley-required="true" value="<?= $action == 'edit' ? $comment->created_at : '' ?>" disabled="" required />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4">Status Comment</label>
							<div class="col-md-6 col-sm-6">
								<select class="form-control" data-parsley-required="true" id="status" name="status">
									<option value="PUBLISH" <?= $action == 'edit' ? ($comment->status == 'PUBLISH' ? 'selected' : '') : ''?>>Published</option>
									<option value="UNPUBLISH" <?= $action == 'edit' ? ($comment->status == 'UNPUBLISH' ? 'selected' : '') : ''?>>Unpublish</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4"></label>
							<div class="col-md-6 col-sm-6">
								<a href="<?php echo base_url('adminapp/Content/Comments');?>" class="btn btn-default">Cancel</a>
								<button type="submit" class="btn btn-danger">Save</button>
							</div>
						</div>
						<input type="hidden" name="method" value="<?= $action ?>">
						<?php
							if ($action == 'edit') {
						?>
								<input type="hidden" name="id" value="<?= $comment->comment_id ?>">
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