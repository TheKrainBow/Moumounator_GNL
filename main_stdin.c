#include "../../../Projet42/PROJECT:gnl/gnl2/get_next_line.h"

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

int main(void)
{
	char	*line_gnl = NULL;
	char	*line = NULL;
	int		ret = 1;
	int		fd;

	while (ret > 0)
		ret = get_next_line(0, &line);
	printf("get_next_line returned %d\n", ret);
	free(line);
	return (1);
}

