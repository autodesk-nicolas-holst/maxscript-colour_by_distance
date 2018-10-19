-- loop through all objects
-- ignore if the name doesn't indicate it's a car
-- buidl up an array of the cars

-- loop through the car array
-- compute distance between all cars
-- get shortest distance

-- copy material
-- change 

min_dist=50
max_dist=200

start_frame=1
end_frame=1000

beginning_of_name="Traffic"

cars=#()
for i in geometry do
(
	if (substring i.name 1 beginning_of_name.count)==beginning_of_name then
		(
			append cars i
		)
)

animate on
(
	for l = start_frame to end_frame do
	(
		at time l 
		(
			for i = 1 to cars.count do
			(
				cur_dist=max_dist
				for j = 1 to cars.count do
				(
					if i!=j then
					(
						d=distance cars[i] cars[j]
						if (d<cur_dist) then
						(
							cur_dist=d
						)
						--format "% % % %\n" i j d cur_dist
					)
				)
	
				-- check for missing materials
				if cars[i].material == undefined then
				(
					-- and fix it
					m=standardmaterial()
					cars[i].material=m
				)
				m=copy cars[i].material
				t=0
				if cur_dist<=min_dist then
				(
					t=0
				)
	
				if cur_dist>=max_dist then
				(
					t=255
				)

				if (cur_dist>min_dist)and(cur_dist<max_dist) then
				(
					t=255*((cur_dist-min_dist)/(max_dist-min_dist))
				)
	
				m.diffuse=color (255-t) t 0
				m.name="cars_"+(t as string)
				cars[i].material=m
			
				--format "% % %\n" cars[i].name cur_dist t
			)
		)
	)
)
