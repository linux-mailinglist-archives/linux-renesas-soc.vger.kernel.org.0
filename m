Return-Path: <linux-renesas-soc+bounces-20174-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C89FB1F2F1
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Aug 2025 09:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 525EA582B3B
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Aug 2025 07:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A8A277CBB;
	Sat,  9 Aug 2025 07:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8L7Eauf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2175B221294
	for <linux-renesas-soc@vger.kernel.org>; Sat,  9 Aug 2025 07:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754725946; cv=none; b=WXK03PObOy1amzoFEuVETxbTQVMusOHxcETAq9QjhdtmBzvg7VxnBWs1oywv6TS5qx/KZD83n4s4PpJa3Ev8FF0Zow/uQ/cHNgCgu9kMIH4Bpk4d25rgpgq/5PUzpw0Lw4JZ83yXLUsoHe9UzhKkzlKYbP2MeyU1lrWGZH2rdXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754725946; c=relaxed/simple;
	bh=NShQXjAc0bMdUIG5TetdyH7Mk0NwnWLSBDC6CsUVxxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gUM6w7tBXKfAXJUEo0StKS/IrIUGJ9/Fpq/RyJHqjBjgiaGogcurac3avRe4UI2k9Qe4qL1/dz0WuesLoZNCftZ6AZ1ChlGL29T7qtYXIikfJbk/5Wqw0kEOv+WYLfcHDFZnMbz+3aXnZezwGBiHb2DGOLEciC1eRLpNEmY2+TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b8L7Eauf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793pv5i004767
	for <linux-renesas-soc@vger.kernel.org>; Sat, 9 Aug 2025 07:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VpEHcu9gcEArGq0cNR0CHEpsGr9nMZuYOYDfPme+0QE=; b=b8L7Eauf+2GTa4uH
	F9FNVrkFO7CgNzK4FCHg39V/+Ea32BiqVcOdCR/R9fpjyfciN+JGUAAzpTALVkbs
	S6sF3kooi/1CXYHdyxI+aab0q1uWho6jLMSGHmBBtfrxbRejsEwkHIAWnTsSVZpO
	Xqg9o62Hoo35E9qq5v8TFjiNuGAAyx59I//Bf4vWSZKcdiylxSG2r5Vz6CfBYIJE
	8go+hR3R1glDvDcTLXgI8UvYZgqaeUwqX49YzYDAPBCnX4o1lGI3H8XfXZCVwrld
	hvB4zsoLceL0rUzQlo6YDB/4DPwokVDOalsQ6gvKd+NDxm0lCgN9hn/m78fYZK61
	IQmVwA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sgd2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sat, 09 Aug 2025 07:52:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e348600cadso677084885a.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 09 Aug 2025 00:52:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754725943; x=1755330743;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VpEHcu9gcEArGq0cNR0CHEpsGr9nMZuYOYDfPme+0QE=;
        b=s2Tyh2qXUQatrko+MCYe41c9tGpMbzhM+DkX8WG+I/ZjERsBI+sY8Ov4BKO8G+3Aru
         JJkFSSkqvBSYjulOAHZOF3W/1i9Gq3BVrgrfOcHY2vVle/z/obMmFmydV1R0oZuQL48e
         SyMGpCV0bgcexZirOTHr7rviGK3x9lmFjgLEgba4OkDRhSLkojMkTw6HLoE6U51zCBcX
         q1czWX0pyHfls0hRaIbMO1UvX9W3fkHdfVRheGJIhKRYuIR2P6oVVHga18W2QVkdeOEE
         A9AI9PrCt72ttb7iPSuBNUCxGANwdO3b4fzsWbDfRdoCP3gXZiheuFTAATfDoYXicwSJ
         /UkA==
X-Forwarded-Encrypted: i=1; AJvYcCUl+V4lGElmRgr16TXFMMoTyQ7I8Ld6FS9vjONrHoGbA+7JeFUU3R4y5oASROeLN/S8HmrcIXJJ0V62QVhVoENWew==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbBP2rTDguqxeUF5r5cgZjAH1G2Qsgo6kDiRWrjcab1BQz1xf6
	62jBzYDRmFA93feB8buChAMwjK3Rlnzk36/1HIOZ0NdQdrA6AM0LMvsuFsb+3r8ginhHrLKxnpa
	Vba+dklSORNlTtuyDVWk3vWokKrDUHSTmygvm3c0v6QNzWeEsBq7ahs0qSGKp1y6rqyZ04yhkwg
	==
X-Gm-Gg: ASbGncsFgOVwlGaXi/0JiqhKImtSTsZ6Go4Xvd2z3Xqt35S87h/t4F1J+Hvgp6lMsbs
	Le3W/Ezfa9xoc+6OwavTGfC9cd3e1hxee+MFiyhsEuQMIOa2KtAVNabDuM534Bxkp4U80+vfOXX
	TwfatxTesAFSXO6n2LbOhV8IyidoEdiWID6sxMfn8feJ9bnqr1wOA7lw7NB/pPOU8rLddpkgfub
	Ttsy2DUD8Z2JgRrK3MPJ3Fa1amn9PR+iEuYYxFzdOqtIw8JroFyq6a1FKoQoIv8Wi/B/VsBzIy0
	qIohdVQIrIxSFpeMLwr2cTSZQQzeHMzP1bju0jl08/9MgH9Mer8sIAjSFXrqGTYjR4Kd/SnjqJf
	Ne7NZRNsdEH0jMK1cwZu5wVI/iytZOprM158dMBNbUR+NWKZb8zKf
