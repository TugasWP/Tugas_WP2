<?php 

include 'conn.php';

if (isset($_POST['submit'])) {
 $bln = date($_POST['bulan']);

 if (!empty($bln)) {
  // perintah tampil data berdasarkan periode bulan
  $q = $conn-> query("SELECT b.kode_barang, b.nama_barang, m.qty_masuk, m.updated_at, k.qty_keluar, k.updated_at as update_keluar, o.nama_operator 
  FROM tbl_barang b 
  INNER JOIN tbl_operator o ON b.id_operator=o.id_operator 
  INNER JOIN tbl_barang_masuk m ON b.id_barang=m.id_barang 
  INNER JOIN tbl_barang_keluar k ON b.id_barang=k.id_barang 
  where MONTH(m.created_at) = '$bln'
  ORDER BY m.updated_at and k.updated_at desc");
 } else {
  // perintah tampil semua data
  $q = $conn->query("SELECT b.kode_barang, b.nama_barang, m.qty_masuk, m.updated_at, k.qty_keluar, k.updated_at as update_keluar, o.nama_operator 
  FROM tbl_barang b 
  INNER JOIN tbl_operator o ON b.id_operator=o.id_operator 
  INNER JOIN tbl_barang_masuk m ON b.id_barang=m.id_barang 
  INNER JOIN tbl_barang_keluar k ON b.id_barang=k.id_barang 
  ORDER BY m.updated_at and k.updated_at desc");
 }
} else {
 // perintah tampil semua data
 $q = $conn->query("SELECT b.kode_barang, b.nama_barang, m.qty_masuk, m.updated_at, k.qty_keluar, k.updated_at as update_keluar, o.nama_operator 
  FROM tbl_barang b 
  INNER JOIN tbl_operator o ON b.id_operator=o.id_operator 
  INNER JOIN tbl_barang_masuk m ON b.id_barang=m.id_barang 
  INNER JOIN tbl_barang_keluar k ON b.id_barang=k.id_barang 
  ORDER BY m.updated_at and k.updated_at desc");
}

// hitung jumlah baris data
$s = $q->num_rows;

?>

<!DOCTYPE html>
<html>
<head>
 <title>Tutorial PHP</title>

 <!-- Bootstrap -->
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<body>
 
 <div class="card">

  <div class="card ">
   <div class="card-body">
    <div class="row">
     <div class="col-md-4 pt-2">
      <span>Jumlah data: <b><?= $s ?></b></span>
     </div>
     <div class="col-md-8">
      <form method="POST" action="" class="form-inline">
       <label for="date1">Tampilkan transaksi bulan </label>
       <select class="form-control mr-2" name="bulan">
        <option value="">-</option>
        <option value="1">Januari</option>
        <option value="2">Februari</option>
        <option value="3">Maret</option>
        <option value="4">April</option>
        <option value="5">Mei</option>
        <option value="6">Juni</option>
        <option value="7">Juli</option>
        <option value="8">Agustus</option>
        <option value="9">September</option>
        <option value="10">Oktober</option>
        <option value="11">November</option>
        <option value="12">Desember</option>
       </select>
       <button type="submit" name="submit" class="btn btn-primary">Tampilkan</button>
      </form>
     </div>
    </div>

    <div class="card-body">
        <table id="example1" class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Barang</th>
                    <th>Tgl. Masuk</th>
                    <th>QTY. Masuk</th>
                    <th>Tgl. Keluar</th>
                    <th>QTY. Keluar</th>
                    <th>Operator</th>
                </tr>
            </thead>
            <tbody>
                <?php

                    $no=1;
                    while($value = $q->fetch_object()){
                        ?>
                            <tr>
                                <td><?=$no;?></td>
                                <td><?=$value->kode_barang;?>-<?=$value->nama_barang;?></td>
                                <td><?=$value->updated_at;?></td>
                                <td><?=$value->qty_masuk;?></td>
                                <td><?=$value->update_keluar;?></td>
                                <td><?=$value->qty_keluar;?></td>
                                <td><?=$value->nama_operator;?></td>
                            </tr>
                        <?php
                        $no++;
                    }

                ?>
                
                
            </tbody>
            
        </table>
    </div>

   </div>
  </div>
 </div>

</body>
</html>