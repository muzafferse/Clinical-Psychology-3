//
//  Strings.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 16.09.2024.
//

import Foundation

struct AppStrings {
    // General Strings
    static let appName = "Klinik Psikoloji \(appPostfix)"
    
    // Login & Register Strings
    static let nickName = "Rumuz"
    static let password = "Şifre"
    static let registerButtonText = "Kayıt Ol"
    
    // Login Strings
    static let loginButtonText = "Giriş Yap"
    static let loginPasswordLengthWarning = "Şifreniz 6 karakterden uzun olmalıdır."
    static let loginPopupTitle = "Hata!"
    static let loginPopupButtonText = "Tamam"
    
    // Register Strings
    static let repeatPassword = "Şifreyi Onayla"
    static let registerBackButtonText = "Giriş Yap"
    static let registerPasswordMatchWarning = "Lütfen girdiğiniz şifrelerin aynı olduğundan emin olun."
    static let registerPopupTitle = "Hata!"
    static let registerPopupButtonText = "Tamam"
    
    // Tab Bar Strings
    static let home = "Ana Sayfa"
    static let settings = "Ayarlar"
    static let tabBarAlertTitle = "Uyarı"
    static let tabBarAlertDescription = "Uygulama esnasında sekmeler arasında geçiş yapamazsınız."
    static let tabBarAlertButtonText = "Tamam"
    
    // Home Tab Strings
    static let homeTitle = "Testler"
    static let guestUser = "Misafir Kullanıcı"
    static let welcomeDescription = "Hoş geldiniz. Uygulamaya başlamadan önce gelin önemli birkaç konuyu tekrar hatırlayalım. Öncelikle sessiz bir ortama geçin. Bulunduğunuz ortamın ne çok sıcak ne de çok soğuk olmamasına dikkat edin. Uygulama sırasında cep telefonunuzun sesini kısın ve diğer uygulamalarınızın bildirimlerini kapatın. Bir başkasının bulunduğunuz ortama aniden girmeyeceğinden emin olun. Yine uygulama sırasında herhangi bir yiyecek ve içecek tüketmeyin. Rahat ve sabit bir sandalyeye sırtınız dik ve ayaklarınız zemine sağlam basacak şekilde ve kollarınızın boşlukta kalmayacağı bir pozisyonda (masa başında) oturun.  Cep telefonunuzun ekranının üst kenarının, gözünüzün hizasında ya da biraz altında olmasına dikkat edin.  Ekran-göz uzaklığınız 40-50 santim aralığında olmalıdır. Ekran ve gözünüz arasında 40-50 cm aralığında bir mesafe olacak şekilde duruşunuzu ayarlayın. Ekran yüzeyinde yansımaların oluşmaması için pencereleri ve yapay ışık kaynaklarını kendinize uygun şekilde konumlandırın.  Hazırsanız aşağıda yer alan butona tıklayın ve uygulamaya başlayın."
    static let startTestButtonText = "Başla"
    
