
import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id ("com.google.gms.google-services")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}


val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
} else {
    println("DEBUG: key.properties file NOT found at: ${keystorePropertiesFile.absolutePath}")
}

android {
    namespace= "com.example.blog_system_app"
    compileSdk= 35
    ndkVersion= "28.1.13356709"

    compileOptions {
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId= "com.example.blog_system_app"
        minSdk = 23
        targetSdk = 35
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            
            keyAlias = keystoreProperties.getProperty("keyAlias") ?: throw GradleException("keyAlias not found in key.properties")
            keyPassword = keystoreProperties.getProperty("keyPassword") ?: throw GradleException("keyPassword not found in key.properties")
            storeFile = file(keystoreProperties.getProperty("storeFile") ?: throw GradleException("storeFile not found in key.properties"))
            storePassword = keystoreProperties.getProperty("storePassword") ?: throw GradleException("storePassword not found in key.properties")
        }
    }

    buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(getDefaultProguardFile("proguard-android.txt"), "proguard-rules.pro")
        }
    }
}
dependencies {
    implementation("androidx.core:core-ktx:1.12.0")
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
    implementation("com.google.android.gms:play-services-auth-api-phone:18.0.1")
}

flutter {
    source = "../.."
}