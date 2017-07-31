--1. How many stops are in the database.
SELECT COUNT(*)
FROM stops

--2. Find the id value for the stop 'Craiglockhart'
SELECT id
FROM stops
WHERE name = 'Craiglockhart'

--3. Give the id and the name for the stops on the '4' 'LRT' service.
SELECT DISTINCT id, name
FROM stops
JOIN route ON (stops.id=route.stop)
WHERE route.num=4 AND company = 'LRT'

--4. The query shown gives the number of routes that visit either London Road (149) or Craiglockhart (53). Run the query and notice the two services that link these stops have a count of 2. Add a HAVING clause to restrict the output to these two routes.
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2

--5. Execute the self join shown and observe that b.stop gives all the places you can get to from Craiglockhart, without changing routes. Change the query so that it shows the services from Craiglockhart to London Road.
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 and b.stop =149

--6. Change the query so that the services between 'Craiglockhart' and 'London Road' are shown.
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='London Road'

--7. Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')
SELECT DISTINCT a.company, a.num
FROM route as a
JOIN route as b ON (a.company=b.company AND a.num=b.num)
WHERE (a.stop=115 AND b.stop=137) OR (a.stop=137 AND b.stop=115)

--8. Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'
SELECT a.company, a.num
FROM route as a
JOIN route as b ON (a.company = b.company AND a.num=b.num)
JOIN stops as stop1 ON (a.stop=stop1.id)
JOIN stops as stop2 ON (b.stop=stop2.id)
WHERE stop1.name = 'Craiglockhart' AND stop2.name='Tollcross'

--9. Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus, including 'Craiglockhart' itself, offered by the LRT company. Include the company and bus no. of the relevant services.
SELECT DISTINCT c.name, a.company, a.num
FROM route as a
JOIN route as b ON (a.company=b.company AND a.num=b.num)
JOIN stops as c ON (a.stop = c.id)
JOIN stops as d ON (b.stop = d.id)
WHERE d.name='Craiglockhart'

--10. \(o_o)/


