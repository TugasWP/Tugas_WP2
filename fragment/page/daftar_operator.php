<?php 
include("conn.php");

$data = $conn->query("SELECT * FROM tbl_operator WHERE deleted_at IS NULL " );

// print_r($data);
?>

<div class="card">
    <div class="card-header">
        <h3 class="card-title">Daftar operator</h3>
    </div>

    <div class="card-body">
        <table id="example1" class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Nama Operator</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                <?php
                    $no=1;
                    while($value = $data->fetch_array()){
                        ?>
                            <tr>
                                <td><?=$no;?></td>
                                <td><?=$value['nama_operator'];?></td>
                                <td><?=$value['username'];?></td>
                                <td><?=$value['email'];?></td>
                                <td>
                                    <a href="index.php?hal=hapus_operator&id=<?=$value['id_operator'];?>" class="btn btn-sm btn-danger"><i class="far fa-trash-alt"></i> Hapus</a>
                                </td>
                            </tr>
                        <?php
                        $no++;
                    }

                ?>
                
                
            </tbody>
            <tfoot>
                <tr>
                    <th>#</th>
                    <th>Nama Operator</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Aksi</th>
                </tr>
            </tfoot>
        </table>
    </div>

</div>