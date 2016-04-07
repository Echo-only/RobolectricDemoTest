/**
 * ������Android Studio + Gradle
 * ͨ��Robolectric + Junitʵ��Android��Ԫ����
 * eg���½� һ��Android ��Ŀ( RobolectricDemoTest )����Ŀ������ʾ��һ��textview��һ��button�����button���Ըı�textview����ʾ������
 */
 
 Instrumentation��Roboletric�������Android���е�Ԫ���ԵĿ�ܣ�ǰ����ִ��caseʱ����Android JUnit�ķ�ʽ���У�
 ��˱�������ʵ��Android���������У�ģ���������������������������Java Junit�ķ�ʽ���У�����������˶� Android ������������
 ������ֱ�ӽ�case��JVM�����У���˺��ʺϽ�Roboletric����Android�Ĳ�������������TDD����
 
 /**
 * Created by anyang on 2016/4/6.
 * ���� RobolectricDemoTest/build.gradle��
 buildscript {
    repositories {
        jcenter()
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:1.5.0'

        // NOTE: Do not place your application dependencies here; they belong
        // in the individual module build.gradle files
    }
 }

 allprojects {
    repositories {
        jcenter()
    }
 }

 task clean(type: Delete) {
    delete rootProject.buildDir
 }


 // maven֧��
 subprojects {

    repositories {
        maven { url "https://oss.sonatype.org/content/repositories/snapshots" }
        mavenLocal()
        mavenCentral()
    }
 }
 * ���� app/build.gradle��
 apply plugin: 'com.android.application'

 // API23Ŀǰ����֧��robolectric����
 android {
    compileSdkVersion 22
    buildToolsVersion "22.0.1"

    defaultConfig {
        applicationId "com.example.anyang.robolectricdemotest"
        minSdkVersion 16
        targetSdkVersion 19
        versionCode 1
        versionName "1.0"
    }
    buildTypes {
        release {
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
        }
    }
 }

 dependencies {
    compile fileTree(dir: 'libs', include: ['*.jar'])
    testCompile 'junit:junit:4.12'
    compile 'com.android.support:appcompat-v7:22.0.0'
    // ��Ӳ�������
    testCompile "org.assertj:assertj-core:1.7.0"
    testCompile "org.robolectric:robolectric:3.0"
 }

 * ɾ����Ŀ����ʱϵͳ�Զ����ɵ�ApplicationTest�����ļ���ѡ��Ҫ���в��Ե��ļ����ٴ��������ࣨע��ѡ��Junit4�������磺MainActivityTest
 * ��д���Դ���
 * ���� Build Variants����Build Variants��ͼ���棬��Test Artifactѡ��ΪUnit Tests
 * �����������Gradle��ͼ���棬���ˢ���������
 * ��ɲ��ԣ���gradle��壬ִ��app--tasks--verification--testDebug�����test�ļ��Ҽ����в��ԣ����Խ������projectname\app\build\reports\tests\debug\index.html�ļ���ͨ����ҳ�鿴
 */