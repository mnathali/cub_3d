/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mnathali <mnathali@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/06/20 23:47:02 by zyasuo            #+#    #+#             */
/*   Updated: 2022/07/18 01:44:19 by mnathali         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../include/cub3d.h"
#include <game.h>

int	destroy_window(t_game *game)
{
	mlx_destroy_window(game->window.mlx, game->window.mlx_win);
	clear_game(game);
	exit(0);
}

int	key_hook(int key, t_game *game)
{
	if (key == ESCAPE)
		destroy_window(game);
	player_controller(game, key);
	return (0);
}

int	mouse_hook(int button, int x, int y, t_game *game)
{
	(void)x;
	(void)y;
	player_controller(game, -button);
	return (0);
}

int	expose_hook(t_game *game)
{
	mlx_clear_window(game->window.mlx, game->window.mlx_win);
	three_dimensional_image(game);
	return (0);
}

int	main(int argc, char **argv)
{
	t_game	*game;
	char	*map_path;

	if (argc != 2)
		return (1 * print_error("Error. Usage: ./cub3d file.cub\n"));
	map_path = argv[1];
	if (!is_path_valid(map_path))
		return (1 * print_error("Invalid file extension.\n"));
	game = game_init(WIGHT, HEIGHT, map_path);
	if (!game)
		return (0 * print_error("Error. Check your config file.\n"));
	mlx_key_hook(game->window.mlx_win, key_hook, game);
	mlx_mouse_hook(game->window.mlx_win, mouse_hook, game);
	mlx_hook(game->window.mlx_win, 17, 0, destroy_window, game);
	mlx_expose_hook(game->window.mlx_win, expose_hook, game);
	mlx_loop(game->window.mlx);
}
