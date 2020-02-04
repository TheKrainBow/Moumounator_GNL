/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   gnl.h                                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: magostin <magostin@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/20 14:52:31 by gboucett          #+#    #+#             */
/*   Updated: 2020/02/04 09:57:16 by magostin         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef GNL_H
# define GNL_H

# include <stdlib.h>
# include <unistd.h>
# include <stdio.h>

char	*gnl_gnl_ft_strdup(const char *s1);
void	*gnl_gnl_ft_memmove(void *dst, const void *src, size_t len);
char	*gnl_gnl_ft_strjoin(const char *s1, const char *s2);
int		gnl_gnl_ft_strchr(char *buffer, char chr);
int		gnl(int fd, char **line);

#endif
