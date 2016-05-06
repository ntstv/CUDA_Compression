#include <jni.h>
#include "ru_mephi_dozen_rshamyan_adaliquid_gpgpu_JCulzss.h"
#include "libculzss.h"

JNIEXPORT jint JNICALL Java_ru_mephi_dozen_rshamyan_adaliquid_gpgpu_JCulzss_encode
  (JNIEnv * env, jobject obj, jstring inputFilename, jstring outputFilename) {
	const char *nativeInputFilename = (*env)->GetStringUTFChars(env, inputFilename, 0);
	const char *nativeOutputFilename = (*env)->GetStringUTFChars(env, outputFilename, 0);

	int res = encode((char*)nativeInputFilename, (char*)nativeOutputFilename);

	(*env)->ReleaseStringUTFChars(env, inputFilename, nativeInputFilename);
	(*env)->ReleaseStringUTFChars(env, outputFilename, nativeOutputFilename);

	return (jint) res;
}

JNIEXPORT jint JNICALL Java_ru_mephi_dozen_rshamyan_adaliquid_gpgpu_JCulzss_decode
  (JNIEnv * env, jobject obj, jstring inputFilename, jstring outputFilename) {

	const char *nativeInputFilename = (*env)->GetStringUTFChars(env, inputFilename, 0);
	const char *nativeOutputFilename = (*env)->GetStringUTFChars(env, outputFilename, 0);

	int res = decode((char*)nativeInputFilename, (char*)nativeOutputFilename);

	(*env)->ReleaseStringUTFChars(env, inputFilename, nativeInputFilename);
	(*env)->ReleaseStringUTFChars(env, outputFilename, nativeOutputFilename);

	return (jint) res;

}
