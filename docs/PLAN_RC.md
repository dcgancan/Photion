# 🏗️ PHOTION - DETAYLI GELİŞTİRME PLANI

## 📋 Proje Özeti
- **Teknoloji Stack:** iOS SwiftUI + ARKit, Node.js + Express + PostgreSQL
- **AR Yaklaşımı:** Image Recognition (fotoğrafın kendisi marker)
- **Baskı Stratejisi:** İlk 100 sipariş manuel, sonra API entegrasyonu
- **Odak:** MVP-first, gerçek veri odaklı geliştirme

---

## 🎯 FAZ 1: MVP - PAZARA ÇIKIŞ (8-10 Hafta)

### **1.1 PROJE ALTYAPI VE HAZIRLIK** (1. Hafta)

#### 1.1.1 Geliştirme Ortamı Kurulumu
- [ ] iOS SwiftUI projesi oluşturma ve temel klasör yapısı
- [ ] Node.js + Express backend projesi kurulumu
- [ ] PostgreSQL veritabanı şeması tasarımı ve kurulumu
- [ ] Git repository yapısı ve branch stratejisi
- [ ] AWS hesabı ve S3 bucket kurulumu

#### 1.1.2 Yasal ve Operasyonel Hazırlıklar
- [ ] **KRİTİK:** Hukuk danışmanı ile görüşme ve yasal metinlerin hazırlanması
- [ ] KVKK uyumluluk planının oluşturulması
- [ ] Baskı partneri araştırması ve ilk görüşmeler
- [ ] PayTR/iyzico hesap açılışı ve test ortamı kurulumu

### **1.2 BACKEND API GELİŞTİRME** (2-3. Hafta)

#### 1.2.1 Temel API Altyapısı
- [ ] Express.js server kurulumu ve middleware yapılandırması
- [ ] PostgreSQL bağlantısı ve ORM (Sequelize/Prisma) kurulumu
- [ ] JWT tabanlı authentication sistemi
- [ ] API rate limiting ve güvenlik middleware'leri

#### 1.2.2 Kullanıcı Yönetimi API'ları
- [ ] Kullanıcı kayıt/giriş endpoint'leri
- [ ] Profil yönetimi API'ları
- [ ] Şifre sıfırlama sistemi
- [ ] **Gerçek Veri:** Test kullanıcıları ile gerçek kayıt/giriş testleri

#### 1.2.3 Video İşleme API'ları
- [ ] Video upload endpoint'i (multipart/form-data)
- [ ] FFmpeg entegrasyonu ile video optimizasyonu (1080p)
- [ ] Frame extraction sistemi (yüksek kalite tek kare)
- [ ] S3'e video ve frame upload sistemi
- [ ] **Mock Veri Kullanımı:** İlk testler için sample videolar

### **1.3 İOS APP CORE GELİŞTİRME** (3-5. Hafta)

#### 1.3.1 Temel UI/UX ve Navigation
- [ ] SwiftUI tabanlı ana navigasyon yapısı
- [ ] Kullanıcı kayıt/giriş ekranları
- [ ] Ana dashboard tasarımı
- [ ] **Gerçek Veri:** Backend API'ları ile entegrasyon

#### 1.3.2 Video Upload ve Frame Selection
- [ ] Kamera/galeri erişimi ve video seçimi
- [ ] Video preview ve kare-kare ilerleme arayüzü
- [ ] Hassas frame seçim sistemi (slider + step controls)
- [ ] Seçilen frame'in backend'e gönderilmesi
- [ ] **Gerçek Veri:** Kullanıcının kendi videoları ile test

#### 1.3.3 ARKit Entegrasyonu
- [ ] ARKit framework kurulumu
- [ ] Image recognition sistemi (Core ML model)
- [ ] Fotoğraf tanıma ve video oynatma engine'i
- [ ] AR session yönetimi ve performans optimizasyonu
- [ ] **Mock Veri Kullanımı:** Test fotoğrafları ile AR tanıma testleri

### **1.4 ÖDEME SİSTEMİ VE SİPARİŞ YÖNETİMİ** (4-5. Hafta)

#### 1.4.1 Ödeme Entegrasyonu
- [ ] PayTR/iyzico SDK entegrasyonu (iOS)
- [ ] Web view tabanlı ödeme akışı
- [ ] Backend'de ödeme doğrulama sistemi
- [ ] Sipariş durumu yönetimi
- [ ] **Gerçek Veri:** Test kartları ile gerçek ödeme testleri