X-Received: by 2002:a05:620a:4143:b0:7e8:221c:c968 with SMTP id af79cd13be357-7e82c7a1401mr845377585a.65.1754725942984;
        Sat, 09 Aug 2025 00:52:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4XWRAAnL1JlYlSACEe9f4C6EFHC69s++GpGa7tj/KvlYxLz0g3xleWIOEQplk3ocUxXH+1Q==
X-Received: by 2002:a05:620a:4143:b0:7e8:221c:c968 with SMTP id af79cd13be357-7e82c7a1401mr845373285a.65.1754725942444;
        Sat, 09 Aug 2025 00:52:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898bd63sm3312345e87.20.2025.08.09.00.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 00:52:20 -0700 (PDT)
Date: Sat, 9 Aug 2025 10:52:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
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
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 5/8] drm/msm/dpu: use drmm_writeback_connector_init()
Message-ID: <opjgpsvd3u2pje5ytyy422uxq7xzvuhfv2uhf3xz7ccampfohh@q5cu2lpcfjem>
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
 <20250801-wb-drop-encoder-v1-5-824646042f7d@oss.qualcomm.com>
 <6cbe8955-cb34-43fc-9950-0fec4b7cac3e@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6cbe8955-cb34-43fc-9950-0fec4b7cac3e@bootlin.com>
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=6896fe38 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=ROXIs7_yG6JpRt47qDYA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: wEEf7PSZDEnmYmhl6lAocpDA6t0MOJpH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX7HFf1Oneym+1
 S6gr/6srUTfFkBEtvsR4aLpCuhZP6RZFPH0ktFzOtRhoxiSCVKJ5FaEUe1QdZQqw58riqA02K2M
 cNOX9gkxAlcNWEt3gqvZqYdctjjGR8cDCgoFPdDdoBk93jJkwYiP4wSHMsbhhlwPb82Y5LIt6hv
 Ug5dl/isziRcCIlHjf+1110GK7zNOfjOY+eCZvn8TNWBrzveekJZyNFr5UjymizVZ5PCGsoNoLg
 r0Qt4YEs+5oa6ETACRRXStsZD02IOYqW+6cQ76BTiGh/JquxiggLK8uN+6d15HyyV/zOan2Fovu
 GHP5OsHfDy2kKDTuz4D8HEgaqRJodI35PBvIFv341qagMB/I09/0ZIUoT2NbOTm30CyiOXqpSnL
 yrQ5+96m
X-Proofpoint-GUID: wEEf7PSZDEnmYmhl6lAocpDA6t0MOJpH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

On Fri, Aug 01, 2025 at 04:08:37PM +0200, Louis Chauvet wrote:
> 
> 
> Le 01/08/2025 à 15:51, Dmitry Baryshkov a écrit :
> > Use drmm_plain_encoder_alloc() to allocate simple encoder and
> > drmm_writeback_connector_init() in order to initialize writeback
> > connector instance.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 23 +++++++++++++++-------
> >   1 file changed, 16 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> > index 8cd37d7b8ae281cbc1fd8cbb243c621174517e23..9986a10e8114680e9da48986f4ca3ce6ec66b8cb 100644
> > --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> > +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> > @@ -134,7 +134,6 @@ static void rcar_du_wb_conn_reset(struct drm_connector *connector)
> >   static const struct drm_connector_funcs rcar_du_wb_conn_funcs = {
> >   	.reset = rcar_du_wb_conn_reset,
> >   	.fill_modes = drm_helper_probe_single_connector_modes,
> > -	.destroy = drm_connector_cleanup,
> >   	.atomic_duplicate_state = rcar_du_wb_conn_duplicate_state,
> >   	.atomic_destroy_state = rcar_du_wb_conn_destroy_state,
> >   };
> > @@ -202,15 +201,25 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
> >   {
> >   	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
> > +	struct drm_encoder *encoder;
> > +
> > +	encoder = drmm_plain_encoder_alloc(&rcdu->ddev, NULL,
> > +					   DRM_MODE_ENCODER_VIRTUAL, NULL);
> > +	if (IS_ERR(encoder))
> > +		return PTR_ERR(encoder);
> > +
> > +	drm_encoder_helper_add(encoder, &rcar_du_wb_enc_helper_funcs);
> > +
> > +	encoder->possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
> 
> drm_crtc_mask?

I was just moving the code, but I think this kind of change is fine

> 
> With this:
> 
> Reviewed-by: Louis Chauvet <louis.chauvet>
> 
> > +
> >   	drm_connector_helper_add(&wb_conn->base,
> >   				 &rcar_du_wb_conn_helper_funcs);
> > -	return drm_writeback_connector_init(&rcdu->ddev, wb_conn,
> > -					    &rcar_du_wb_conn_funcs,
> > -					    &rcar_du_wb_enc_helper_funcs,
> > -					    writeback_formats,
> > -					    ARRAY_SIZE(writeback_formats),
> > -					    1 << drm_crtc_index(&rcrtc->crtc));
> > +	return drmm_writeback_connector_init(&rcdu->ddev, wb_conn,
> > +					     &rcar_du_wb_conn_funcs,
> > +					     encoder,
> > +					     writeback_formats,
> > +					     ARRAY_SIZE(writeback_formats));
> >   }
> >   void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,
> > 
> 
> -- 
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

-- 
With best wishes
Dmitry

