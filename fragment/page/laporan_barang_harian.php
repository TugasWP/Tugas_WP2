<?php 
include("conn.php");

$data = $conn->query("SELECT b.kode_barang, b.nama_barang, m.qty_masuk, m.updated_at, k.qty_keluar, k.updated_at as update_keluar, o.nama_operator
FROM tbl_barang b 
INNER JOIN tbl_operator o ON b.id_operator=o.id_operator
INNER JOIN tbl_barang_masuk m ON b.id_barang=m.id_barang
INNER JOIN tbl_barang_keluar k ON b.id_barang=k.id_barang_keluar");

// print_r($data);
?>

<div class="card">
    <div class="card-header">
        <h3 class="card-title">Daftar Barang Harian</h3>
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
            <tfoot>
                <tr>
                <tr>
                    <th>#</th>
                    <th>Barang</th>
                    <th>Tgl. Masuk</th>
                    <th>QTY. Masuk</th>
                    <th>Tgl. Keluar</th>
                    <th>QTY. Keluar</th>
                    <th>Operator</th>
                </tr>
                </tr>
            </tfoot>
        </table>
    </div>

</div>