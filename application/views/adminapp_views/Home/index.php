<!-- begin #content -->
<div id="content" class="content">
<!-- begin breadcrumb -->
<ol class="breadcrumb pull-right">
	<li><a href="javascript:;">Home</a></li>
	<li><a href="javascript:;">Tables</a></li>
	<li class="active">Managed Tables</li>
</ol>
<!-- end breadcrumb -->
<!-- begin page-header -->
<h1 class="page-header">Managed Tables <small>header small text goes here...</small></h1>
<!-- end page-header -->

<!-- begin row -->
<div class="row">
	<div class="col-md-12">
		<div class="alert alert-success fade in m-b-15">
			<strong>Success!</strong>
			Vivamus vestibulum posuere est eu tincidunt.
			<span class="close" data-dismiss="alert">&times;</span>
		</div>
		<div class="alert alert-info fade in m-b-15">
			<strong>Info!</strong>
			Morbi sed nibh ac tortor laoreet blandit sed eu ligula.
			<span class="close" data-dismiss="alert">&times;</span>
		</div>
        <div class="alert alert-warning fade in m-b-15">
			<strong>Warning!</strong>
			Lorem ipsum dolor sit amet, consectetur adipiscing elit.
			<span class="close" data-dismiss="alert">&times;</span>
		</div>
		<div class="alert alert-danger fade in m-b-15">
			<strong>Error!</strong>
			Morbi vitae arcu in neque luctus elementum.
			<span class="close" data-dismiss="alert">&times;</span>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12 pull-right">
        <p class="m-b-20">
            <a href="<?php echo base_url('adminapp/Home/Form')?>" class="btn btn-inverse btn-sm">
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
                <h4 class="panel-title">Data Table - Default</h4>
            </div>
            <div class="panel-body">
                <table id="data-table" class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Browser</th>
                            <th>Platform(s)</th>
                            <th>Engine version</th>
                            <th>CSS grade</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php for ($i=0; $i < 5; $i++) { ?>
                        	<tr class="odd gradeX" id="<?php echo $i;?>">
	                            <td><?php echo $i+1;?></td>
	                            <td>Internet Explorer 4.0</td>
	                            <td>Win 95+</td>
	                            <td>4</td>
	                            <td>X</td>
	                            <td>
	                            	<a class="btn btn-white btn-xs m-r-5 btn-view" href="<?php echo base_url('adminapp/Home/Form');?>">
	                            		<i class="fa fa-search"></i> Edit
	                            	</a>
	                            	<a class="btn btn-white btn-xs m-r-5 btn-delete" href="#">
	                            		<i class="fa fa-trash"></i> Delete
	                            	</a>
	                            </td>
	                        </tr>
                        <?php } ?>
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
