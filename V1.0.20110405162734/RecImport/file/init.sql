use xpaper ;
delete from gp_release where release_id > 4 ;
delete from gp_paper;
delete from gp_doc ;
update gp_release set release_doing = 1 where release_id = 4 ;

use xpaper;
select * from gp_release ;
select * from gp_paper;
select * from gp_doc ;
