/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   user_output.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: zyasuo <zyasuo@student.21-school.ru>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/06/21 16:04:33 by zyasuo            #+#    #+#             */
/*   Updated: 2022/06/21 16:11:36 by zyasuo           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <cub3d.h>

int	print_error(char *error)
{
	return (write(2, error, ft_strlen(error)));
}
