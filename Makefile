# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kpuwar <kpuwar@student.42heilbronn.de>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/09 14:26:33 by kpuwar            #+#    #+#              #
#    Updated: 2024/01/09 14:26:39 by kpuwar           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME        = ircserv

CC          = c++
CFLAGS      = -Wall -Wextra -Werror -std=c++98

INCL_DIR    = ./include/
SRC_DIR     = ./src/
OBJ_DIR     = ./obj/

CLASSES     = User
INCLUDE     = $(addprefix $(INCL_DIR), $(addsuffix .hpp, $(CLASSES)))
SRCS        = $(addprefix $(SRC_DIR), $(addsuffix .cpp, main)) $(addprefix $(SRC_DIR), $(addsuffix .cpp, $(CLASSES)))
OBJS        = $(patsubst $(SRC_DIR)%.cpp, $(OBJ_DIR)%.o, $(SRCS))

RM          = rm -rf

$(OBJ_DIR)%.o: $(SRC_DIR)%.cpp $(INCLUDE)
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

$(NAME): $(OBJS) $(SRCS) $(INCLUDE)
	$(CC) $(CFLAGS) $(OBJS) -I $(INCL_DIR) -o $(NAME)

all: $(NAME)

clean: 
	$(RM) $(OBJ_DIR)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
