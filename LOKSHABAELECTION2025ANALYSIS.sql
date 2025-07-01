use india_election_result
--total seats 
select count(Parliament_Constituency) as total_seats from constituencywise_results
--total no of seat available for elaction in bihar state
select * from statewise_results
select s.state ,count(distinct cr.Parliament_Constituency) from constituencywise_results as cr 
inner join statewise_results as sr 
on 
cr.Parliament_Constituency=sr.Parliament_Constituency
inner join states s 
on s.State_ID=sr.State_ID
where s.state='Bihar'
group by s.State

-- total seats won by nda 
SELECT 
    SUM(CASE 
            WHEN [party] IN (
                'Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
                'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM'
            ) THEN [Won]
            ELSE 0 
        END) AS NDA_Total_Seats_Won
FROM 
    partywise_results;

-- Seats Won by NDA Allianz Parties
SELECT party as party_name,
                won as seat_won 
    from partywise_results
    where party in (
                'Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
                'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM'
            ) 
            order by seat_won desc


--partywise_results
SELECT 
    SUM(CASE 
            WHEN party IN (
                'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
            ) THEN [Won]
            ELSE 0 
        END) AS INDIA_Total_Seats_Won
FROM 
    partywise_results
-- Seats Won by I.N.D.I.A. Allianz Parties
SELECT 
    party as Party_Name,
    won as Seats_Won
FROM 
    partywise_results
WHERE 
    party IN (
        'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
    )
ORDER BY Seats_Won DESC
--Add new column field in table partywise_results to get the Party Allianz as NDA, I.N.D.I.A and OTHER
Alter Table partywise_results
add party_alliance varchar(50);

Update partywise_results
set party_alliance = 'I.N.D.I.A'
where party in (
'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
                )
Update partywise_results
set party_alliance ='N.D.A'
where party in ('Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
                'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM'
                )
update partywise_results
set party_alliance ='Others'
where party_alliance is null

select party_alliance ,sum(Won) as seat_won
from partywise_results
group by party_alliance

-- Winning candidate's name, their party name, total votes, and the margin of victory for a specific state and constituency?
select b.constituency, a.Winning_Candidate,Total_Votes,b.Margin,a.Parliament_Constituency,c.Party,d.State from
constituencywise_results as a left join statewise_results as b
on a.Parliament_Constituency=b.Parliament_Constituency
left join partywise_results as c 
on a.Party_ID=c.Party_ID
left join states d
on b.State_ID=d.State_ID 
WHERE d.State = 'Uttar Pradesh' AND a.Constituency_Name = 'AMETHI'

-- What is the distribution of EVM votes versus postal votes for candidates in a specific constituency?
select distinct cr.Constituency_Name ,EVM_Votes,Postal_Votes,cd.Total_Votes,Candidate ,Party
from
constituencywise_results cr
left join
constituencywise_details cd
on
cr.Constituency_ID=cd.Constituency_ID
where 
cr.Constituency_Name = 'SOUTHDELHI'
order by cd.Total_Votes desc

-- Which parties won the most seats in s State, and how many seats did each party win
select * from (
	select pr.Party ,s.State,count(cr.Constituency_Name) as seat_won ,dense_rank()over(partition by s.State order by count(cr.Constituency_Name)  desc ) as c from partywise_results pr
	left join constituencywise_results cr
	on pr.Party_ID=cr.Party_ID
	left join statewise_results sr
	on cr.Parliament_Constituency=sr.Parliament_Constituency
	left join states s
	on sr.State_ID=s.State_ID
	group by pr.Party ,s.State
)result
where c=1
--What is the total number of seats won by each party alliance (NDA, I.N.D.I.A, and OTHER) in each state for the India Elections 2024

select s.State ,SUM(case when party_alliance ='I.N.D.I.A' THEN 1 ELSE 0 end) AS india_seat_won ,
sum(case when party_alliance ='N.D.A' then 1 else 0 end) as nda_seat_won,
sum(case when party_alliance= 'Others' then 1 else 0 end) as Other_seat_won

from partywise_results pr
left join constituencywise_results cr
on cr.Party_ID=pr.Party_ID
left join statewise_results sr
on
cr.Parliament_Constituency=sr.Parliament_Constituency
left join states s
on sr.State_ID=s.State_ID
WHERE 
    pr.party_alliance IN ('N.D.A', 'I.N.D.I.A',  'Others')  
group by s.State
order by s.State
-- Which candidate received the highest number of EVM votes in each constituency (Top 10)?
SELECT TOP 10
    cr.Constituency_Name,
    cd.Constituency_ID,
    cd.Candidate,
    cd.EVM_Votes
FROM 
    constituencywise_details cd
JOIN 
    constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
WHERE 
    cd.EVM_Votes = (
        SELECT MAX(cd1.EVM_Votes)
        FROM constituencywise_details cd1
        WHERE cd1.Constituency_ID = cd.Constituency_ID
    )
ORDER BY 
    cd.EVM_Votes DESC;
--Which candidate won and which candidate was the runner-up in each constituency of State for the 2024 elections?

with cte1 as (
select Constituency_Name,Candidate,cd.Total_Votes,dense_rank() over(partition by Constituency_Name order by cd.Total_Votes desc) as ranks from constituencywise_details cd
left join constituencywise_results cr
on cd.Constituency_ID=cr.Constituency_ID
)
select Constituency_Name,
max(case when ranks=1 then candidate end )as winner,
max(case when ranks =2 then candidate end ) as runner_up
from cte1
group by Constituency_Name 

--For the state of Maharashtra, what are the total number of seats, total number of candidates, total number of parties, total votes (including EVM and postal), and the breakdown of EVM and postal votes?

select s.State,count(distinct cr.Constituency_ID) as seats ,count(distinct cd.Candidate) as total_candidate ,count(distinct cr.Party_id) as no_of_paarty,sum(cd.Total_Votes) as total_votes ,sum(cd.EVM_Votes) as total_evm_votes,sum(cd.Postal_Votes) as evm_votes
from constituencywise_details cd 
left join constituencywise_results cr 
on cd.Constituency_ID=cr.Constituency_ID
left join statewise_results sr 
on cr.Parliament_Constituency=sr.Parliament_Constituency
left join states s
on sr.State_ID=s.State_ID
left join partywise_results pr 
on cr.Party_ID=pr.Party_ID
where s.State='Maharashtra'
group by s.State
