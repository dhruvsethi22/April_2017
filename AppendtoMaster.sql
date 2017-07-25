use mini_project;
Insert Into Table Main_Data_Set
Select p.*, awpbc.ve_total, awpbc.pvh_invl, awpbc.peds,awpbc.persons, awpbc.pernotmvit,
awpbc.permvit, awpbc.city, awpbc.year, awpbc.day_week, awpbc.nhs, awpbc.rd_owner, awpbc.route,
awpbc.tway_id, awpbc.tway_id2, awpbc.milept, awpbc.sp_jur, awpbc.reljct1, awpbc.reljct2,
awpbc.typ_int,awpbc.wrk_zone, awpbc.rel_road, awpbc.lgt_cond, awpbc.weather1,
awpbc.weather2, awpbc.weather, awpbc.rail, awpbc.not_hour, awpbc.not_min, awpbc.arr_hour,
awpbc.arr_min,awpbc.hosp_hr, awpbc.hosp_mn, awpbc.cf1, awpbc.cf2, awpbc.cf3,
awpbc.latitude, awpbc.longitude, awpbc.zipcode, awpbc.fatals, awpbc.drunk_dr, awpbc.station_id,
awpbc.station_name, awpbc.date_1, awpbc.tmax, awpbc.tmin, awpbc.prcp, awpbc.snow, awpbc.snwd,
awpbc.pbtype, awpbc.pbage, awpbc.pbsex, awpbc.pbcwalk, awpbc.pbswalk, awpbc.pbszone, awpbc.pedctype,
awpbc.bikectype, awpbc.pedloc, awpbc.bikeloc, awpbc.pedpos, awpbc.bikepos, awpbc.peddir, awpbc.bikedir,
awpbc.motdir, awpbc.motman, awpbc.pedleg, awpbc.pedsnr, awpbc.pedcgp, awpbc.bikecgp, awpbc.aoi1,
awpbc.aoi2, awpbc.eventnum, awpbc.soe, awpbc.vnumber1, awpbc.vnumber2,vvddm.numoccs, vvddm.unittype,
vvddm.hit_run, vvddm.reg_stat, vvddm.owner, vvddm.model, vvddm.vin, vvddm.j_knife, vvddm.mcarr_i1,
vvddm.mcarr_id, vvddm.mcarr_i2,vvddm.gvwr, vvddm.v_config, vvddm.cargo_bt, vvddm.bus_use,
vvddm.haz_inv, vvddm.haz_id, vvddm.haz_plac,vvddm.haz_cno, vvddm.haz_rel,
vvddm.trav_sp, vvddm.underide, vvddm.rolinloc,vvddm.deformed, vvddm.towed, vvddm.m_harm, vvddm.veh_sc1,
vvddm.veh_sc2, vvddm.l_state, vvddm.dr_pres, vvddm.dr_zip, vvddm.l_status, vvddm.l_type, vvddm.cdl_stat, vvddm.l_endors,
vvddm.l_compl, vvddm.l_restri, vvddm.dr_hgt, vvddm.dr_wgt,vvddm.prev_acc, vvddm.prev_sus,
vvddm.prev_dwi,vvddm.prev_spd, vvddm.prev_oth,vvddm.first_mo, vvddm.first_yr, vvddm.last_mo,
vvddm.last_yr, vvddm.speed_rel, vvddm.dr_sf1,vvddm.dr_sf2, vvddm.dr_sf3,vvddm.dr_sf4,
vvddm.vtrafway, vvddm.vnum_lan, vvddm.vspd_lim,vvddm.valign, vvddm.vprofile, vvddm.vpavetyp,
vvddm.vsurcond, vvddm.vtrafcon, vvddm.vtcont_f, vvddm.p_crash1, vvddm.p_crash2, vvddm.p_crash3,
vvddm.pcrash4, vvddm.pcrash5,vvddm.acc_type, vvddm.deaths, vvddm.dr_drink,vvddm.veventnum, vvddm.mdrdstrd,
vvddm.mdareas, vvddm.drimpair, vvddm.mfactor, nm.nmimpair from Person_Subset p
left join
(Select a.*, w.station_id, w.station_name, w.date_1, w.tmax, w.tmin, w.prcp, w.snow, w.snwd,
 pb.pbtype, pb.pbage, pb.pbsex, pb.pbcwalk, pb.pbswalk, pb.pbszone, pb.pedctype, pb.bikectype,
 pb.pedloc, pb.bikeloc, pb.pedpos, pb.bikepos, pb.peddir, pb.bikedir, pb.motdir, pb.motman,
 pb.pedleg, pb.pedsnr, pb.pedcgp, pb.bikecgp,c.eventnum, c.aoi1, c.aoi2, c.soe, c.vnumber1, c.vnumber2
from Accident_Subset a
left join (
Select wsi.station_id, wsi.state, wsi.station_name, wsi.latitude, wsi.longitude, wsi.zipcode,
  ws.date_1, ws.tmax, ws.tmin, ws.prcp, ws.snow, ws.snwd from weather_station_info wsi
inner join weather_2_station ws
on wsi.station_id = ws.station_id) w
on a.zipcode = w.zipcode
left join Pbtype_Subset pb
on a.st_case = pb.st_case
left join Cevent_Subset c
on a.st_case = c.st_case) awpbc
on p.st_case = awpbc.st_case
left join
(Select v.*, ve.veventnum, d.mdrdstrd, dm.mdareas, dp.drimpair, f.mfactor
from Vehicle_Subset v
left join Vevent_Subset ve
on v.st_case = ve.st_case
and v.veh_no = ve.veh_no
left join Distract_Subset d
on v.st_case = d.st_case
and v.veh_no = d.veh_no
left join Damage_Subset dm
on v.st_case = dm.st_case
and v.veh_no = dm.veh_no
left join Drimpair_Subset dp
on v.st_case = dp.st_case
and v.veh_no = dp.veh_no
left join Factor_Subset f
on v.st_case = f.st_case
and v.veh_no = f.veh_no) vvddm
on p.st_case = vvddm.st_case
and p.veh_no = vvddm.veh_no
left join nmimpair_subset nm
on p.st_case = nm.st_case
and p.veh_no = nm.veh_no
and p.per_no = nm.per_no;
