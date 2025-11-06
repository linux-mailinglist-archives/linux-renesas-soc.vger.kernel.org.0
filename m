Return-Path: <linux-renesas-soc+bounces-24208-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F44C3AD8C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 13:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A8A6334444D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 12:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2512320CB8;
	Thu,  6 Nov 2025 12:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gDQV/Edl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dQwB00cY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50E7288B1
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Nov 2025 12:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762431435; cv=none; b=iY+WJGlnfUGM/0BsBVl0vqNFtmyYMFhPkopgj2TH3+BS0xFIV5kf5xMIs507eF4altVEpNU2jXjS1bteHxIF4A1oGhg3ZuW6vcD2AeTEGPYg6Nufll85QQSpKLL/avkZtaBsWBz+6nIsPs9E/5CaHwKOdXuJApSPNINMrYCEK8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762431435; c=relaxed/simple;
	bh=a9Z4HB79a/IvUhKRcQedmxdVkUVlRTqTGttwGU9vVRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D7My7k1i8LphSrrtMVYgL6hvVePAlYnAh8lFl0kB6llpm6bxY169DoYMrl5wGuzSaJr6UJ4CGjNy4VnrbuTRN3g0NWA549a1HQU2xP5oM6S7vjS9CGjdO262tXzv40tNDwYSrhjt1izqY+DalmEBfETu12U7hopzIoSYCsP+AaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gDQV/Edl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dQwB00cY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A68AhCT2164635
	for <linux-renesas-soc@vger.kernel.org>; Thu, 6 Nov 2025 12:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gNvmCJ0hrdNJ/9zdjaCrkfGY
	VdoeuP9Y/SBDObi2LCM=; b=gDQV/Edl2ZgDxe6dhgFYWDLZG28wb5c1VGrHAh+R
	1PC7QB7edlWtyn+Xu9Ifd/eFaBRVue653TzMdWcCNCoyBcBkokdy8lvWjEoSshGf
	D/mVJkcKdaPbF2dDOc9zc4cpzXCOsICzMq9/CzkIVkzLV+r+z/UIzNfYF+l5Z35S
	FSAHA2tcw1SpdjqNWeK2IEvnsksy8Zmuzz4CDgjhI/IQ7X54rKJncJkTfe9Qt8NH
	ZOo7EId1Z4l7AWaN2+hzRyBnENv6jbkwTcelMRkJB83a2QDVlE83kT1vR7r9dugJ
	/TJGXVqm0WfBaGkeP3vQ7WYLhucX6u/Is1OJoed1UNBezQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8g6esx4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Nov 2025 12:17:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-26e4fcc744dso2473425ad.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Nov 2025 04:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762431432; x=1763036232; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gNvmCJ0hrdNJ/9zdjaCrkfGYVdoeuP9Y/SBDObi2LCM=;
        b=dQwB00cYhyGRNhjxWeHZKz0TkX940hDPrkd6cVXEjU9HMBtL0c9SQhn4gtr/W4dXdi
         Jbln4/VV0/mMq5lkw5Qz+lfkCp4cd9xf+zaUxewSjn7If6yXlYy7Iixd/4TJO464cdWN
         wVQWm6smqwKp9uTUmMKqWszP500abu4Oy+i9GkAd2p15CnjojswKzTuCVJh15Em4iFFf
         fRHsJNof0aBK/UstkrpPsUKWRFrjOknn7UtdDLSryg7+l3jYTZnPAw3CMgj0OKDWlife
         JNd3e2YJ+76nbUC1eRxWzKawfGly1+9Dbw1I343/VqlVYZT+i+bCp4KX7P+rlx374rQk
         5B3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762431432; x=1763036232;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gNvmCJ0hrdNJ/9zdjaCrkfGYVdoeuP9Y/SBDObi2LCM=;
        b=kHotY2WrnzKpHM22Q/oieh9yMPOJwofXW3AHnBEX4yyO5ZmsgbfBOd3XbG3X6XTZ3J
         IUwBQg1K1CEdEEYYAP0KC8xxZ3bOplMX4Azeh7rJSqe7b5aX74UPe6naE5RQxC4cUZRU
         AGAYKDdTV3ysXe2IXzXVDPz3B90I0t2bKAy1hZQR9JePIY5hEG2STziDw/Mi71eRLvqK
         OCf7Wi97q7QXTKgc8/I6VGI6YpjHcZh+4T+TjyRTunnLOEq+O7g9p9hYXNAtaedNzZaK
         52vLPoGFsFgLxJNngi7lTMi9S8klh914k5dA6/PrIY7UbAndYcU67rUdutK3XbADMicP
         E3hQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/2VzY2HqsLYyd7sc/8wIHE3qfJHsefL+7i1KbHYbQHiz6LvIkb9SR1CO9zHUfb1T02yvcUfJce/kacpodhw02hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPb0lamsFhANE7l+We2Fp29MKRWLiepEMMBf3/SmROWkhpsTJm
	or4Emerj/ZmFd7lRxIkxY5tcKUecqpRo40uXZMRrIsjpttPejDm+zIR3SsZ2p+xkgfB6YRmh+Bi
	rfBeutPm8c90MMJgtWwOZiwcMLUcVvGxo+2zzXXrBecx4TgBoPZKK3bsaokNB6J9dGIAsrkIV8h
	90u19I0wtVkO/EgHAvHAtAa0rzR8CoipuCBBtc7yJ6SU0NCgSg
