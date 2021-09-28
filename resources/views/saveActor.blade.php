<?php
$name = "'".$_GET['name']."'";
$birthdate = "'".$_GET['birthdate']."'";
$sex = "'".$_GET['sex']."'";
if (array_key_exists("movie", $_GET)) {
    $movie = "'".$_GET['movie']."'";
    $insert = DB::insert("insert into actors (name, birthdate, sex, movie) values ($name, $birthdate, $sex, $movie)");
} else {
    
    $insert = DB::insert("insert into actors (name, birthdate, sex) values ($name, $birthdate, $sex)");
}
$results = DB::select("select * from actors");
?>
<script>
window.location.replace("/actors");
</script>