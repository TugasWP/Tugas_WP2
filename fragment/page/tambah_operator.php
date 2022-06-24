<?php

if(isset($_POST['simpan'])){
    include("./conn.php");
    date_default_timezone_set("Asia/Jakarta");
    
    $nama_operator = $_POST['nama_operator'];
    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = $_POST['password'];

    $tgl = date('Y-m-d H:i:s', time());
    // insert into table barang 
    $query = "INSERT into tbl_operator (nama_operator, username, email, password, created_at, updated_at) values ('$nama_operator', '$username', '$email', '$password','$tgl','$tgl')";

    $insert = $conn->query($query);

    if($insert){
        ?>
        <script>
            alert("Berhasil menambahkan data");
            window.location="index.php?hal=daftar_operator";
        </script>
        <?php
    }
}
?>


<div class="col-md-6">

    <div class="card card-primary">
        <div class="card-header">
            <h3 class="card-title">Tambah operator</h3>
        </div>

        <form method="post" action="">
            <div class="card-body">
                <div class="form-group">
                    <label for="exampleInputEmail1">Nama Operator</label>
                    <input type="text" class="form-control" name="nama_operator" placeholder="Nama">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Username</label>
                    <input type="text" class="form-control" name="username" placeholder="Username">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Email</label>
                    <input type="text" class="form-control" name="email" placeholder="Email">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">password</label>
                    <input type="password" class="form-control" name="password" placeholder="Password">
                </div>
            </div>

            <div class="card-footer">
                <button type="submit" name="simpan" class="btn btn-primary">Simpan</button>
            </div>
        </form>
    </div>
</div>