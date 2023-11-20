CREATE TABLE t_user
(
	iuser INTEGER AUTO_INCREMENT
	,uid VARCHAR(50)
	,upw VARCHAR(50)
	,nm VARCHAR(50)
	,pic VARCHAR(300)
	,created_at TIMESTAMP DEFAULT NOW()
	,updated_at TIMESTAMP DEFAULT NOW()
	,PRIMARY KEY(iuser)
);

CREATE TABLE t_fav
(
	ifeed integer
	,	iuser integer
	,	created_at tiMESTAMP DEFAULT NOW()
);

CREATE TABLE t_feed
(
	ifeed INTEGER
	,	iuser integer
	,	contents VARCHAR(1000)
	,	location VARCHAR(100)
	,	created_at TIMESTAMP DEFAULT NOW()
	,	updated_at TIMESTAMP DEFAULT NOW()
);
CREATE TABLE t_feed_pics
(
	ifeed_pics INTEGER AUTO_INCREMENT 
	,	ifeed  INteger(10)
	,	pic VARCHAR(1000)
	,	created_at TIMESTAMP not null DEFAULT NOW()
	,	PRIMARY KEY(ifeed_pics) 
);

ALTER TABLE t_feed
ADD CONSTRAINT
FOREIGN KEY(iuser)REFERENCES t_user(iuser);

ALTER TABLE t_feed_pics
ADD CONSTRAINT
FOREIGN KEY(ifeed) REFERENCES t_feed(ifeed);

CREATE TABLE t_feed_fav
(
	ifeed INTEGER 
	,iuser integer
	,created_at TIMESTAMP DEFAULT NOW()
);

ALTER TABLE t_feed_fav
ADD CONSTRAINT
FOREIGN KEY(iuser) REFERENCES t_user (iuser); 
ALTER TABLE t_feed_fav
ADD CONSTRAINT
FOREIGN KEY(ifeed) REFERENCES t_feed (ifeed); 

ALTER TABLE t_feed_fav
ADD CONSTRAINT
PRIMARY KEY(ifeed,iuser);

CREATE TABLE t_feed_comment
(
	comments VARCHAR(500)
	,	created_at TIMESTAMP DEFAULT NOW()
	,	updated_at TIMESTAMP DEFAULT NOW()
	,	iuser INTEGER
	,	comments_where integer
);

ALTER TABLE t_feed_comment
ADD CONSTRAINT
FOREIGN KEY (iuser) REFERENCES t_user(iuser);

ALTER TABLE t_feed_comment
ADD CONSTRAINT
FOREIGN KEY (ifeed) REFERENCES t_feed(ifeed);


