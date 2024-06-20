# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id, candidates)
  candidates.find { |candidate| candidate[:id] == id }
end
  
def experienced?(candidate)
  candidate[:years_of_experience] >= 2
end

# Method to check if candidate has at least 100 github points
def github_experience?(candidate)
  candidate[:github_points] >= 100
end

# Method to check if candidate knows ruby or python
def required_languages?(candidate)
  candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python')
end

# Method to check if candidate applied less than 15 days ago
def recent_applicant?(candidate)
  candidate[:date_applied] >= 15.days.ago.to_date
end

# # Method to check if candidate os 18 or olds
def old_enough?(candidate)
  candidate[:age] > 17
end  

# Main method to pull qualified candidates
def qualified_candidates(candidates)
  candidates.select do |candidate|
    experienced?(candidate) &&
    github_experience?(candidate) &&
    required_languages?(candidate) &&
    recent_applicant?(candidate) &&
    old_enough?(candidate)
  end
end
 
# Method to sort all candidates by experience and github points 
def ordered_by_qualifications(candidates)
  candidates.sort_by { |candidate| [-candidate[:years_of_experience], -candidate[:github_points]] }
end