    //Caution Test Strings
    static let ctStartDescription = "Bu çalışmada ekranda karşınıza bazı fotoğraf ve fotoğraf çiftleri çıkacak. Lütfen tüm dikkatinizi ekrandaki fotoğraf ve fotoğraf çiftlerine veriniz. Fotoğraflar ekrana gelip çok kısa bir süre ekranda kalacak ve sonra kaybolacak. Fotoğrafların kaybolmasının hemen ardından bir sonraki ekranda karşınıza sağ ok (→) ya da sol ok (←) şekillerinden biri çıkacak. Eğer ekranda karşınıza çıkan şekil sağ ok (→) ise ekranın ortasında karşınıza çıkacak olan bu şekil ile uyumlu olan sağ ok (→) butonuna, karşınıza çıkan şekil sol ok (←) ise bu şekil ile uyumlu olan sol ok (←) butonuna basmanız gerekmektedir. Lütfen ekranda gördüğünüz şekle denk gelen butona mümkün olduğunca hızlı bir şekilde basınız. Bir deneme bittikten sonra diğer denemeye başlamadan önce ekranda kısa bir süre belirecek olan bir artı (+) işareti göreceksiniz. Bu işaret ekranda çok kısa bir süre kalacağı için bütün dikkatinizi bu ekrana vermeniz önemlidir. Hazırsanız çalışmaya başlamak için aşağıdaki BAŞLAT yazılı butona basın."
    static let ctStartButtonText = "BAŞLAT"
    #if CLINIC3A
    static let ctFinishDescription = "Çalışma bitti. Sonlandırmak ve diğer adıma geçmek için aşağıdaki BİTİR VE DİĞER ADIMA GEÇ yazılı butona basın."
    static let ctFinishButtonText = "BİTİR VE DİĞER ADIMA GEÇ"
    #elseif CLINIC3B
    static let ctFinishDescription = "Çalışma bitti. Sonlandırmak için aşağıdaki BİTİR yazılı butona basın."
    static let ctFinishButtonText = "BİTİR"
    #endif
    
    
    // Interpretation Test Strings
    static let itWelcomeMessage = "Bu çalışmada karşınıza bazı senaryolar çıkacaktır. Bu senaryolara yönelik sizden bir dizi soruyu cevaplamanız istenecektir. Lütfen her bir senaryoyu dikkatli bir şekilde okuyunuz ve kendinizi o durum içinde hayal ediniz. Her bir senaryonun sonunda karşınıza bir harfi eksik olan kelimeler çıkacaktır. Lütfen elinizden gelenin en iyisini yaparak kelimeyi tamamlayınız. Kelimeyi tamamlayabilmek için, cep telefonunuzun klavyesini kullanarak eksik olduğunu düşündüğünüz harfe denk gelen tuşa basınız. Doğru harfe basıp kelimeyi tamamlamadan bir sonraki aşamaya geçemeyeceksiniz. Kelimeyi doğru bir şekilde tamamladıktan sonra sizden kendinizi hayal ettiğiniz durum ile ilgili bir soruyu cevaplamanız istenecektir. Açıklamanın devamını okumak için aşağıdaki DEVAM yazılı butona basın."
    static let itWelcomeButtonText = "DEVAM"
    static let itStartDescription = "Kelimeyi doğru bir şekilde tamamladıktan sonra karşınıza çıkacak soruyu cevaplarken lütfen sadece senaryonun içeriğinde yer alan bilgiyi göz önünde bulundurunuz. Evet cevabını vermek için ekrandaki EVET butonuna, Hayır cevabını vermek için ekrandaki HAYIR butonuna basınız. Cevap vermeden bir sonraki aşamaya geçemeyeceksiniz. Eğer cevabınızdan emin değilseniz, lütfen size en uygun gelen tahmini yapınız. Hazırsanız çalışmaya başlamak için aşağıdaki BAŞLAT yazılı butona basın."
    static let itStartButtonText = "BAŞLAT"
    #if CLINIC3A
    static let itFinishDescription = "Çalışma bitti. Sonlandırmak için aşağıdaki BİTİR yazılı butona basın."
    static let itFinishButtonText = "BİTİR"
    #elseif CLINIC3B
    static let itFinishDescription = "Çalışma bitti. Sonlandırmak ve diğer adıma geçmek için aşağıdaki BİTİR VE DİĞER ADIMA GEÇ yazılı butona basın."
    static let itFinishButtonText = "BİTİR VE DİĞER ADIMA GEÇ"
    #endif
    static let itYes = "EVET"
    static let itNo = "HAYIR"
    static let itCorrect = "DOĞRU"
    static let itIncorrect = "YANLIŞ"
    
    // Auth Error Strings
    static let authErrorEmailAlreadyInUse = "Bu rumuz ile zaten bir kullanıcı kayıtlı."
    static let authErrorInvalidCredential = "Rumuz veya şifre yanlış. Lütfen şifrenizi ve rumuzunuzu doğru girdiğinizden emin olun."
    static let authErrorInvalidEmail = "Geçersiz bir rumuz girdiniz."
    static let authErrorNetworkError = "Ağ hatası. Lütfen daha sonra tekrar deneyin."
    static let authErrorOperationNotAllowed = "Bu işlem şu anda yapılamıyor."
    static let authErrorTooManyRequests = "Çok fazla istek gönderildi. Lütfen daha sonra tekrar deneyin."
    static let authErrorUnknownError = "Bilinmeyen bir hata oluştu."
    static let authErrorUserDisabled = "Bu kullanıcı devre dışı bırakılmış."
    static let authErrorUserNotFound = "Bu kullanıcı mevcut değil."
    static let authErrorWeakPassword = "Şifre 6 karakterden kısa. Lütfen daha uzun bir şifre seçin."
    static let authErrorWrongPassword = "Şifre yanlış. Lütfen tekrar deneyin."
    
    // Settings Tab Strings
    static let settingsTitle: String = "Ayarlar"
    //TODO: Future Work - Contributors
    //static let contributorsButtonText = "Katkıda Bulunanları Gör"
    static let demoModeButtonText = "Demo Modu"
    static let itDemoModeDescription = "Kelimeyi doğru bir şekilde tamamladıktan sonra karşınıza çıkacak soruyu cevaplarken lütfen sadece senaryonun içeriğinde yer alan bilgiyi göz önünde bulundurunuz. Evet cevabını vermek için ekrandaki EVET butonuna, Hayır cevabını vermek için ekrandaki HAYIR butonuna basınız. Cevap vermeden bir sonraki aşamaya geçemeyeceksiniz. Eğer cevabınızdan emin değilseniz, lütfen size en uygun gelen tahmini yapınız. Şimdi bir alıştırma yapalım. Hazırsanız alıştırmaya başlamak için aşağıdaki BAŞLAT yazılı butona basın."
    static let itDemoModeButtonText = "BAŞLAT"
    static let itDemoModeFinishDescription = "Alıştırma bitti. Sonlandırmak için aşağıdaki BİTİR yazılı butona basın."
    static let itDemoModeFinishButtonText = "BİTİR"
    static let logoutButtonText = "Çıkış Yap"
    
    static var appPostfix: String {
#if CLINIC3A
        "3-A"
#elseif CLINIC3B
        "3-B"
#endif
    }
    
    //TODO: Future Work - Contributors
    /*
    // Contributors Strings
    static let contributorsTitle = "Katkıda Bulunanlar"
    static let contactButtonText = "İletişime Geç"
    static let contributorsBackButtonText = "Ayarlar"
     */
}
