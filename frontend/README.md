## Frontend  
This is a Flutter project that provides an interface to the pantry inventory backend server. 
Upon connection to a valid server, users are brought to the main page where they may submit recipe URLs for ingredient extraction.

## Screenshots  
| ![Connect Screen](./.assets/connect_page.jpg) | 
|:--:| 
| *Starting page for the app.* |

| ![New Connection](./.assets/adding_connection.jpg) | 
|:--:| 
| *Entering connection details for a server.* |

| ![Selecting a saved connection](./.assets/connect_page_dropdown.jpg) | 
|:--:| 
| *Choosing from previously saved connections.* |

| ![Home page](./.assets/home.jpg) | 
|:--:| 
| *Main page of the app where recipe URLs may be submitted.* |

| ![Extractors page](./.assets/extractors.jpg) | 
|:--:| 
| *Extractor listing page where all supported recipe sites are listed.* |

| ![Ingredients page](./.assets/ingredients_before.jpg) | 
|:--:| 
| *The ingredients in the server before the following extraction and updates.* |

| ![Actual recipe's ingredients](./.assets/real_recipe.jpg) | 
|:--:| 
| *This is a real screenshot taken from the recipe for [Peanut Butter Fudge](https://sallysbakingaddiction.com/peanut-butter-fudge/#tasty-recipes-76130) from Sally's Baking Addiction.* |

| ![Extracted recipe](./.assets/home_extracted.jpg) | 
|:--:| 
| *The ingredients extracted from the above recipe.* |  

Ingredient extraction is not perfect, and some recipes are not perfectly extracted. In this instance, you can see that there are two entries labeled "`Optional`". That's okay! Users can either ignore them entirely, or check such erroneous entries off as being owned. The table view is meant to be read by a person, not a computer; either option taken will not detract from the app's usefulness. Not every recipe is formatted following the rules expected by an extractor and solving such edge cases is a practice in futility.

| ![Marking ingredients as owned](./.assets/home_extracted_updated.jpg) | 
|:--:| 
| *The table enables checking off ingredients as owned directly.* |

| ![Ingredients page with new entries](./.assets/ingredients_after.jpg) | 
|:--:| 
| *Checking the ingredients page, we can verify the new ingredients from the extraction are now listed.* |
