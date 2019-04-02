require 'award'

def update_expiration(award)
  award.expires_in -= 1 
end

def blue_first_update(award)
  if award.expires_in > 0 && award.quality < 50
    award.quality += 1 
  elsif award.expires_in <= 0 && award.quality < 50
    if award.quality >= 48
      award.quality = 50 
    else 
      award.quality += 2
    end
  end 

  update_expiration(award)
  return award 
end 

def blue_compare_update(award)
  if award.expires_in <= 0 
    award.quality = 0  
  elsif award.expires_in <= 5 && award.quality < 50
    award.quality += 3 
  elsif award.expires_in <= 10 && award.quality < 50
    award.quality += 2
  elsif award.quality < 50  
    award.quality += 1 
  end 
  update_expiration(award)
  return award 
end

def blue_distinction_update(award)
  if award.quality < 80 
    award.quality += 1
  end 
  return award 
end 

def update_quality(awards)
  awards.each do |award| 
    if award.name == 'Blue First'
      blue_first_update(award)
    elsif award.name == 'Blue Compare'
      blue_compare_update(award)
    elsif award.name == 'Blue Distinction Plus'
      blue_distinction_update(award)
    end 
  end 
end 


# def update_quality(awards)
  # awards.each do |award|

  #   if award.name != 'Blue First' && award.name != 'Blue Compare'
  #     if award.quality > 0
  #       if award.name != 'Blue Distinction Plus'
  #         award.quality -= 1
  #       end
  #     end
  #   else
  #     if award.quality < 50
  #       award.quality += 1
  #       if award.name == 'Blue Compare'
  #         if award.expires_in < 11
  #           if award.quality < 50
  #             award.quality += 1
  #           end
  #         end
  #         if award.expires_in < 6
  #           if award.quality < 50
  #             award.quality += 1
  #           end
  #         end
  #       end
  #     end
  #   end
  #   if award.name != 'Blue Distinction Plus'
  #     award.expires_in -= 1
  #   end
  #   if award.expires_in < 0
  #     if award.name != 'Blue First'
  #       if award.name != 'Blue Compare'
  #         if award.quality > 0
  #           if award.name != 'Blue Distinction Plus'
  #             award.quality -= 1
  #           end
  #         end
  #       else
  #         award.quality = award.quality - award.quality
  #       end
  #     else
  #       if award.quality < 50
  #         award.quality += 1
  #       end
  #     end
  #   end
  # end
# end
