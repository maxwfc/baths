PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "schema_migrations" ("version" text NOT NULL);
INSERT INTO "schema_migrations" VALUES('20140103231954');
INSERT INTO "schema_migrations" VALUES('20140107005805');
INSERT INTO "schema_migrations" VALUES('20140204090845');
INSERT INTO "schema_migrations" VALUES('20140204092126');
INSERT INTO "schema_migrations" VALUES('20140207102959');
INSERT INTO "schema_migrations" VALUES('20140330233219');
INSERT INTO "schema_migrations" VALUES('20140330233220');
INSERT INTO "schema_migrations" VALUES('20140330233221');
INSERT INTO "schema_migrations" VALUES('20140427192825');
INSERT INTO "schema_migrations" VALUES('20140508000842');
INSERT INTO "schema_migrations" VALUES('20140508002843');
CREATE TABLE "users" ("id" SERIAL PRIMARY KEY NOT NULL, "name" text, "bio" text, "twitter" text, "email" text, "crypted_password" text, "created_at" timestamp, "updated_at" timestamp, "salt" text, "avatar_file_name" text, "avatar_content_type" text, "avatar_file_size" integer, "avatar_updated_at" timestamp);
INSERT INTO "users" VALUES(1,'Emily A.','','','alford.emilya@gmail.com','$2a$10$jabDgw7MwCYwbdX3ml/KjeFJYsTp2KtNs9BT2F8gcTMsYu/ylUw0O','2014-04-13 22:36:01.155316','2014-05-08 02:34:22.229672','mm4Yrp2CpGXRJX6CmoLT','emilychicken.jpg','image/jpeg',67260,'2014-05-08 00:57:24.580079');
CREATE TABLE "rich_rich_files" ("id" SERIAL PRIMARY KEY NOT NULL, "created_at" timestamp, "updated_at" timestamp, "rich_file_file_name" text, "rich_file_content_type" text, "rich_file_file_size" integer, "rich_file_updated_at" timestamp, "owner_type" text, "owner_id" integer, "uri_cache" text, "simplified_type" text DEFAULT 'file');
CREATE TABLE "articles" ("id" SERIAL PRIMARY KEY NOT NULL, "user_id" integer, "body" text, "title" text, "views" integer, "draft" text, "published" boolean, "created_at" timestamp, "updated_at" timestamp, "mainImage_file_name" text, "mainImage_content_type" text, "mainImage_file_size" integer, "mainImage_updated_at" timestamp, "excerpt_length" int);
INSERT INTO "articles" VALUES(1,1,'<p>​<span>San Francisco 49ers quarterback Colin Kaepernick was gracious enough to say a few <a class="f-link" rel="nofollow" target="_blank" href="http://www.ninersnation.com/2014/5/2/5676240/colin-kaepernick-miami-suspicious-incident-comments-turlock-prayer-breakfast">words</a>  to fans, the media, and that big Niner in the sky, Jesus Christ, at a California prayer breakfast on Friday morning:<br><br><em>"It''s been put out that I did something wrong. Even though it''s a bad circumstance, a bad situation, I feel like ultimately I''ve been blessed because it''s changed my way of thinking. It''s made me stronger. It''s made me look at things differently."  </em></span></p><p><span><em>"Even this morning, this is a blessing. It makes me very happy to know that people are staying behind me the way they have."<br></em><br>Truly, Kaepernick insisted, that naked woman who nearly died has been a great blessing. God put her there, drugged and unresponsive to medical professionals, unsure if a sexual assault had taken place, too afraid to release her name for fear of a rabid, sensationalist media and the vitriol of millions of football fans eager to take to anonymous message boards to call her a gold digging whore, to make him stronger, because, as one of the nation’s top athletes, he often has difficulty with strength. He cannot wait for all the future blessings God has planned to increase his strength: maybe he’ll back over a puppy with his car when he’s adjusting the radio instead of using the rearview or perhaps the next girl he brings to his hotel will have a drug-induced seizure, convulsing helplessly before him, reaching out a trembling hand in her final moments of life, pleading with her eyes for human connection, one he is unwilling or unable to ultimately give. Maybe next time will haunt him for the rest of his life. Maybe he’ll see this next dying naked woman’s fading light in the laughter of his first born son, his future wife’s sleepy smiles, and know the fleeting, fragile nature of this life. He hopes if that happens, it will increase his upper body strength because his quads are pretty good for the time being. <br><br>“I just can’t wait to see what other blessings Christ our Lord has in store,” Kaepernick reckoned in front of a smiling crowd. <br><br>When asked for comment, God replied, “I don’t even know anymore, man.” <br><br>No word on whether or not the woman who was hospitalized after drinking and drugging with Kaepernick feels equally blessed, but she can’t throw a football, so it’s not like she’s even real. <br><br></span></p>','Super Rich Football Player Further Blessed By God With The Honor Of Having Had Naked Woman Nearly Die In His Bed',0,NULL,'t','2014-05-07 05:33:00.000000','2014-05-08 01:14:18.905036','footballpic.jpg','image/jpeg',45952,'2014-05-08 00:20:02.018790',397);
INSERT INTO "articles" VALUES(2,1,'<p style="text-align: center;"><span style="font-size: 40px;" data-font="true"><span></span>NO!<span></span></span><br></p><p><br></p><p style="text-align: center;"><iframe src="//www.youtube.com/embed/QiOF6KfXt7k" allowfullscreen="" frameborder="0" height="315" width="560"></iframe></p>','QUIZ: Are You a Feminist?',0,NULL,'t','2014-05-04 01:26:15.000000','2014-05-08 01:06:58.587152',NULL,NULL,NULL,NULL,0);
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('users',3);
INSERT INTO "sqlite_sequence" VALUES('articles',2);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE INDEX "index_articles_on_user_id" ON "articles" ("user_id");
COMMIT;
