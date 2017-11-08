return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "1.0.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 10,
  height = 10,
  tilewidth = 32,
  tileheight = 32,
  nextobjectid = 1,
  properties = {},
  tilesets = {
    {
      name = "Tileset",
      firstgid = 1,
      filename = "../tiled/tilesets/water.tsx",
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../graphics/water_expanded.png",
      imagewidth = 256,
      imageheight = 192,
      transparentcolor = "#ffffff",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      terrains = {},
      tilecount = 48,
      tiles = {}
    },
    {
      name = "grass",
      firstgid = 49,
      filename = "../tiled/tilesets/grass.tsx",
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../graphics/tilesets/auto/grass_auto.png",
      imagewidth = 64,
      imageheight = 96,
      transparentcolor = "#86b971",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      terrains = {},
      tilecount = 6,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "Tile Layer 1",
      x = 0,
      y = 0,
      width = 10,
      height = 10,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
        49, 49, 49, 49, 49, 49, 49, 54, 49, 49,
        49, 49, 35, 37, 49, 50, 50, 54, 54, 49,
        49, 49, 41, 11, 21, 37, 50, 50, 54, 52,
        49, 49, 49, 17, 1, 3, 21, 21, 21, 21,
        49, 49, 50, 17, 1, 1, 1, 1, 1, 1,
        49, 49, 50, 17, 1, 1, 1, 1, 1, 1,
        49, 49, 50, 17, 1, 1, 1, 1, 1, 1,
        49, 49, 50, 17, 1, 1, 1, 1, 1, 1,
        49, 49, 50, 17, 1, 1, 1, 1, 1, 1
      }
    }
  }
}
