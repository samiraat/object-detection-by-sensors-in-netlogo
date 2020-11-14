globals [cx cy flag1 flag2 flag3 flag4 flag5 flag6 flag7 flag8 flag9
         buff1 buff2 buff3 buff4 buff5 buff6 buff7 buff8 buff9
         en1 en2 en3 en4 en5 en6 en7 en8 en9
         corx cory corx-des cory-des
         list1 list2 list3 list4 list5 list6 list7 list8 list9
         listp1 listp2 p1 p2
         num_sensor

         last_sen
         p3 p4
         mi b
         ]
breed [ sensors sensor]
breed [ objects object]
breed [ bases base]


sensors-own [ x y energy ]
bases-own [ x y infom infob ]
objects-own [ x y ]

to setup
  clear-all
  create-sensors 1 [
    setxy 6 24
    set shape "flag"
    set color white
    set label 1
    set energy 1000
  ]

  create-sensors 1 [
    setxy 30 16
    set shape "flag"
    set color white
    set label 2
    set energy 1000
  ]

  create-sensors 1 [
    setxy 17 13
    set shape "flag"
    set color white
    set label 3
    set energy 1000
  ]

  create-sensors 1 [
    setxy 7 16
    set shape "flag"
    set color white
    set label 4
  ]

  create-sensors 1 [
    setxy 30 6
    set shape "flag"
    set color white
    set label 5
    set energy 1000
  ]

  create-sensors 1 [
    setxy 18 7
    set shape "flag"
    set color white
    set label 6
  ]

  create-sensors 1 [
    setxy 5 7
    set shape "flag"
    set color white
    set label 7
    set energy 1000
  ]

  create-sensors 1 [
    setxy 29 27
    set shape "flag"
    set color white
    set label 8
    set energy 1000
  ]

  create-sensors 1 [
    setxy 11 25
    set shape "flag"
    set color white
    set label 9
    set energy 1000
  ]


  create-objects 1 [
    setxy 2 0
    set x 2
    set y 0
    set shape "car"
    set color red
    set heading 135
  ]
  set corx 2
  set cory 0
  set corx-des 36
  set cory-des 30



  create-bases 1[
    setxy 0 0
    set shape "target"
    set color yellow
  ]

  set cx 6               ;; x coordinate of patch you want to circle
  set cy 24
  circle

  set cx 30
  set cy 16
  circle

  set cx 17
  set cy 13
  circle

  set cx 7
  set cy 16
  circle

  set cx 30
  set cy 6
  circle

  set cx 18
  set cy 7
  circle

  set cx 5
  set cy 7
  circle

  set cx 29
  set cy 27
  circle

  set cx 11
  set cy 25
  circle

  set en1 1000
  set en2 1000
  set en3 1000
  set en4 1000
  set en5 1000
  set en6 1000
  set en7 1000
  set en8 1000
  set en9 1000
  set buff1 []
  set buff2 []
  set buff3 []
  set buff4 []
  set buff5 []
  set buff6 []
  set buff7 []
  set buff8 []
  set buff9 []
  set list1 [ 0 0 0 0 0 0 0 0 0 ]
  set list2 [ 0 0 0 0 0 0 0 0 0 ]
  set list3 [ 0 0 0 0 0 0 0 0 0 ]
  set list4 [ 0 0 0 0 0 0 0 0 0 ]
  set list5 [ 0 0 0 0 0 0 0 0 0 ]
  set list6 [ 0 0 0 0 0 0 0 0 0 ]
  set list7 [ 0 0 0 0 0 0 0 0 0 ]
  set list8 [ 0 0 0 0 0 0 0 0 0 ]
  set list9 [ 0 0 0 0 0 0 0 0 0 ]
  set num_sensor 0
;  set info []
;  set listp1 []
;  set listp2 []
  set p3 []
  set p4 []
  set p1 []
  set p2 []
  reset-ticks
end

to object1

  ask bases [ setxy 0 0 ]
    print ("for object 1 ")
  while [ corx < corx-des or cory < cory-des ][
    tick
    start-detection
    recognize-behaviour-of-object-1
    negotiation

    ask objects [ setxy corx + 1 cory + 15 / 17
                set corx corx + 1
                set cory cory + 15 / 17 ]
      ask objects [ show list xcor ycor ]
    ask sensors [ set color white ]
  ]
;  ask objects [ show list xcor ycor ]
  tick
  tick
  if any? sensors with [color = magenta ] = false [
    if flag1 = true [ set last_sen 0 ]
    if flag2 = true [ set last_sen 1 ]
    if flag3 = true [ set last_sen 2 ]
    if flag4 = true [ set last_sen 3 ]
    if flag5 = true [ set last_sen 4 ]
    if flag6 = true [ set last_sen 5 ]
    if flag7 = true [ set last_sen 6 ]
    if flag8 = true [ set last_sen 7 ]
    if flag9 = true [ set last_sen 8 ]
  ]

  print (word  " time and radius for sensor 1 " buff1)
  print (word  " time and radius for sensor 2 " buff2)
  print (word  " time and radius for sensor 3 " buff3)
  print (word  " time and radius for sensor 4 " buff4)
  print (word  " time and radius for sensor 5 " buff5)
  print (word  " time and radius for sensor 6 " buff6)
  print (word  " time and radius for sensor 7 " buff7)
  print (word  " time and radius for sensor 8 " buff8)
  print (word  " time and radius for sensor 9 " buff9)

  equation
  ask sensor 7 [ ask bases [ set infom mi
    set infob b]]
