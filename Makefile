##
## EPITECH PROJECT, 2017
## imageCompressor
## File description:
## Makefile
##

NAME	=	imageCompressor

SRC	=	./app/Main.hs		\
		./src/Parsing.hs	\

all:	$(NAME)

$(NAME): $(SRC)
	stack build --copy-bins --local-bin-path .

clean:
	stack clean
	rm .stack-work imageCompressor.cabal -rf

fclean:	clean
	$(RM) $(NAME)

re:	fclean all

.PHONY:	all clean fclean re
