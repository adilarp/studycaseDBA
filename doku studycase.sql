CREATE DATABASE db_bunga;

insert into tb_bunga (id_bunga, nama_bunga, keterangan)
values ('1','melati','bunga putih kecil harum');

insert into tb_bunga (id_bunga, nama_bunga, keterangan)
values ('2','mawar','Bunga dengan batang berduri');

insert into tb_bunga (id_bunga, nama_bunga, keterangan)
values ('3','tulip','Bunga warnawarni dari belanda');

insert into tb_bunga (id_bunga, nama_bunga, keterangan)
values ('4','angrek','-');

insert into tb_satuan (id_satuan, nama_satuan, desc_satuan)
values ('1','kg','Perhitungan berdasarkan berat');

insert into tb_satuan (id_satuan, nama_satuan, desc_satuan)
values ('2','batang','Perhitungan berdasarkan batang yang mempunyai bunga');

insert into tb_satuan (id_satuan, nama_satuan, desc_satuan)
values ('3','pot','Perhitungan berdasarkan 1 wadah');

insert into tb_harga (id_harga, id_bunga, id_satuan, harga_beli, harga_jual)
values ('1','1','1','25000.00','30000.00');

insert into tb_harga (id_harga, id_bunga, id_satuan, harga_beli, harga_jual)
values ('2','2','1','100000.00','150000.00');

insert into tb_harga (id_harga, id_bunga, id_satuan, harga_beli, harga_jual)
values ('3','2','2','10000.00','15000.00');
 
insert into tb_harga (id_harga, id_bunga, id_satuan, harga_beli, harga_jual)
values ('4','3','2','300000.00','350000.00');

insert into tb_harga (id_harga, id_bunga, id_satuan, harga_beli, harga_jual)
values ('5','4','3','250000.00','300000.00'); 

select tb_harga.id_harga, tb_bunga.nama_bunga, tb_satuan.nama_satuan, tb_harga.harga_jual as harga
from tb_harga
inner join tb_bunga on tb_harga.id_bunga = tb_bunga.id_bunga
inner join tb_satuan on tb_harga.id_satuan = tb_satuan.id_satuan;


