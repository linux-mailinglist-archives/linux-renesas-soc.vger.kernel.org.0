Return-Path: <linux-renesas-soc+bounces-24112-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1353C337D0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 01:39:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A45A427FB9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 00:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34951D63F5;
	Wed,  5 Nov 2025 00:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hP3HVb6O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g8MYuSrS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34552940D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Nov 2025 00:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762303170; cv=none; b=qRwwsvMHFQnx+SXevn0z+/RY3t7jq4eyOb5Ymr4QisvYHTHcNmVHgRcd9/NCN+oIt/9ror6OS4IJywsrO15onfR6KChX2hTRnQCqspTL2Wers9jRuwSIEyfjx5qX8q+zSOfNk/OPZSXWEsRWyrdsCBbyHJ4e853kiOQUdWZAFw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762303170; c=relaxed/simple;
	bh=lDk02qC5u1ro9HbXlcRBn/dzxEt1Og8Og6FOlhRc6lk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sEG1JZsID0rYx+Npmp9+HjrN+Ij6kY1L27SzL6xi/addlbr4EyGfUuTDPAee85nwtwc7DnxiMR8LOrwaxvAj/lcRYbVn3R2vQ/2rm0hB8po40d7lVIEn6SMdcR7j/jmS7D6gP9CR1wG/+OmG9dvj6+HtyPN1+hyqbSGlTpCFTvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hP3HVb6O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g8MYuSrS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4KfmhB2967284
	for <linux-renesas-soc@vger.kernel.org>; Wed, 5 Nov 2025 00:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BzFWrus5ToDQoAoDgYGAeJvj
	7pPGBO5zh4BEeX+7e1M=; b=hP3HVb6OLtaKhgMbJqnE9uY/1P3GcyuUhB9Tpu7t
	JKMWJRQLZV4KabicOMHfnJ2J1/jYp/VwM1ITWplYb1YReCw9g78TTi5dNe1ETy0R
	XBGR8s1w7k8BHU4Q09IwMre9VhU6k205H3AVJ1ASYRETQ7GwG7fGaHVYl1tt3dl3
	9VnlUhzoMAaYpijecthL4JMzlb3xZQEOeNsUPYNfWIzPydDwpUAMpZpqs34LmrfE
	3buMGCUGFJmV33iR75mc+4Cq6eKHtQ/jKQ1r6Y7mk9voAKBYhIr/DZKv7LlSG3Ye
	ulLB5H1e5oONvebQrBxvv82X2DTMEwWEojZTcnVmGr7RVA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7heaj25b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Nov 2025 00:39:28 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7ae70693579so76388b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Nov 2025 16:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762303167; x=1762907967; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BzFWrus5ToDQoAoDgYGAeJvj7pPGBO5zh4BEeX+7e1M=;
        b=g8MYuSrScYq1kmeLWZOpfP9Ysn1c4CIe1DRbHKuLReqs9XKb4ngRVpUlOFfYqVfe5W
         EGQnSN++3A0s7bO8BffJVkTiKWuutvBBJRx0fSsNZX/LhKD1nL6QsH2GfOfpIZOUDDk2
         GhOKDfpSCYXOvS4ZOrvlmeFBQPGW0c6sUY0QInNim+y88i+N40552dHEAO4G0pKhthp+
         GGoJ4Q6OEnybvDYMSoXIs6SzG1/N20spd3zRuAwZ0SoD7mZiz90RauvrEnGCFI6Q/nuP
         xZwDx62FEkJ27lQ0AzfSj5Gx3lHS/k2FH9VBZrLvPPkgWYyIgQLqoRsGLvPvGy0ymSny
         QjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762303167; x=1762907967;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BzFWrus5ToDQoAoDgYGAeJvj7pPGBO5zh4BEeX+7e1M=;
        b=blCEc1d+/4bz2+7KZ3e6xqiu37U2bDZqseRkfnj7avE8bsJN1DZTMeRcqChJMxZ1Ty
         QCSWjLGMprLEJ8Y5Qwk10BNif9VmRs1xk8lQsN7EnALdOXxEEdoJuxICS1T1nzxqjsTE
         z9VpxJYTnmle4JyIoe09y2pjkjXJ0xS/Fbe/KMaysuQVmKz70q7hN7xU1gCiwF5VO9Je
         1P9etusZr+R2kKV8029bkSYbdkxmON7Lo1uQXNFCAHOieKfJ74q+fVpFXR8CM26+yyVS
         Rg3i2vzYZyN7seV2KWHtY36x+TLmHNYYFoFqharSFqqPGa2/9fgczxwSsT9TTiVqOkMP
         ZBMA==
