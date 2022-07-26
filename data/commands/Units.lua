Units = {}
Units.list = {
	['length'] = {
		['mm'] = 0.001,
		['cm'] = 0.01,
		['dm'] = 0.1,
		['m']  = 1,
		['km'] = 1000,

		['planck_length'] = tonumber(1.616255e-35),
		['au'] = 149597870700,
		['ls'] = 299792458,
		['lm'] = 17987547480,
		['ly'] = tonumber(9.460731e+15),

		['inch'] = 0.0254,
		['ft']   = 0.3048,
		['yard'] = 0.9144,
		['mi']   = 1609.344
	},
	['area'] = {
		['mm2'] = 0.000001,
		['cm2'] = 0.0001,
		['dm2'] = 0.01,
		['m2']  = 1,
		['km2'] = 1000000,
		['are'] = 100,

		['inch2'] = 0.00064516,
		['yard2'] = 8.361274,
		['ft2']  = 0.9290304,
		['mi2']  = 2589988.110336,
		['acre'] = 4046.86
	},
	['volume'] = {
		['ml'] = 0.001,
		['l']  = 1,

		['m3']  = 1000,
		['dm3'] = 1,
		['cm3'] = 0.001,
		['mm3'] = 0.000001,

		['inch3'] = 0.01638706,
		['ft3'] = 28.31685,
		['yard3'] = 764.5549,
		['gallon_us'] = 3.7854,
		['gallon_imp'] = 4.55,

		['oil_barrel']  = 158.9873,
		['beer_barrel'] = 117.3478,

		['cup_imp'] = 0.284131,
		['cup_us']  = 0.24,

		['teaspoon_imp'] = 0.005919,
		['teaspoon_us']  = 0.004929,

		['tablespoon_imp'] = 0.01776,
		['tablespoon_us']  = 0.01479,

		['fluid_ounce_imp'] = 0.0284131,
		['fluid_ounce_us']  = 0.02957344,

		['pint'] = 0.4731765,
		['drop'] = 0.00005
	},
	['mass'] = {
		['mg'] = 0.001,
		['g'] = 1,
		['kg'] = 1000,
		['t'] = 1000000,
		['planck_mass'] = tonumber(2.176434e-8),

		['lbs']  = 453.59,
		['t_us'] = 907180,
		['oz']   = 28.35
	},
	['speed'] = {
		['km/h'] = 1,
		['m/s']  = 3.6,
		['lightspeed'] = 1079252848.7999,

		['mph']  = 1.609344,
		['ft/s'] = 1.09728,

		['knot'] = 1.852001
	},
	['duration'] = {
		['planck_time'] = (1/60)*tonumber(5.391247e-44),
		['nanosecond']  = (1/60)*0.000000001,
		['microsecond'] = (1/60)*0.000001,
		['millisecond'] = (1/60)*0.001,
		['second']      = 1/60,
		['kilosecond']  = (1/60)*1000,
		['minute'] = 1,
		['hour'] = 60,
		['day'] = 1440,
		['week'] = 10080,
		['fortnight'] = 20160,
		['month'] = 43830,
		['year'] = 525960,
		['decade'] = 5259600,
		['century'] = 52596000,
		['milennium'] = 525960000
	},
	['temperature'] = {
		['c'] = 1,
		['k'] = 1,
		['f'] = 5/9,
		['r'] = 5/9,
		['planck_temperature'] = tonumber(1.416784e+32)
	}
}

local list = Units.list['temperature']
local offset = {
	['c'] = 0,
	['f'] = 32,
	['k'] = 273.15
}
Units.temp = {
	convertToC = nil,
	convertToX = nil
}

Units.temp.convertToC = function (numX, fromUnit)
	local out = nil
	if fromUnit == 'c' then
		out = numX
	end
	if fromUnit == 'k' then
		out = numX - offset['k']
	end
	if fromUnit == 'planck_temperature' then
		out = list['planck_temperature'] * numX - offset['k']
	end
	if fromUnit == 'f' then
		out = list['f'] * (numX - offset['f'])
	end
	if fromUnit == 'r' then
		out = (numX - 491.67) * list['r']
	end
	return out
end
Units.temp.convertToX = function (numC, toUnit)
	local out = nil
	if toUnit == 'c' then
		out = numC
	end
	if toUnit == 'k' then
		out = numC + offset['k']
	end
	if toUnit == 'planck_temperature' then
		out = (numC + offset['k']) / list['planck_temperature']
	end
	if toUnit == 'f' then
		out = numC / list['f'] + offset['f']
	end
	if toUnit == 'r' then
		out = (numC + offset['k']) / list['r']
	end
	return out
end

return Units