#### 1.4.2 Sipariş Yönetimi
- [ ] Sipariş oluşturma ve takip sistemi
- [ ] "Siparişlerim" ekranı
- [ ] Push notification sistemi
- [ ] E-posta bildirim entegrasyonu

### **1.5 BASKI OPERASYON SİSTEMİ** (5-6. Hafta)

#### 1.5.1 Manuel Sipariş İşleme Sistemi
- [ ] Admin panel (basit web arayüzü) geliştirilmesi
- [ ] Sipariş listesi ve detay görüntüleme
- [ ] Baskı için gerekli dosyaların hazırlanması (yüksek çözünürlük)
- [ ] Baskı partnerine manuel sipariş iletim sistemi
- [ ] **Gerçek Veri:** İlk test siparişleri ile süreç testleri

#### 1.5.2 Sipariş Takip Sistemi
- [ ] Sipariş durumu güncelleme sistemi
- [ ] Kargo takip entegrasyonu (manuel)
- [ ] Müşteri bilgilendirme otomasyonu

### **1.6 TEST VE OPTİMİZASYON** (6-7. Hafta)

#### 1.6.1 Entegrasyon Testleri
- [ ] End-to-end test senaryoları
- [ ] AR tanıma doğruluğu testleri (farklı ışık koşulları)
- [ ] Video optimizasyon performans testleri
- [ ] Ödeme akışı testleri
- [ ] **Gerçek Veri:** Beta tester grubu ile gerçek kullanım testleri

#### 1.6.2 Performans Optimizasyonu
- [ ] Video upload/download hızı optimizasyonu
- [ ] AR tanıma hızı iyileştirmeleri
- [ ] Battery usage optimizasyonu
- [ ] Memory management iyileştirmeleri

### **1.7 LANSMAN HAZIRLIĞI** (7-8. Hafta)

#### 1.7.1 App Store Hazırlıkları
- [ ] App Store Connect hesabı ve uygulama profili
- [ ] Screenshot'lar ve app preview videosu
- [ ] App Store açıklaması ve metadata
- [ ] TestFlight beta dağıtımı
- [ ] **Gerçek Veri:** Beta testerlerden gelen gerçek feedback

#### 1.7.2 Production Deployment
- [ ] AWS production ortamı kurulumu
- [ ] SSL sertifikaları ve domain yapılandırması
- [ ] Monitoring ve logging sistemleri
- [ ] Backup ve disaster recovery planı

### **1.8 LANSMAN VE İLK OPERASYON** (8. Hafta)

#### 1.8.1 Soft Launch
- [ ] App Store'da yayınlama
- [ ] İlk kullanıcı kayıtları ve siparişleri
- [ ] Gerçek zamanlı monitoring
- [ ] Müşteri destek sisteminin aktifleştirilmesi

---

## 🎯 FAZ 2: B2B WEB PORTALI VE OPTİMİZASYON (6-8 Hafta)

### **2.1 B2B WEB PORTAL GELİŞTİRME** (1-3. Hafta)

#### 2.1.1 React/Next.js Portal Altyapısı
- [ ] Next.js projesi kurulumu ve temel yapı
- [ ] Fotoğrafçı authentication sistemi
- [ ] Dashboard ve navigation tasarımı
- [ ] **Gerçek Veri:** İlk partner fotoğrafçılar ile test

#### 2.1.2 Müşteri ve Sipariş Yönetimi
- [ ] Müşteri listesi ve profil yönetimi
- [ ] Toplu sipariş oluşturma arayüzü
- [ ] Sipariş takip ve durum yönetimi
- [ ] **Gerçek Veri:** Gerçek düğün/etkinlik siparişleri

### **2.2 AKILLI QR KOD SİSTEMİ** (2-4. Hafta)

#### 2.2.1 QR Kod Üretim Sistemi
- [ ] Her sipariş için benzersiz QR kod üretimi
- [ ] QR kod içinde aktivasyon bilgileri
- [ ] iOS app'te QR kod okuma sistemi
- [ ] Otomatik aktivasyon akışı

### **2.3 ANALİTİK VE RAPORLAMA** (3-4. Hafta)

#### 2.3.1 B2B Analytics Dashboard
- [ ] Sipariş istatistikleri ve trendler
- [ ] Gelir raporları ve komisyon hesaplamaları
- [ ] Müşteri davranış analizleri
- [ ] **Gerçek Veri:** Gerçek sipariş verilerinden analizler

### **2.4 BASKI OPERASYON OTOMASYONU** (4-6. Hafta)