X-Gm-Gg: ASbGnctkGBrXbCFD5mwfWEXV7bn3L7ZI2Pb17H1Mvubq01Bcktsyq8vPP+4+iYPLl73
	EEv+Ql9z4rmVJSU3+JZFtAPIfYGnaHKM5oCUP0AnZTldiXhd9WvbATkeSkBVc6oncDhHg7XAGni
	60z1JWhJeN+8jlQsHO8EeT+fGu11wj5WsT5H8/TnF+53ZqoyDyZGPEyA6X+yw2VJNH13Rd/wvVq
	OTXlr2jInRvKw==
X-Received: by 2002:a17:903:1ce:b0:290:7e29:f59f with SMTP id d9443c01a7336-2962ad3d72fmr86648295ad.27.1762431431470;
        Thu, 06 Nov 2025 04:17:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTXH8NGkIDg7Ywz6RX10UIWewqyu96hZrjWXSo9nV+y7WP4ZxR0xQhes+p81qNvau23TvKRF0R0V1UeWn9oko=
X-Received: by 2002:a17:903:1ce:b0:290:7e29:f59f with SMTP id
 d9443c01a7336-2962ad3d72fmr86647725ad.27.1762431430643; Thu, 06 Nov 2025
 04:17:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007054528.2900905-1-suraj.kandpal@intel.com>
 <20251007054528.2900905-2-suraj.kandpal@intel.com> <aQjDejhzGRYJT614@e110455-lin.cambridge.arm.com>
 <DM3PPF208195D8D5DDD56AA88E006E66AD9E3C4A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <aQoIBroBqQc3B-RD@e110455-lin.cambridge.arm.com> <CAO9ioeX2qEyjwi9LsnUh-cRv88iaRcdZtFr_yidf55A9_ZbLWw@mail.gmail.com>
 <aQyApokLttxf9spU@e110455-lin.cambridge.arm.com>
In-Reply-To: <aQyApokLttxf9spU@e110455-lin.cambridge.arm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 14:17:02 +0200
X-Gm-Features: AWmQ_bmmb7qkmOjV1MvJBVbTKPSje7kfBu1HmXRF-M95TYAq_55qEAFRaKc2Oxc
Message-ID: <CAO9ioeUwt2aR5y9FkMPOKz-4dPO8pUvxeEYUqGrGVZWaUHYw-g@mail.gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA5NyBTYWx0ZWRfX8ii1ACgkHzRY
 iL12BvwGsdSrBN5WhI0k8ljzOi9ceAKaWNCnc5bE5vms3w9uKF4VnTyvdQl+UlPryVdB9vmo3ds
 PNqXLew7JJR0frnNQ+tXaS2Wxn7Eg1tYb+I4qwZR44uK0z/6/CrTjlO7Wy055W9t6bu9wN5oVz0
 tMvFFfgaox1alI+KOmvkbUZQgOFp1ss8gho9bHHOsw8zrqZ0aki3ODRaEIwsD/ObImuN4ANTXYK
 gWEsKW6c6gWQkkYbauvRlN/drllA8o9yBSS2CSZz9yRIPqVitECs830kzfojtJsy8nyoXy06MDI
 lpNr80jlyPmzVQ5XVAcsG75dbnSQ1W5GfZnvHON4SOulCQnXPUg+mGav4E2gupJtGGoh0sDXWEF
 B7tt/WJDj7NEycgLJ95lNgtyJc0+sA==