end
to object2
  ask bases [ setxy 0 0 ]
    print ("for object 2 ")
  set buff1 []
  set buff2 []
  set buff3 []
  set buff4 []
  set buff5 []
  set buff6 []
  set buff7 []
  set buff8 []
  set buff9 []
   ask objects [ setxy 36 22
                 ]
   set corx 36
  set cory 22
  set corx-des 0
  set cory-des 20
   while [ corx > corx-des or  cory > cory-des ][
    tick
    start-detection
    recognize-behaviour-of-object-2
    negotiation

    ask objects [ setxy corx - 1 cory - 1 / 18
                set corx corx - 1
                set cory cory - 1 / 18 ]
      ask objects [ show list xcor ycor ]
    ask sensors [ set color white ]
  ]
  ask objects [ show list xcor ycor ]
  tick
  tick
  if any? sensors with [color = magenta ] = false [
    if flag1 = true [ set last_sen 0 ]
    if flag2 = true [ set last_sen 1 ]
    if flag3 = true [ set last_sen 2 ]
    if flag4 = true [ set last_sen 3 ]
    if flag5 = true [ set last_sen 4 ]
    if flag6 = true [ set last_sen 5 ]
    if flag7 = true [ set last_sen 6 ]
    if flag8 = true [ set last_sen 7 ]
    if flag9 = true [ set last_sen 8 ]
  ]

  print (word  " time and radius for sensor 1 " buff1)
  print (word  " time and radius for sensor 2 " buff2)
  print (word  " time and radius for sensor 3 " buff3)
  print (word  " time and radius for sensor 4 " buff4)
  print (word  " time and radius for sensor 5 " buff5)
  print (word  " time and radius for sensor 6 " buff6)
  print (word  " time and radius for sensor 7 " buff7)
  print (word  " time and radius for sensor 8 " buff8)
  print (word  " time and radius for sensor 9 " buff9)

  equation
  ask sensor 0 [ ask bases [ set infom mi
    set infob b]]
end

to object3
  ask bases [ setxy 36 36 ]
    print ("for object 3 ")
  set buff1 []
  set buff2 []
  set buff3 []
  set buff4 []
  set buff5 []
  set buff6 []
  set buff7 []
  set buff8 []
  set buff9 []

   ask objects [ setxy 28 0
                 ]
   set corx 28
  set cory 0
  set corx-des 20
  set cory-des 36
   while [ corx > corx-des and cory < cory-des ][

    tick
    start-detection
    recognize-behaviour-of-object-3
    negotiation

    ask objects [ setxy corx - 2 / 9 cory + 1
                set corx corx - 2 / 9
                set cory cory + 1 ]
      ask objects [ show list xcor ycor ]
    ask sensors [ set color white ]
  ]
;  ask objects [ show list xcor ycor ]
  tick
  tick
  if any? sensors with [color = magenta ] = false [
    if flag1 = true [ set last_sen 0 ]
    if flag2 = true [ set last_sen 1 ]
    if flag3 = true [ set last_sen 2 ]
    if flag4 = true [ set last_sen 3 ]
    if flag5 = true [ set last_sen 4 ]
    if flag6 = true [ set last_sen 5 ]
    if flag7 = true [ set last_sen 6 ]
    if flag8 = true [ set last_sen 7 ]
    if flag9 = true [ set last_sen 8 ]
  ]

  print (word  " time and radius for sensor 1 " buff1)
  print (word  " time and radius for sensor 2 " buff2)
  print (word  " time and radius for sensor 3 " buff3)
  print (word  " time and radius for sensor 4 " buff4)
  print (word  " time and radius for sensor 5 " buff5)
  print (word  " time and radius for sensor 6 " buff6)
  print (word  " time and radius for sensor 7 " buff7)
  print (word  " time and radius for sensor 8 " buff8)
  print (word  " time and radius for sensor 9 " buff9)

  equation
  ask sensor 1 [ ask bases [ set infom mi
    set infob b]]
end

to object4
  ask bases [ setxy 36 36 ]
     set buff1 []
  set buff2 []
  set buff3 []
  set buff4 []
  set buff5 []
  set buff6 []
  set buff7 []
  set buff8 []
  set buff9 []
  print ("for object 4 ")
   ask objects [ setxy 16 36
                 ]
   set corx 16
  set cory 36
  set corx-des 36
  set cory-des 3
   while [ corx < corx-des or cory > cory-des ][
    tick
    start-detection
    recognize-behaviour-of-object-4
    negotiation

    ask objects [ setxy corx + 20 / 33 cory - 1
                set corx corx + 20 / 33
                set cory cory - 1 ]
      ask objects [ show list xcor ycor ]
    ask sensors [ set color white ]
  ]
;  ask objects [ show list xcor ycor ]
  tick
  tick
  if any? sensors with [color = magenta ] = false [
    if flag1 = true [ set last_sen 0 ]
    if flag2 = true [ set last_sen 1 ]
    if flag3 = true [ set last_sen 2 ]
    if flag4 = true [ set last_sen 3 ]
    if flag5 = true [ set last_sen 4 ]
    if flag6 = true [ set last_sen 5 ]
    if flag7 = true [ set last_sen 6 ]
    if flag8 = true [ set last_sen 7 ]
    if flag9 = true [ set last_sen 8 ]
  ]

  print (word  " time and radius for sensor 1 " buff1)
  print (word  " time and radius for sensor 2 " buff2)
  print (word  " time and radius for sensor 3 " buff3)
  print (word  " time and radius for sensor 4 " buff4)
  print (word  " time and radius for sensor 5 " buff5)
  print (word  " time and radius for sensor 6 " buff6)
  print (word  " time and radius for sensor 7 " buff7)
  print (word  " time and radius for sensor 8 " buff8)
  print (word  " time and radius for sensor 9 " buff9)
 equation
 ask sensor 4 [ ask bases [ set infom mi
    set infob b]]
end
to go
  print ("for object 1 ")
  while [ corx < corx-des or cory < cory-des ][
    tick
    start-detection
    recognize-behaviour-of-object-1
    negotiation

    ask objects [ setxy corx + 1 cory + 15 / 17
                set corx corx + 1
                set cory cory + 15 / 17 ]
      ask objects [ show list xcor ycor ]
    ask sensors [ set color white ]
  ]
