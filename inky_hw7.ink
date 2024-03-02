As a student at the witch's school, you will eventually take a variety of classes such as courses about spellcasting, familiars, and broom flying.

This year, one of your classes is a potions class. The lab you're doing today: cooking up a simple energizing potion. Your teacher tells you that the end result should be a pretty shimmery blue that's scentless and wakes you up in just a handful of minutes.

You're at the cauldron sequestered away in the corner of the room and you skim over the directions in your potions book. It all looks easy and straightforward to the point it's almost boring.

-> potion_making

== potion_making
= boiling
You light a fire under the cauldron and sit down to wait for it to boil.

+ (boil1) I wait patiently. // following instructions
+ It'll be fine if I don't boil the water first - I can just move on to the next instruction.
    Practically almost every potion starts off with boiling it first. Skipping this step is setting yourself up for an end result that does nothing.
    ++ (boil2) I'll wait patiently then. //following instructions
    ++ (no_boil) It'll be fine. // not following instructions
        I don't know about this-
        -> first_ingredient
    
- Eventually, the water comes to a boil. <>

-> first_ingredient

= first_ingredient

You move on to the next instruction, which tells you to add nettle.

+ (nettle) You look for the nettle and put it in.
    A great start. //following instructions
+ (foxglove) You catch sight of some foxglove and decide to put that in instead. // not following instructions
    That's poisonous!
        ++ That's part of the fun!
        ++ Foxglove is one of the most common potion ingredients!
        --Nevermind how you're not supposed to use them, do you know to prepare them correctly-
        
- You move on to the next step.

-> second_ingredient

= second_ingredient

The next step tells you to add in five newt eyes, which you go to do.

+ You grab the jar of newt eyes.
    ++ (fiveeyes) You count out five newt eyes. //following instructions
        This lab is going smoothly, just as planned.
    ++ (spoonful) You scoop a big spoonful of newt eyes. // not following instructions
        That was... much too many.
    -- You drop the newt eyes to the cauldron.
+ (snakeskin) Adding in shedded snakeskin... // not following instructions
    ...Sometimes one just has to acknowledge that a banana isn't an egg, you know?
    

- You move onto the next and last step.

-> third_ingredient

= third_ingredient 

The last ingredient the recipe calls for you to add is cobwebs.
+ (cobwebs) You put in the cobwebs.
    Almost done!
+ (spider) Why put in cobwebs when you can put in an actual spider?
    Have you seen those reviews on cooking recipes online where people will replace critical ingredients and then complain it tastes horrible? Like using applesauce instead of milk in a muffin recipe.
    

- For the final touch, you wave your wand over the cauldron and mumble the spell that'll infuse your potion with magic, then stir for a couple minutes.

-> test_tasting

== test_tasting

//finished making the potion, time to try it

// if the player followed all of the instructions and put in the right ingredients, then send to one ending. 
// else send player to other ending
{(potion_making.boiling.boil1 or potion_making.boiling.boil2) and potion_making.first_ingredient.nettle and potion_making.second_ingredient.fiveeyes and potion_making.third_ingredient.cobwebs: -> followed_instructions | -> no_instructions}


= followed_instructions // if the player followed every direction to successfully make an energizing potion

The potion is the shimmery blue as the teacher had said it would it. It's time to test it out and see you were successful.

+ (sip) You take a sip.
    ++ You take another sip.
    ++ You wait.
    -- There's doesn't seem to be an immediate effect.
+ (gulp) You take a big gulp.
+ (chug) Chug!!
    Please slow down- is it really smart to- ah. It's all gone.

- You dwaddle around for a few minutes and then you feel it.

//different reactions depending on how much the player drank
{sip: A spark of extra energy. It stays around for just a minute or so before fading away}

{gulp: A spark of extra energy. Suddenly motivated, you finish off the rest of your lab report over the next twenty minutes until it fades away.}

{chug: A rush of extra energy. You finish off the rest of your lab report over the next twenty minutes in a rush and are still buzzing after you submitted it.}

All in all, a success! Wonderful job. You feel confident in your grade for this lab.

-> END

= no_instructions // if the player didn't follow every direction to make the energizing potion
Now that you think about it, since you didn't really follow the proper directions, you're not sure what the potion will do after you drink it. It's certainly not blue, but instead a translucent {~purple | green | orange} shade. You decide not to drink it, just to be safe. You can start your lab assignment over, properly this time.

+ You drink it.
    It's not a good idea to consume that! What if it makes all your hair stand up straight? What if you end up cursed to tripp over your feet every ten steps? What if it just makes your stomach hurt really really badly?
    ++ You're drinking it.
        // narrator is a worrier trying to help the player do the assignment safely :( imagine the narrator throwing their hands up in the air
        :( 
        
        // if you didn't follow any of the directions
        {potion_making.boiling.no_boil and potion_making.first_ingredient.foxglove and (potion_making.second_ingredient.spoonful or potion_making.second_ingredient.snakeskin) and potion_making.third_ingredient.spider: I don't think you followed even one direction... I can't do this anymore. I don't want to look.}
        
        Narrator's narrator: the narrator is by nature a worrier trying to help the player do the lab assignment safely. The narrator is throwing their hands up in the air right now.
        -> END
    ++ On a second thought.
+ [You don't drink it.]

- You set aside your concoction and turn back to your potions book to start the energizing potion over.
-> potion_making // essentially restart the game to try making the potion again
    

-> END