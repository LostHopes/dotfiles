"use strict";(("undefined"!=typeof self?self:global).webpackChunkclient_web=("undefined"!=typeof self?self:global).webpackChunkclient_web||[]).push([[5457],{43776:(e,s,l)=>{l.r(s),l.d(s,{default:()=>b});var a=l(50959),t=l(35869),n=l(11317),i=l(98604),r=l(71764),d=l(18982),u=l(19930),o=l(11527);const c=({uri:e,playlistId:s,leavebehinds:l})=>{const a=d.Tg.PLAYLIST;return l&&l.length>0?(0,o.jsx)(i.w,{surface:a,uri:e,leavebehinds:l.slice(0,u.aV),seeAllButton:l.length>u.aV?(0,o.jsx)(r.j,{leavebehinds:l,surface:a,pathname:`/playlist/${s}/see-all-ads`,state:{uri:e},uri:e}):null}):null};var h=l(45883);const f=e=>e.ads.sponsoredPlaylist.sponsoredPlaylist.get("allSponsorships"),b=({uri:e,playlistName:s})=>{const l=(0,n.EC)(e)?.id,i=(0,t.v9)(f),r=i?.some((e=>e.playlistId===l)),b=d.Tg.PLAYLIST,{data:v,error:p,getLeavebehinds:g}=(0,h.Z)({surface:b,uri:e,playlistName:s});if((0,a.useEffect)((()=>{g()}),[g]),!v?.leavebehindAds||p||r)return null;const m=(0,u.D7)(v,e);return v&&v.leavebehindAds.length>0&&l?(0,o.jsx)(c,{uri:e,playlistId:l,leavebehinds:m}):null}},71764:(e,s,l)=>{l.d(s,{j:()=>c});var a=l(36275),t=l(68007),n=l(84231),i=l(85648),r=l(24071),d=l(18982),u=l(19930),o=l(11527);const c=({leavebehinds:e,surface:s,uri:l,pathname:c,state:h})=>{const f=(0,r.s4)(),b=`${i.ag.get("view.see-all")} (${e.length<=u.fz?i.ag.formatNumber(e.length):i.ag.formatNumber(u.fz)})`;return(0,o.jsx)(a.rU,{to:c,state:h,children:(0,o.jsx)(t.o,{"data-testid":"leavebehinds-see-all",size:"small",onClick:()=>{f.send((0,n.a)({leavebehind_request_id:e[0].requestId,event:"event_clicked",event_reason:"cta_see_all",surface:(0,d.OO)(s),uri:l}))},children:b})})}}}]);
//# sourceMappingURL=playlist-leavebehinds.js.map