# Photion MVP Geliştirme Planı

## 📋 Proje Özeti

**Proje:** Photion - Zamanı Canlandıran Fotoğraflar  
**Vizyon:** Fiziksel fotoğrafları AR ile "zaman kapısı" haline getiren hibrit deneyim  
**Hedef:** MVP ile pazara çıkış ve ilk 100 ödeme yapan müşteriye ulaşma  
**Tarih:** 7 Temmuz 2025

### 🎯 Core Konsept
Kullanıcılar videolarından bir anı seçer, fiziksel fotoğraf bastırır ve AR ile tarayarak videonun devamını izler.

**Sihirli Formül:**
```
Seçilen An + Fiziksel Fotoğraf + AR Tarama = Zamanın Devamı
```

---

## 🏗️ 4 Ana Faz Yapısı

### FAZ 1: ALTYAPI VE TEMEL KURULUM
**Hedef:** Backend API, iOS projesi, database ve AWS altyapısının kurulumu

#### 1.1 Backend API Kurulumu
- **1.1.1** Node.js Proje Kurulumu (Express.js, TypeScript, ESLint, Prettier)
- **1.1.2** PostgreSQL Database Setup (Local ve production, connection pool)
- **1.1.3** Basic API Routes (Health check, CORS, middleware, temel routes)
- **1.1.4** Error Handling & Logging (Global error handler, request logging)

#### 1.2 iOS Proje Kurulumu
- **1.2.1** iOS Proje Oluşturma (SwiftUI, minimum deployment target 17.6)
- **1.2.2** Navigation Yapısı (TabView, NavigationStack ile temel navigation)
- **1.2.3** Network Layer (URLSession wrapper, API client, error handling)
- **1.2.4** Basic UI Components (Reusable components, design system, theme)

#### 1.3 Database Schema ve Migrations
- PostgreSQL database schema tasarımı ve migration dosyalarının oluşturulması

#### 1.4 AWS S3 ve CDN Kurulumu
- Video ve image storage için S3 bucket ve CloudFront CDN kurulumu

#### 1.5 Development Environment Setup
- Local development environment, environment variables ve basic CI/CD setup

---

### FAZ 2: CORE FUNCTIONALITY
**Hedef:** Video upload, processing, frame selection ve AR sistemlerinin geliştirilmesi

#### 2.1 Authentication System
- JWT tabanlı kullanıcı kayıt/giriş sistemi (Backend + iOS)

#### 2.2 Video Upload System
- iOS'tan backend'e güvenli video upload sistemi

#### 2.3 Video Processing Pipeline
- Video optimizasyon, frame extraction ve S3 storage pipeline

#### 2.4 Frame Selection Interface
- iOS'ta kare-kare hassas video frame seçim arayüzü

#### 2.5 AR Marker Generation
- Seçilen frame için unique AR marker üretme sistemi

#### 2.6 AR Recognition System
- ARKit ile fotoğraf tanıma ve video oynatma sistemi

---

### FAZ 3: PAYMENT & ORDER SYSTEM
**Hedef:** Ödeme entegrasyonu, sipariş yönetimi ve baskı partner entegrasyonu

#### 3.1 Payment Provider Integration
- PayTR/iyzico entegrasyonu ve güvenli ödeme akışı

#### 3.2 Order Management System
- Sipariş oluşturma, takip ve yönetim sistemi

#### 3.3 Print Partner Integration
- Baskı partneri ile API/manuel entegrasyon sistemi

#### 3.4 Order Status Tracking
- iOS'ta sipariş durumu takip arayüzü ve bildirim sistemi

---

### FAZ 4: PRODUCTION & LAUNCH
**Hedef:** Production deployment, test, App Store submission ve lansman

#### 4.1 Production Deployment
- AWS production environment setup ve deployment pipeline

#### 4.2 Testing & QA
- End-to-end testing, beta test ve bug fixing

#### 4.3 Legal Compliance
- KVKK, kullanıcı sözleşmesi ve yasal metinlerin hazırlanması

#### 4.4 App Store Submission
- App Store submission, review süreci ve lansman

---

## 🎭 MOCK DATA GEREKSİNİMLERİ

### Gerçek Data Odaklı Yaklaşım
Mümkün olduğunca gerçek verilerle çalışacağız. Mock data sadece şu alanlarda kullanılacak:

#### Test Video Koleksiyonu
- Farklı format (MP4, MOV), çözünürlük (1080p, 4K) ve sürelerde (5-30 saniye) 5-6 test videosu

#### AR Test Fotoğrafları
- Farklı baskı kalitesi, ışık koşulları ve açılarda AR tanıma testi için 10-15 test fotoğrafı

#### Payment Sandbox Setup
- PayTR/iyzico sandbox environment, test kartları ve mock transaction responses

#### Print Partner Mock API
- Baskı partneri entegrasyonu için mock API responses ve sipariş formatları

---

## ⚡ Kritik Dependency Chain

```
Backend API → iOS Auth → Video Upload → Processing → AR → Payment → Order
```

**Önemli:** Her aşama bir öncekine bağımlı olduğu için sıralı ilerleme zorunludur.

---

## 🎯 MVP Başarı Kriterleri

### Phase 1: MVP - PAZARA ÇIKIŞ
- ✅ İlk 100 ödeme yapan müşteriye ulaşılması
- ✅ App Store rating > 4.2
- ✅ Sipariş karşılama ve teslimat başarı oranı > %98
- ✅ Müşteri destek taleplerine ortalama yanıt süresi < 24 saat

---

## 🚀 Hemen Başlanacak Adımlar

1. **Mock Data Hazırlıkları** (Paralel olarak başlatılacak)
2. **Backend API Kurulumu** (Node.js proje kurulumu)
3. **iOS Proje Kurulumu** (SwiftUI, iOS 17.6)
4. **Database Schema Tasarımı** (PostgreSQL)

---

## 📊 Teknik Stack

### Backend
- **Runtime:** Node.js
- **Framework:** Express.js
- **Language:** TypeScript
- **Database:** PostgreSQL
- **Storage:** AWS S3
- **CDN:** CloudFront
- **Authentication:** JWT

### iOS
- **Framework:** SwiftUI
- **Minimum iOS:** 17.6
- **AR:** ARKit
- **Network:** URLSession
- **Architecture:** MVVM

### Infrastructure
- **Cloud:** AWS
- **Payment:** PayTR/iyzico
- **Monitoring:** CloudWatch
- **CI/CD:** GitHub Actions

---

## 🔄 Risk Yönetimi

### Teknik Riskler
- **AR tanıma doğruluğu:** Standart baskı kalitesi belirleme
- **Video işleme performansı:** AWS Elemental MediaConvert kullanımı

### Business Riskler
- **App Store reddi:** Detaylı inceleme notları ve demo hazırlığı
- **Baskı operasyon hataları:** İlk 100 sipariş için kontrol listeleri
- **Yasal uyumluluk:** Uzman hukuk danışmanlığı (zorunlu)

---

*Bu plan, MVP'den başlayarak ölçeklenebilir bir platforma dönüşümü hedefler. Her aşama test edilebilir ve birbirine zarar vermeyecek şekilde tasarlanmıştır.*