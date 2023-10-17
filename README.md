# Jarkom-Modul-2-f14-2023
Laporan resmi praktikum modul 2 gns, dns, &amp; web server mata kuliah jaringan komputer
Kelompok: F14 <br />
Nama anggota 1: Ali Hasyimi Assegaf <br />
NRP anggota 1: 5025211131 <br />

## 1. Buat topologi jaringan
Topologi 4 adalah topologi yang digunakan kelompok kami, kelompok f14<br />
![Topologi 4](tangkaplayar/topologi.png)

## 2. Buat website utama dengan akses ke arjuna.f14.com dengan alias www.arjuna.f14.com
_Script_ yang digunakan adalah makeArjuna.sh yang dijalankan di node YudhistiraDNSMaster dan melakukan perintah:
1. Menambahkan domain **arjuna.f14.com** di **/etc/bind/named.conf.local**
2. Pada file domain **arjuna.f14.com** mengarahkan alamat IP-nya ke _node_ **ArjunaLoadBalancer**
3. Menambahkan _record_ CNAME untuk membuat alias website<br />

Perintah yang digunakan dalam pengetesan adalah:<br />
1. ping arjuna.f14.com -c 2
2. host -t CNAME www.arjuna.f14.com
3. ping www.arjuna.f14.com -c 2<br />


## 3. Buat website utama dengan akses ke abimanyu.f14.com dengan alias www.abimanyu.f14.com
_Script_ yang digunakan adalah makeAbimanyu.sh yang dijalankan di node YudhistiraDNSMaster dan melakukan perintah:
1. Menambahkan domain **abimanyu.f14.com** di **/etc/bind/named.conf.local**
2. Pada file domain **abimanyu.f14.com** mengarahkan alamat IP-nya ke _node_ **AbimanyuWebServer**
3. Menambahkan _record_ CNAME untuk membuat alias website<br />

Perintah yang digunakan dalam pengetesan adalah:<br />
1. ping abimanyu.f14.com -c 2
2. host -t CNAME www.abimanyu.f14.com
3. ping www.abimanyu.f14.com -c 2<br />

## 4. Buat subdomain parikesit.abimanyu.f14.com yang mengarah ke AbimanyuWebServer
_Script_ yang digunakan adalah makeParikesit.sh yang dijalankan di node YudhistiraDNSMaster dan melakukan perintah:
1. Pada file domain **abimanyu.f14.com** menambahkan _record_ A untuk membuat subdomain suatu _website_<br />

Perintah yang digunakan dalam pengetesan adalah:<br />
1. host -t A parikesit.abimanyu.f14.com
2. ping parikesit.abimanyu.f14.com -c 2<br />

## 5. Buat reverse domain untuk domain abimanyu.f14.com
_Script_ yang digunakan adalah makeReverse.sh yang dijalankan di node YudhistiraDNSMaster dan melakukan perintah:
1. Menambahkan domain reverse **3.226.192.in-addr.arpa** di **/etc/bind/named.conf.local**
2. Pada file domain **3.226.192.in-addr.arpa** membuat _nameserver_ dan mengarahkan ke **abimanyu.f14.com**<br />
