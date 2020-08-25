--this code was written by Dennis Åhlin and is available in its original form at https://github.com/dennisahlin
function transition_icons(icon_from, icon_to)
  if type(icon_to) == "string" then
    return {
      { icon = "__space-exploration-graphics__/graphics/blank.png", scale = 1, shift = {0, 0}, icon_size = 32 }, -- to lock scale
      { icon = icon_from, scale = 0.66, shift = {8, -8}, icon_size = 32 },
      { icon = icon_to, scale = 0.66, shift = {-8, 8}, icon_size = 32 },
      { icon = "__space-exploration-graphics__/graphics/icons/transition-arrow.png", scale = 1, shift = {0, 0}, icon_size = 32 }, -- to overlay
    }
  else
    local icons = {
      { icon = "__space-exploration-graphics__/graphics/blank.png", scale = 1, shift = {0, 0}, icon_size = 32 }, -- to lock scale
      { icon = icon_from, scale = 0.66, shift = {8, -8}, icon_size = 32 },
    }
    for _, icon in pairs(icon_to) do
      table.insert(icons, { icon = icon, scale = 0.5, shift = {-12 + (_-1) * 8, 12}, icon_size = 32 })
    end
    table.insert(icons, { icon = "__space-exploration-graphics__/graphics/icons/transition-arrow.png", scale = 1, shift = {0, 0}, icon_size = 32 })
    return icons
  end
end



local emptyCanisterReprocessing ={
    type = "recipe",
    name = "selb-empty-canister-reprocessing",
    localised_name = {"recipe-name.selb-empty-canister-reprocessing"},
    results = {
      { name="iron-plate", amount = 1},
      { name="plastic-bar", amount = 1 },
    },
    enabled = false,
    energy_required = 2,
    ingredients = {
      { "empty-canister", 5 }
    },
  	icons = transition_icons(
	    data.raw.item["empty-canister"].icon,
	    {
	      data.raw.item["iron-plate"].icon,
	      data.raw.item["plastic-bar"].icon
	    }
	  ),
    category = "hand-hard-recycling",
  	subgroup = "space-recycling",
  	allow_as_intermediate = false,
    always_show_made_in = true,
    always_show_products = true
}


local gasCanisterReprocessing ={
    type = "recipe",
    name = "selb-gas-canister-reprocessing",
    localised_name = {"recipe-name.selb-gas-canister-reprocessing"},
    results = {
      { name="steel-plate", amount = 1}
    },
    enabled = false,
    energy_required = 2,
    ingredients = {
      { "gas-canister", 5 }
    },
  	icons = transition_icons(
	    data.raw.item["gas-canister"].icon,
	    data.raw.item["steel-plate"].icon
	  ),
  	category = "hand-hard-recycling",
  	subgroup = "space-recycling",
  	allow_as_intermediate = false,
    always_show_made_in = true,
    always_show_products = true
}

data:extend{emptyCanisterReprocessing, gasCanisterReprocessing}

local spaceRecyclingFacilityTech = data.raw.technology["se-recycling-facility"]

table.insert(spaceRecyclingFacilityTech.effects, { type = "unlock-recipe", recipe = emptyCanisterReprocessing.name })
table.insert(spaceRecyclingFacilityTech.effects, { type = "unlock-recipe", recipe = gasCanisterReprocessing.name })

--this code was written by walter
data_util = require("__space-exploration__/data_util")
local radiationdatafromplutonium ={
  type = "recipe",
  name = "se-radiaton-data-from-plutonium",
  localised_name = {"recipe-name.se-radiaton-data-from-plutonium"},
  results = {
    { name="se-radiation-data", amount = 1},
    { name="plutonium-239", probability = 0.5, amount =1 },
  },
  enabled = false,
  energy_required = 2,
  ingredients = {
    { name="se-empty-data", amount = 1},
    { name="plutonium-239", amount = 1}
  },
  icon = "__space-exploration-graphics__/graphics/icons/data/radiation.png",
  icon_size = 64,
  category = "space-radiation",
  subgroup = "data-energy",
  allow_as_intermediate = false,
  always_show_made_in = true,
  always_show_products = true
}

