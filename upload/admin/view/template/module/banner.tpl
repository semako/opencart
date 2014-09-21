<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-banner" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-primary">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-banner">
          <table id="module" class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <td class="text-left"><?php echo $entry_banner; ?></td>
                <td class="text-left required"><?php echo $entry_dimension; ?></td>
                <td></td>
              </tr>
            </thead>
            <tbody>
              <?php $module_row = 0; ?>
              <?php foreach ($modules as $module) { ?>
              <tr id="module-row<?php echo $module_row; ?>">
                <td class="text-left"><select name="banner_module[<?php echo $module_row; ?>][banner_id]" class="form-control">
                    <?php foreach ($banners as $banner) { ?>
                    <?php if ($banner['banner_id'] == $module['banner_id']) { ?>
                    <option value="<?php echo $banner['banner_id']; ?>" selected="selected"><?php echo $banner['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $banner['banner_id']; ?>"><?php echo $banner['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select></td>
                <td class="text-left"><input type="text" name="banner_module[<?php echo $module_row; ?>][width]" value="<?php echo $module['width']; ?>" placeholder="<?php echo $entry_width; ?>" class="form-control" />
                  <input type="text" name="banner_module[<?php echo $module_row; ?>][height]" value="<?php echo $module['height']; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                  <?php if (isset($error_dimension[$module_row])) { ?>
                  <div class="text-danger"><?php echo $error_dimension[$module_row]; ?></div>
                  <?php } ?></td>
                <td class="text-left"><button type="button" onclick="$('#module-row<?php echo $module_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
              </tr>
              <?php $module_row++; ?>
              <?php } ?>
            </tbody>
            <tfoot>
              <tr>
                <td colspan="2"></td>
                <td class="text-left"><button type="button" onclick="addModule();" data-toggle="tooltip" title="<?php echo $button_module_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
              </tr>
            </tfoot>
          </table>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {	
	html  = '<tr id="module-row' + module_row + '">';
	html += '  <td class="text-left"><select name="banner_module[' + module_row + '][banner_id]" class="form-control">';
	<?php foreach ($banners as $banner) { ?>
	html += '    <option value="<?php echo $banner['banner_id']; ?>"><?php echo addslashes($banner['name']); ?></option>';
	<?php } ?>
	html += '  </select></td>';
	html += '  <td class="text-left"><input type="text" name="banner_module[' + module_row + '][width]" value="" placeholder="<?php echo $entry_width; ?>" class="form-control" /> <input type="text" name="banner_module[' + module_row + '][height]" value="" placeholder="<?php echo $entry_height; ?>" class="form-control" /></td>'; 
	html += '  <td class="text-left"><button type="button" onclick="$(\'#module-row' + module_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';
	
	$('#module tbody').append(html);
	
	module_row++;
}
//--></script></div>
<?php echo $footer; ?>