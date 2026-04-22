Return-Path: <linux-renesas-soc+bounces-31511-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCZCH3kX6WlpUQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31511-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 20:46:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DE5449D51
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 20:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9304F303BB33
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 18:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB27A1F3D56;
	Wed, 22 Apr 2026 18:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gly+Aqw1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B39yEwRV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808D54414
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 18:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776883514; cv=none; b=LpP4T+duUFYgGG5pvIoRGFAWZzAdaI4IglYBt+l6eyZJ/bKFgixpH+3maktVGrqOXc9pUU7tFAYY8VmXo4J5wK3ynCrpG1dzl4OIgTDWIZSqxJoPUVYLmDKF8nvzGwSfxPbgrr3LGXXzF+hdhSh6osmz3IaerZ8KV8Q3QzFZ1Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776883514; c=relaxed/simple;
	bh=V4FELy4f9vE5jcyXKZRVqPVJD85Xg9vimjMqUMlBH9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XwhCG9f6cYYxUh8lZJFj1Oj172WkwvbEY3D2WSJbHchsZWUYqQLEPE0kqmyT5d4Vw61DbpK8BUxZati/PoLQCG2REK+WS+FHpX8l0wRU0ui9WL9E+B3G6wYaT5/bsC/i+1WOcySknwnppdcsd7QqFzfNmHhCFH2L3XTJMM9Sfg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gly+Aqw1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B39yEwRV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MGA5pB3173741
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 18:45:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bevnJjRIR73/p4aK2qiXUzUc
	Ji2lAQcMOYywjRN3VJg=; b=Gly+Aqw1ktxlqmAekdeaT0aoOilbxDOQJMJNvIku
	WnjOK37fWMqI0CUsQlGCr7o4iGowwRjp2ZUsrJ3MJKA9/xh2kvajNHaM1SXRT+yO
	NLz8sdGftAqTJdiJMvhPbUGcS7Lf1buXnuJJV1+kIeu5PtZOEcsHjUsYUSqDBCwv
	GVSiV+e2X3NIqXYDV5zPbBE6QWCFp9qC4KVBZTy8PgYw5ia2yJbgmeEDMIIR1PB9
	k4pvEW4E+p0FbKgrNNkO+cp2nMLRFL+QiblJvsZUu3qnGctMurjj5v8ag1zgnP2N
	FWoytfjLeQSPp7IeScn4Kas0pWGdfR+KQy9uycNbW0ydVg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1m30hg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 18:45:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d58bed44aso107672761cf.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 11:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776883512; x=1777488312; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bevnJjRIR73/p4aK2qiXUzUcJi2lAQcMOYywjRN3VJg=;
        b=B39yEwRV2uCxgYLDyLqgn39ujoL9pn+28pLISww+ZpRgGoMFQSnHG+X2LJSDOZSEiR
         QuHJTVXDpITFPY2noV6wno1de46Y98aSH+4OJfzhlYhRUCRFg/kSw7iFgXNsGuVxVsC9
         WLakelqz6XsxvUt51ZyacI5F1o4mUQsidZNMzKTj6dnbsRzSlr/3Rc/C/v27WtMLVONz
         xSdLKeOnDMHJTsoFzRmf7ulAvTtAtCQhNjLxjy8iASXziGgjctA6yzZQKlxS71yRY4v6
         K4vz5EkYGuhzO6OgUudBdpYGaSCdWlwezyUM4wmdeoJuY1bIp0vah4eFaxYNJpToD/Ph
         QHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776883512; x=1777488312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bevnJjRIR73/p4aK2qiXUzUcJi2lAQcMOYywjRN3VJg=;
        b=B3tpjILELx5m00/QN6RdfolL+W+tnfnvA4BsKf7geiMHiD3LYSXuL2LXTCjaURlem2
         ggZPFx3JFFiGrGAnthomt8FxO0wHSZhq/0x2OkBItZKNbVVothnotFymqYSGm96LFqVC
         /3oeEB8jC5DhH6MZompNbtZPke2+DbiATKFKTpqLT9wUMFFl8yzl1Tit1sNG0pQLi+MZ
         3iob+lMFkf0hJzfHDniednXaMSWy/79xlqo0xIzKxWNU+R5mFCNaSjCDNs9RkAhsSsjN
         ZW/n2acxsBEysf7Lta5a+P/dt3Sr86eiTU55yXlKOpVmrHFtxh9BM7a2+rTwWOSVFRj2
         Fh/g==
