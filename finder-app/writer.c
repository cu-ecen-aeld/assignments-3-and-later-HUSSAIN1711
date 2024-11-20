#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <syslog.h>
#include "writer.h"
int main(int argc, char *argv[]){
	//Open Log for LOG_USER
	openlog("writer", LOG_PID | LOG_CONS, LOG_USER);
	
	//We first check if the number of arguments are correct
	
	if(argc!=3){
		//Throw an error
		logerror("Error: Two arguments required - file path and text string to write.");
		fprintf(stderr, "Error: Two arguments required - file path and text string to write.");
		exit(EXIT_FAILURE);
	}

	char *writefile = argv[1];
	char *writestr = argv[2];

	//Now we check if they are empty, if they are we throw an error
	if(writefile == NULL || writestr == NULL || strlen(writefile)==0 || strlen(writestr)==0){
		//Throw an error with syslog
		logerror("Error: Both file path and text string must be non-empty." );
		fprintf(stderr, "Error: Both file path and text string must be non-empty.");
		exit(EXIT_FAILURE);
	}

	//Attempt to Create the file
	FILE *file = fopen(writefile, "w");
	if(file == NULL) {
		logerror("Error: Could not create the file for writing");
		fprintf(stderr, "Error: Could not create the file for writing");
		exit(EXIT_FAILURE);
	}

	//Write the string to the file
	if(fprintf(file, "%s\n", writestr)<0) {
		logerror("Error: Could not write to the file");
		fprintf(stderr, "Error Could not write to the file");
		fclose(file);
		exit(EXIT_FAILURE);
	}

	if (fclose(file) != 0) {
        	logerror("Error: Failed to close the file.");
        	fprintf(stderr, "Error: Failed to close the file: %s\n", writefile);
        	exit(EXIT_FAILURE);
    	}

	syslog(LOG_DEBUG, "Writing %s to %s", writestr, writefile);

	printf("Operation Completed");
	closelog();
	return 0;
	
}

//Create a function to for syslog errorr
void logerror(char *message){
	syslog(LOG_ERR, "%s", message);
}


