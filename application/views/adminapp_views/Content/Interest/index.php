<!-- begin #content -->
<div id="content" class="content">
    <!-- begin breadcrumb -->
    <ol class="breadcrumb pull-right">
        <li><a href="<?php echo base_url();?>">Home</a></li>
        <li><a href="#">Content</a></li>
        <li class="active">Management Interests</li>
    </ol>
    <!-- end breadcrumb -->
    <!-- begin page-header -->
    <h1 class="page-header">Interest</h1>
    <!-- end page-header -->
    <div class="row">
        <div class="col-md-12">
            <?= $this->session->flashdata("message"); ?>
        </div>
    </div>
    <!-- begin row -->
    <div class="row">
    	<div class="col-md-12 pull-right">
            <p class="m-b-20">
                <a href="<?php echo base_url('adminapp/Content/Interest/Form')?>" class="btn btn-inverse btn-sm">
                	<i class="fa fa-plus"></i> Add New Data
               	</a>
            </p>
        </div>
    </div>
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
                                <th>Ineters</th>
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
            	                            <td><?= $value->name ?></td>
            	                            <td>
            	                            	<a class="btn btn-white btn-xs m-r-5 btn-view" href="<?= base_url('adminapp/Content/Interest/Form?id='.$value->id) ?>">
            	                            		<i class="fa fa-search"></i> Edit
            	                            	</a>
            	                            	<a class="btn btn-white btn-xs m-r-5 btn-delete" href="<?= base_url('adminapp/Content/Interest/Remove?id='.$value->id) ?>">
            	                            		<i class="fa fa-trash"></i> Delete
            	                            	</a>
            	                            </td>
            	                        </tr>
                            <?php
                                    }
                                } else {
                            ?>
                                <tr class="odd gradeX" id="1">
                                    <td colspan="3" class="text-center">No Data</td>
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
