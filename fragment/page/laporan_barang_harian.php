<?php 
include("conn.php");

$data = $conn->query("SELECT b.kode_barang, b.nama_barang, m.qty_masuk, m.updated_at, k.qty_keluar, k.updated_at as update_keluar, o.nama_operator 
FROM tbl_barang b 
INNER JOIN tbl_operator o ON b.id_operator=o.id_operator 
INNER JOIN tbl_barang_masuk m ON b.id_barang=m.id_barang 
INNER JOIN tbl_barang_keluar k ON b.id_barang=k.id_barang 
ORDER BY m.updated_at and k.updated_at desc");

// print_r($data);
?>

<div class="card">
    <div class="card-header">
    </div>

    <div class="col">
        <form method="POST" class="form-inline">
            <input type="date" name="tgl_mulai" class="form-control">
            <input type="date" name="tgl_selesai" class="form-control  ml-3">
            <button type="submit" name="filter_tgl" class="btn btn-info  ml-3"> Filter </button>
        </form>
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

                if(isset($_POST['filter_tgl'])){

                    $mulai = $_POST['tgl_mulai'];
                    $selesai = $_POST['tgl_selesai'];

                    if($mulai!= null || $selesai!=null){
                        $data = $conn->query("SELECT b.kode_barang, b.nama_barang, m.qty_masuk, m.updated_at, k.qty_keluar, k.updated_at as update_keluar, o.nama_operator FROM tbl_barang b INNER JOIN tbl_operator o ON b.id_operator=o.id_operator INNER JOIN tbl_barang_masuk m ON b.id_barang=m.id_barang INNER JOIN tbl_barang_keluar k ON b.id_barang=k.id_barang AND m.updated_at BETWEEN '$mulai' AND DATE_ADD('$selesai', INTERVAL 1 DAY) AND k.updated_at BETWEEN '$mulai' AND DATE_ADD('$selesai', INTERVAL 1 DAY) order by m.updated_at and k.updated_at ");
                    } else {
                        $data = $conn->query("SELECT b.kode_barang, b.nama_barang, m.qty_masuk, m.updated_at, k.qty_keluar, k.updated_at as update_keluar, o.nama_operator FROM tbl_barang b INNER JOIN tbl_operator o ON b.id_operator=o.id_operator INNER JOIN tbl_barang_masuk m ON b.id_barang=m.id_barang INNER JOIN tbl_barang_keluar k ON b.id_barang=k.id_barang ");
                    }

                } else {
                    $data = $conn->query("SELECT b.kode_barang, b.nama_barang, m.qty_masuk, m.updated_at, k.qty_keluar, k.updated_at as update_keluar, o.nama_operator FROM tbl_barang b INNER JOIN tbl_operator o ON b.id_operator=o.id_operator INNER JOIN tbl_barang_masuk m ON b.id_barang=m.id_barang INNER JOIN tbl_barang_keluar k ON b.id_barang=k.id_barang ");
                }

                    $no=1;
                    while($value = $data->fetch_object()){
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