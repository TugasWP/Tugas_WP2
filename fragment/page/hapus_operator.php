<?php
include("./conn.php");
date_default_timezone_set("Asia/Jakarta");

if(isset($_GET['id'])){
    $id = $_GET['id'];

    $tgl = date('Y-m-d H:i:s', time());

    $query = "DELETE FROM tbl_operator WHERE id_operator='$id'";

    $delete = $conn->query($query);

    if($delete){
        ?>
        <script>
            alert("Berhasil menghapus data");
            window.location="index.php?hal=daftar_operator";
        </script>
        <?php
    }
}
?>