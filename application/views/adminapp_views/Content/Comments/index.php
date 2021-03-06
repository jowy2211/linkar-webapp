<!-- begin #content -->
<div id="content" class="content">
    <!-- begin breadcrumb -->
    <ol class="breadcrumb pull-right">
        <li><a href="<?php echo base_url();?>">Home</a></li>
        <li><a href="#">Content</a></li>
        <li class="active">Management Comments</li>
    </ol>
    <!-- end breadcrumb -->
    <!-- begin page-header -->
    <h1 class="page-header">Management Comments</h1>
    <!-- end page-header -->
    <div class="row">
        <div class="col-md-12">
            <?= $this->session->flashdata("message"); ?>
        </div>
    </div>
    <!-- begin row -->
    <div class="row">
        <!-- begin col-12 -->
        <div class="col-md-12">
            <!-- begin panel -->
            <div class="panel panel-inverse">
                <div class="panel-heading">
                    <div class="panel-heading-btn">
                        <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                    </div>
                    <h4 class="panel-title">Data</h4>
                </div>
                <div class="panel-body">
                    <table id="data-table" class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Text</th>
                                <th>User</th>
                                <th>Video</th>
                                <th>Publish at</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                                if (count($list)) {
                                    $no = 1;
                                    foreach ($list as $value) {
                            ?>
                                    	<tr class="odd gradeX" id="<?php echo $no;?>">
            	                            <td><?= $no++;?></td>
                                            <td><?= $value->text ?></td>
                                            <td><?= $value->user ?></td>
                                            <td><?= $value->video ?></td>
                                            <td><?= $value->created_at ?></td>
                                            <td><?= $value->status ?></td>
            	                            <td>
            	                            	<a class="btn btn-white btn-xs m-r-5 btn-view" href="<?= base_url('adminapp/Content/Comments/Form?id='.$value->comment_id) ?>">
            	                            		<i class="fa fa-search"></i> Edit
            	                            	</a>
            	                            </td>
            	                        </tr>
                            <?php
                                    }
                                } else {
                            ?>
                                <tr class="odd gradeX" id="1">
                                    <td colspan="10" class="text-center">No Data</td>
                                </tr>
                            <?php 
                                } 
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- end panel -->
        </div>
        <!-- end col-12 -->
    </div>
    <!-- end row -->
</div>
<!-- end #content -->
