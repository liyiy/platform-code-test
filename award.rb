class Award
  attr_reader :name, :expires_in, :quality 

  BLUE_FIRST = "Blue First"
  BLUE_COMPARE = "Blue Compare"
  BLUE_DISTINCTION_PLUS = "Blue Distinction Plus"
  BLUE_STAR = "Blue Star"
  NORMAL = "Normal"

  def initialize(name, expires_in, quality)
    @name = name
    @expires_in = expires_in
    @quality = quality
    set_type
  end

  def update_quality
    case @type
    when BLUE_FIRST 
      blue_first_update()
    when BLUE_COMPARE 
      blue_compare_update()
    when BLUE_DISTINCTION_PLUS
      blue_distinction_plus_update()
    when BLUE_STAR
      blue_star_update()
    else 
      normal_update()
    end 
    
  end

  private

  def set_type
    case @name
    when BLUE_FIRST
      @type = BLUE_FIRST
    when BLUE_COMPARE 
      @type = BLUE_COMPARE 
    when BLUE_DISTINCTION_PLUS
      @type = BLUE_DISTINCTION_PLUS
    when BLUE_STAR 
      @type = BLUE_STAR 
    else 
      @type = NORMAL
    end 

  end

  def update_expiration 
    @expires_in -= 1
  end

  def blue_first_update
    if @quality < 50 
      if @expires_in > 0 
        @quality += 1
      else  
        if @quality >= 48 
          @quality = 50 
        else 
          @quality += 2
        end 
      end 
    end 
    update_expiration()
  end

  def blue_compare_update 
    if @expires_in <= 0 
      @quality = 0 
    elsif @quality < 50 
      if @expires_in <= 5 
        @quality += 3 
      elsif @expires_in <= 10 
        @quality += 2 
      else  
        @quality += 1
      end 
    end 
    update_expiration()
  end

  def base_award_update(multiplier=1)
    if @quality > 0 
      if @expires_in > 0 
        @quality -= (1 * multiplier)
      else  
        if @quality <= (2 * multiplier) 
          @quality = 0 
        else 
          @quality -= (2 * multiplier)
        end 
      end 
    end  
  end

  def blue_distinction_plus_update 
    if @quality < 80 
      @quality += 1 
    end 
  end

  def blue_star_update 
    base_award_update(2)
    update_expiration() 
  end

  def normal_update 
    base_award_update()
    update_expiration()
  end
end