local radiationshieldingdatafromplutonium ={
  type = "recipe",
  name = "se-radiaton-shielding-data-from-plutonium",
  localised_name = {"recipe-name.se-radiaton-shielding-data-from-plutonium"},
  results = {
    { name="se-radiation-shielding-data", amount = 1},
    { name="se-contaminated-scrap", amount = 8},
    { name="se-iridium-plate",probability = 0.75, amount = 1},
    { name="plutonium-239", probability = 0.5, amount =1 },
  },
  enabled = false,
  energy_required = 2,
  ingredients = {
    { name="se-empty-data", amount = 1},
    { name="se-material-testing-pack", amount = 4},
    { name="se-iridium-plate", amount = 1},
    { name="plutonium-239", amount =1 },
  },
  icon = "__space-exploration-graphics__/graphics/icons/data/radiation-shielding.png",
  icon_size = 64,
  category = "space-radiation",
  subgroup = "data-material",
  allow_as_intermediate = false,
  always_show_made_in = true,
  always_show_products = true
}

local radiationexposuredatafromplutonium ={
  type = "recipe",
  name = "se-radiaton-exposure-data-from-plutonium",
  localised_name = {"recipe-name.se-radiaton-exposure-data-from-plutonium"},
  results = {
    { name="se-radiation-exposure-data", amount = 1},
    { type="fluid", name="se-contaminated-bio-sludge", amount = 10},
    { name="plutonium-239", probability = 0.5, amount =1 },
  },
  enabled = false,
  energy_required = 2,
  ingredients = {
    { name="se-specimen", amount = 1},
    { name="se-empty-data", amount = 1},
    { name="plutonium-239", amount =1 },
  },
  icon = "__space-exploration-graphics__/graphics/icons/data/radiation-exposure.png",
  icon_size = 64,
  category = "space-radiation",
  subgroup = "data-biological",
  allow_as_intermediate = false,
  always_show_made_in = true,
  always_show_products = true
}

local radiationresistancedatafromplutonium ={
  type = "recipe",
  name = "se-radiaton-resistance-data-from-plutonium",
  localised_name = {"recipe-name.se-radiaton-resistance-data-from-plutonium"},
  results = {
    { name="se-radiation-exposure-resistance-data", amount = 1},
    { type="fluid", name="se-contaminated-bio-sludge",probability =1,amount_min =1, amount_max =10},
    { name="se-significant-specimen", probability = 0.5, amount = 1},
    { name="plutonium-239", probability = 0.5, amount =1 },
  },
  enabled = false,
  energy_required = 2,
  ingredients = {
    { name="se-significant-specimen", amount = 1},
    { name="se-empty-data", amount = 1},
    { name="plutonium-239", amount =1 },
  },
  icon = "__space-exploration-graphics__/graphics/icons/data/radiation-exposure-resistance.png",
  icon_size = 64,
  category = "space-radiation",
  subgroup = "data-biological",
  allow_as_intermediate = false,
  always_show_made_in = true,
  always_show_products = true
}

local se_low_density_structure_beryllium_al={
  type = "recipe",
  name =  "se-low-density-structure-beryllium-al",
  localised_name = {"recipe-name.se-low-density-structure-beryllium-al"},
  result = "low-density-structure",
  enabled = false,
  energy_required = 10,
  ingredients = {
    { name = "se-aeroframe-scaffold", amount = 2},
    { name = "glass", amount = 2},
    { name = "aluminium-plate", amount = 2 },
    { name = "plastic-bar", amount = 2 }
  },
  icon = "__base__/graphics/icons/low-density-structure.png",
  icon_size = 64,
  category = "space-radiation",
  order = "b",
  subgroup = "rocket-intermediate-product",
  stack_size = 50,
  allow_as_intermediate = false,
  always_show_made_in = true,
  always_show_products = true
}
--[[

data.raw.item["rocket-control-unit"].subgroup = "rocket-intermediate-product"
data.raw.item["low-density-structure"].subgroup = "rocket-intermediate-product"
data.raw.item["low-density-structure"].order = "b"
data.raw.item["low-density-structure"].stack_size = 50
data.raw.item["rocket-fuel"].subgroup = "rocket-intermediate-product"
]]
data:extend({
  {
      type = "recipe",
      name = data_util.mod_prefix .. "low-density-structure-beryllium-al",
      result = "low-density-structure",
      energy_required = 10,
      ingredients = {
        { name = data_util.mod_prefix .. "aeroframe-scaffold", amount = 2},
        { name = "glass", amount = 2},
        { "aluminium-plate", amount = 2 },
        { "plastic-bar", amount = 2 }
      },
      requester_paste_multiplier = 2,
      enabled = false,
      always_show_made_in = false,
      allow_as_intermediate = false,
    }
}
)--]]
data:extend{radiationdatafromplutonium,radiationshieldingdatafromplutonium,radiationexposuredatafromplutonium,radiationresistancedatafromplutonium,se_low_density_structure_beryllium_al}


