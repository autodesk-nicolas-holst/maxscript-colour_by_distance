-- loop through all objects
-- ignore if the name doesn't indicate it's a car
-- buidl up an array of the cars

-- loop through the car array
-- compute distance between all cars
-- get shortest distance

-- copy material
-- change color at the given frame


-- start of user configurable values

-- optimizations:
-- approach 1: don't  compute for every frame but every ten frames
optimize_frame_step=500

-- don't do all frames:
start_frame=1
end_frame=14950

-- don't do all cars
limit_cars=4000

min_dist=5
max_dist=20

beginning_of_name="Traffic"


-- end of user configurable values

total_time=0-timestamp()




cars=#()
for i in geometry do
(
	if (substring i.name 1 beginning_of_name.count)==beginning_of_name then
		(
			if limit_cars>0 then
			(
				append cars i
				limit_cars=limit_cars-1
			)
		)
)


-- check for missing materials
for i in cars do
(
	if i.material == undefined then
	(
		-- and fix it
		m=standardmaterial()
		i.material=m
	)
	
	-- and ensure if a material is shared we work on a separate copy
	m=copy i.material
	i.material=m
)

time_in_compare=0

animate on
(
	for l = start_frame to end_frame by optimize_frame_step do
	(
		--slidertime=l
		--format "% \n" l
		at time l 
		(
			for i = 1 to cars.count do
			(
				time_in_compare=time_in_compare-timestamp()
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
	
				time_in_compare=time_in_compare+timestamp()
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
	
				cars[i].material.diffuse=color (255-t) t 0
	
				--format "% % %\n" cars[i].name cur_dist t
			)
		)
	)
)
total_time=total_time+timestamp()

format "total=%s comparisons=%s\n" (total_time/1000) (time_in_compare/1000)