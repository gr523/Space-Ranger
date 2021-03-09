SRCDIR=src
OBDIR=obj
HEADERS=src
IDIR=
_EXCLUDE=highscore.cpp
EXCLUDE=$(patsubst %.cpp,$(OBDIR)/%.o,$(_EXCLUDE))
_OBJ=$(patsubst $(SRCDIR)/%.cpp,$(OBDIR)/%.o,$(wildcard $(SRCDIR)/*.cpp))
OBJ=$(filter-out $(EXCLUDE),$(_OBJ))
LIBS=-lsfml-graphics -lsfml-audio -lsfml-system -lsfml-window
CC=g++ --std=c++17

Program: $(OBJ)
	$(CC) $^ -o $@ $(IDIR) $(LIBS)

$(OBDIR)/main.o: $(SRCDIR)/main.cpp
	$(CC) -c $^ -o $@

$(OBDIR)/Game.o: $(SRCDIR)/Game.cpp $(SRCDIR)/highscore.cpp
	$(CC) -c $< -o $@

$(OBDIR)/%.o: $(SRCDIR)/%.cpp $(HEADERS)/%.h
	$(CC) -c $< -o $@

clean:
	rm $(OBJ)
	rm Program