X-Forwarded-Encrypted: i=1; AJvYcCV2RufOHzzSKvkMgC66KMk/jps0MRb1Q2Jhi9LnqSedbfLOvJwp8WMxSBfrkseFIPtiM7Sl52zFKWJxcZWqxStDyw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/YI/Dh3tMQ1NZ+ojLs+Gb1yqqdkLL8MOrQC21ouy8LeLz7Yag
	4+/F0JJgQVJjdQ+N0UyTqrvuEGGzUP1U9rRpdgXQ43/jmda6jlGJRD6O6aAP1XSI0xMriVCDwEw
	BlGxBd3F+xCaOmD2jsJnmXzcgAMHAYpH5gBXCYQgyeRGvJdZgwzxUtdUE2FMjp/z09Ub4gqJ6yP
	yZuquASJqL8JY0M/4e1xfyrbZ0q9DJOu4V0GsFWS/1P69y6WkO
X-Gm-Gg: ASbGnctw/sL/mgNtNAaZaHZxrX1AjIkJpHTbWImWjCdP0iNGuFoekU8r3Ouab8hoDhF
	d1CI3A0bJ5qAu0C7Tgz0Adt/RojTmwUC7rG6XHzSWgNKKaAyBLM/IFRPx99Lfm4CGCItS/PuZj8
	IPu4BePuGoHYL3ZCYjWtg2+ceP4v7wtXAKwgeyYwu/Ut8ZyeNI5Mvuw2+xjJUa9BbNCiBkL4zM+
	VWWQQ5vXj8uU4w=
X-Received: by 2002:a05:6a20:9144:b0:34a:1da8:b8e8 with SMTP id adf61e73a8af0-34f86408f07mr1550663637.50.1762303167212;
        Tue, 04 Nov 2025 16:39:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzaGLmiKsrRvSr4jPvA6a7wSEG94Y+iLXfyMLNCyUN32mroWfowJJT4oHvtGc87ilU+o9AHrd1pUJDCgsX280=
X-Received: by 2002:a05:6a20:9144:b0:34a:1da8:b8e8 with SMTP id
 adf61e73a8af0-34f86408f07mr1550611637.50.1762303166627; Tue, 04 Nov 2025
 16:39:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007054528.2900905-1-suraj.kandpal@intel.com>
 <20251007054528.2900905-2-suraj.kandpal@intel.com> <aQjDejhzGRYJT614@e110455-lin.cambridge.arm.com>
 <DM3PPF208195D8D5DDD56AA88E006E66AD9E3C4A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <aQoIBroBqQc3B-RD@e110455-lin.cambridge.arm.com>
In-Reply-To: <aQoIBroBqQc3B-RD@e110455-lin.cambridge.arm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 02:39:15 +0200
X-Gm-Features: AWmQ_bnEJwcu6XSjUjTu8rMBuA8ieKzJYCA5nkQvWatiwJBc8AoL_uq6o3M1DN8
Message-ID: <CAO9ioeX2qEyjwi9LsnUh-cRv88iaRcdZtFr_yidf55A9_ZbLWw@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] drm: writeback: Refactor drm_writeback_connector structure
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
        "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
        "kernel-list@raspberrypi.com" <kernel-list@raspberrypi.com>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
        "Murthy, Arun R" <arun.r.murthy@intel.com>,
        "Shankar, Uma" <uma.shankar@intel.com>,
        "Nikula, Jani" <jani.nikula@intel.com>,
        "harry.wentland@amd.com" <harry.wentland@amd.com>,
        "siqueira@igalia.com" <siqueira@igalia.com>,
        "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "airlied@gmail.com" <airlied@gmail.com>,
        "simona@ffwll.ch" <simona@ffwll.ch>,
        "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
        "mripard@kernel.org" <mripard@kernel.org>,
        "robin.clark@oss.qualcomm.com" <robin.clark@oss.qualcomm.com>,
        "abhinav.kumar@linux.dev" <abhinav.kumar@linux.dev>,
        "tzimmermann@suse.de" <tzimmermann@suse.de>,
        "jessica.zhang@oss.qualcomm.com" <jessica.zhang@oss.qualcomm.com>,
        "sean@poorly.run" <sean@poorly.run>,
        "marijn.suijten@somainline.org" <marijn.suijten@somainline.org>,
        "laurent.pinchart+renesas@ideasonboard.com" <laurent.pinchart+renesas@ideasonboard.com>,
        "mcanal@igalia.com" <mcanal@igalia.com>,
        "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
        "tomi.valkeinen+renesas@ideasonboard.com" <tomi.valkeinen+renesas@ideasonboard.com>,
        "kieran.bingham+renesas@ideasonboard.com" <kieran.bingham+renesas@ideasonboard.com>,
        "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=GekaXAXL c=1 sm=1 tr=0 ts=690a9cc0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7CQSdrXTAAAA:8 a=QyXUC8HyAAAA:8
 a=cwjfTKyZ_bUBt8LYXKAA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDAwMyBTYWx0ZWRfX2eWzZtgo3nJz
 6e/B8LQGbK09EQ+atpn6Ichff3/XBsaorrXdJso3xAs08sQudz+HWMKpG/Ghrc1FCOLFxPiGyFo
 JlUDC+rECj4ydzEil3fXRib3teKsd+K/vJxXhCM2fFsXWgDSMNqqYz92TxwHok1KYGZbhc9PnX5
 5gZFBDiNqcDL8js8lYUcnq6PG2vwwICUFO3Gg//fGc5SBNGQPzyDLvOc1YWlBD4PjtDpMUrud4O
 Q1W1bFFv5kl184wM+slc9h4FQ4a2DRleJt2/bMv4xhKR0pUmhf0Xf2cociKzVHc8LPdxYFXgs3/
 /exzvZ7bTEli4cEnNTARiawkpqLlhTwr2ywswX8YFJtAe/aClRNA9gygyYR4BCJ4qhwezq0nG3j
 RUUbAIa7eU310sJm/CMa7hNSRrwf3g==
