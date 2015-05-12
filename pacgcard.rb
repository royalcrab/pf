module PacgCards
	@common_cards

	def init_cards
		@common_cards = {}

		@common_cards["GIANT GECKO"] = {
			"Type" => "Monster",
			"Trait" => ["Animal","Basic"],
			"Adventure" => "B",
			"Set" => "Rise of the Runelords",
			"CheckToDefeat" => "Combat",
			"Combat" => 8,
			"Text" => "もし倒されなかったら、GIANT GECKO を閉じられてないロケーションデッキに入れてシャッフルする。",
			"Powers" => nil
		}

		@common_cards["ZOMBIE"] = {
			"Type" => "Monster",
			"Trait" => ["Undead","Zombie","Basic"],
			"Adventure" => "B",
			"Set" => "Rise of the Runelords",
			"CheckToDefeat" => "Combat",
			"Combat" => 9,
			"Text" => "Zombie は Mental と Poison に耐性がある。Zombie に与えられたダメージは半分になる(端数切りあげ)。もし倒せなかったときは、このロケーションにいる各キャラクタは Zombie を召喚して遭遇する。",
			"Powers" => nil
		}

		@common_cards["LARGE CHEST"] = {
			"Type" => "Barrier",
			"Trait" => ["Chache","Lock", "Veteran"],
			"Adventure" => "B",
			"Set" => "Rise of the Runelords",
			"CheckToDefeat" => ["Dexterity","Disable","Strength","Melee"],
			"Dexterity" => 9,
			"Disable" => 9,
			"Strength" => 10,
			"Melee" => 10,									
			"Text" => "Difficulty は現在のシナリオの Adventure Deck の番号だけ増加する。もし倒されたら、1d4 枚のランダム武器カードを手札に加える。もし倒せなかったら、このカードを消滅させてもよい。",
			"Powers" => nil
		}

		@common_cards["FORCE MISSILE"] = {
			"Type" => "Spell",
			"Trait" => ["Magic","Arcane","Attack","Force","Basic"],
			"Adventure" => "B",
			"Set" => "Rise of the Runelords",
			"CheckToAcquire" => ["Intelligence","Arcane"],
			"Intelligence" => 8,
			"Arcane" => 4,
			"Text" => "このカードを捨てて、あなたの Combat Check をあなたの Arcane ダイスに +2d4 して Force 属性をつける。もしあなたが Arcane 属性をもっていなければ、このカードを消滅させる。",
			"Recharge" => ["Arcane",6],
			"Powers" => nil
		}


		@common_cards["CROWBAR"] = {
			"Type" => "Item",
			"Trait" => ["Tool","Basic"],
			"Adventure" => "B",
			"Set" => "Rise of the Runelords",
			"CheckToAcquire" => ["Strength"],
			"Strength" => 3,
			"Text" => "このカードを公開することで、Combat ではない Strength のチェックか Lock か Obstacle の属性をもつ barrier を倒すチェックにダイスを 1 つ追加する。このカードを捨てることで、さらにダイス 1 つを追加してもよい。",
			"Recharge" => ["Strength",3],
			"Powers" => nil
		}

		@common_cards["LONG SWOARD"] = {
			"Type" => "Weapon",
			"Trait" => ["Sword","Melee", "Slashing", "Basic"],
			"Adventure" => "B",
			"Set" => "Rise of the Runelords",
			"CheckToAcquire" => ["Strength","Melee"],
			"Strength" => 6,
			"Melee" => 6,			
			"Text" => "",
			"Powers" => nil
		}

		@common_cards["LEATHER ARMOR"] = {
			"Type" => "Armor",
			"Trait" => ["Light Armor", "Basic"],
			"Adventure" => "B",
			"Set" => "Rise of the Runelords",
			"CheckToAcquire" => ["Constitution","Fortitude"],
			"Constitution" => 2,
			"Fortitude" => 2,			
			"Text" => "",
			"Powers" => nil
		}

		@common_cards["SAGE"] = {
			"Type" => "Ally",
			"Trait" => ["Human","Sage", "Basic"],
			"Adventure" => "B",
			"Set" => "Rise of the Runelords",
			"CheckToAcquire" => ["Wisdom","Charisma","Diplomacy"],
			"Wisdom" => 7,
			"Charisma" => 6,
			"Diplomacy" => 6,
			"Text" => "",
			"Powers" => nil
		}
	end
end
