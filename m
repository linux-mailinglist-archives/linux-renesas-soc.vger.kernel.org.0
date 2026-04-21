Return-Path: <linux-renesas-soc+bounces-31453-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gK6xEOxd52l87AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31453-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 13:22:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0459143A0A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 13:22:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E13FA3008C8E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 11:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A543BC69F;
	Tue, 21 Apr 2026 11:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H+29Q2mz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XrXKCmJH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C0F3B776E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Apr 2026 11:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776770532; cv=none; b=nIJNLXD/Npv5mFHHr1hY7FoFHWT2wn+QMosH2FvzN5ip0KbeGiMDrduZvjFc0R8BGBQr66xlc7oq7UxOAawSm2qdfKaoPji21/ViKHOSrGu2+Zfn2HHvn4Mty6zGJ8LiCCWsmfyLRDs2cTfPX43PRZRIAi+fQ1utEFmUsLnGuoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776770532; c=relaxed/simple;
	bh=xMfDMIHKxeVa6/+tMZFU2Ac/H1vRoW5skcnc9XO0vIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uYHobKYidc0kzAg2jymmCjog4DR89vbFlc+5yQF0PoYOW5sRy7EiLrhKUoXw8nq0obwPQtvtVjmPoqrNGl2c5TvkYK/RPFS8Su2jWiLxX5sGCf03lg2NrXf+RqqetDgBscH4d2fIu3A8ZchTw84Ocs8R38J4d+LVq4t5zW5YpKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H+29Q2mz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XrXKCmJH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L74Lqe1538545
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Apr 2026 11:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=50XlgasD2lNjDD3FnXwrtdbf
	2oU2iRb6FUDysqOc+hQ=; b=H+29Q2mzPwQQB4kjO0sv3zl7gcQMgTp9YGWhR7jS
	ETIZlednz38QIN8BbjKFyvjGxATQlHBsG+Ke6Bazi8QcumZ99EIE+wkk3SIXzv6N
	YIre/e4s2jLt1Ff3P1qTr0D+XV27wGLeN/dUqQy+o7b0cISfowXvyprNCqgyNGvv
	t5ldGWMBc+YutCYXI7OyNnFOm9esDPfPOgeBs8CDMRgmyhCVGnM8vcU2GW4KXuhk
	2lhKMvlGSEw6IJbtnP2R5fm22fsZ/e/IaUX6M1lDOVthTNVGY7MLNIcGw11T/ioK
	il2pVUUkm0tdS60XSqP3NrLwYix6yg/QPijdBFsDgv4QbQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp4hagxch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Apr 2026 11:22:10 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-948b41f95deso5144795241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Apr 2026 04:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776770529; x=1777375329; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=50XlgasD2lNjDD3FnXwrtdbf2oU2iRb6FUDysqOc+hQ=;
        b=XrXKCmJHY+BHuC897Rksnmr1PTq5ibd5SopBMkr4ImuE9Uptx1qpXrEVgZCcSLUzgI
         Sc2j67dcrxdomnMt7zVk+i5p/RfVgD9fv/45YE6C1PMBHcHXOB3Ot8oUwS4Ov2ZLr57+
         3IVIMavYwYLbhT3X3Jm55GVJQL43M4AAICuYvmbPBJBdXpgk6P7TQRocPmSfCKxi5a6X
         kolWq8p9JEtQv+qD6RAO/tl6k9pATcw66XNUxNNgEe+q0PW0XhFbm0OFcx8wZAyG671s
         4LBdkyHjP4CZ7X8nA6Wys3n2bVV7WmqK2G4j94Fvjysd4sfhelT88qk1flMBfyO5iWEq
         eulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776770529; x=1777375329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=50XlgasD2lNjDD3FnXwrtdbf2oU2iRb6FUDysqOc+hQ=;
        b=Sx6pa9C5OkPQ2woa7qXy7ofnxnKuL3PvHoEpeLz8et5BZkEIHe4DBwg5QMq27S6KXB
         G5iaerv77SwDlM6iVNecq9wYdUOSqsCmPWFtOruXcNPiuYVyYJdlaS5dBHarYq+Ys15/
         GJe/CmPJxwlc25/0dS14JfYWuTv7mbMPusrLPKvBKdnhAAtdsIl3CUHEzyM8vpsOAYJZ
         K9a2IO9UmvtXrXoMgrdgxRCyqyHktryV/MkmMcVb/nE9MS64dFtO9Tdog2ak9O/nRyBJ
         JCIpFC0QrfzbbFoMx8XbV7KOHnDo9EYtczBiTTNHawVdtbFHeatC7bFYBN0OGy9xc4o+
         loUg==
