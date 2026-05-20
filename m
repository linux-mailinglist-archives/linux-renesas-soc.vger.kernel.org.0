Return-Path: <linux-renesas-soc+bounces-32868-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIm7H3yzDWo62AUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32868-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 15:13:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA28258E93C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 15:13:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 114CC3037BCB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 13:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6BB336F428;
	Wed, 20 May 2026 13:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V1LiJLbT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h6j01Agg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5932246BC0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 13:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779282291; cv=none; b=RGIxmWbkdIAQzqVoXwMAvkG7/d64vKSpyKrs5jRxgeOw6SY4IaAXQDcSmkkZDyhx2rbsnvzJAEOuk6xOSNOV7qAFkmSopmFArRRphm7T4nVV5CdxgUqgVPIhw0nUvSLPHiS2VrJq5g9ONnP2DIewEEoTZIdewLDhVzNby+HJB70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779282291; c=relaxed/simple;
	bh=GQQrx1sGVnqbKnvWv78r5yHuONIlxJWqqPy7Xm4CCbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOetGoBn9FbijMRo5FmJ03P0zxXm74qXYnYZu3rtsV4P2hvcgEGcQTyp/DKN+46si/Kc+Pv0bbxm9efJK1/57pmAU9HVY+Ah25xO1KIV+g1DJOUUVh8khYxcsnYv1x9FO0Y99NfDdmpB9SRmfoIxn4w/9DRyDY+HMFvEAYJCUUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V1LiJLbT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h6j01Agg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7KPvW1725603
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 13:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kpTG2ueCP7uKXj2aLZqi4ovU
	YrM7cSBV0BgwJSqxzwc=; b=V1LiJLbTqPYTUwTneVZ2/bD4/eI/jNZYROYPYJl7
	24ogz0cLpsxdggcqr7bE2z6EXcV3+AaYa5+J9efjYu1tUvbMv0AnuUPYgSsCV5YR
	pe7lD+7TITnprsJNWZYYwDAxor45/PlCaZkDlg20RzC5pRl6KdbsjOc0KCd0fDhn
	UfXvG+5TyNqnDi/ZJ8HyoOHMiskyOJOV2dVVD8ywNi3vS3Z0N0inWTg1key2QqJZ
	3hZnWmWB9D19O/Kz2ZqopTq8uoFJxEHAfbYdIb3EEerOGYu1A6BO6uWLMuzn7fnz
	b5WDRIMaFwOeFYzVOBSVNk2WQ8Wl3uk26MwIUnnmVXp29Q==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qmu1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 13:04:45 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7dcd7302f00so5525567a34.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 06:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779282285; x=1779887085; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kpTG2ueCP7uKXj2aLZqi4ovUYrM7cSBV0BgwJSqxzwc=;
        b=h6j01AggGmtsv3yWxKV79QFcNS6VKOCG164pGrvlpAZysWpmsEumT2p5y3tEPuRfDz
         Zc/+DjFG63C14SBRWpNLjo6iDiXmXoK9ej1/XQV0Q5YdLrZo3STRjEqjiCmms71vauqD
         O8+GGTyrGwDLqpfdROGSWLDRBLujk3G1rd1FC2V+0HLGo+UAq9uXaQ5KNfpCXHsnEQzZ
         WrPphsQjqCCUd551aPGugYhZmk5/rpB9vC60EquywKE9/fhusW/BS8C9NS3xcqjL/M7w
         +TJCpKt+OB1V1gEHxMuf7JYSi8EquESy/lD9CmMavlSl8LXz3WRFJiHBxeKl2c2T0Ss/
         Heqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779282285; x=1779887085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kpTG2ueCP7uKXj2aLZqi4ovUYrM7cSBV0BgwJSqxzwc=;
        b=Uvxc00lMmsfl3GcyXXnMU0TX99LVG8nqVouv4d9ek7w/+oyCCsQY4A2SHJDRd8njMA
         oFo914/gUG75VjCVdtfVaqFjPZcfdD18VxJqpA6YskcXNpEsIivmr0FC3gTz1OJ0J//U
         2RC/FpHR2eVXs97MAKUFDK89t6D22xYoYtuRW+Lyu4Bc22DLnX81Jr74/K9H56eScivp
         BXkSmhNin9btb9p7DvXuSzq3+pHCaIuaY+7P3EA+OHUUA4D2XcBhhHvGhUKmiNKOmlME
         iT0M7jJ+Ns16eIILBgfY0jglwX7IYNtWksw4tNnP2g/NspKwk+kBEvgqP59pmCl5DH/G
         EDDA==
X-Forwarded-Encrypted: i=1; AFNElJ96TDo5f4OTg5wvm+wkaJ3Q4W02qfKXfxsj6SWcrzn4JOBby2pzIZTsWru/vQbJzGnDuUJuMgphfF5iLTGrzaO50g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyORPX66qoklM5cI/KG5APWlAZ8cB3txTWe1Mby233HAWuxtBkE
	RJ9uItyBXgOtqM32ZN5xzcFO2BEhDd+x90uLj1qHMX7O/ITnyO8SzrlxVcgXKX+Tfzc2xmhtykk
	XsIwqhu3MpjU9dZXalRyLEGgXR+UEK5PpciKIMHrJBaeaFRSFchfpiCrX38ncBOnht1wmEtuthw
	==
