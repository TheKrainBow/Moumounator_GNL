/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   gnl.h                                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: magostin <magostin@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/20 14:52:31 by gboucett          #+#    #+#             */
/*   Updated: 2020/02/16 20:12:20 by magostin         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef GNL_H
# define GNL_H

# include <stdlib.h>
# include <unistd.h>
# include <stdio.h>
# define RED   "\x1B[31m"
# define GRN   "\x1B[32m"
# define YEL   "\x1B[33m"
# define BLU   "\x1B[34m"
# define MAG   "\x1B[35m"
# define CYN   "\x1B[36m"
# define WHT   "\x1B[37m"
# define RESET "\x1B[0m"
# define BRED   "\x1B[1;31m"
# define BGRN   "\x1B[1;32m"
# define BYEL   "\x1B[1;33m"
# define BBLU   "\x1B[1;34m"
# define BMAG   "\x1B[1;35m"
# define BCYN   "\x1B[1;36m"
# define BWHT   "\x1B[1;37m"

char	*gnl_gnl_ft_strdup(const char *s1);
void	*gnl_gnl_ft_memmove(void *dst, const void *src, size_t len);
char	*gnl_gnl_ft_strjoin(const char *s1, const char *s2);
int		gnl_gnl_ft_strchr(char *buffer, char chr);
int		gnl(int fd, char **line);

#endif