X-Forwarded-Encrypted: i=1; AFNElJ88O6lRz8/FJ68Q9cRdgygYR9Phxk8jvh0BDthI1nolfX3YNFBe5U9Lahx4A3nEdz1nE8vfuZSmkyTywk55TNRROw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp4ZE6XrA7Y1P93AKZaCITt6GoCK0c6cnRpaiH2UERX8B/8c1n
	iuYdFap9yw2UozglbF3p7BrSw1Tb1tW3CQoCuBuF/FdJFYrIdDgUkMjILowinHHgTw/It3sAqgD
	Q6w4eUHM642SNVldpd21B7RSZKv6Uz8bPdknp/OSWx2Y1uDZqE86W1Y3aKWifnYzPNAU166Rf3g
	==
X-Gm-Gg: AeBDiesiitQGZYL+I0bVkIPeRSEhg1v3pOzw8vV35cianb9pXnifoU+1mJOm1Hz8Cw/
	GTbYbpCZq8XQzM8C28jgxb0fX51aEUt8TqrKkn6hxK+ziv2ZmW4z1CZUw6WmTvUgtQDCTKFWrnp
	bjAL+vEx1lhA6Ylye7kZc5s0b1Yr2eXxvGGTwYpo4Dn4T5zCpMprl2ajtUjSMX2hK/9p3Yzhwkg
	GnTf6YiYgk7PCHacwd9808Usnf/TNc3kg55OPlCcsUtLaNTL33KD8Q1iGjU4NCbymFxPWDSoBWd
	I1I5z33+5Oo4uQS3t9L9WNtdlJNexEfCYsVRAtnRvAAIEcpXkCmBMc6KMYSdNnbmNY4K03KAY+4
	R9CCC1d5ZysYFdEvFlDeRCyHhOtF92AvLnmTcUX9S5QUgg1gmgpjjbaTGARiKV7KyhnblXjozwv
	FwR1rxPPt4iWyTJIRH22RJgjsU3GS4yf/Kc1nhhn1w8pL39Q==
X-Received: by 2002:a05:6102:3581:b0:611:b9be:1199 with SMTP id ada2fe7eead31-616f6ee96damr8142481137.14.1776770529199;
        Tue, 21 Apr 2026 04:22:09 -0700 (PDT)
X-Received: by 2002:a05:6102:3581:b0:611:b9be:1199 with SMTP id ada2fe7eead31-616f6ee96damr8142470137.14.1776770528743;
        Tue, 21 Apr 2026 04:22:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb4f54ffsm29613461fa.1.2026.04.21.04.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 04:22:07 -0700 (PDT)
Date: Tue, 21 Apr 2026 14:22:05 +0300
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
Message-ID: <m225f2xw3xkzacscycaifnc4hb3mv3o6ezaxjyhtphnjo5cfw3@6smswij3txnc>
References: <20260417175235.224809-1-biju.das.jz@bp.renesas.com>
 <20260417175235.224809-4-biju.das.jz@bp.renesas.com>
 <td55nrjrchomtatyx5phbojvjipwh64gnlnydqame5xakviafp@ixzaju2lnkpm>
 <9523bd97-2730-4b99-b3d0-6accc7622478@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9523bd97-2730-4b99-b3d0-6accc7622478@tuxon.dev>
