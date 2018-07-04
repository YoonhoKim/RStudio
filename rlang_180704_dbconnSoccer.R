#30번
win_count(df_win_count)
win_count_pie(df_win_count)
#29번
seat_chart(df_seat_chart)
#28번
score_high(df_score_high)
#20번나중에
#27번
GK_heightavg(df_GK_heightavg)

#30번 바차트 : 구단승리순으로 순위매기기 
df_win_count <- dbGetQuery(conn, 
    "SELECT 
    A.WINNER,
    COUNT(A.WINNER) WIN_COUNT
FROM(SELECT
        K.SCHE_DATE 경기날짜,
        CASE
            WHEN K.HOME_SCORE > K.AWAY_SCORE THEN HT.TEAM_NAME
            WHEN K.AWAY_SCORE > K.HOME_SCORE THEN AT.TEAM_NAME
            ELSE '무승부'
        END WINNER
     FROM SCHEDULE K
            JOIN TEAM HT
                ON K.HOMETEAM_ID LIKE HT.TEAM_ID
            JOIN TEAM AT
                ON K.AWAYTEAM_ID LIKE AT.TEAM_ID
     WHERE
        K.GUBUN LIKE 'Y'
        AND K.SCHE_DATE LIKE '2012%'
    )A
WHERE A.WINNER NOT LIKE '무승부'
GROUP BY A.WINNER
ORDER BY COUNT(A.WINNER) DESC
")
df_win_count
#바 차트
win_count <- function(df_win_count){
  return (barplot(df_win_count$WIN_COUNT, names.arg=df_win_count$WIN_COUNT))
}



#파이차트
win_count_pie <- function(df_win_count){
  return (pie(df_win_count$WIN_COUNT,df_win_count$WINNER)
  )
}



#29번 파이차트 : 좌석수가 많은 대로 스타디움 순서 매기기 
df_seat_chart <- dbGetQuery(conn, 
                           "SELECT
                            ROWNUM ,
                           A.*
                           FROM(SELECT
                           STADIUM_NAME ,
                           SEAT_COUNT 
                           FROM
                           STADIUM
                           ORDER BY SEAT_COUNT DESC) A
                           ")
df_seat_chart
#파이차트
seat_chart<-function(df_seat_chart){
 return (pie(c(df_seat_chart$SEAT_COUNT),c(df_seat_chart$STADIUM_NAME))) 
}


#28번 점수차별로 분류한 경기수. 1점차경기 3경기,...6점차경기 1경기, 이렇게 해서 히스토그램
df_score_high <- dbGetQuery(conn,"
                            SELECT A.*
FROM(SELECT
        K.SCHE_DATE ,
        HT.TEAM_NAME || ' VS ' || AT.TEAM_NAME ,
        K.HOME_SCORE - K.AWAY_SCORE SCORE_DEF
     FROM
        SCHEDULE K
        JOIN TEAM HT
            ON K.HOMETEAM_ID LIKE HT.TEAM_ID
        JOIN TEAM AT
            ON K.AWAYTEAM_ID LIKE AT.TEAM_ID
     WHERE
        K.SCHE_DATE LIKE '2012%'
        AND K.GUBUN LIKE 'Y'
    
     ORDER BY SCORE_DEF DESC) A")

df_score_high
#히스토그램 hist(v,main,xlab,xlim,ylim,breaks,col,border)
score_high <- function(df_score_high){
  return (hist(df_score_high$SCORE_DEF,main = "스코어차이",xlab = "~~",col = "yellow",border = "blue")
)  
}

#20 산포도 : 월별 경기수
df_count_monthgame <- dbGetQuery(conn,"
                                 SELECT 
                                (SELECT COUNT(*) m1
                                 FROM SCHEDULE
                                 WHERE SCHE_DATE LIKE '201201%') m1,
                                 (SELECT COUNT(*) m2
                                 FROM SCHEDULE
                                 WHERE SCHE_DATE LIKE '201202%') m2,
                                 (SELECT COUNT(*) m3
                                 FROM SCHEDULE
                                 WHERE SCHE_DATE LIKE '201203%') m3,
                                 (SELECT COUNT(*) m4
                                 FROM SCHEDULE
                                 WHERE SCHE_DATE LIKE '201204%') m4,
                                 (SELECT COUNT(*) m5
                                 FROM SCHEDULE
                                 WHERE SCHE_DATE LIKE '201205%') m5,
                                 (SELECT COUNT(*) m6
                                 FROM SCHEDULE
                                 WHERE SCHE_DATE LIKE '201206%') m6,
                                 (SELECT COUNT(*) m7
                                 FROM SCHEDULE
                                 WHERE SCHE_DATE LIKE '201207%') m7,
                                 (SELECT COUNT(*) m8
                                 FROM SCHEDULE
                                 WHERE SCHE_DATE LIKE '201208%') m8,
                                 (SELECT COUNT(*) m9
                                 FROM SCHEDULE
                                 WHERE SCHE_DATE LIKE '201209%') m9,
                                 (SELECT COUNT(*) m10
                                 FROM SCHEDULE
                                 WHERE SCHE_DATE LIKE '201210%') m10,
                                 (SELECT COUNT(*) m11
                                 FROM SCHEDULE
                                 WHERE SCHE_DATE LIKE '201211%') m11,
                                 (SELECT COUNT(*) m12
                                 FROM SCHEDULE
                                 WHERE SCHE_DATE LIKE '201212%') m12
                                 FROM DUAL
                                 ")
df_count_monthgame
#산포도
input <- mtcars[,c('wt','mpg')]
print(df_count_monthgame)
plot(x = df_count_monthgame$,y = input$mpg,
     xlab = "Month",
     ylab = "Count",
     xlim = c(2.5,5),
     ylim = c(15,30),		 
     main = "Weight vs Milage"
)
#27 팀별 골키퍼의 평균키로 라인차트 (인덱스값을 팀이름으로 치환가능한지 찾아볼것)
df_GK_heightavg <- dbGetQuery(conn,"
                              select
   (select tb.team_name
   from team tb
   where tb.team_id like t.team_id) TEAMNAME_NAME,
   round(avg(p.height),2) GK_HEIGHTAVG
from player p
   join team t
       on p.team_id like t.team_id
group by t.team_id
having avg(p.height)<(
       select avg(pa.height)
       from player pa
           join team ta
               on pa.team_id like ta.team_id
       where ta.team_name like '삼성블루윙즈')
                              ")
df_GK_heightavg
#라인차트 plot(v,type,col,xlab,ylab)
GK_heightavg <- function(df_GK_heightavg){
  return(plot(df_GK_heightavg$GK_HEIGHTAVG,type = "o",xlab = df_GK_heightavg$TEAMNAME_NAME)
)  
}
#byTEACHER 30번
query = "SELECT A.WINNER,
COUNT(A.WINNER) WIN_COUNT
FROM(SELECT
K.SCHE_DATE 경기날짜,
CASE
WHEN K.HOME_SCORE > K.AWAY_SCORE THEN HT.TEAM_NAME
WHEN K.AWAY_SCORE > K.HOME_SCORE THEN AT.TEAM_NAME
ELSE '무승부'
END WINNER
FROM SCHEDULE K
JOIN TEAM HT
ON K.HOMETEAM_ID LIKE HT.TEAM_ID
JOIN TEAM AT
ON K.AWAYTEAM_ID LIKE AT.TEAM_ID
WHERE
K.GUBUN LIKE 'Y'
AND K.SCHE_DATE LIKE '2012%'
)A
WHERE A.WINNER NOT LIKE '무승부'
GROUP BY A.WINNER
ORDER BY WIN_COUNT DESC"
rs <- dbGetQuery(conn, query)
barplot(rs[,2],names.arg=rs[,1], main = "승리수")
