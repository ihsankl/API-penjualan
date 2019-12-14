const Express = require('express');
const app = Express();
const bodyParser = require('body-parser');
const port = 3001;
const cors = require('cors');

const mysql = require('mysql');
const db = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'penjualan'
});

app.use(bodyParser());
app.use(cors());

// BARANG

app.get('/barang', async (req, res) => {
    const resData = await db.query(`SELECT * FROM barang`, function (err, rows, fields) {
        console.log(err)
        res.json(rows);
    });
});

app.get('/barang/:id', async (req, res) => {

    const resData = await db.query(`SELECT * FROM barang where barang.id_barang = ${req.params.id}`, function (err, rows, fields) {
        console.log(err)
        res.json(rows);
    });
});

app.post('/barang', async (req, res) => {
    const { kode_barang, nama_barang, kategori, harga_pokok, harga_jual } = req.body;

    const resData = await db.query(`INSERT INTO barang( kode_barang, nama_barang, kategori, harga_pokok, harga_jual, sisa_stok) VALUES('${kode_barang}', '${nama_barang}', '${kategori}', '${harga_pokok}', '${harga_jual}', '0')`, function (err, rows, fields) {
        console.log(err)
        res.json(rows);
    });
});

app.put('/hapusbarang/:id', async (req, res) => {
    const resData = await db.query(`UPDATE barang SET sisa_stok = '0' WHERE id_barang =${req.params.id}`, function (err, rows, fields) {
        res.json(rows);
    });
});

app.put('/barang/:id', async (req, res) => {
    const { kode_barang, nama_barang, kategori, harga_pokok, harga_jual } = req.body;

    const resData = await db.query(`UPDATE barang SET kode_barang = '${kode_barang}', nama_barang = '${nama_barang}', kategori = '${kategori}', harga_pokok = '${harga_pokok}', harga_jual = '${harga_jual}' WHERE id_barang = ${req.params.id}`, function (err, rows, fields) {
        console.log(err)
        res.json(rows);
    });
});

app.put('/ubahbarang/:id', async (req, res) => {
    const { sisa_stok } = req.body;

    const resData = await db.query(`UPDATE barang SET sisa_stok = '${sisa_stok}' WHERE id_barang = ${req.params.id}`, function (err, rows, fields) {
        console.log(err)
        res.json(rows);
    });
});

app.put('/ubahstok/:id', async (req, res) => {
    const { qty_beli } = req.body;

    const resData = await db.query(`UPDATE barang SET sisa_stok = (sisa_stok - '${qty_beli}') WHERE id_barang = ${req.params.id}`, function (err, rows, fields) {
        console.log(err)
        res.json(rows);
    });
});

app.delete('/barang/:id', async (req, res) => {
    const resData = await db.query(`DELETE FROM barang WHERE id_barang =${req.params.id}`, function (err, rows, fields) {
        res.json(rows);
    });
});

app.get('/kodebarang/:id', async (req, res) => {

    const resData = await db.query(`SELECT * FROM barang WHERE kode_barang = '${req.params.id}'`, function (err, rows, fields) {
        console.log(err)
        res.json(rows);
    });
});

app.get('/namabarang/:id', async (req, res) => {

    const resData = await db.query(`SELECT * FROM barang where nama_barang LIKE '%${req.params.id}%'`, function (err, rows, fields) {
        console.log(err)
        res.json(rows);
    });
});

// END BARANG

// SUPPLY

app.get('/pembelian', async (req, res) => {
    const resData = await db.query(`select pembelian.*, supplier.*, barang.id_barang, barang.sisa_stok, barang.nama_barang from pembelian inner join supplier on pembelian.id_supplier = supplier.id_supplier inner join barang on pembelian.id_barang = barang.id_barang`, function (err, rows, fields) {
        console.log(err)
        res.json(rows);
    });
});

app.get('/pembelian/barang/:id', async (req, res) => {
    const { id_barang } = req.body

    const resData = await db.query(`select * from pembelian where id_barang ='${id_barang}' `, function (err, rows, fields) {
        console.log(err)
        res.json(rows);
    });
});