X-Authority-Analysis: v=2.4 cv=bOQm5v+Z c=1 sm=1 tr=0 ts=69e75de2 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=yC-0_ovQAAAA:8
 a=aPXnMlqv0fPtNfNeGM4A:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: 3EhQ-w7pfqEj57YWMVVwBXz26_avxo-p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDExMiBTYWx0ZWRfX5/9m7JeAxH3h
 1YuvJCUPR6X3J76IU29YtTErba6gqwCbcRnL5zVjtKQ2MErJW7VuxKD3KwGYQ/f7toinQlSTZ9V
 76/JTFLr8Ah3qTQMy5iKeQbqS24nKwvwXOUhI5IoHRMVFDnbhteDHIk62Cd7krIque734TYsCzV
 TBjyg3hppCLx7qPiwZMsyX9XU3J4tz6E4UV7l4/4baiLNaTpDZvlKvQuEEyFgohuIUi1fYFKw4z
 t09q+mStuhtMmmN6MGoOOqFDSfmDf9WnZ8pqrIpVcvkbQ+gZBXJ4wOEDlgXX0Wfh2/D0XrG5Kt3
 69UVCyJ1eG+UpqRomdLR0l8+kdzvA73yJQUoWY7kWA82XuAWvdNoVXHKG2QwIRsFcjUoCScT3Yo
 yCpDq45FnbhrsVjPN0K40njwVg7+Ja0aOB06YHuQWjcXzm7Xp2J+dIdHU8BxPXJSYBGtifcqtgR
 O4QXSlaUJA/fH2a7KYg==
X-Proofpoint-ORIG-GUID: 3EhQ-w7pfqEj57YWMVVwBXz26_avxo-p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 clxscore=1011 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210112
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31453-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,bp.renesas.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,pengutronix.de,glider.be,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0459143A0A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 12:11:28PM +0300, Claudiu Beznea wrote:
> Hi,
> 
> On 4/19/26 18:58, Dmitry Baryshkov wrote:
> > On Fri, Apr 17, 2026 at 06:52:30PM +0100, Biju wrote:
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > 
> > > Add support for the RZ/G3L LVDS encoder driver. It operates in single-link
> > > mode with 4 lanes (Data) + 1 lane (Clock) and supports pixel clock rates
> > > from 25 to 87 MHz. The LVDS module cannot be used at the same time as
> > > MIPI-DSI. However, LVDS and the DSI interface share a peripheral clock and
> > > the MIPI_DSI_PRESET_N reset signal. Also, the MIPI_DSI_CMN_RSTB and
> > > MIPI_DSI_ARESET_N reset signals must be asserted before using the LVDS
> > > module.
> > > 
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> 
> [ ...]
> 
> > > +/* -----------------------------------------------------------------------------
> > > + * Bridge
> > > + */
> > > +static void rzg3l_lvds_atomic_enable(struct drm_bridge *bridge,
> > > +				     struct drm_atomic_state *state)
> > > +{
> > > +	struct rzg3l_lvds *lvds = bridge_to_rzg3l_lvds(bridge);
> > > +	const struct drm_bridge_state *bridge_state;
> > > +	int ret;
> > > +	u32 fmt;
> > > +
> > > +	/* Get the LVDS format from the bridge state. */
> > > +	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
> > > +	if (!bridge_state) {
> > > +		dev_err(lvds->dev, "failed to get bridge state\n");
> > > +		return;
> > > +	}
> > > +
> > > +	switch (bridge_state->output_bus_cfg.format) {
> > > +	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> > > +		fmt = RZG3L_LVDS_MODE_JEIDA;
> > > +		break;
> > > +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> > > +		fmt = RZG3L_LVDS_MODE_VESA;
> > > +		break;
> > > +	default:
> > > +		fmt = RZG3L_LVDS_MODE_VESA;
> > > +		dev_warn(lvds->dev, "Unsupported bus fmt 0x%04x\n",
> > > +			 bridge_state->output_bus_cfg.format);
> > > +		break;
> > > +	}
> > > +
> > > +	ret = pm_runtime_resume_and_get(lvds->dev);
> > 
> > If this  fails for any reason, the atomic_disable() would still be
> > called and it will decrement the counter, potentially undeflowing it.
> > Consider switching to pm_runtime_get_sync(), which suits better here.
> 
> AFAIK, the clocks of this HW blocks have MSTOP functionality. HW manual of
> RZ/G3S [1] (should be the same for RZ/G3L as well) mentions the following in
> the chapter 41.2.1. "If the master accesses a module that has the clock
> stopped and the MSTOP bit set, a bus error will occur". [1]
> MSTOP is set though the clock enable/disable APIs.
> 
> The clocks on RZ/G3L are part of clock power domains. If the
> pm_runtime_resume_and_get() fails (or any runtime PM resume calls), the
> clocks will be off and MSTOP set. In this case, calling atomic_disable() or
> any API setting HW registers will lead to sync aborts.

Then you've identified a bug in the code. The atomic_enable() doesn't
fail, so for each enable there always will be an atomic_disable() call.

-- 
With best wishes
Dmitry

