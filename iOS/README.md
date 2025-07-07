# Photion iOS App

iOS uygulaması - AR fotoğraf deneyimi platformu

## 🚀 Özellikler

### Tamamlanan (FAZ 1)
- ✅ SwiftUI tabanlı modern UI
- ✅ TabView ile ana navigasyon
- ✅ Kapsamlı Network Layer (URLSession + async/await)
- ✅ API Service katmanı
- ✅ Error handling ve network durumu yönetimi
- ✅ Development için Network Test arayüzü
- ✅ Constants ve configuration yönetimi

### Geliştirilecek (FAZ 2+)
- 🔄 Authentication sistemi
- 🔄 Video upload ve işleme
- 🔄 ARKit entegrasyonu
- 🔄 Frame selection arayüzü
- 🔄 Sipariş yönetimi

## 🏗️ Proje Yapısı

```
iOS/Photion/Photion/
├── App/
│   └── PhotionApp.swift           # Ana uygulama entry point
├── Core/
│   ├── Models/
│   │   └── User.swift             # User ve auth modelleri
│   └── Network/
│       ├── NetworkManager.swift   # Ana network katmanı
│       ├── NetworkError.swift     # Network hata yönetimi
│       └── APIService.swift       # API service katmanı
├── Features/
│   ├── ContentView.swift          # Ana content view
│   ├── MainTabView.swift          # Tab navigation
│   ├── Authentication/
│   ├── Home/
│   ├── VideoUpload/
│   ├── ARScan/
│   ├── Profile/
│   └── NetworkTest/               # Development test arayüzü
├── Utils/
│   ├── Constants/
│   │   └── AppConstants.swift     # Uygulama sabitleri
│   └── Extensions/
│       └── View+Extensions.swift  # SwiftUI extensions
└── Resources/
    └── Assets.xcassets/           # Görsel varlıklar
```

## 🔧 Teknik Detaylar

### Network Layer
- **URLSession** tabanlı modern async/await implementasyonu
- **JSON Encoding/Decoding** otomatik snake_case ↔ camelCase dönüşümü
- **Error Handling** kapsamlı hata yönetimi ve kullanıcı dostu mesajlar
- **Authentication** JWT token yönetimi (gelecekte Keychain entegrasyonu)
- **Timeout Management** configurable timeout değerleri

### API Configuration
```swift
// Development
AppConstants.API.baseURL = "http://localhost:3000"

// Production (gelecekte)
AppConstants.API.baseURL = "https://api.photion.com"
```

### Network Test
Development sırasında backend bağlantısını test etmek için:
1. iOS Simulator'ı başlatın
2. "Network" tab'ına gidin
3. "Bağlantıyı Test Et" butonuna tıklayın

## 📱 Gereksinimler

- **iOS:** 17.6+
- **Xcode:** 15.0+
- **Swift:** 5.9+

## 🚀 Kurulum

1. Xcode'da projeyi açın:
```bash
open iOS/Photion/Photion.xcodeproj
```

2. Simulator veya device seçin

3. Build ve run:
```bash
Cmd + R
```

## 🔍 Development

### Network Test
Backend server'ın çalıştığından emin olun:
```bash
cd server
npm start
```

iOS uygulamasında Network tab'ından bağlantıyı test edin.

### Debug Network Calls
Network çağrılarını debug etmek için:
- Xcode Console'da network log'larını izleyin
- NetworkManager'da `print` statement'ları aktif

### Constants Güncelleme
API endpoint'leri ve configuration için:
```swift
// AppConstants.swift
struct API {
    static let baseURL = "http://localhost:3000" // Development
    static let timeout: TimeInterval = 30.0
}
```

## 🎯 Sıradaki Adımlar

1. **Authentication UI** - Login/Register ekranları
2. **Video Upload** - Kamera entegrasyonu ve video seçimi
3. **ARKit Integration** - AR fotoğraf tanıma
4. **Frame Selection** - Video frame seçim arayüzü
5. **Payment Integration** - Ödeme akışı

## 🔧 Troubleshooting

### Network Bağlantı Sorunları
- Backend server'ın çalıştığından emin olun
- iOS Simulator'da localhost erişimi için HTTP (HTTPS değil) kullanın
- Network Test view'ından bağlantıyı kontrol edin

### Build Hataları
- Clean build folder: `Cmd + Shift + K`
- Derived data temizle: `Cmd + Shift + Option + K`
- Xcode'u yeniden başlatın

## 📝 Development Notes

- Modern SwiftUI patterns kullanılıyor
- MVVM architecture pattern
- Async/await ile modern concurrency
- File System Synchronized Xcode project (otomatik dosya tanıma)
- Development için Network Test tab'ı eklendi (production'da kaldırılacak)