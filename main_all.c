#include "../../../Projet42/PROJECT:gnl/get_next_line/get_next_line.h"

#include "gnl/gnl.h"
#include <stdio.h>

int			compare_line(char *s1, char *s2)
{
	int		i;

	i = 0;
	if (!s1 && !s2)
		return (1);
	if (!s1 || !s2)
		return (0);
	while (s1[i] && s2[i])
	{
		if (s1[i] != s2[i])
			return (0);
		i++;
	}
	return (1);
}

int			main(int ac, char **av)
{
	char	*line_gnl = NULL;
	char	*line = NULL;
	int		ret_gnl = 1;
	int		ret = 1;
	int		fd;
	int		i = 0;

	fd = open(av[1], 'r');
	while (ret > 0 && ret_gnl > 0 && i > 0)
	{
		ret = get_next_line(fd, &line);
		ret_gnl = gnl(fd, &line_gnl);
		if (ret != ret_gnl || !compare_line(line, line_gnl))
		{
			printf(BRED " KO\n" BWHT);
			free(line);
			free(line_gnl);
			return (0);
		}
	}
	printf(BGRN " OK\n" BWHT);
	free(line);
	free(line_gnl);
	return (1);
}

