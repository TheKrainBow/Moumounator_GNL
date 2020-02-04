/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   gnl_utils.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: magostin <magostin@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/20 14:52:29 by gboucett          #+#    #+#             */
/*   Updated: 2020/02/04 10:23:20 by magostin         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "gnl.h"

void			*gnl_gnl_ft_memmove(void *dst, const void *src, size_t len)
{
	char	*srcc;
	char	*dstc;
	size_t	i;

	i = -1;
	srcc = (char *)src;
	dstc = (char *)dst;
	if (srcc < dstc)
		while ((int)(--len) >= 0)
			*(dstc + len) = *(srcc + len);
	else
		while (++i < len)
			*(dstc + i) = *(srcc + i);
	return (dst);
}

static size_t	ft_strlen(const char *str)
{
	size_t	len;

	len = 0;
	while (str[len] && str[len] != '\n')
		len++;
	return (len);
}

char			*gnl_gnl_ft_strdup(const char *s1)
{
	char	*result;
	size_t	i;

	if (!(result = (char *)malloc(sizeof(char) * (ft_strlen(s1) + 1))))
		return (NULL);
	i = 0;
	while (i++ < ft_strlen(s1))
		result[i - 1] = s1[i - 1];
	result[i - 1] = 0;
	return (result);
}

char			*gnl_gnl_ft_strjoin(const char *s1, const char *s2)
{
	size_t	size;
	char	*result;
	char	*s;

	size = 0;
	if (s1)
		size += ft_strlen(s1);
	if (s2)
		size += ft_strlen(s2);
	if (!(result = (char *)malloc(sizeof(char) * (size + 1))))
		return (NULL);
	s = result;
	if (s1)
		while (*s1)
			*s++ = *s1++;
	if (s2)
		while (*s2 && *s2 != '\n')
			*s++ = *s2++;
	*s = 0;
	return (result);
}

int				gnl_gnl_ft_strchr(char *buffer, char chr)
{
	int		pos;

	pos = 0;
	while (buffer[pos] && buffer[pos] != chr)
		pos++;
	return (buffer[pos] == chr ? pos + 1 : -1);
}