X-Forwarded-Encrypted: i=1; AFNElJ++j5XO365HNxu/dtG/U26S128sHH/Od5DXcVMbfIcVibHqsNFDt2Vz+s8TnVt/96CK2iFl1QanTreilz4e+igOEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhTQo2ymy063w8DnZ2CtEqfMk73qn4D1RNK6AY+J5H0UMmF4uB
	NsNo05q5/hNmzL8s7wAqmFHiK37uKV8TbOcKOvdLecZDjgInsg4J75U2qWs9cZYQlVxY8DOOUQw
	dvOeysNYBTcgnQ3gHHmz7/+38GcSVKJdMn1rlL0MkHZHCFT6hyW6/ZVXe4/FORH7jlntT84+CdA
	==
X-Gm-Gg: AeBDiestwl8/cd/GPt8l/PLkIhmoyyBX/H3R0BRPJr3hWeWvFoLagkUh7jUX9Uhe+qH
	q9yaBY+PgIcWXi0Q+NSlXyP7iL4N5ofXTLxENUwIxqVyl6EtcepbnzpAHEYspggbpTQXJ08xPug
	ca1cHp/hGI4+EnMY7cFKKd08whRBv07Ts7So+uTyJx5MvoymBjHn344rBBLZGdVpO9GwT2pfifG
	ZeyIjn5VNlC/LhN1OaPGKslcOEo/2bMzj6wOdcCNtlQGF/hXIDqPgZ0ZkQ3Og2/t1N+3MVPRGcw
	xHCxcs9bYeBXioBq8skqSSjVyCS7UTrEQg9NUGR4WRQdKpEEf++/T5MzWcWp4c9lHn1suOIcOKW
	p0VCo1tySIFnzS+P+tuplXgxvHWmHczdI4GgL6rErHIFXHQk6kXH7EJnBTMl2r9hOAfxBfatvxK
	M/HVrmHTlHOGrJmLxwABw43VoNqLOks0ecjLiogof5nYTAug==
X-Received: by 2002:a05:622a:5914:b0:50d:aa29:2b67 with SMTP id d75a77b69052e-50e36c748edmr360301621cf.49.1776883511805;
        Wed, 22 Apr 2026 11:45:11 -0700 (PDT)
X-Received: by 2002:a05:622a:5914:b0:50d:aa29:2b67 with SMTP id d75a77b69052e-50e36c748edmr360300761cf.49.1776883511190;
        Wed, 22 Apr 2026 11:45:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ebf9bsm4643342e87.81.2026.04.22.11.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 11:45:10 -0700 (PDT)
Date: Wed, 22 Apr 2026 21:45:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Biju <biju.das.au@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: Re: [PATCH 3/3] drm: renesas: rz-du: Add support for RZ/G3L LVDS
 encoder
Message-ID: <j3w7jjnlms57kt75xrugj27wzielpnbl4j6imw45avi4bfi2p3@4l72u2ylswme>
References: <20260417175235.224809-1-biju.das.jz@bp.renesas.com>
 <20260417175235.224809-4-biju.das.jz@bp.renesas.com>
 <td55nrjrchomtatyx5phbojvjipwh64gnlnydqame5xakviafp@ixzaju2lnkpm>
 <9523bd97-2730-4b99-b3d0-6accc7622478@tuxon.dev>
 <m225f2xw3xkzacscycaifnc4hb3mv3o6ezaxjyhtphnjo5cfw3@6smswij3txnc>
 <d087c4f0-024d-480d-8711-5a47610b99b4@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d087c4f0-024d-480d-8711-5a47610b99b4@tuxon.dev>
X-Proofpoint-ORIG-GUID: J3Md92CK3V_-kZOYhKkRJMztyuQEQ23A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE4MSBTYWx0ZWRfX0twCMOqNHG/q
 LzlmrifNp1Mv0iV3Z4Ya323pCP/blZErcWpIZM3btsx5SFnqEA469HsJQh7VOUv97ZWqmgUiUPp
 I6StkcvNqOxdBp4DOnn+ZAg38pcqI3fl+ld8ydBA0W5RziUqKnmX4e+qpzEM4XEuDNgBIHw6Tl+
 HxHriXpuBbTkHYN9UbQJ3zwoSle2NGWA1C53V94/0qy5PqHoW37QDMwRlT7Uj3kxTWQtKYHR6wu
 q5e5+7x26+0iSJHu7Q+VT4wYsi/WUgzYcSF2eKzunMHAMvNWZnxzFCotcX+DSMXjdnlHyaZAOFS
 PiMygRJGQSazFCgkXgi5AcleIZOTXqdHhCRoWZhp36voT/oQlb1eOILeiaxsg1QMDJLlQFXl9Io
 8xc/01a5eFtXv3BjmaxVtNNNCEQUqPr9tBwXOftTH5S1rYynOiQzc0YeaxdYHN+GZn/plFVQOGJ
 n1kKa+YW1xYHKJF/gZg==