X-Proofpoint-GUID: bLr7cfTLgMC2Pu8pveGWU8uCP41lJBtA
X-Proofpoint-ORIG-GUID: bLr7cfTLgMC2Pu8pveGWU8uCP41lJBtA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050003

On Tue, 4 Nov 2025 at 16:05, Liviu Dudau <liviu.dudau@arm.com> wrote:
>
> On Tue, Nov 04, 2025 at 05:11:25AM +0000, Kandpal, Suraj wrote:
> > > Subject: Re: [PATCH v2 1/7] drm: writeback: Refactor
> > > drm_writeback_connector structure
> > >
> > > On Tue, Oct 07, 2025 at 11:15:23AM +0530, Suraj Kandpal wrote:
> > > > Some drivers cannot work with the current design where the connector
> > > > is embedded within the drm_writeback_connector such as Intel and some
> > > > drivers that can get it working end up adding a lot of checks all
> > > > around the code to check if it's a writeback conenctor or not, this is
> > > > due to the limitation of inheritance in C.
> > > > To solve this move the drm_writeback_connector within the
> > > > drm_connector and remove the drm_connector base which was in
> > > > drm_writeback_connector. Make this drm_writeback_connector a union
> > > > with hdmi connector to save memory and since a connector can never be
> > > > both writeback and hdmi it should serve us well.
> > > > Do all other required modifications that come with these changes along
> > > > with addition of new function which returns the drm_connector when
> > > > drm_writeback_connector is present.
> > > > Modify drivers using the drm_writeback_connector to allow them to use
> > > > this connector without breaking them.
> > > > The drivers modified here are amd, komeda, mali, vc4, vkms, rcar_du,
> > > > msm
> > > >
> > > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > > ---
> > > > V1 -> V2: Use &connector->writeback, make commit message imperative
> > > > (Dmitry)
> > > > ---
> > > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 +-
> > > > .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +-
> > > > .../drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c  |  8 +--
> > > > .../gpu/drm/arm/display/komeda/komeda_crtc.c  |  6 +-
> > > >  .../gpu/drm/arm/display/komeda/komeda_kms.h   |  6 +-
> > > >  .../arm/display/komeda/komeda_wb_connector.c  |  8 +--
> > > >  drivers/gpu/drm/arm/malidp_crtc.c             |  2 +-
> > > >  drivers/gpu/drm/arm/malidp_drv.h              |  2 +-
> > > >  drivers/gpu/drm/arm/malidp_hw.c               |  6 +-
> > > >  drivers/gpu/drm/arm/malidp_mw.c               |  8 +--
> > > >  drivers/gpu/drm/drm_atomic_uapi.c             |  2 +-
> > > >  drivers/gpu/drm/drm_writeback.c               | 35 ++++++----
> > >
> > > For the komeda and malidp drivers, as well as for the drm_writeback.c
> > > changes:
> > >
> > > Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> > >
> > >
> > > [snip]
> > >
> > >
> > > > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > > > index 8f34f4b8183d..1b090e6bddc1 100644
> > > > --- a/include/drm/drm_connector.h
> > > > +++ b/include/drm/drm_connector.h
> > > > @@ -1882,6 +1882,61 @@ struct drm_connector_cec {
> > > >   void *data;
> > > >  };
> > > >
> > > > +/**
> > > > + * struct drm_writeback_connector - DRM writeback connector  */
> > > > +struct drm_writeback_connector {
> > > > + /**
> > > > +  * @pixel_formats_blob_ptr:
> > > > +  *
> > > > +  * DRM blob property data for the pixel formats list on writeback
> > > > +  * connectors
> > > > +  * See also drm_writeback_connector_init()
> > > > +  */
> > > > + struct drm_property_blob *pixel_formats_blob_ptr;
> > > > +
> > > > + /** @job_lock: Protects job_queue */
> > > > + spinlock_t job_lock;
> > > > +
> > > > + /**
> > > > +  * @job_queue:
> > > > +  *
> > > > +  * Holds a list of a connector's writeback jobs; the last item is the
> > > > +  * most recent. The first item may be either waiting for the hardware
> > > > +  * to begin writing, or currently being written.
> > > > +  *
> > > > +  * See also: drm_writeback_queue_job() and
> > > > +  * drm_writeback_signal_completion()
> > > > +  */
> > > > + struct list_head job_queue;
> > > > +
> > > > + /**
> > > > +  * @fence_context:
> > > > +  *
> > > > +  * timeline context used for fence operations.
> > > > +  */
> > > > + unsigned int fence_context;
> > > > + /**
> > > > +  * @fence_lock:
> > > > +  *
> > > > +  * spinlock to protect the fences in the fence_context.
> > > > +  */
> > > > + spinlock_t fence_lock;
> > > > + /**
> > > > +  * @fence_seqno:
> > > > +  *
> > > > +  * Seqno variable used as monotonic counter for the fences
> > > > +  * created on the connector's timeline.
> > > > +  */
> > > > + unsigned long fence_seqno;
> > > > + /**
> > > > +  * @timeline_name:
> > > > +  *
> > > > +  * The name of the connector's fence timeline.
> > > > +  */
> > > > + char timeline_name[32];
> > > > +};
> > > > +
> > > >  /**
> > > >   * struct drm_connector - central DRM connector control structure
> > > >   *
> > > > @@ -2291,10 +2346,16 @@ struct drm_connector {
> > > >    */
> > > >   struct llist_node free_node;
> > > >
> > > > - /**
> > > > -  * @hdmi: HDMI-related variable and properties.
> > > > -  */
> > > > - struct drm_connector_hdmi hdmi;
> > > > + union {
> > >
> > > This is a surprising choice. Before this patch one had to have a separate
> > > writeback connector besides the HDMI connector. Going forward it looks like
> > > you still need two connectors, one that uses the writeback member and one
> > > that uses the hdmi one. Is that intended?
> > >
> > > I was expecting that you're going to declare the writeback member next to the
> > > hdmi, without overlap. If you do that, then you also don't need to move the
> > > struct drm_writeback declaration from the header file and it should be enough
> > > to include the drm_writeback.h file.
> >
> > Hi,
> > Thanks for the review
> > The reason for this came from the discussion on previous patches and was suggested by Dmitry.
> > The idea is that a connector can never be both an HDMI and writeback connector at the same time
> > Hence we save space if we pack them together.
>
> Hmm, but you can still have all the CEC and HDMI codecs data in that connector,
> which feels strange.  Also, what's the issue with having a connector that has
> both a valid HDMI state and an associated writeback at the same time (i.e.
> don't use the union)? Writing back the memory the output that goes to HDMI is
> valid, right?

Writing back to memory requires a separate connector (with separate
setup). The CRTC should also support outputting data to both HDMI
_and_ Writeback connectors at the same time (aka cloning). Not all
configurations are possible, writeback requires additional bandwidth,
etc., etc.

>
> Maybe that is not something that you considered, but with this patch (without union)
> we can drop the need to have a separate connector just for writeback. We're breaking
> user space compatibility, true, but it feels like a good change to be able to
> attach a writeback to any connector and get its output. The drivers that don't support
> that can reject the commit that attaches the writeback to the existing connector.

Well... No. It's not how it is being handled in the (existing)
hardware. Nor does it make it easier to handle resources for the
writeback.

-- 
With best wishes
Dmitry

