const Express = require('express');
const app = Express();
const bodyParser = require('body-parser');
const port = process.env.PORT;
const cors = require('cors');

const mysql = require('mysql');
const db = mysql.createPool({
    host: 'remotemysql.com',
    user: 'r5l5PHuuuZ',
    password: 'WZ6xkMRI5J',
    database: 'r5l5PHuuuZ'
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

    const resData = await db.query(`INSERT INTO barang( kode_barang, nama_barang, kategori, harga_pokok, harga_jual) VALUES('${kode_barang}', '${nama_barang}', '${kategori}', '${harga_pokok}','${harga_jual}')`, function (err, rows, fields) {
        console.log(err)
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

app.delete('/barang/:id', async (req, res) => {
    const resData = await db.query(`DELETE FROM barang WHERE id_barang =${req.params.id}`, function (err, rows, fields) {
        res.json(rows);
    });
});

// END BARANG

// SUPPLY

app.get('/pembelian', async (req, res) => {
    const resData = await db.query(`select * from pembelian`, function (err, rows, fields) {
        console.log(err)
        res.json(rows);
    });
});

// END SUPPLY


app.listen(port, () => console.log(port));