app.post('/pembelian', async (req, res) => {
    const { id_supplier, id_barang, tgl_pembelian, tgl_exp, qty_beli, total_pembelian } = req.body;

    const resData = await db.query(`INSERT INTO pembelian( id_supplier, id_barang, tgl_pembelian, tgl_exp, qty_beli, total_pembelian) VALUES('${id_supplier}', '${id_barang}', '${tgl_pembelian}', '${tgl_exp}', '${qty_beli}', '${total_pembelian}')`, function (err, rows, fields) {
        console.log(err)
        res.json(rows);
    });
});

app.put('/pembelian/:id', async (req, res) => {
    const { id_supplier, id_barang, tgl_pembelian, tgl_exp, qty_beli, total_pembelian } = req.body;

    const resData = await db.query(`UPDATE pembelian SET id_supplier = '${id_supplier}', id_barang = '${id_barang}', tgl_pembelian = '${tgl_pembelian}', tgl_exp = '${tgl_exp}', qty_beli = '${qty_beli}', total_pembelian = '${total_pembelian}' WHERE id_pembelian = ${req.params.id}`, function (err, rows, fields) {
        console.log(err)
        res.json(rows);
    });
});

app.delete('/pembelian/:id', async (req, res) => {
    const resData = await db.query(`DELETE FROM pembelian WHERE id_pembelian =${req.params.id}`, function (err, rows, fields) {
        console.log(err)
        res.json(rows);
    });
});

// END SUPPLY

// SUPPLIER

app.get('/supplier', async (req, res) => {
    const resData = await db.query(`select * from supplier`, function (err, rows, fields) {
        console.log(err)
        res.json(rows);
    });
});

app.post('/supplier', async (req, res) => {
    const { nama_supplier } = req.body;

    const resData = await db.query(`INSERT INTO supplier( nama_supplier) VALUES('${nama_supplier}')`, function (err, rows, fields) {
        console.log(err)
        res.json(rows);
    });
});

app.put('/supplier/:id', async (req, res) => {
    const { nama_supplier } = req.body;

    const resData = await db.query(`UPDATE supplier SET nama_supplier = '${nama_supplier}' WHERE id_supplier = ${req.params.id}`, function (err, rows, fields) {
        console.log(err)
        res.json(rows);
    });
});

app.delete('/supplier/:id', async (req, res) => {
    const resData = await db.query(`DELETE FROM supplier WHERE id_supplier =${req.params.id}`, function (err, rows, fields) {
        console.log(err)
        res.json(rows);
    });
});

// END SUPPLIER

// PENJUALAN

app.post('/penjualan', async (req, res) => {
    const { id_barang, tgl_penjualan, qty_beli, total_pembelian } = req.body;

    const resData = await db.query(`INSERT INTO penjualan( id_barang, tgl_penjualan, qty_beli, total_pembelian) VALUES('${id_barang}', '${tgl_penjualan}', '${qty_beli}', '${total_pembelian}')`, function (err, rows, fields) {
        console.log(err)
        res.json(rows);
    });
});

app.get('/penjualan/:tanggal', async (req, res) => {
    const resData = await db.query(`SELECT penjualan.*, barang.* FROM penjualan inner join barang on penjualan.id_barang = barang.id_barang WHERE tgl_penjualan='${req.params.tanggal}'`, function (err, rows, fields) {
        console.log(err)
        res.json(rows);
    });
});

app.get('/editpenjualan/:id', async (req, res) => {
    const resData = await db.query(`SELECT * from penjualan WHERE id_penjualan='${req.params.id}'`, function (err, rows, fields) {
        console.log(err)
        res.json(rows);
    });
});

app.delete('/penjualan/:id', async (req, res) => {
    const resData = await db.query(`DELETE FROM penjualan WHERE id_penjualan='${req.params.id}'`, function (err, rows, fields) {
        console.log(err)
        res.json(rows);
    });
});

app.get('/total_harian/:tanggal', async (req, res) => {
    const resData = await db.query(`SELECT SUM(total_pembelian) as hasil FROM penjualan WHERE tgl_penjualan = '${req.params.tanggal}'`, function (err, rows, fields) {
        console.log(err)
        res.json(rows);
    });
});

app.get('/penjualan/', async (req, res) => {
    const resData = await db.query(`SELECT penjualan.*, barang.* FROM penjualan inner join barang on penjualan.id_barang = barang.id_barang`, function (err, rows, fields) {
        console.log(err)
        res.json(rows);
    });
});

// END PENJUALAN


app.listen(port, () => console.log(port));
