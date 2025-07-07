# Photion - Sıfırdan Başlangıç PRD

## 📋 Proje Kimliği

- **Proje:** Photion - Zamanı Canlandıran Fotoğraflar
- **Vizyon:** Durmuş anları tekrar başlatan sihirli deneyim
- **Versiyon:** 1.1 (MVP Odaklı Revizyon)
- **Tarih:** 7 Temmuz 2025

---

## 🎯 1. Proje Tanımı

### 1.1 Core Konsept

Photion, fiziksel fotoğrafları "zaman kapısı" haline getiren devrimci bir teknoloji. Kullanıcılar videolarından bir anı seçer, o anı fiziksel fotoğraf olarak bastırır. Fotoğrafı mobil uygulamayla taradıklarında, videonun o andan sonraki kısmı devam eder.

**Sihirli Formül:**
```
Seçilen An + Fiziksel Fotoğraf + AR Tarama = Zamanın Devamı
```

### 1.2 Gerçek Hayat Senaryosu

#### Senaryo: Ayşe'nin Doğum Günü Sürprizi

*Ayşe, 5 yaşındaki kızı Elif'in doğum günü için özel bir hediye hazırlamak istiyor.*

**1. Video Yakalama (Cumartesi Sabahı)**
- Elif bahçede köpekleriyle oynarken 12 saniyelik video çeker
- En güzel an: 4. saniyede Elif gülümseyerek kameraya bakıyor

**2. Photion Deneyimi (Cumartesi Öğleden Sonra)**
- Ayşe videoyu Photion'a yükler
- 4. saniyedeki frame'i, kare kare ilerleme sağlayan hassas arayüz ile seçer: "Bu anı ölümsüzleştirmek istiyorum"
- Uygulama içinden açılan web arayüzü ile (PayTR/iyzico gibi) güvenli ödeme yaparak sipariş verir: "10x15 premium baskı + Photion deneyimi"

**3. Fiziksel Ürün (Pazartesi)**
- Elif'in gülümseyen fotoğrafı eve gelir
- Ayşe fotoğrafı çerçeveler, Elif'in odasına asar

**4. Sihirli Keşif (Çarşamba Akşamı)**
- Elif odasında fotoğrafını görür
- Ayşe: "Bu fotoğrafın sırrı var, telefonla bakayım"
- Photion uygulamasını açar, fotoğrafı tarar
- **SIHIR:** Fotoğraf tanınır, videonun 4. saniyeden sonraki optimize edilmiş 8 saniyesi oynar
- Elif ekranda kendini köpeklerle oynamaya devam ederken görür
- "Anne, ben fotoğraftan çıktım!" diye bağırır

### 1.3 Değer Önerisi Piramidi

```
                🎭 DUYGUSAL DEĞER
               "Sihirli Anlar Yaratma"
              
          🔮 DENEYIM DEĞERI
         "Fiziksel + Dijital Hibrit"
        
    💡 TEKNOLOJIK DEĞER
   "AR + Video Continuation"

🎁 SOSYAL DEĞER
"Paylaşılabilir Sürpriz"
```

---

## 🏗️ 2. Esnek Teknik Mimari

### 2.1 Modüler Sistem Tasarımı

#### Priority 1: Core System (iOS + Backend)

**📱 iOS App (B2C Focus)**
- Authentication Engine
- Video Upload & Processing
- AR Recognition Engine
- Video Continuation Playback
- Order Management & Web Payment Flow

**🖥️ Backend API**
- User Authentication
- Video Processing & Optimization Pipeline
- AR Marker Management
- Order & Secure Payment Verification (PayTR/iyzico)
- File Storage Management (S3 Lifecycle)

#### Priority 2: B2B Web Portal (Later Phase)

**🌐 Web Dashboard (B2B Only)**
- Photographer Registration & Client Management
- Bulk Order Processing & Smart QR Generation
- Analytics & Reporting
- Revenue Tracking

### 2.2 Platform Strategy

| Phase | Focus | Technology Stack |
|-------|-------|------------------|
| **Phase 1** | iOS MVP + Market Launch | SwiftUI + ARKit, Node.js backend |
| **Phase 2** | B2B Web Portal & Optimization | React/Next.js, Enhanced backend |
| **Phase 3** | Scale & Expand | Android native, Advanced features |

### 2.3 Scalable Data Architecture

**Micro-Database Pattern**
- **User Data** → PostgreSQL (Relational)
- **Media Files** → S3 (Lifecycle Policies ile yönetilen)
- **AR Markers** → Redis (Fast Access)
- **Analytics** → InfluxDB / Mixpanel (Time Series)
- **Cache** → Redis (Memory)

---

## 📋 3. Fazlı Geliştirme Planı

