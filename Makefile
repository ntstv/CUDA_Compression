all: main

JCulzss: ru_mephi_dozen_rshamyan_adaliquid_gpgpu_JCulzss.c ru_mephi_dozen_rshamyan_adaliquid_gpgpu_JCulzss.h
	gcc -g -shared -fPIC -I/usr/lib/jvm/default-java/include -o libJCulzss.so ru_mephi_dozen_rshamyan_adaliquid_gpgpu_JCulzss.c libculzss.so

lib: libculzss culzss gpu_compress deculzss  gpu_decompress decompression
	gcc -shared -g -L/usr/local/cuda/lib64/ -lcudart -lpthread -o libculzss.so libculzss.o culzss.o gpu_compress.o deculzss.o gpu_decompress.o decompression.o /usr/local/cuda/lib64/libcudart.so /lib/x86_64-linux-gnu/libpthread.so.0
		
libculzss: libculzss.c libculzss.h
	gcc -g -fPIC -c -lpthread -o libculzss.o libculzss.c

main: main.c culzss  gpu_compress deculzss  gpu_decompress decompression
	gcc -g -L /usr/local/cuda/lib64/ -lcudart -lpthread -o main main.c culzss.o gpu_compress.o deculzss.o gpu_decompress.o decompression.o /usr/local/cuda/lib64/libcudart.so /lib/x86_64-linux-gnu/libpthread.so.0

decompression: 	decompression.c decompression.h
	gcc -g -fPIC -c -lpthread -o decompression.o decompression.c
	
culzss: culzss.c culzss.h libculzss.c
	gcc -g -c -fPIC -lpthread -o culzss.o culzss.c 

gpu_compress: gpu_compress.cu gpu_compress.h
	nvcc -O3 -g -c -arch sm_20  -lpthread --compiler-options "-fPIC" -o gpu_compress.o gpu_compress.cu    

deculzss:  deculzss.c deculzss.h 
	gcc -g -fPIC -c -lpthread -o deculzss.o deculzss.c

gpu_decompress: gpu_decompress.cu gpu_decompress.h
	nvcc -c -g -lpthread --compiler-options "-fPIC" -o  gpu_decompress.o gpu_decompress.cu  
	
clean:
	rm *.o

