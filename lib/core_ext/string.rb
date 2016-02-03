class String
  BLANK_RE = /\A[[:space:]]*\z/

  def blank?
    BLANK_RE === self
  end
end