### FAZ 1: MVP - PAZARA ÇIKIŞ (ÇEKİRDEK SİSTEM VE LANSMAN)

**Hedef:** İlk müşterilerden sipariş alabilen, "cilalı" ve stabil bir B2C sistemi.

#### 1.1 iOS App & Kullanıcı Deneyimi
- [ ] SwiftUI ile proje kurulumu ve "cilalı" UI/UX tasarımı
- [ ] Kullanıcı kayıt/giriş sistemi
- [ ] Video yükleme ve kare-kare hassas seçim arayüzü
- [ ] ARKit ile görüntü tanıma ve video oynatma
- [ ] Uygulama içinden web arayüzü ile (PayTR/iyzico) ödeme akışı
- [ ] Temel "Siparişlerim" ekranı ve anlık bildirimler

#### 1.2 Backend API & Veri İşleme
- [ ] Node.js, Express, PostgreSQL sunucu altyapısı
- [ ] JWT tabanlı kimlik doğrulama
- [ ] Video yükleme, 1080p'ye optimize etme ve S3'e kaydetme API'ları
- [ ] AR Marker üretme sistemi
- [ ] Ödeme sağlayıcısından gelen onayı doğrulama ve sipariş kaydetme

#### 1.3 Altyapı, Operasyon ve Lansman
- [ ] AWS production ortamı, S3 ve CDN kurulumu
- [ ] Baskı partneri ile manuel veya API entegrasyonu
- [ ] Yasal metinlerin (KVKK, Sözleşmeler) hazırlanması ve entegrasyonu
- [ ] App Store gönderimi için hazırlıklar (Demo hesap, test kartı, inceleme notları)
- [ ] Beta testleri ve halka açık lansman

**Çıktı:** App Store'da yayında olan, ilk siparişlerini ve gelirini yaratan uygulama.

### FAZ 2: B2B WEB PORTALI VE OPTİMİZASYON

**Hedef:** Fotoğrafçılar için profesyonel bir platform oluşturmak ve mevcut sistemi iyileştirmek.

- [ ] Fotoğrafçılar için React/Next.js tabanlı web portalı geliştirilmesi
- [ ] Müşteri yönetimi ve toplu sipariş arayüzleri
- [ ] Her sipariş için "Akıllı QR Kod" (Smart QR) üretme ve teslim etme akışı
- [ ] Analitik ve raporlama ekranları
- [ ] Baskı ve kargo süreçlerinin otomasyonu

**Çıktı:** B2B web portalı ve ilk fotoğrafçı iş ortakları.

### FAZ 3: ÖLÇEKLENME VE GENİŞLEME

**Hedef:** Büyüme, platform genişletme ve kullanıcı bağlılığını artırma.

- [ ] Android için native uygulama geliştirilmesi
- [ ] Kullanıcılar için "Anı Galerisi" özelliği
- [ ] Gelişmiş "Paylaşma Deneyimi" (uygulama içi ekran kaydı vb.) özellikleri
- [ ] Abonelik modelleri ve uluslararası pazarlara açılma

**Çıktı:** Çok platformlu ekosistem ve uluslararası kullanıcı tabanı.

---

## 🎯 4. Esnek Başarı Metrikleri

### Phase 1: MVP - PAZARA ÇIKIŞ
- ✅ İlk 100 ödeme yapan müşteriye ulaşılması
- ✅ App Store rating > 4.2
- ✅ Sipariş karşılama ve teslimat başarı oranı > %98
- ✅ Müşteri destek taleplerine ortalama yanıt süresi < 24 saat

### Phase 2: B2B WEB PORTALI
- ✅ İlk 10 B2B fotoğrafçı partnerin sisteme dahil edilmesi
- ✅ B2B sipariş hacminin toplam hacmin %20'sine ulaşması

### Phase 3: ÖLÇEKLENME
- ✅ Aylık aktif kullanıcı sayısında istikrarlı büyüme
- ✅ Müşteri Yaşam Boyu Değeri (LTV) > 200 TL
- ✅ Android ve iOS kullanıcı tabanları arasında dengeli büyüme

---

## 🔄 5. Risk Yönetimi & Esneklik

### 5.1 Teknik Riskler & Çözümler

| Risk | Plan B |
|------|--------|
| AR tanıma doğruluğunun farklı baskı materyallerinde düşük olması | Baskı partneri ile standart bir kağıt ve baskı kalitesi belirlemek |
| Video işleme ve optimizasyonunun yavaş kalması | AWS Elemental MediaConvert gibi yönetilen servislere geçiş |

### 5.2 Business Riskler & Pivotlar

**Risk:** Apple App Store'un harici ödeme akışını reddetmesi  
**Çözüm:** Detaylı inceleme notları, test kartı ve demo video ile süreci şeffafça açıklamak. İnceleme ekibiyle proaktif iletişim kurmak.

