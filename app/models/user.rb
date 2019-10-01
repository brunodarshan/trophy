# frozen_string_literal: true

class User < ApplicationRecord
  has_many :deaths
  has_many :coins_trophies
  has_many :death_trophies
  has_many :killed_monsters
  has_many :killed_monster_trophies
end
