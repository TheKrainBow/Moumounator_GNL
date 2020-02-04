/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   gnl.c                                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: magostin <magostin@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/20 14:52:24 by gboucett          #+#    #+#             */
/*   Updated: 2020/02/04 10:25:12 by magostin         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "gnl.h"

static int		gnl_gnl_ft_read(int fd, char *buffer, char **line)
{
	char	*tmp;
	int		chr_read;
	int		pos;

	while ((chr_read = read(fd, buffer, BUFFER_SIZE)) && chr_read != -1)
	{
		buffer[chr_read] = 0;
		tmp = gnl_gnl_ft_strjoin(*line, buffer);
		free(*line);
		*line = tmp;
		if ((pos = gnl_gnl_ft_strchr(buffer, '\n')) != -1)
		{
			gnl_gnl_ft_memmove(buffer, buffer + pos, BUFFER_SIZE - pos);
			buffer[BUFFER_SIZE - pos] = 0;
			break ;
		}
	}
	return (chr_read == 0 || chr_read == -1 ? chr_read : 1);
}

int				gnl(int fd, char **line)
{
	static char		buffer[100][BUFFER_SIZE + 1];
	int				pos;

	if (BUFFER_SIZE <= 0 || !line)
		return (-1);
	*line = buffer[fd][0] ? gnl_gnl_ft_strdup(buffer[fd]) : gnl_gnl_ft_strdup("");
	if (!*line)
		return (-1);
	if (!(buffer[fd][0]))
		return (gnl_gnl_ft_read(fd, buffer[fd], line));
	if ((pos = gnl_gnl_ft_strchr(buffer[fd], '\n')) == -1)
		return (gnl_gnl_ft_read(fd, buffer[fd], line));
	gnl_gnl_ft_memmove(buffer[fd], buffer[fd] + pos, BUFFER_SIZE - pos);
	return (1);
}