X-Authority-Analysis: v=2.4 cv=D5FK6/Rj c=1 sm=1 tr=0 ts=690c91c8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7CQSdrXTAAAA:8 a=QyXUC8HyAAAA:8
 a=_xLGP-AJQIWHLRMqBqIA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: uK_gJ35AYTVTO0RNPCc0oaUxmZYAUTjX
X-Proofpoint-ORIG-GUID: uK_gJ35AYTVTO0RNPCc0oaUxmZYAUTjX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 clxscore=1011 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060097

On Thu, 6 Nov 2025 at 13:04, Liviu Dudau <liviu.dudau@arm.com> wrote:
>
> On Wed, Nov 05, 2025 at 02:39:15AM +0200, Dmitry Baryshkov wrote:
> > On Tue, 4 Nov 2025 at 16:05, Liviu Dudau <liviu.dudau@arm.com> wrote:
> > >
> > > On Tue, Nov 04, 2025 at 05:11:25AM +0000, Kandpal, Suraj wrote:
> > > > > Subject: Re: [PATCH v2 1/7] drm: writeback: Refactor
> > > > > drm_writeback_connector structure
> > > > >
> > > > > On Tue, Oct 07, 2025 at 11:15:23AM +0530, Suraj Kandpal wrote:
> > > > > > Some drivers cannot work with the current design where the connector
> > > > > > is embedded within the drm_writeback_connector such as Intel and some
> > > > > > drivers that can get it working end up adding a lot of checks all
> > > > > > around the code to check if it's a writeback conenctor or not, this is
> > > > > > due to the limitation of inheritance in C.
> > > > > > To solve this move the drm_writeback_connector within the
> > > > > > drm_connector and remove the drm_connector base which was in
> > > > > > drm_writeback_connector. Make this drm_writeback_connector a union
> > > > > > with hdmi connector to save memory and since a connector can never be
> > > > > > both writeback and hdmi it should serve us well.
> > > > > > Do all other required modifications that come with these changes along
> > > > > > with addition of new function which returns the drm_connector when
> > > > > > drm_writeback_connector is present.
> > > > > > Modify drivers using the drm_writeback_connector to allow them to use
> > > > > > this connector without breaking them.
> > > > > > The drivers modified here are amd, komeda, mali, vc4, vkms, rcar_du,
> > > > > > msm
> > > > > >
> > > > > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > > > > ---
> > > > > > V1 -> V2: Use &connector->writeback, make commit message imperative
> > > > > > (Dmitry)
> > > > > > ---
> > > > > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 +-
> > > > > > .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +-
> > > > > > .../drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c  |  8 +--
> > > > > > .../gpu/drm/arm/display/komeda/komeda_crtc.c  |  6 +-
> > > > > >  .../gpu/drm/arm/display/komeda/komeda_kms.h   |  6 +-
> > > > > >  .../arm/display/komeda/komeda_wb_connector.c  |  8 +--
> > > > > >  drivers/gpu/drm/arm/malidp_crtc.c             |  2 +-
> > > > > >  drivers/gpu/drm/arm/malidp_drv.h              |  2 +-
> > > > > >  drivers/gpu/drm/arm/malidp_hw.c               |  6 +-
> > > > > >  drivers/gpu/drm/arm/malidp_mw.c               |  8 +--
> > > > > >  drivers/gpu/drm/drm_atomic_uapi.c             |  2 +-
> > > > > >  drivers/gpu/drm/drm_writeback.c               | 35 ++++++----
> > > > >
> > > > > For the komeda and malidp drivers, as well as for the drm_writeback.c
> > > > > changes:
> > > > >
> > > > > Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> > > > >
> > > > >
> > > > > [snip]
> > > > >
> > > > >
> > > > > > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > > > > > index 8f34f4b8183d..1b090e6bddc1 100644
> > > > > > --- a/include/drm/drm_connector.h
> > > > > > +++ b/include/drm/drm_connector.h
> > > > > > @@ -1882,6 +1882,61 @@ struct drm_connector_cec {
> > > > > >   void *data;
> > > > > >  };
> > > > > >
> > > > > > +/**
> > > > > > + * struct drm_writeback_connector - DRM writeback connector  */
> > > > > > +struct drm_writeback_connector {
> > > > > > + /**
> > > > > > +  * @pixel_formats_blob_ptr:
> > > > > > +  *
> > > > > > +  * DRM blob property data for the pixel formats list on writeback
> > > > > > +  * connectors
> > > > > > +  * See also drm_writeback_connector_init()
> > > > > > +  */
> > > > > > + struct drm_property_blob *pixel_formats_blob_ptr;
> > > > > > +
> > > > > > + /** @job_lock: Protects job_queue */
> > > > > > + spinlock_t job_lock;
> > > > > > +
> > > > > > + /**
> > > > > > +  * @job_queue:
> > > > > > +  *
> > > > > > +  * Holds a list of a connector's writeback jobs; the last item is the
> > > > > > +  * most recent. The first item may be either waiting for the hardware
> > > > > > +  * to begin writing, or currently being written.
> > > > > > +  *
> > > > > > +  * See also: drm_writeback_queue_job() and
> > > > > > +  * drm_writeback_signal_completion()
> > > > > > +  */
> > > > > > + struct list_head job_queue;
> > > > > > +
> > > > > > + /**
> > > > > > +  * @fence_context:
> > > > > > +  *
> > > > > > +  * timeline context used for fence operations.
> > > > > > +  */
> > > > > > + unsigned int fence_context;
> > > > > > + /**
> > > > > > +  * @fence_lock:
> > > > > > +  *
> > > > > > +  * spinlock to protect the fences in the fence_context.
> > > > > > +  */
> > > > > > + spinlock_t fence_lock;
> > > > > > + /**
> > > > > > +  * @fence_seqno:
> > > > > > +  *
> > > > > > +  * Seqno variable used as monotonic counter for the fences
> > > > > > +  * created on the connector's timeline.
> > > > > > +  */
> > > > > > + unsigned long fence_seqno;
> > > > > > + /**
> > > > > > +  * @timeline_name:
> > > > > > +  *
> > > > > > +  * The name of the connector's fence timeline.
> > > > > > +  */
> > > > > > + char timeline_name[32];
> > > > > > +};
> > > > > > +
> > > > > >  /**
> > > > > >   * struct drm_connector - central DRM connector control structure
> > > > > >   *
> > > > > > @@ -2291,10 +2346,16 @@ struct drm_connector {
> > > > > >    */
> > > > > >   struct llist_node free_node;
> > > > > >
> > > > > > - /**
> > > > > > -  * @hdmi: HDMI-related variable and properties.
> > > > > > -  */
> > > > > > - struct drm_connector_hdmi hdmi;
> > > > > > + union {
> > > > >
> > > > > This is a surprising choice. Before this patch one had to have a separate
> > > > > writeback connector besides the HDMI connector. Going forward it looks like
> > > > > you still need two connectors, one that uses the writeback member and one
> > > > > that uses the hdmi one. Is that intended?
> > > > >
> > > > > I was expecting that you're going to declare the writeback member next to the
> > > > > hdmi, without overlap. If you do that, then you also don't need to move the
> > > > > struct drm_writeback declaration from the header file and it should be enough
> > > > > to include the drm_writeback.h file.
> > > >
> > > > Hi,
> > > > Thanks for the review
> > > > The reason for this came from the discussion on previous patches and was suggested by Dmitry.
> > > > The idea is that a connector can never be both an HDMI and writeback connector at the same time
> > > > Hence we save space if we pack them together.
> > >
> > > Hmm, but you can still have all the CEC and HDMI codecs data in that connector,
> > > which feels strange.  Also, what's the issue with having a connector that has
> > > both a valid HDMI state and an associated writeback at the same time (i.e.
> > > don't use the union)? Writing back the memory the output that goes to HDMI is
> > > valid, right?
> >
> > Writing back to memory requires a separate connector (with separate
> > setup). The CRTC should also support outputting data to both HDMI
> > _and_ Writeback connectors at the same time (aka cloning). Not all
> > configurations are possible, writeback requires additional bandwidth,
> > etc., etc.
> >
> > >
> > > Maybe that is not something that you considered, but with this patch (without union)
> > > we can drop the need to have a separate connector just for writeback. We're breaking
> > > user space compatibility, true, but it feels like a good change to be able to
> > > attach a writeback to any connector and get its output. The drivers that don't support
> > > that can reject the commit that attaches the writeback to the existing connector.
> >
> > Well... No. It's not how it is being handled in the (existing)
> > hardware. Nor does it make it easier to handle resources for the
> > writeback.
>
> Which (existing) hardware? Komeda can do it mainly because it doesn't have an HDMI connector,
> but an output that can be cloned to writeback while it is being sent out on a bus to an encoder.
> You have to remember that writeback is a connector because we didn't have a better concept for
> it. It doesn't have to be a separate connector from an HDMI or eDP or DP.

drm/msm. It requires a separate setup for the Writeback, which is
described as an encoder. As such, we need a separate connector for the
writeback.

-- 
With best wishes
Dmitry