table.insert(data.raw.technology[data_util.mod_prefix .. "aeroframe-scaffold"], { type = "unlock-recipe", recipe = se_low_density_structure_beryllium_al.name})
table.insert(data.raw.technology["se-space-catalogue-energy-1"].effects, { type = "unlock-recipe", recipe = radiationdatafromplutonium.name })
table.insert(data.raw.technology["se-space-catalogue-material-3"].effects, { type = "unlock-recipe", recipe = radiationshieldingdatafromplutonium.name })
table.insert(data.raw.technology["se-space-catalogue-biological-3"].effects, { type = "unlock-recipe", recipe = radiationexposuredatafromplutonium.name })
table.insert(data.raw.technology["se-space-catalogue-biological-4"].effects, { type = "unlock-recipe", recipe = radiationresistancedatafromplutonium.name })

data_util = require("__space-exploration__/data_util")
--se_delivery_cannon_recipes["iron-ore"] = {name="iron-ore"}
--safe adding of elements to a list without duplication
function add_to_table(table,item,index)
  if(data_util.table_contains(table, item)) then
    return
  else
    table[index]={name=item}
  end
end

function check_in_table(table,str)
  if not str then 
    --log("no subtype")
    return false 
  end
  for _,field in pairs(table) do
    if field==str or string.find(str,field) then --field==str or
      --log(str .. "successfull")
    --if( string.match(field,str)) then
      return true
    end
  end
  --log(str)
  return false
end

--adding angels and bobs to delivery cannon, by recipe subgroup
--names of the subgroups that should be added, the code is save, even if subgroups get removed from the game.
local sgroups={--list of strings, can contain lua "regex"
'petrochem-raw-fluids',
'ore-sorting-fluid',
'petrochem-carbon-fluids',
'petrochem-basic-fluids',
'petrochem-chlorine-fluids',
'petrochem-sulfer-fluids',
'petrochem-nitrogen-fluids',
'petrochem.*fluids',
'angels-ores',
'angels.*casting$',
'ore-processing-a',
'ore-processing-b',
'ore-processing-c',
'ore-processing-d',
'bob-ores',
'angels-iron',
'angels-aluminium',
'angels-chrome',
'angels-coal',
'angels-cobalt',
'angels-copper',
'angels-glass',
'angels-gold',
'angels-lead',
'angels-manganese',
'angels-nickel',
'angels-platinum',
'angels-silicon',
'angels-silver',
'angels-stone',
'angels-tin',
'angels-titanium',
'angels-tungsten',
'angels-zinc',
'angels-alloys',
'angels-power-nuclear-processing '
}
se_delivery_cannon_recipes = se_delivery_cannon_recipes or {}
--add all fluids that have barreling recipes
for _, fluid in pairs(data.raw["fluid"]) do
  if check_in_table(sgroups,fluid.subgroup) then
    add_to_table(se_delivery_cannon_recipes,fluid.name .. "-barrel",fluid.name)
  end
end

for _, item in pairs(data.raw["item"]) do
  if check_in_table(sgroups,item.subgroup) then
    add_to_table(se_delivery_cannon_recipes,item.name,item.name)
  end
end

