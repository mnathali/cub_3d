NAME	=	cub3d
B_NAME	=	cub3d_bonus
CC		=	cc
CFLAGS	=	-Wall -Wextra -Werror #-fsanitize=address

SRC		=	main.c					\
			game.c					\
			user_output.c			\
			get_next_line.c			\
			get_next_line_utils.c	\
			get_file.c				\
			string_utils.c			\
			format_file.c			\
			get_textures.c			\
			clear_game.c			\
			valid_textures.c		\
			get_map_matrix.c		\
			valid_map.c				\
			valid_file.c			\
			mlx_utils.c				\
			player_controller.c		\
			new_player.c			\
			three_dimensional.c		\
			end_and_free.c			

B_SRC	= 	main_bonus.c				\
			game.c						\
			user_output.c				\
			get_next_line.c				\
			get_next_line_utils.c		\
			get_file.c					\
			string_utils.c				\
			format_file.c				\
			get_textures.c				\
			clear_game.c				\
			valid_textures.c			\
			get_map_matrix.c			\
			valid_map.c					\
			valid_file.c				\
			render_minimap_bonus.c		\
			render_player_bonus.c		\
			mlx_utils.c					\
			player_controller_bonus.c	\
			new_player.c				\
			three_dimensional.c			\
			end_and_free.c			

OBJDIR	=	obj
SRCDIR	=	src
INCDIR	=	include

HEADERS	=	cub3d.h			\
			game.h			\
			map.h			\
			get_next_line.h	\

FT_PRINTF 	=	ft_printf/libftprintf.a 
FT_PRINTF_PATH	=	./ft_printf/include

HEAD_DEP	=	${HEADERS:%.h=${INCDIR}/%.h}
MLXLIB	=	/usr/local/lib/libmlx.a

OBJS	=	${SRC:%.c=${OBJDIR}/%.o}

.PHONY : all re clean fclean ${FT_PRINTF}

all : ${NAME}

ifneq ($(shell ${MAKE} -q -C ft_printf/ ; echo $$? ), 0)
${NAME} : ${FT_PRINTF}
endif

${FT_PRINTF}:
	@echo "Making the library."
	${MAKE} -j -C ft_printf/

${OBJDIR} :
	mkdir ${OBJDIR}

${OBJDIR}/%.o: ${SRCDIR}/%.c ${HEAD_DEP} | ${OBJDIR}
	$(CC) ${CFLAGS} -I/usr/include -I ${INCDIR} -I ${FT_PRINTF_PATH} -Imlx -O3 -c $< -o $@

$(NAME): $(OBJS)
	$(CC) ${CFLAGS} $^ ${FT_PRINTF} ${MLXLIB} -framework OpenGL -framework AppKit -o $(NAME)

bonus:
	@make SRC="$(B_SRC)" NAME="$(B_NAME)" all

clean: 
	rm -f ${OBJS} ${B_SRC:%.c=${OBJDIR}/%.o}

fclean: clean
	rm -f ${NAME} ${B_NAME}

re: fclean all
