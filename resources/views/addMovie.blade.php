<?php
$name = "'".$_GET['name']."'";
$year = "'".$_GET['year']."'";
$genre = "'".$_GET['genre']."'";
$insert = DB::insert("insert into movies (name, year, genre) values ($name, $year, $genre)");
$results = DB::select("select * from movies");
?>
<script>
window.location.replace("/movies");
</script>