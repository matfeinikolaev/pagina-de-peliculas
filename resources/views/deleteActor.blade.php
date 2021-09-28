<?php
$id = $_GET['id'];
$delete = DB::delete("delete from actors where id = $id");
$redirect = $_GET['redirect'];
?>
<script>
window.location.replace("<?php echo $redirect?>");
</script>