X-Authority-Analysis: v=2.4 cv=PsOjqQM3 c=1 sm=1 tr=0 ts=69e91738 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=yC-0_ovQAAAA:8
 a=ymOM-fvVj_9TNphksOoA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: J3Md92CK3V_-kZOYhKkRJMztyuQEQ23A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220181
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31511-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,bp.renesas.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,pengutronix.de,glider.be,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A5DE5449D51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 11:55:37AM +0300, Claudiu Beznea wrote:
> 
> 
> On 4/21/26 14:22, Dmitry Baryshkov wrote:
> > On Tue, Apr 21, 2026 at 12:11:28PM +0300, Claudiu Beznea wrote:
> > > Hi,
> > > 
> > > On 4/19/26 18:58, Dmitry Baryshkov wrote:
> > > > On Fri, Apr 17, 2026 at 06:52:30PM +0100, Biju wrote:
> > > > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > 
> > > > > Add support for the RZ/G3L LVDS encoder driver. It operates in single-link
> > > > > mode with 4 lanes (Data) + 1 lane (Clock) and supports pixel clock rates
> > > > > from 25 to 87 MHz. The LVDS module cannot be used at the same time as
> > > > > MIPI-DSI. However, LVDS and the DSI interface share a peripheral clock and
> > > > > the MIPI_DSI_PRESET_N reset signal. Also, the MIPI_DSI_CMN_RSTB and
> > > > > MIPI_DSI_ARESET_N reset signals must be asserted before using the LVDS
> > > > > module.
> > > > > 
> > > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > ---
> > > 
> > > [ ...]
> > > 
> > > > > +/* -----------------------------------------------------------------------------
> > > > > + * Bridge
> > > > > + */
> > > > > +static void rzg3l_lvds_atomic_enable(struct drm_bridge *bridge,
> > > > > +				     struct drm_atomic_state *state)
> > > > > +{
> > > > > +	struct rzg3l_lvds *lvds = bridge_to_rzg3l_lvds(bridge);
> > > > > +	const struct drm_bridge_state *bridge_state;
> > > > > +	int ret;
> > > > > +	u32 fmt;
> > > > > +
> > > > > +	/* Get the LVDS format from the bridge state. */
> > > > > +	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
> > > > > +	if (!bridge_state) {
> > > > > +		dev_err(lvds->dev, "failed to get bridge state\n");
> > > > > +		return;
> > > > > +	}
> > > > > +
> > > > > +	switch (bridge_state->output_bus_cfg.format) {
> > > > > +	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> > > > > +		fmt = RZG3L_LVDS_MODE_JEIDA;
> > > > > +		break;
> > > > > +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> > > > > +		fmt = RZG3L_LVDS_MODE_VESA;
> > > > > +		break;
> > > > > +	default:
> > > > > +		fmt = RZG3L_LVDS_MODE_VESA;
> > > > > +		dev_warn(lvds->dev, "Unsupported bus fmt 0x%04x\n",
> > > > > +			 bridge_state->output_bus_cfg.format);
> > > > > +		break;
> > > > > +	}
> > > > > +
> > > > > +	ret = pm_runtime_resume_and_get(lvds->dev);
> > > > 
> > > > If this  fails for any reason, the atomic_disable() would still be
> > > > called and it will decrement the counter, potentially undeflowing it.
> > > > Consider switching to pm_runtime_get_sync(), which suits better here.
> > > 
> > > AFAIK, the clocks of this HW blocks have MSTOP functionality. HW manual of
> > > RZ/G3S [1] (should be the same for RZ/G3L as well) mentions the following in
> > > the chapter 41.2.1. "If the master accesses a module that has the clock
> > > stopped and the MSTOP bit set, a bus error will occur". [1]
> > > MSTOP is set though the clock enable/disable APIs.
> > > 
> > > The clocks on RZ/G3L are part of clock power domains. If the
> > > pm_runtime_resume_and_get() fails (or any runtime PM resume calls), the
> > > clocks will be off and MSTOP set. In this case, calling atomic_disable() or
> > > any API setting HW registers will lead to sync aborts.
> > 
> > Then you've identified a bug in the code. The atomic_enable() doesn't
> > fail, so for each enable there always will be an atomic_disable() call.
> > 
> 
> Is this something that should be solved by individual drivers providing
> struct drm_bridge_funcs to the upper layers or by the subsystem itself?
> 
> Accessing HW w/o its power being on (whatever power means here, e.g. clocks,
> resets, regulators) seems odd and may lead to critical failures.

The major problem is that atomic_enable() can't fail for the design
reasons. So, yes, currently this needs to be handled by the driver which
calls pm_resume in the atomic_enable() path.

> 
> On some Renesas SoCs this used to work previously but it is not anymore with
> the addition of the so called MSTOP functionality.
> 
> Thank you,
> Claudiu

-- 
With best wishes
Dmitry

