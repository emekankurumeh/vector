--
-- Vector
--
-- Copyright (c) 2017, emekankurumeh
--
-- This module is free software; you can redistribute it and/or modify it under
-- the terms of the MIT license. See LICENSE for details.
--

local Vector = {}
Vector.__index = Vector

function Vector:new(angle, magnitude)
  self.type = "Vector"
  self.angle = tonumber(angle)
  self.magnitude = tonumber(magnitude)
end

function Vector:clone()
  return self(self.angle, self.magnitude)
end

function Vector:distance(v)
  if type(v) == "table" and v.type == self.type then
    return math.sqrt((self.angle - v.angle)^2 + (self.magnitude - v.magnitude)^2)
  else
    return math.sqrt((self.angle - v)^2 + (self.magnitude - v)^2)
  end
end

function Vector:middle(v)
  if type(v) == "table" and v.type == self.type then
    return self((self.angle + v.angle) / 2, (self.magnitude + v.magnitude) / 2)
  else
    return self((self.angle + v) / 2, (self.magnitude + v) / 2)
  end
end

function Vector:__add(v)
  if type(v) == "table" and v.type == self.type then
    return self(self.angle + v.angle, self.magnitude + v.magnitude)
  else
    return self(self.angle + v, self.magnitude + v)
  end
end

function Vector:__sub(v)
  if type(v) == "table" and v.type == self.type then
    return self(self.angle - v.angle, self.magnitude - v.magnitude)
  else
    return self(self.angle - v, self.magnitude - v)
  end
end

function Vector:__mul(v)
  if type(v) == "table" and v.type == self.type then
    return self(self.angle * v.angle, self.magnitude * v.magnitude)
  else
    return self(self.angle * v, self.magnitude * v)
  end
end

function Vector:__div(v)
  if type(v) == "table" and v.type == self.type then
    return self(self.angle / v.angle, self.magnitude / v.magnitude)
  else
    return self(self.angle / v, self.magnitude / v)
  end
end

function Vector:__mod(v)
  if type(v) == "table" and v.type == self.type then
    return self(self.angle % v.angle, self.magnitude % v.magnitude)
  else
    return self(self.angle % v, self.magnitude % v)
  end
end

function Vector:__unm()
  return self(-self.angle, -self.magnitude)
end

function Vector:__eq(v)
  if type(v) == "table" and v.type == self.type then
    return (self.angle == v.angle) and (self.magnitude == v.magnitude)
  else
    return (self.angle == v) and (self.magnitude == v)
  end
end

function Vector:__lt(v)
  if type(v) == "table" and v.type == self.type then
    return (self.angle < v.angle) and (self.magnitude < v.magnitude)
  else
    return (self.angle < v) and (self.magnitude < v)
  end
end

function Vector:__le(v)
  if type(v) == "table" and v.type == self.type then
    return (self.angle <= v.angle) and (self.magnitude <= v.magnitude)
  else
    return (self.angle <= v) and (self.magnitude <= v)
  end
end

function Vector:__len(v)
  return self.angle + self.magnitude
end

function Vector:__tostring()
  return ("{%d, %d}"):format(self.angle, self.magnitude)
end

function Vector:__concat(v)
  if type(v) == "table" and v.type == self.type then
    local angle = self.angle * v.angle
    local mag = self.magnitude * v.magnitude
    return angle + mag
  else
    local angle = self.angle * v
    local mag = self.magnitude * v
    return angle + mag
  end
end

function Vector:__call(...)
  local vec = {}
  vec.__index = vec
  setmetatable(vec, self)
  vec:new(...)
  return vec
end

return setmetatable(Vector, Vector)