**Risk:** Baskı/Kargo operasyonlarında manuel süreçlerden kaynaklanan hatalar  
**Çözüm:** İlk 100 sipariş için detaylı kontrol listeleri oluşturmak. Belirli bir sipariş hacminden sonra API entegrasyonunu zorunlu kılmak.

**Risk:** Yasal yükümlülüklerin (KVKK vb.) eksik yerine getirilmesi  
**Çözüm:** Proje başlamadan önce e-ticaret ve KVKK alanında uzman bir hukuk danışmanıyla çalışmak. **Bu bir risk değil, bir zorunluluktur.**

---

## 💡 6. Teknik Detaylar & Örnekler

### 6.1 Video Optimizasyon ve Depolama Stratejisi

Maliyetleri düşürmek ve performansı artırmak için video yaşam döngüsü:

1. **Yükleme:** Kullanıcı yüksek çözünürlüklü videosunu yükler
2. **İşleme:** Sistem, baskı için orijinal kalitede tek bir kare ayırır. Videonun geri kalanını 1080p'ye düşürerek ve sıkıştırarak optimize eder
3. **Depolama:** Sadece optimize edilmiş küçük boyutlu video ve yüksek kaliteli tek kare S3'te saklanır. Orijinal video dosyası işlemden sonra silinir
4. **Yaşam Döngüsü:** S3 Lifecycle Policies kullanılarak çok eski ve erişilmeyen dosyaların daha ucuz depolama sınıflarına (Glacier) taşınması

---

## 🎨 7. Kullanıcı Deneyimi Senaryoları

### 7.1 Senaryo: Düğün Fotoğrafçısı İşbirliği

**B2B Journey:**

1. **Partnership:** Fotoğrafçı Ahmet, Photion B2B portalına kaydolur
2. **Wedding Day:** Düğün sırasında özel anları video olarak yakalar
3. **Selection & Order:** Çiftle birlikte en özel anı seçer, videoyu B2B portala yükler ve siparişi oluşturur
4. **Smart QR Delivery:** Sistem, bu siparişe özel, içinde aktivasyon kodu barındıran tek bir "Akıllı QR Kod" üretir. Ahmet bu QR kodu (dijital veya basılı kartla) çifte teslim eder
5. **Magic Moment:** Çift, QR kodu okutur. Photion uygulaması yoksa indirilir, varsa açılır ve sihirli fotoğraf otomatik olarak aktive edilir. Kod girmeye gerek kalmaz
6. **Viral Effect:** Misafirler deneyimi sosyal medyada paylaşır

---

## 🆕 8. Operasyonel ve Yasal Hazırlıklar

### 8.1 Müşteri Desteği Politikası

- **Kanal:** Başlangıçta uygulama içi bir "Bize Ulaşın" butonu ile e-posta desteği
- **SLA:** Destek taleplerine 24 saat içinde ilk yanıtın verilmesi hedeflenir
- **FAQ:** Yaygın sorunlar için bir "Sıkça Sorulan Sorular" bölümü hazırlanacaktır

### 8.2 İade ve Sipariş Yönetimi

- **Kusurlu Ürün:** Hasarlı kargo veya bariz baskı kalitesi sorunlarında müşteriye ücretsiz olarak yeniden gönderim
- **Cayma Hakkı:** Ürünler "kişiye özel üretildiği" için, yasal mevzuat uyarınca kusurlu haller dışında keyfi iade (cayma hakkı) kabul edilmeyecektir. Bu durum, Mesafeli Satış Sözleşmesi'nde açıkça belirtilecektir

### 8.3 Yasal Uyumluluk (KVKK ve Sözleşmeler)

- **Zorunluluk:** Proje başlamadan önce e-ticaret ve KVKK alanında uzman bir hukuk danışmanıyla çalışılacaktır
- **Gerekli Metinler:** Aşağıdaki dokümanlar hazırlanıp uygulama ve web sitesine entegre edilecektir:
  - Gizlilik Politikası
  - Kullanıcı Sözleşmesi
  - Aydınlatma Metni
  - Mesafeli Satış Sözleşmesi

---

## 📊 9. Özet ve Sonraki Adımlar

Bu PRD, Photion projesinin MVP'den başlayarak ölçeklenebilir bir platforma dönüşümünü planlar. İlk faz olan MVP'nin başarılı bir şekilde tamamlanması, sonraki fazların temelini oluşturacaktır.

**Hemen Başlanacak Adımlar:**
1. iOS SwiftUI projesi kurulumu
2. Backend API altyapısının oluşturulması
3. Yasal danışmanlık sürecinin başlatılması
4. Baskı partneri araştırması ve görüşmeleri

---

*Bu doküman, proje gelişimi sırasında güncellenecek ve revize edilecektir.*
