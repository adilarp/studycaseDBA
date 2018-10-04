CREATE DATABASE db_bunga;

/* table bunga*/
CREATE TABLE `db_bunga`.`tb_stok` (
id_bunga INT PRIMARY KEY, nama_bunga varchar(20), keterangan varchar(100), 
);
insert into tb_bunga (id_bunga, nama_bunga, keterangan)
values ('1','melati','bunga putih kecil harum');

insert into tb_bunga (id_bunga, nama_bunga, keterangan)
values ('2','mawar','Bunga dengan batang berduri');

insert into tb_bunga (id_bunga, nama_bunga, keterangan)
values ('3','tulip','Bunga warnawarni dari belanda');

insert into tb_bunga (id_bunga, nama_bunga, keterangan)
values ('4','angrek','-');

/* table satuan */
CREATE TABLE `db_bunga`.`tb_satuan` (
id_satuan INT PRIMARY KEY, nama_satuan varchar(20), desc_satuan varchar(100) 
);
insert into tb_satuan (id_satuan, nama_satuan, desc_satuan)
values ('1','kg','Perhitungan berdasarkan berat');

insert into tb_satuan (id_satuan, nama_satuan, desc_satuan)
values ('2','batang','Perhitungan berdasarkan batang yang mempunyai bunga');

insert into tb_satuan (id_satuan, nama_satuan, desc_satuan)
values ('3','pot','Perhitungan berdasarkan 1 wadah');

/* table harga */
CREATE TABLE `db_bunga`.`tb_harga` (
id_harga INT PRIMARY KEY, id_bunga int, id_satuan int, 
harga_beli int, harga_jual int
);
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

/* table stock */
CREATE TABLE `db_bunga`.`tb_stok` (
id_stok INT NOT NULL PRIMARY KEY, id_bunga int, id_satuan int, 
stock int);

insert into tb_stok (id_stok, id_bunga, id_satuan, stock)
values ('1','4','3','10');

insert into tb_stok (id_stok, id_bunga, id_satuan, stock)
values ('2','2','1','5');

insert into tb_stok (id_stok, id_bunga, id_satuan, stock)
values ('3','3','2','20');

insert into tb_stok (id_stok, id_bunga, id_satuan, stock)
values ('4','2','2','50');

insert into tb_stok (id_stok, id_bunga, id_satuan, stock)
values ('5','1','1','50');

/* table keranjang */
CREATE TABLE `db_bunga`.`tb_keranjang` (id_keranjang INT NOT NULL PRIMARY KEY, 
trx_id int, id_bunga int, id_satuan int, jumlah int, amount int
);

insert into tb_keranjang (id_keranjang, trx_id, id_bunga, id_satuan, jumlah, amount)
values ('1','1','2','2','10','150000');

insert into tb_keranjang (id_keranjang, trx_id, id_bunga, id_satuan, jumlah, amount)
values ('2','2','1','1','2','60000');

insert into tb_keranjang (id_keranjang, trx_id, id_bunga, id_satuan, jumlah, amount)
values ('3','2','2','2','5','75000');

insert into tb_keranjang (id_keranjang, trx_id, id_bunga, id_satuan, jumlah, amount)
values ('4','3','4','3','2','60000');

insert into tb_keranjang (id_keranjang, trx_id, id_bunga, id_satuan, jumlah, amount)
values ('5','4','2','1','1','150000');

insert into tb_keranjang (id_keranjang, trx_id, id_bunga, id_satuan, jumlah, amount)
values ('6','4','4','3','1','300000');

insert into tb_keranjang (id_keranjang, trx_id, id_bunga, id_satuan, jumlah, amount)
values ('7','5','1','1','5','150000');

/* table transaction */
CREATE TABLE `db_bunga`.`tb_transaksi` (trx_id int primary key not null,
tanggal_order datetime, `status` varchar (10), total_amount int 
);

insert into tb_transaksi (trx_id, tanggal_order, status, total_amount)
values ('1','2018-09-29 10:31:01','sukses','150000');

insert into tb_transaksi (trx_id, tanggal_order, status, total_amount)
values ('2','2018-09-29 15:28:05','sukses','135000');

insert into tb_transaksi (trx_id, tanggal_order, status, total_amount)
values ('3','2018-09-30 07:15:25','proses','600000');

insert into tb_transaksi (trx_id, tanggal_order, status, total_amount)
values ('4','2018-09-30 12:30:45','sukses','450000');

insert into tb_transaksi (trx_id, tanggal_order, status, total_amount)
values ('5','2018-09-30 14:23:23','sukses','150000');

/* pricelist kebutuhan toko */
select tb_harga.id_harga, tb_bunga.nama_bunga, tb_satuan.nama_satuan, tb_harga.harga_jual as harga
from tb_harga
inner join tb_bunga on tb_harga.id_bunga = tb_bunga.id_bunga
inner join tb_satuan on tb_harga.id_satuan = tb_satuan.id_satuan;

/* laporan tiap hari toko per bunga dengan status sukses*/
select  tb_transaksi.trx_id, tb_transaksi.tanggal_order, tb_bunga.nama_bunga as nama, tb_transaksi.status, 
tb_transaksi.total_amount
from tb_transaksi, tb_bunga
join tb_keranjang on tb_keranjang.id_bunga = tb_bunga.id_bunga
where status = 'sukses';

SELECT tb_keranjang.id_keranjang, tb_bunga.nama_bunga, tb_bunga.keterangan, tb_transaksi.tanggal_order From tb_bunga, tb_keranjang, tb_transaksi 
WHERE NOT EXISTS
(SELECT * FROM tb_keranjang WHERE tb_bunga.id_bunga = tb_keranjang.id_bunga) and tb_transaksi.trx_id = tb_keranjang.trx_id 
order by tb_transaksi.tanggal_order);



