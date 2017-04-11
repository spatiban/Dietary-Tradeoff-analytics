
list_of_nutrients <- data.frame( 
                              name = ""
                             ,serving_size = " "
                             ,vitamin_A_pcent = " "
                             ,calories = " "
                             ,calories_from_fat = " "
                             ,carbs_in_grams = " "
                             ,carbs_pcent = " "
                             ,cholesterol_mg = " "
                             ,cholesterol_pcent = " "
                             ,fat_in_grams = " "
                             ,fat_pcent = " "
                             ,fiber_grams = " "
                             ,fiber_pcent = " "
                             ,potassium_in_mg = " "
                             ,potassium_pcent = " "
                             ,protein_in_grams = " "
                             ,saturated_fat_pcent = " "
                             ,saturated_fat_in_grams = " "
                             ,sodium_in_mg = " "
                             ,sodium_pcent = " "
                             ,sugar_in_grams = " "
                             ,vitamin_C_pcent = " "
                             ,stringsAsFactors = FALSE )

#Going through recipes dataframe
for(i in output1$V1)
{
  print(i)
  try({
    remdr$navigate("https://www.caloriecount.com/main-dish-recipes-rc27")
    data <- vector()
    searchrecipe <- remdr$findElement(using = "css selector","#nav-search-input")
    searchrecipe$sendKeysToElement(list(i))
    search_click <-remdr$findElement(using = 'css selector', ".search-nav")
    search_click$clickElement()
    Sys.sleep(10)
    #searchrecipe$sendKeysToElement(list(i, key = "enter"))
    therecipe <- remdr$findElement(using = "css selector","#searchResultsDiv > ol:nth-child(4) > li:nth-child(1) > a:nth-child(1)")
    therecipe$clickElement()
    Sys.sleep(10)
    #name of recipe
    name <- remdr$findElement(using = "css selector","h1")
    data <- unlist(name$getElementText())
    
    #size
    size <- remdr$findElement(using = "css selector",".serving")
    data <- append(data,unlist(size$getElementText()))
    
    #vitamin_A_pcent
    vitamin_A_pcent <- remdr$findElement(using = "css selector",".vitamins tr:nth-child(1) td:nth-child(1)")
    data <- append(data,unlist(vitamin_A_pcent$getElementText()))
    
    #calories
    calories <- remdr$findElement(using = "css selector","tr:nth-child(5) .label .weight")
    data <- append(data,unlist(calories$getElementText()))
    
    #calories_from_fat
    calories_from_fat <- remdr$findElement(using = "css selector",".label+ .labellight .weight")
    data <- append(data,unlist(calories_from_fat$getElementText()))
    
    #carbs_in_grams
    carbs_in_grams <- remdr$findElement(using = "css selector","tr:nth-child(13) .weight")
    data <- append(data,unlist(carbs_in_grams$getElementText()))
    
    #carbs_pcent
    carbs_pcent <- remdr$findElement(using = "css selector","tr:nth-child(13) .dv")
    data <- append(data,unlist(carbs_pcent$getElementText()))
    
    #cholesterol_mg
    cholesterol_mg <- remdr$findElement(using = "css selector","tr:nth-child(10) .weight")
    data <- append(data,unlist(cholesterol_mg$getElementText()))
    
    #cholesterol_pcent
    cholesterol_pcent <- remdr$findElement(using = "css selector","tr:nth-child(10) .dv")
    data <- append(data,unlist(cholesterol_pcent$getElementText()))
    
    #fat_in_grams
    fat_in_grams <- remdr$findElement(using = "css selector","tr:nth-child(7) .weight")
    data <- append(data,unlist(fat_in_grams$getElementText()))
    
    #fat_pcent
    fat_pcent <- remdr$findElement(using = "css selector","tr:nth-child(7) .dv")
    data <- append(data,unlist(fat_pcent$getElementText()))
    
    #fiber_grams
    fiber_grams <- remdr$findElement(using = "css selector","tr:nth-child(14) .weight")
    data <- append(data,unlist(fiber_grams$getElementText()))
    
    #fiber_pcent
    fiber_pcent <- remdr$findElement(using = "css selector","tr:nth-child(14) .dv")
    data <- append(data,unlist(fiber_pcent$getElementText()))
    
    #potassium_in_mg
    potassium_in_mg <- remdr$findElement(using = "css selector","tr:nth-child(12) .weight")
    data <- append(data,unlist(potassium_in_mg$getElementText()))
    
    #potassium_pcent
    potassium_pcent <- remdr$findElement(using = "css selector","tr:nth-child(12) .dv")
    data <- append(data,unlist(potassium_pcent$getElementText()))
    
    #protein_in_grams
    protein_in_grams <- remdr$findElement(using = "css selector","tr:nth-child(16) .weight")
    data <- append(data,unlist(protein_in_grams$getElementText()))
    
    #saturated_fat_pcent
    saturated_fat_pcent <- remdr$findElement(using = "css selector","tr:nth-child(8) .dv")
    data <- append(data,unlist(saturated_fat_pcent$getElementText()))
    
    #saturated_fat_in_grams
    saturated_fat_in_grams <- remdr$findElement(using = "css selector","tr:nth-child(8) .weight")
    data <- append(data,unlist(saturated_fat_in_grams$getElementText()))
    
    #sodium_in_mg
    sodium_in_mg <- remdr$findElement(using = "css selector","tr:nth-child(11) .weight")
    data <- append(data,unlist(sodium_in_mg$getElementText()))
    
    #sodium_pcent
    sodium_pcent <- remdr$findElement(using = "css selector","tr:nth-child(11) .dv")
    data <- append(data,unlist(sodium_pcent$getElementText()))
    
    #sugar_in_grams
    sugar_in_grams <- remdr$findElement(using = "css selector","tr:nth-child(15) .weight")
    data <- append(data,unlist(sugar_in_grams$getElementText()))
    
    #vitamin_C_pcent
    vitamin_C_pcent <- remdr$findElement(using = "css selector","#nutritionfacts tr:nth-child(1) td~ td+ td")
    data <- append(data,unlist(vitamin_C_pcent$getElementText()))
   
    
    list_of_nutrients <- rbind(list_of_nutrients,data)},silent = TRUE)
}

write.csv(list_of_nutrients, file = "nutrient_file.csv")
