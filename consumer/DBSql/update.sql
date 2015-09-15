--show index from member;查看索引

ALTER TABLE member ADD INDEX index_syscode (syscode)

create index index_gameType on issue_config (game_type)

create index index_issue_code on qcssc_issue (issue_code)
 