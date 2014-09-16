#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>

int main(int argc, char ** argv)
{
	if(argc < 3)
	{
		printf("Usage:\n./a.out hostname port [seed]\n\n");
		return 1;
	}

	char * hostname = argv[1];
	char * port = argv[2];
	int seed = 1234;
	if(argc >= 4)
	{
		seed = atoi(argv[3]);
	}

	FILE * example = fopen("server.out", "r");		
	if(example == NULL)
	{
		printf("Failed to open 'server.out'\n");
		return 1;
	}

	char original[2048];
	size_t byteCount = fread(original, sizeof(char), 2048, example);
	if(byteCount <= 0)
	{
		printf("Failed to read data\n");
		return 1;
	}

	srandom(seed);
	while(true)
	{
		char duplicate[2048];
		memcpy(duplicate, original, 2048);
		int pos = random() % byteCount;
		duplicate[pos] = 255;

		FILE * corrupt = fopen("corrupt.out", "w");
		if(corrupt == NULL)
		{
			printf("Failed to open 'corrupt.out'\n");
			return 1;
		}

		fwrite(duplicate, sizeof(char), byteCount, corrupt);

		fclose(corrupt);

		char commandString[1024];
		snprintf(commandString, 1024, "/bin/bash -c \"cat corrupt.out | openssl s_client -connect %s:%s -CAfile iqlsacacert.pem\"", hostname, port);

		FILE * sslout = popen(commandString, "r");
		sleep(1);
		pclose(sslout);
	}

	return 0;
}