#### 2.4.1 API Entegrasyonu
- [ ] Baskı partneri API entegrasyonu
- [ ] Otomatik sipariş iletimi
- [ ] Kargo takip entegrasyonu
- [ ] **Gerçek Veri:** Gerçek siparişlerle API testleri

---

## 🎯 FAZ 3: ÖLÇEKLENME VE GENİŞLEME (8-12 Hafta)

### **3.1 ANDROID GELİŞTİRME** (1-6. Hafta)

#### 3.1.1 Native Android App
- [ ] Kotlin/Java ile Android projesi
- [ ] ARCore entegrasyonu
- [ ] iOS parity özellikleri
- [ ] **Gerçek Veri:** Cross-platform kullanıcı testleri

### **3.2 GELİŞMİŞ ÖZELLİKLER** (4-8. Hafta)

#### 3.2.1 Anı Galerisi ve Sosyal Özellikler
- [ ] Kullanıcı anı koleksiyonu
- [ ] Paylaşma özellikleri
- [ ] Sosyal medya entegrasyonları
- [ ] **Gerçek Veri:** Kullanıcı generated content

---

## 🚨 KRİTİK MOCK VERİ KULLANIM ALANLARI

### **Mock Veri Gerekli Alanlar:**
1. **İlk AR Testleri:** Test fotoğrafları ve videolar (geliştirme aşamasında)
2. **Video İşleme Testleri:** Sample video dosyaları (algoritma geliştirme için)
3. **UI/UX Testleri:** Placeholder içerikler (tasarım aşamasında)

### **Gerçek Veri Kullanım Alanları:**
1. **Kullanıcı Authentication:** Gerçek kayıt/giriş işlemleri
2. **Video Upload:** Kullanıcıların kendi videoları
3. **Ödeme Testleri:** Test kartları ile gerçek ödeme akışları
4. **Baskı Operasyonları:** Gerçek sipariş ve teslimat süreçleri
5. **AR Tanıma:** Gerçek basılı fotoğraflarla tanıma testleri

---

## 📊 BAŞARI METRİKLERİ VE MİLESTONE'LAR

### **Faz 1 Çıktıları:**
- ✅ App Store'da yayında uygulama
- ✅ İlk 10 ödeme yapan müşteri
- ✅ %95+ AR tanıma başarı oranı
- ✅ <3 saniye video yükleme süresi

### **Faz 2 Çıktıları:**
- ✅ 5 aktif B2B partner
- ✅ Otomatik sipariş işleme sistemi
- ✅ %98+ sipariş karşılama oranı

### **Faz 3 Çıktıları:**
- ✅ Cross-platform kullanıcı tabanı
- ✅ 1000+ aylık aktif kullanıcı
- ✅ Sürdürülebilir gelir modeli

---

## 🔄 RİSK YÖNETİMİ VE ÖNLEMLER

### **Teknik Riskler:**
1. **AR Tanıma Doğruluğu:** Farklı ışık koşullarında test, standart baskı kalitesi belirleme
2. **Video İşleme Performansı:** AWS Elemental MediaConvert gibi yönetilen servislere geçiş planı
3. **iOS App Store Onayı:** Detaylı inceleme notları, test kartı ve demo video hazırlığı

### **Operasyonel Riskler:**
1. **Baskı Kalitesi:** İlk 100 sipariş için detaylı kontrol listeleri
2. **Kargo Sorunları:** Güvenilir kargo partneri seçimi ve takip sistemi
3. **Müşteri Desteği:** 24 saat yanıt SLA'sı ve FAQ sistemi

### **Yasal Riskler:**
1. **KVKK Uyumluluk:** Proje başında hukuk danışmanlığı (zorunlu)
2. **E-ticaret Mevzuatı:** Mesafeli satış sözleşmesi ve cayma hakkı düzenlemeleri

---

## 🎯 SONRAKI ADIMLAR

Bu plan onaylandıktan sonra:

1. **Hemen Başlanacak:** Yasal danışmanlık süreci
2. **1. Hafta:** Geliştirme ortamı kurulumu
3. **2. Hafta:** Backend API geliştirmeye başlama
4. **3. Hafta:** iOS app core geliştirme

**Not:** Bu plan MVP odaklı yaklaşımla gerçek veriler üzerinden çalışmayı önceleyerek, mock veriyi sadece gerekli alanlarda kullanıyor. Her faz birbirini destekleyecek şekilde tasarlandı ve risk yönetimi dahil edildi.

---

*Bu doküman, proje gelişimi sırasında güncellenecek ve revize edilecektir.*
*Son güncelleme: 7 Temmuz 2025*