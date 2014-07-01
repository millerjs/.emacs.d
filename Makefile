C = gcc


all: parse-jump

%.o: %.cpp 
	$(C) $(CCFLAGS) $< -c

parse-jump: parse-jump.o
	$(C) $^ -o parse-jump

clean:
	rm *.o