X-Gm-Gg: Acq92OFA37swFMzf1DbTED76EmVs3x7DZEwnj1jEaqubiqfRsHAOPWTv8hUsiBAU5uN
	e4/D/FjcBtsZZAGJwG5GyTUvJUcFejBBBM+gws3i6e598B2S200LidAEs2LXuSOIJH3AdjvGNYs
	xgzh1W+FcpLdnzmY2TPtVex94YsfdNUKuXKIaOPkB2Stvy5nWyV7S/aJhJi5wnJY2XYQnovyoVA
	9RlRIU7aXe7wDfTMmzGfXCgbXtbq3ZCj5lAPVVf0rzDoBY0Xod7cgBDHdqvl8z87sFe2hwluE1y
	X4VagYnMGApFoUUv4RMoSsi+p0ausjYccct6M/rWALoH6F6iSufSAeA67iwozMtcJs7reqRtUKR
	oSn9NWni8I2Zu+ZblqbhYXV0P9XZtbm3RTEBLaFW+jk6pHAPP5YvGE87sogBRfpcmUpL6WZHOKk
	ekhqQhmhLUXu0fQScv6oqeoULq/x8VlpOEdXg=
X-Received: by 2002:a05:6830:6d0e:b0:7d7:d100:2613 with SMTP id 46e09a7af769-7e4ea03bfb3mr14892430a34.1.1779282284772;
        Wed, 20 May 2026 06:04:44 -0700 (PDT)
X-Received: by 2002:a05:6830:6d0e:b0:7d7:d100:2613 with SMTP id 46e09a7af769-7e4ea03bfb3mr14892372a34.1.1779282284298;
        Wed, 20 May 2026 06:04:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395887b3c3esm30377451fa.34.2026.05.20.06.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:04:43 -0700 (PDT)
Date: Wed, 20 May 2026 16:04:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: John Harrison <John.Harrison@igalia.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
        "Kandpal, Suraj" <suraj.kandpal@intel.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 0/8] drm: writeback: clean up writeback connector
 initialization
Message-ID: <wcgvogluzfrjk6rlomswkmqceilbbichxsgx3aqzpoawe7jzgw@uiy3ogtswflk>
References: <20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com>
 <177894506978.2448625.17152574519326512949.b4-ty@b4>
 <8fc45730-b2e3-4ba8-b80a-9b30557e810b@Igalia.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fc45730-b2e3-4ba8-b80a-9b30557e810b@Igalia.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEyNiBTYWx0ZWRfX1WknkHWz8gqC
 +l4JusRyGwj9cXZMKXk/okH4PbL+NtTLJCdj1kLP8MG8XebX7BujrphCY04tFNRRQFePurFLs3T
 05t0XpODX6Ak7b1rw5SHfTGmNvzAXlQaZ9FfOi2LdjOzIZzbiPZQ2nDUqwMtCGE44udO3iRlV6y
 M+r/ulBeueB/OU+xSII6SgXuhDSoO6e8YTb2oB3b/VcO8UulfovV8qF2aK7F75wBkCjqc5BxQ8f
 yrko+xrn+dRI91nd2jLUDwymmwksZg8Cb0IVsbCm5hl2RFt+3AmnBArZcmDh2PVX126Rq0Xp8oR
 Pb+k2VMdimyRo1V6JgorB7a9WT41w7+N3d/JNrfaUZrhTHr4YBAEXNYhgg6woF0kE976IIy+Q/9
 EcUi7Q2JOb9ALtjQnT9E/Nt1iSF/Kkz1ip+NRhDnoxBLIDpcwlhrGSoh0KBbseCfVp9zfESk3VV
 mq0Z+/LLC1feH3+FEAQ==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0db16d cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=e5mUnYsNAAAA:8
 a=JYzImek8qnKDYlgmmesA:9 a=CjuIK1q_8ugA:10 a=EyFUmsFV_t8cxB2kMr4A:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: ENvQ9jqjA72sXoRP-ApAkmS6njXgAPgW
X-Proofpoint-ORIG-GUID: ENvQ9jqjA72sXoRP-ApAkmS6njXgAPgW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200126
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32868-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,amd.com,igalia.com,gmail.com,ffwll.ch,arm.com,kernel.org,suse.de,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,ideasonboard.com,glider.be,raspberrypi.com,wanadoo.fr,bootlin.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,gitlab.freedesktop.org:url,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EA28258E93C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 09:59:00AM -0700, John Harrison wrote:
> On 5/16/26 08:25, Dmitry Baryshkov wrote:
> > On Tue, 05 May 2026 03:24:57 +0300, Dmitry Baryshkov wrote:
> > > Drivers using drm_writeback_connector_init() / _with_encoder() don't
> > > perform cleanup in a manner similar to drmm_writeback_connector_init()
> > > (see drm_writeback_connector_cleanup()). Migrate all existing drivers
> > > to use drmm_writeback_connector_init(), drop
> > > drm_writeback_connector_init() and drm_writeback_connector::encoder
> > > (it's unused afterwards).
> > > 
> > > [...]
> > Applied to msm-fixes, thanks!
> > 
> > [1/8] drm/msm/dpu: don't mix devm and drmm functions
> >        https://gitlab.freedesktop.org/lumag/msm/-/commit/c0c70a11365c
> > 
> > Best regards,
> That is only the first patch of the series, yes?

Yes, correct.

> 
> What is happening with the rest? Can they all be merged to drm-next now? As
> I understand it, only the first patch was still being discussed, the others
> have all been reviewed some time ago.

At least we need an ack from the AMD maintainers. I can pick up patches
3-6 to drm-misc-next, but it doesn't really help because the rest of the
patches are blocked by the AMD change.

-- 
With best wishes
Dmitry