;  ask objects [ show list xcor ycor ]
  tick
  tick
  if any? sensors with [color = magenta ] = false [
    if flag1 = true [ set last_sen 0 ]
    if flag2 = true [ set last_sen 1 ]
    if flag3 = true [ set last_sen 2 ]
    if flag4 = true [ set last_sen 3 ]
    if flag5 = true [ set last_sen 4 ]
    if flag6 = true [ set last_sen 5 ]
    if flag7 = true [ set last_sen 6 ]
    if flag8 = true [ set last_sen 7 ]
    if flag9 = true [ set last_sen 8 ]
  ]

  print (word  " time and radius for sensor 1 " buff1)
  print (word  " time and radius for sensor 2 " buff2)
  print (word  " time and radius for sensor 3 " buff3)
  print (word  " time and radius for sensor 4 " buff4)
  print (word  " time and radius for sensor 5 " buff5)
  print (word  " time and radius for sensor 6 " buff6)
  print (word  " time and radius for sensor 7 " buff7)
  print (word  " time and radius for sensor 8 " buff8)
  print (word  " time and radius for sensor 9 " buff9)
 ; ask sensor las_sen [


  print ("for object 2 ")
  set buff1 []
  set buff2 []
  set buff3 []
  set buff4 []
  set buff5 []
  set buff6 []
  set buff7 []
  set buff8 []
  set buff9 []
   ask objects [ setxy 36 22
                 ]
   set corx 36
  set cory 22
  set corx-des 0
  set cory-des 20
   while [ corx > corx-des or  cory > cory-des ][
    tick
    start-detection
    recognize-behaviour-of-object-2
    negotiation

    ask objects [ setxy corx - 1 cory - 1 / 18
                set corx corx - 1
                set cory cory - 1 / 18 ]
      ask objects [ show list xcor ycor ]
    ask sensors [ set color white ]
  ]
  ask objects [ show list xcor ycor ]
  tick
  tick
  if any? sensors with [color = magenta ] = false [
    if flag1 = true [ set last_sen 0 ]
    if flag2 = true [ set last_sen 1 ]
    if flag3 = true [ set last_sen 2 ]
    if flag4 = true [ set last_sen 3 ]
    if flag5 = true [ set last_sen 4 ]
    if flag6 = true [ set last_sen 5 ]
    if flag7 = true [ set last_sen 6 ]
    if flag8 = true [ set last_sen 7 ]
    if flag9 = true [ set last_sen 8 ]
  ]

  print (word  " time and radius for sensor 1 " buff1)
  print (word  " time and radius for sensor 2 " buff2)
  print (word  " time and radius for sensor 3 " buff3)
  print (word  " time and radius for sensor 4 " buff4)
  print (word  " time and radius for sensor 5 " buff5)
  print (word  " time and radius for sensor 6 " buff6)
  print (word  " time and radius for sensor 7 " buff7)
  print (word  " time and radius for sensor 8 " buff8)
  print (word  " time and radius for sensor 9 " buff9)

  print ("for object 3 ")
  set buff1 []
  set buff2 []
  set buff3 []
  set buff4 []
  set buff5 []
  set buff6 []
  set buff7 []
  set buff8 []
  set buff9 []

   ask objects [ setxy 28 0
                 ]
   set corx 28
  set cory 0
  set corx-des 20
  set cory-des 36
   while [ corx > corx-des or cory < cory-des ][
    tick
    start-detection
    recognize-behaviour-of-object-3
    negotiation

    ask objects [ setxy corx - 2 / 9 cory + 1
                set corx corx - 2 / 9
                set cory cory + 1 ]
      ask objects [ show list xcor ycor ]
    ask sensors [ set color white ]
  ]
;  ask objects [ show list xcor ycor ]
  tick
  tick
  if any? sensors with [color = magenta ] = false [
    if flag1 = true [ set last_sen 0 ]
    if flag2 = true [ set last_sen 1 ]
    if flag3 = true [ set last_sen 2 ]
    if flag4 = true [ set last_sen 3 ]
    if flag5 = true [ set last_sen 4 ]
    if flag6 = true [ set last_sen 5 ]
    if flag7 = true [ set last_sen 6 ]
    if flag8 = true [ set last_sen 7 ]
    if flag9 = true [ set last_sen 8 ]
  ]

  print (word  " time and radius for sensor 1 " buff1)
  print (word  " time and radius for sensor 2 " buff2)
  print (word  " time and radius for sensor 3 " buff3)
  print (word  " time and radius for sensor 4 " buff4)
  print (word  " time and radius for sensor 5 " buff5)
  print (word  " time and radius for sensor 6 " buff6)
  print (word  " time and radius for sensor 7 " buff7)
  print (word  " time and radius for sensor 8 " buff8)
  print (word  " time and radius for sensor 9 " buff9)

   set buff1 []
  set buff2 []
  set buff3 []
  set buff4 []
  set buff5 []
  set buff6 []
  set buff7 []
  set buff8 []
  set buff9 []
  print ("for object 4 ")
   ask objects [ setxy 16 36
                 ]
   set corx 16
  set cory 36
  set corx-des 36
  set cory-des 3
   while [ corx < corx-des or cory > cory-des ][
    tick
    start-detection
    recognize-behaviour-of-object-4
    negotiation

    ask objects [ setxy corx + 20 / 33 cory - 1
                set corx corx + 20 / 33
                set cory cory - 1 ]
      ask objects [ show list xcor ycor ]
    ask sensors [ set color white ]
  ]
;  ask objects [ show list xcor ycor ]
  tick
  tick
  if any? sensors with [color = magenta ] = false [
    if flag1 = true [ set last_sen 0 ]
    if flag2 = true [ set last_sen 1 ]
    if flag3 = true [ set last_sen 2 ]
    if flag4 = true [ set last_sen 3 ]
    if flag5 = true [ set last_sen 4 ]
    if flag6 = true [ set last_sen 5 ]
    if flag7 = true [ set last_sen 6 ]
    if flag8 = true [ set last_sen 7 ]
    if flag9 = true [ set last_sen 8 ]
  ]

  print (word  " time and radius for sensor 1 " buff1)
  print (word  " time and radius for sensor 2 " buff2)
  print (word  " time and radius for sensor 3 " buff3)
  print (word  " time and radius for sensor 4 " buff4)
  print (word  " time and radius for sensor 5 " buff5)
  print (word  " time and radius for sensor 6 " buff6)
  print (word  " time and radius for sensor 7 " buff7)
  print (word  " time and radius for sensor 8 " buff8)
  print (word  " time and radius for sensor 9 " buff9)


end
to start-detection

  set list1 [ 0 0 0 0 0 0 0 0 0 ]
  set list2 [ 0 0 0 0 0 0 0 0 0 ]
  set list3 [ 0 0 0 0 0 0 0 0 0 ]
  set list4 [ 0 0 0 0 0 0 0 0 0 ]
  set list5 [ 0 0 0 0 0 0 0 0 0 ]
  set list6 [ 0 0 0 0 0 0 0 0 0 ]
  set list7 [ 0 0 0 0 0 0 0 0 0 ]
  set list8 [ 0 0 0 0 0 0 0 0 0 ]
  set list9 [ 0 0 0 0 0 0 0 0 0 ]
set flag1 false
set flag2 false
set flag3 false
set flag4 false
set flag5 false
set flag6 false
set flag7 false
set flag8 false
set flag9 false

  set num_sensor 0
  print ( word " in time : " ticks )
  ask sensor 0 [
    let i 0
    while [ i < 9 ][
    ask objects  in-radius i [set flag1 true
        set list1 ( replace-item i list1 1 )
        let j ticks
        let bi (list j i 0 )
        set buff1 lput bi  buff1
        print ( word " this object is in scope of sensor 1 in radius :  " i )
          set i 8 ]
      set i i + 1]]
  if flag1 = true [ ask sensor 0 [ set color magenta ]
                   set num_sensor num_sensor + 1]
;  print (word " radius distance object from sensor 1 ( in array 1 to 8 ) " list1)


    ask sensor 1 [
    let i 1
    while [ i < 9 ][
    ask objects in-radius i [set flag2 true
        set list2 ( replace-item i list2 1 )
        let j ticks
        let bi (list j i 1 )
        set buff2 lput bi buff2
         print (word  " this object is in scope of sensor 2 in radius : " i )
        set i 8 ]
      set i i + 1]]
  if flag2 = true [ ask sensor 1 [ set color magenta ]
                    set num_sensor num_sensor + 1]

 ; print (word " radius distance object from sensor 2 ( in array 1 to 8 ) " list2)
    ask sensor 2 [
    let i 1
    while [ i < 9 ][
    ask objects in-radius i [set flag3 true
        set list3 ( replace-item i list3 1 )
        let j ticks
        let bi (list j i 2 )
        set buff3 lput bi buff3
        print ( word " this object is in scope of sensor 3 in radius : " i)
        set i 8  ]
        set i i + 1]]
  if flag3 = true [ ask sensor 2 [ set color magenta ]
                    set num_sensor num_sensor + 1]

 ; print (word " radius distance object from sensor 3 ( in array 1 to 8 ) " list3)
    ask sensor 3 [
    let i 1
    while [ i < 9 ][
    ask objects in-radius i [set flag4 true
        set list4 ( replace-item i list4 1 )
        let j ticks
        let bi (list j i 3 )
        set buff4 lput bi buff4
        print (word " this object is in scope of sensor 4 in radius : " i )
        set i 8 ]
        set i i + 1]]
  if flag4 = true [ ask sensor 3 [ set color magenta ]
                    set num_sensor num_sensor + 1]

;  print (word " radius distance object from sensor 4 ( in array 1 to 8 ) " list4)
    ask sensor 4 [
    let i 1
    while [ i < 9 ][
    ask objects in-radius i [set flag5 true
        set list5 ( replace-item i list5 1  )
        let j ticks
        let bi (list j i 4 )
       set buff5 lput bi buff5
        print ( word " this object is in scope of sensor 5 in radius : " i )
        set i 8 ]
        set i i + 1]]
  if flag5 = true [ ask sensor 4 [ set color magenta ]
                    set num_sensor num_sensor + 1]

;  print (word " radius distance object from sensor 5 ( in array 1 to 8 ) " list5)
    ask sensor 5 [
    let i 1
    while [ i < 9 ][
    ask objects in-radius i [set flag6 true
        set list6 ( replace-item i list6 1 )
        let j ticks
        let bi (list j i 5 )
        set buff6 lput bi buff6
         print (word " this object is in scope of sensor 6 in radius :  " i )
         set i 8 ]
        set i i + 1]]
  if flag6 = true [ ask sensor 5 [ set color magenta ]
                   set num_sensor num_sensor + 1]

;  print (word " radius distance object from sensor 6 ( in array 1 to 8 ) " list6)
    ask sensor 6 [
    let i 1
    while [ i < 9 ][
    ask objects in-radius i [set flag7 true
        set list7 ( replace-item i list7 1 )
        let j ticks
        let bi (list j i 6 )
         set buff7 lput bi buff7
        print (word " this object is in scope of sensor 7 in radius : " i)
        set i 8 ]
        set i i + 1]]
  if flag7 = true [ ask sensor 6 [ set color magenta ]
                   set num_sensor num_sensor + 1]

;  print (word " radius distance object from sensor 7 ( in array 1 to 8 ) " list7)
    ask sensor 7 [
    let i 1
    while [ i < 9 ][
    ask objects in-radius i [set flag8 true
        set list8 ( replace-item i list8 1 )
        let j ticks
        let bi (list j i 7 )
        set buff8 lput bi buff8
        print (word " this object is in scope of sensor 8 in radius : " i )
        set i 8 ]
        set i i + 1]]
  if flag8 = true [ ask sensor 7 [ set color magenta ]
                    set num_sensor num_sensor + 1]

;  print (word " radius distance object from sensor 8 ( in array 1 to 8 ) " list8)
    ask sensor 8 [
    let i 1
    while [ i < 9 ][
    ask objects in-radius i [set flag9 true
        set list9 ( replace-item i list9 1 )
        let j ticks
        let bi (list j i 8 )
        set buff9 lput bi buff9
        print (word " this object is in scope of sensor 9 in radius : " i )
        set i 8 ]
        set i i + 1]]
  if flag9 = true [ ask sensor 8 [ set color magenta ]
                    set num_sensor num_sensor + 1]

;  print (word " radius distance object from sensor 9 ( in array 1 to 8 ) " list9)
; print (word "buff 7 " buff7)


end

to negotiation
  if ticks > 1 [
    let m ticks - 1
    let n ticks
    ask sensor 6 [if empty? buff7 = false[ let l last buff7
                   if item 0 l = m and flag7 = false [
        ask sensor 0 [ if flag1 = true and ( distancexy 5 7) < 30 [ set buff1 lput buff7 buff1 ] ]
        ask sensor 1 [ if flag2 = true and ( distancexy 5 7) < 30 [ set buff2 lput buff7 buff2 ] ]
        ask sensor 2 [ if flag3 = true and ( distancexy 5 7) < 30 [ set buff3 lput buff7 buff3 ] ]
        ask sensor 3 [ if flag4 = true  and ( distancexy 5 7) < 30[ set buff4 lput buff7 buff4 ] ]
        ask sensor 4 [ if flag5 = true  and ( distancexy 5 7) < 30[ set buff5 lput buff7 buff5 ] ]
        ask sensor 5 [ if flag6 = true and ( distancexy 5 7) < 30 [ set buff6 lput buff7 buff6 ] ]
      ;  ask sensor 6 [ if flag7 = trueand ( distancexy 5 7) < 30  [ set buff7 lput buff7 buff7 ] ]
        ask sensor 7 [ if flag8 = true and ( distancexy 5 7) < 30 [ set buff8 lput buff7 buff8 ] ]
        ask sensor 8 [ if flag9 = true and ( distancexy 5 7) < 30 [ set buff9 lput buff7 buff9 ] ]
                          ]
      set en7 en7 - 100
    ]
    ]
    ask sensor 0 [ if empty? buff1 = false [let l last buff1
                   if item 0 l = m and flag1 = false [
      ;  ask sensor 0 [ if flag1 = true [ set buff1 lput buff1 buff1 ] ]
        ask sensor 1 [ if flag2 = true and (distancexy 6 24) < 30 [ set buff2 lput buff1 buff2 ] ]
        ask sensor 2 [ if flag3 = true and (distancexy 6 24) < 30 [ set buff3 lput buff1 buff3 ] ]
        ask sensor 3 [ if flag4 = true and (distancexy 6 24) < 30 [ set buff4 lput buff1 buff4 ] ]
        ask sensor 4 [ if flag5 = true and (distancexy 6 24) < 30 [ set buff5 lput buff1 buff5 ] ]
        ask sensor 5 [ if flag6 = true and (distancexy 6 24) < 30 [ set buff6 lput buff1 buff6 ] ]
        ask sensor 6 [ if flag7 = true and (distancexy 6 24) < 30 [ set buff7 lput buff1 buff7 ] ]
        ask sensor 7 [ if flag8 = true and (distancexy 6 24) < 30  [ set buff8 lput buff1 buff8 ] ]
        ask sensor 8 [ if flag9 = true and (distancexy 6 24) < 30 [ set buff9 lput buff1 buff9 ] ]
                          ]
      set en1 en1 - 100
      ]
    ]

    ask sensor 1 [if empty? buff2 = false [ let l last buff2
                   if item 0 l = m and flag2 = false [
        ask sensor 0 [ if flag1 = true and (distancexy 30 16) < 30[ set buff1 lput buff2 buff1 ] ]
      ;  ask sensor 1 [ if flag2 = true [ set buff2 lput buf2 buff2 ] ]
        ask sensor 2 [ if flag3 = true and (distancexy 30 16) < 30 [ set buff3 lput buff2 buff3 ] ]
        ask sensor 3 [ if flag4 = true and (distancexy 30 16) < 30 [ set buff4 lput buff2 buff4 ] ]
        ask sensor 4 [ if flag5 = true and (distancexy 30 16) < 30 [ set buff5 lput buff2 buff5 ] ]
        ask sensor 5 [ if flag6 = true and (distancexy 30 16) < 30 [ set buff6 lput buff2 buff6 ] ]
        ask sensor 6 [ if flag7 = true and (distancexy 30 16) < 30 [ set buff7 lput buff2 buff7 ] ]
        ask sensor 7 [ if flag8 = true and (distancexy 30 16) < 30 [ set buff8 lput buff2 buff8 ] ]
        ask sensor 8 [ if flag9 = true and (distancexy 30 16) < 30 [ set buff9 lput buff2 buff9 ] ]
                          ]
      set en2 en2 - 100
      ]
    ]
    ask sensor 2 [ if empty? buff3 = false [let l last buff3
                   if item 0 l = m and flag3 = false [
        ask sensor 0 [ if flag1 = true and (distancexy 17 13) < 30 [ set buff1 lput buff3 buff1 ] ]
        ask sensor 1 [ if flag2 = true and (distancexy 17 13) < 30 [ set buff2 lput buff3 buff2 ] ]
      ;  ask sensor 2 [ if flag3 = true [ set buff3 lput buff3 buff3 ] ]
        ask sensor 3 [ if flag4 = true and (distancexy 17 13) < 30 [ set buff4 lput buff3 buff4 ] ]
        ask sensor 4 [ if flag5 = true and (distancexy 17 13) < 30 [ set buff5 lput buff3 buff5 ] ]
        ask sensor 5 [ if flag6 = true and (distancexy 17 13) < 30 [ set buff6 lput buff3 buff6 ] ]
        ask sensor 6 [ if flag7 = true and (distancexy 17 13) < 30 [ set buff7 lput buff3 buff7 ] ]
        ask sensor 7 [ if flag8 = true and (distancexy 17 13) < 30 [ set buff8 lput buff3 buff8 ] ]
        ask sensor 8 [ if flag9 = true and (distancexy 17 13) < 30 [ set buff9 lput buff3 buff9 ] ]
                          ]
      set en3 en3 - 100
      ]
    ]
    ask sensor 3 [ if empty? buff4 = false [let l last buff4
                   if item 0 l = m and flag4 = false [
        ask sensor 0 [ if flag1 = true and (distancexy 7 16) < 30 [ set buff1 lput buff4 buff1 ] ]
        ask sensor 1 [ if flag2 = true and (distancexy 7 16) < 30  [ set buff2 lput buff4 buff2 ] ]
        ask sensor 2 [ if flag3 = true and (distancexy 7 16) < 30  [ set buff3 lput buff4 buff3 ] ]
      ;  ask sensor 3 [ if flag4 = true [ set buff4 lput buff4 buff4 ] ]
        ask sensor 4 [ if flag5 = true and (distancexy 7 16) < 30  [ set buff5 lput buff4 buff5 ] ]
        ask sensor 5 [ if flag6 = true and (distancexy 7 16) < 30  [ set buff6 lput buff4 buff6 ] ]
        ask sensor 6 [ if flag7 = true and (distancexy 7 16) < 30  [ set buff7 lput buff4 buff7 ] ]
        ask sensor 7 [ if flag8 = true and (distancexy 7 16) < 30  [ set buff8 lput buff4 buff8 ] ]
        ask sensor 8 [ if flag9 = true and (distancexy 7 16) < 30  [ set buff9 lput buff4 buff9 ] ]
                          ]
      set en4 en4 - 100
      ]
    ]
    ask sensor 4 [if empty? buff5 = false [ let l last buff5
                   if item 0 l = m and flag5 = false [
        ask sensor 0 [ if flag1 = true and (distancexy 30 6) < 30  [ set buff1 lput buff5 buff1 ] ]
        ask sensor 1 [ if flag2 = true and (distancexy 30 6) < 30 [ set buff2 lput buff5 buff2 ] ]
        ask sensor 2 [ if flag3 = true and (distancexy 30 6) < 30 [ set buff3 lput buff5 buff3 ] ]
        ask sensor 3 [ if flag4 = true and (distancexy 30 6) < 30 [ set buff4 lput buff5 buff4 ] ]
      ;  ask sensor 4 [ if flag5 = true [ set buff5 lput buff5 buff5 ] ]
        ask sensor 5 [ if flag6 = true and (distancexy 30 6) < 30 [ set buff6 lput buff5 buff6 ] ]
        ask sensor 6 [ if flag7 = true and (distancexy 30 6) < 30 [ set buff7 lput buff5 buff7 ] ]
        ask sensor 7 [ if flag8 = true and (distancexy 30 6) < 30 [ set buff8 lput buff5 buff8 ] ]
        ask sensor 8 [ if flag9 = true and (distancexy 30 6) < 30 [ set buff9 lput buff5 buff9 ] ]
                          ]
      set en5 en5 - 100
      ]
    ]

    ask sensor 5 [ if empty? buff6 = false [ let l last buff6
                   if item 0 l = m and flag6 = false [
        ask sensor 0 [ if flag1 = true and (distancexy 18 7) < 30 [ set buff1 lput buff6 buff1 ] ]
        ask sensor 1 [ if flag2 = true and (distancexy 18 7) < 30 [ set buff2 lput buff6 buff2 ] ]
        ask sensor 2 [ if flag3 = true and (distancexy 18 7) < 30 [ set buff3 lput buff6 buff3 ] ]
        ask sensor 3 [ if flag4 = true and (distancexy 18 7) < 30 [ set buff4 lput buff6 buff4 ] ]
        ask sensor 4 [ if flag5 = true and (distancexy 18 7) < 30 [ set buff5 lput buff6 buff5 ] ]
      ;  ask sensor 5 [ if flag6 = true [ set buff6 lput buff6 buff6 ] ]
        ask sensor 6 [ if flag7 = true and (distancexy 18 7) < 30 [ set buff7 lput buff6 buff7 ] ]
        ask sensor 7 [ if flag8 = true and (distancexy 18 7) < 30 [ set buff8 lput buff6 buff8 ] ]
        ask sensor 8 [ if flag9 = true and (distancexy 18 7) < 30 [ set buff9 lput buff6 buff9 ] ]
                          ]
      set en6 en6 - 100
      ]
    ]
    ask sensor 7 [ if empty? buff8 = false [ let l last buff8
                   if item 0 l = m and flag8 = false [
        ask sensor 0 [ if flag1 = true and (distancexy 29 27) < 30 [ set buff1 lput buff8 buff1 ] ]
        ask sensor 1 [ if flag2 = true and (distancexy 29 27) < 30 [ set buff2 lput buff8 buff2 ] ]
        ask sensor 2 [ if flag3 = true and (distancexy 29 27) < 30 [ set buff3 lput buff8 buff3 ] ]
        ask sensor 3 [ if flag4 = true and (distancexy 29 27) < 30 [ set buff4 lput buff8 buff4 ] ]
        ask sensor 4 [ if flag5 = true and (distancexy 29 27) < 30 [ set buff5 lput buff8 buff5 ] ]
        ask sensor 5 [ if flag6 = true and (distancexy 29 27) < 30 [ set buff6 lput buff8 buff6 ] ]
        ask sensor 6 [ if flag7 = true and (distancexy 29 27) < 30 [ set buff7 lput buff8 buff7 ] ]
      ;  ask sensor 7 [ if flag8 = true [ set buff8 lput buff8 buff8 ] ]
        ask sensor 8 [ if flag9 = true and (distancexy 29 27) < 30 [ set buff9 lput buff8 buff9 ] ]
                          ]
      set en8 en8 - 100
      ]
    ]
    ask sensor 8 [if empty? buff9 = false [ let l last buff9
                   if item 0 l = m and flag9 = false [
        ask sensor 0 [ if flag1 = true and (distancexy 11 25) < 30 [ set buff1 lput buff9 buff1 ] ]
        ask sensor 1 [ if flag2 = true and (distancexy 11 25) < 30 [ set buff2 lput buff9 buff2 ] ]
        ask sensor 2 [ if flag3 = true and (distancexy 11 25) < 30 [ set buff3 lput buff9 buff3 ] ]
        ask sensor 3 [ if flag4 = true and (distancexy 11 25) < 30 [ set buff4 lput buff9 buff4 ] ]
        ask sensor 4 [ if flag5 = true and (distancexy 11 25) < 30 [ set buff5 lput buff9 buff5 ] ]
        ask sensor 5 [ if flag6 = true and (distancexy 11 25) < 30 [ set buff6 lput buff9 buff6 ] ]
        ask sensor 6 [ if flag7 = true and (distancexy 11 25) < 30 [ set buff7 lput buff9 buff7 ] ]
        ask sensor 7 [ if flag8 = true and (distancexy 11 25) < 30  [ set buff8 lput buff9 buff8 ] ]
      ;  ask sensor 8 [ if flag9 = true [ set buff9 lput buff9 buff9 ] ]
                          ]
      set en9 en9 - 100
    ]
    ]


  ]
  set buff1 remove-duplicates buff1
  set buff2 remove-duplicates buff2
  set buff3 remove-duplicates buff3
  set buff4 remove-duplicates buff4
  set buff5 remove-duplicates buff5
  set buff6 remove-duplicates buff6
  set buff7 remove-duplicates buff7
  set buff8 remove-duplicates buff8
  set buff9 remove-duplicates buff9

end

to recognize-behaviour-of-object-1
  set listp1 []
  set listp2 []
  if ticks = 11 [
    if flag7 = true and flag6 = true [
      let h last buff7
      let v last buff6
      let ra item 1 h
      let rad item 1 v
     ; print ( word "ra " ra)
      ask sensor 6  [ ask patches in-radius ra [ set pcolor green ]]
      ask sensor 5  [ ask patches in-radius rad [ if pcolor = green [; print list pxcor pycor
        set p3 list pxcor pycor
        ]
        set listp1 lput p3  listp1
        set listp1 remove-duplicates listp1
         ]]
      ask patches [set pcolor black ]
      set listp1 ( remove-item 0 listp1)
 ;     print (word " listp1 " listp1)
      let i 0
      foreach listp1 [ [k] -> if item 0 k = 13 [
        set p1 k ]]
      print (word "p1" p1)

    ]
  ]
  if ticks = 28 [
    if flag8 = true and flag2 = true [
       let h last buff2
      let v last buff8
      let ra item 1 h
      let rad item 1 v
     ; print ( word "ra " ra)
      ask sensor 7  [ ask patches in-radius ra [ set pcolor green ]]
      ask sensor 1  [ ask patches in-radius rad [ if pcolor = green [ ;print list pxcor pycor
      set p4 list pxcor pycor]
      set listp2 lput p4 listp2
      set listp2 remove-duplicates listp2
       ]]
      ask patches [set pcolor black ]
      set listp2 ( remove-item 0 listp2)
 ;     print (word " listp2 " listp2)
      let i 0
      foreach listp2 [ [k] -> if item 0 k = 30 and item 1 k = 20 [
        set p2 k ]]
      print (word "p2" p2)
    ]
  ]


end

to recognize-behaviour-of-object-2
   set listp1 []
  set listp2 []
  if ticks = 21 [
    if flag3 = true and flag9 = true [
      let h last buff3
      let v last buff9
      let ra item 1 h
      let rad item 1 v
     ; print ( word "ra " ra)
      ask sensor 2  [ ask patches in-radius ra [ set pcolor green ]]
      ask sensor 8  [ ask patches in-radius rad [ if pcolor = green [; print list pxcor pycor
        set p3 list pxcor pycor
        ]
        set listp1 lput p3  listp1
        set listp1 remove-duplicates listp1
         ]]
      ask patches [set pcolor black ]
      set listp1 ( remove-item 0 listp1)
  ;    print (word " listp1 " listp1)
      let i 0
      foreach listp1 [ [k] -> if item 0 k = 15 [
        set p1 k ]]
      print (word "p1" p1)

    ]
  ]
  if ticks = 32 [
    if flag9 = true and flag4 = true [
       let h last buff9
      let v last buff4
      let ra item 1 h
      let rad item 1 v
     ; print ( word "ra " ra)
      ask sensor 8  [ ask patches in-radius ra [ set pcolor green ]]
      ask sensor 3  [ ask patches in-radius rad [ if pcolor = green [ ;print list pxcor pycor
      set p4 list pxcor pycor]
      set listp2 lput p4 listp2
      set listp2 remove-duplicates listp2
       ]]
      ask patches [set pcolor black ]
      set listp2 ( remove-item 0 listp2)
    ;  print (word " listp2 " listp2)
      let i 0
      foreach listp2 [ [k] -> if item 0 k = 5 and item 1 k = 20 [
        set p2 k ]]
      print (word "p2" p2)
    ]
  ]
end
to recognize-behaviour-of-object-3
   set listp1 []
  set listp2 []
  if ticks = 13 [
    if flag2 = true and flag5 = true [
      let h last buff2
      let v last buff5
      let ra item 1 h
      let rad item 1 v
     ; print ( word "ra " ra)
      ask sensor 1  [ ask patches in-radius ra [ set pcolor green ]]
      ask sensor 4  [ ask patches in-radius rad [ if pcolor = green [ ;print list pxcor pycor
        set p3 list pxcor pycor
        ]
        set listp1 lput p3  listp1
        set listp1 remove-duplicates listp1
         ]]
      ask patches [set pcolor black ]
      set listp1 ( remove-item 0 listp1)
;      print (word " listp1 " listp1)
      let i 0
      foreach listp1 [ [k] -> if item 0 k = 25 and item 1 k = 12 [
        set p1 k ]]
      print (word "p1" p1)

    ]
  ]
  if ticks = 16 [
    if flag2 = true and flag3 = true [
       let h last buff2
      let v last buff3
      let ra item 1 h
      let rad item 1 v
     ; print ( word "ra " ra)
      ask sensor 1  [ ask patches in-radius ra [ set pcolor green ]]
      ask sensor 2  [ ask patches in-radius rad [ if pcolor = green [ ;print list pxcor pycor
      set p4 list pxcor pycor]
      set listp2 lput p4 listp2
      set listp2 remove-duplicates listp2
       ]]
      ask patches [set pcolor black ]
      set listp2 ( remove-item 0 listp2)
;      print (word " listp2 " listp2)
      let i 0
      foreach listp2 [ [k] -> if item 0 k = 24 and item 1 k = 16 [
        set p2 k ]]
      print (word "p2" p2)
    ]
  ]

end
to recognize-behaviour-of-object-4
    set listp1 []
  set listp2 []
  if ticks = 17 [
    if flag2 = true and flag8 = true [
      let h last buff2
      let v last buff8
      let ra item 1 h
      let rad item 1 v
     ; print ( word "ra " ra)
      ask sensor 1  [ ask patches in-radius ra [ set pcolor green ]]
      ask sensor 7  [ ask patches in-radius rad [ if pcolor = green [ ;print list pxcor pycor
        set p3 list pxcor pycor
        ]
        set listp1 lput p3  listp1
        set listp1 remove-duplicates listp1
         ]]
      ask patches [set pcolor black ]
      set listp1 ( remove-item 0 listp1)
  ;    print (word " listp1 " listp1)
      let i 0
      foreach listp1 [ [k] -> if item 0 k = 26 and item 1 k = 20 [
        set p1 k ]]
      print (word "p1" p1)

    ]
  ]
  if ticks = 28 [
    if flag2 = true and flag5 = true [
       let h last buff2
      let v last buff5
      let ra item 1 h
      let rad item 1 v
     ; print ( word "ra " ra)
      ask sensor 1  [ ask patches in-radius ra [ set pcolor green ]]
      ask sensor 4  [ ask patches in-radius rad [ if pcolor = green [ ;print list pxcor pycor
      set p4 list pxcor pycor]
      set listp2 lput p4 listp2
      set listp2 remove-duplicates listp2
       ]]
      ask patches [set pcolor black ]
      set listp2 ( remove-item 0 listp2)
    ; print (word " listp2 " listp2)
      let i 0
     foreach listp2 [ [k] -> if item 0 k = 32 and item 1 k = 9 [
        set p2 k ]]
      print (word "p2" p2)
    ]
  ]

end

to equation
  let x1 item 0 p1
  let x2 item 0 p2
  let y1 item 1 p1
  let y2 item 1 p2
  set mi y2 - y1 / x2 - x1
  let f mi * x1
  set b y1 - f
  print (word " m in linear equation is :" mi)
  print ( word" b in linear equation is : " b )
  print (word "y = " mi " * x" " + " b )
end

to circle


  let r 8                ;; radius of the circle you want
  let p2r ( 2 * pi * r )  ;; get circumference of the circle
  let step p2r / 360      ;; make step lengths 1/360th of the circumference

  crt 1 [                 ;; create a single drawing turtle
    setxy cx + r cy       ;; move it to the highlight patch + the radius
    pd                    ;; put the pen down
    set heading 0         ;; make it face along the tangent
    while [ p2r > 0 ] [   ;; make the turtle continue to move until the circle is drawn
      lt 1
      fd step
      set p2r p2r - step
    ]
    die                   ;; remove the turtle
  ]

end



to-report eucdistance [a bi c d ]
  let dis ( (abs(a - bi )) ^ 2 + (abs(c - d )) ^ 2) ^ 0.5
  report dis
end
@#$#@#$#@
GRAPHICS-WINDOW
210
10
699
500
-1
-1
13.0
1
10
1
1
1
0
1
1
1
0
36
0
36
0
0
1
ticks
30.0

BUTTON
69
65
132
98
NIL
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
70
125
133
158
NIL
go
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

@#$#@#$#@
## WHAT IS IT?

(a general understanding of what the model is trying to show or explain)

## HOW IT WORKS

(what rules the agents use to create the overall behavior of the model)

## HOW TO USE IT

(how to use the model, including a description of each of the items in the Interface tab)

## THINGS TO NOTICE

(suggested things for the user to notice while running the model)

## THINGS TO TRY

(suggested things for the user to try to do (move sliders, switches, etc.) with the model)

## EXTENDING THE MODEL

(suggested things to add or change in the Code tab to make the model more complicated, detailed, accurate, etc.)

## NETLOGO FEATURES

(interesting or unusual features of NetLogo that the model uses, particularly in the Code tab; or where workarounds were needed for missing features)

## RELATED MODELS

(models in the NetLogo Models Library and elsewhere which are of related interest)

## CREDITS AND REFERENCES

(a reference to the model's URL on the web if it has one, as well as any other necessary credits, citations, and links)
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.0.1
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
