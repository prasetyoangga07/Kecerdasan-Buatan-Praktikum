import random
import datetime

# Daftar produk yang tersedia
daftar_produk = {
    "A": {"nama": "Tepung", "harga": 10000},
    "B": {"nama": "Garam", "harga": 8000},
    "C": {"nama": "Minuman Soda", "harga": 12000},
    "D": {"nama": "Keju", "harga": 30000}
}

keranjang_belanja = []

def tampilkan_produk():
    print("\nDaftar Produk:")
    for kode, produk in daftar_produk.items():
        print(f"{kode}. {produk['nama']} - Rp{produk['harga']}")

def tambah_ke_keranjang():
    kode = input("Masukkan kode produk yang ingin dibeli: ")
    if kode in daftar_produk:
        jumlah = int(input(f"Masukkan jumlah {daftar_produk[kode]['nama']}: "))
        keranjang_belanja.append({"nama": daftar_produk[kode]["nama"], "harga": daftar_produk[kode]["harga"], "jumlah": jumlah})
        print(f"{daftar_produk[kode]['nama']} berhasil ditambahkan ke keranjang.")
    else:
        print("Kode produk tidak ditemukan!")

def tampilkan_keranjang():
    if not keranjang_belanja:
        print("Keranjang belanja masih kosong.")
    else:
        print("\nIsi Keranjang Belanja:")
        total_belanja = 0
        for produk in keranjang_belanja:
            subtotal = produk['harga'] * produk['jumlah']
            total_belanja += subtotal
            print(f"{produk['nama']} - {produk['jumlah']} x Rp{produk['harga']} = Rp{subtotal}")
        print(f"Total Belanja: Rp{total_belanja}")

def proses_pembayaran():
    if not keranjang_belanja:
        print("Tidak ada produk di keranjang untuk dibayar.")
        return
    
    tampilkan_keranjang()
    uang_masuk = int(input("Masukkan jumlah uang: "))
    total_belanja = sum(produk['harga'] * produk['jumlah'] for produk in keranjang_belanja)
    if uang_masuk >= total_belanja:
        kembalian = uang_masuk - total_belanja
        print(f"Pembayaran berhasil! Kembalian Anda: Rp{kembalian}")
        transaksi_id = random.randint(1000, 9999)
        waktu_transaksi = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        print(f"ID Transaksi: {transaksi_id} | Waktu: {waktu_transaksi}")
        keranjang_belanja.clear()
    else:
        print("Uang tidak mencukupi! Silakan coba lagi.")

while True:
    print("\nMenu:")
    print("1. Lihat daftar produk")
    print("2. Tambah produk ke keranjang")
    print("3. Lihat isi keranjang")
    print("4. Bayar")
    print("5. Keluar")
    
    pilihan = input("Pilih menu: ")
    if pilihan == "1":
        tampilkan_produk()
    elif pilihan == "2":
        tambah_ke_keranjang()
    elif pilihan == "3":
        tampilkan_keranjang()
    elif pilihan == "4":
        proses_pembayaran()
    elif pilihan == "5":
        print("Terima kasih telah berbelanja!")
        break
    else:
        print("Pilihan tidak valid!")
