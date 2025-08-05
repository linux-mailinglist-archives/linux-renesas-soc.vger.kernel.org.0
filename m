Return-Path: <linux-renesas-soc+bounces-19986-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 243E0B1AD57
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Aug 2025 06:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89121621180
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Aug 2025 04:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 392CE219A81;
	Tue,  5 Aug 2025 04:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kzt5V+6x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72B421883F
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Aug 2025 04:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754369897; cv=none; b=Yp/nkSzTCM+5TsuVqFtJy6AvR6vaDO1j0U+v+XhiJzn18Da7Si0h0SFBfwzif4DpqfaadbV/3uvmEh7EPFAdwg6GiCecQxdoOlXFNUF4NWi/N4zmexpAC8uWvBnVAw2FqIdWk3p1yN4iGl9lX8dfMk5Op2e6r6b5JPGDUYzPjVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754369897; c=relaxed/simple;
	bh=lJYhkL+QX40YpeFwEk9gu0WQ9NBis32tZcCmGmXy6i0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qnnUImwDztq6cdwDjGCnWD+A0g/a5s9VEzMgprCs5hugD/varnq6nZzF4+o1snzTL2tA+aoe+ajKvVVAy1Y10HQ8+9jkpJODTNUiyaSWVHkXKw+KyUceHM+HMsFad9XM0zm3uniCT255+AH/z0mRG/MPsdoWTrT1AM6lPPkUhfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kzt5V+6x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574Gmwmg011524
	for <linux-renesas-soc@vger.kernel.org>; Tue, 5 Aug 2025 04:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZJk8ZPcKnOpx2SNNbdPGbHCx
	Lccj6TZBqXskHVjiVyc=; b=Kzt5V+6xQ4sPGQZHZZzOITFZ/wk0ZUSxsrZL0Vnp
	Xx1l01K2Gu43cr0/LJFnlvqqBsMZVzzkKApUXwa+gkvaZyfRb+LckZUXlnS2xeaa
	gc/UB7HiQAMs0jcn35W7ZNKSvcBqC5D8Zp+uQY50gOwxMCyxWylqdHi/tw3PlD0/
	6nm/gR0Az9SnA620lLuc3hPNoySvKw54dIVv9M2lSBDJYEK/qwWd+ngG4jL75hL+
	u0qjloA8qwCPjIkElxnwGXW4gnzohY/0A2PdtmqjoE/Aii48Ik0TGNxr1tonRnNB
	pLAkMIuntt06gt4WqMEXjC7JW5w3W8VkvRnUnkVbU+OinQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489buqq75t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Aug 2025 04:58:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e6857795eeso1100640385a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Aug 2025 21:58:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754369889; x=1754974689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJk8ZPcKnOpx2SNNbdPGbHCxLccj6TZBqXskHVjiVyc=;
        b=bpWyhqQAhU4VeTSYcHA7xvEMvSijpXUhTQWKDla0w64N02tGn4VTPoRFuyZqrvt6Ol
         JzDyvnaJu8es9HUQqJ+lVDw+eEDjjvhrZdj9unXfvFj/ZCtvG8jGBBsNsb9HINLtorLL
         gFZ3s6feYdBtU7cXRjMptJJcdG3Cto5Gqw1tMNJWa4tqdCkEmcJkSpmsqgRBLW121bxi
         Aif/2MjiJQn50OAdI4iQMIf32SIV1n0Xz1UeLyGdRNV+UUOTBesfqNcvg4WTUTGdGDSs
         pRW8iFgsJOYolO0Sfm1hK3t0eYGMmSvt6gC01VzcXl6zDGORzAsqKjckmvgc9xs6pcVP
         W8Gw==
X-Forwarded-Encrypted: i=1; AJvYcCWkBT4sLK0fDWev7nl+V+bd2zOk651SktruQNtPbN8dLatN3ibZhrr+n+t0r8Hf8lDA5eSp7R7nZAgn1dSPS69elg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1rt89eNXk27c3JBgBTfcx5qtqJ9WOvBQK8tVlDExXWvJ4Gkp5
	IeCxz/w7YGrij97Gj3gCae/5/Mtj4KS16ZnfbUvTb55uZNxbT1CHiK9SQgrrc3OOCjra027U2QB
	Ifyh18CUrRAnYnKFcXLkvibN0m0wU/eBrePY5JrqWVAQwBrhmBllmV3yqlUkmDBTBdcTvRYsANA
	==
X-Gm-Gg: ASbGncsGeDPtefMXdlix/WaPSnbT15b71uG9NahLclwbbt3j4Dq5XC1uO77Rw06asz+
	nPW6dW/bIVmXRwm+NSmYpsCJvKqVdV/SuvtKH65a8v82m8s5cU5Aqg06QNsIgz2sSfLkyDl6qTn
	iSTVHff87PWDhrTbNXxzQWu1qvZLnPwDSq+PygSPdXd3HHZpmShcib7vfLIRzVGDBWrznzNpC9K
	mm8Sq6MNgfE5A4l2uhgieX+peaSe4wO/lwb92FclM3oj+TWrRWTJBA0pAeMzXq1oNOdzFl1vyDx
	mtg6RObyDGTgi42Uz6tpz+VG77R2tZ52FupscKNkG95AQOJB/MrHoBhlI3/8jQyOnuwcEwxJqa1
	7fD+2fBfRTo6wV8kz+cE0jaPr807kai7RbIkXoSUo/tADKnBMkEBS
X-Received: by 2002:a05:620a:a512:b0:7e6:5ef5:846b with SMTP id af79cd13be357-7e6963b8367mr1194542185a.65.1754369888926;
        Mon, 04 Aug 2025 21:58:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsXtKxDheFJG11QuYaCVPiIu+728m5NKJMdNbg0+TAMsOq+9gDo86NZhO5c8LUFYsWbjmH9Q==
X-Received: by 2002:a05:620a:a512:b0:7e6:5ef5:846b with SMTP id af79cd13be357-7e6963b8367mr1194538285a.65.1754369888391;
        Mon, 04 Aug 2025 21:58:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889ac54fsm1866911e87.62.2025.08.04.21.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 21:58:06 -0700 (PDT)
Date: Tue, 5 Aug 2025 07:58:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
        "Kandpal, Suraj" <suraj.kandpal@intel.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
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
Subject: Re: [PATCH 0/8] drm: writeback: clean up writeback connector
 initialization
Message-ID: <pwnrvebmf77p77z3pn53kzivy5t5qglh3ngdmj33f7i7v5r4jg@sseokeuqindn>
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
 <aJDHAF69VOEHwcKO@e110455-lin.cambridge.arm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJDHAF69VOEHwcKO@e110455-lin.cambridge.arm.com>
X-Proofpoint-GUID: KlgyG5-HnXOtSPF2lpNYVdW23HK3jyol
X-Authority-Analysis: v=2.4 cv=VZT3PEp9 c=1 sm=1 tr=0 ts=68918f66 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=DSBK3S_xfJQIu1nZ6GAA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDAzNCBTYWx0ZWRfXyja5YVHjSubV
 T0umFlX7oLpqVv51sVKV8mylPecyiRL+S8gDMQy5YvYQZYIdNevyrMpdb1aSQlpmjioPcV35cTC
 L0LC7cpeiVttO4swmU7ZZC2+oV2wDROzQFWBpmcd5Tc1hdvSxv8R9CdDvCsmxsKarlJXLSIu/1m
 Ne02VIcVcdySLXHuCBf872Z2KgBgh0sOqGGXS22ucW/MvAAb1m+mC/LZMj3zjyVpkd0sFjajc+F
 CLGDLxWuIgUHdgz56aQJ6HLF6AXqDkZ1xehEw88CLAVi/KzT0/wgD8AYqctwnPpjTy3PurTgaem
 OOAU31Qn2TDKjYvBMqp8FqJ2j7IYBvrqqfYery4q7XhjEmkCB8UwvkYKAZ+jx8Rb4NVFkWdXXUK
 vX4Qkk2inqGbb0sqkX2s2mto/2oixE4Zx2h4jCvxEPdLuVhXTHUa1TCL0pibcWZSzfzTxplW
X-Proofpoint-ORIG-GUID: KlgyG5-HnXOtSPF2lpNYVdW23HK3jyol
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508050034

On Mon, Aug 04, 2025 at 03:43:12PM +0100, Liviu Dudau wrote:
> Hi,
> 
> On Fri, Aug 01, 2025 at 04:51:08PM +0300, Dmitry Baryshkov wrote:
> > Drivers using drm_writeback_connector_init() / _with_encoder() don't
> > perform cleanup in a manner similar to drmm_writeback_connector_init()
> > (see drm_writeback_connector_cleanup()). Migrate all existing drivers
> > to use drmm_writeback_connector_init(), drop
> > drm_writeback_connector_init() and drm_writeback_connector::encoder
> > (it's unused afterwards).
> > 
> > This series leaves former drm_writeback_connector_init_with_encoder()
> > (renamed to drm_writeback_connector_init as a non-managed counterpart
> > for drmm_writeback_connector_init()). It is supposed to be used by
> > drivers which can not use drmm functions (like Intel). However I think
> > it would be better to drop it completely.
> 
> The intent of _init_with_encoder() was to be a special case for drivers
> that use their own specific encoder and the rest use the generic function
> that creates the virtual encoder inside the call. The API for
> _init_with_encoder() was actually introduced 4 years after the original
> patch, so that should give a hint.
> 
> drmm_writeback_connector_init() is more like _init_with_encoder() and
> I don't remember reviewing it, so I'm not sure why that was considered
> to be the better behaviour for the managed version. Now you're moving
> all the drivers to the managed version and you have to duplicate code
> in each driver to create the ENCODER_VIRTUAL encoder.

This follows e.g. the process of deprecating drm_simple_* /
drm_simple_encoder. The drivers are expected to open code empty encoder
handling on their own.

> I'm not against the changes being made in the series, I just want to
> see a better justification on why _init_with_encoder() behaviour is
> better than the previous default that you're removing.

This was triggered by the discussion of Intel writeback patchset, see
the threads for first three patches of [1]. We have an optional
non-pointer field inside drm_writeback_connector, which can be left
uninitialized (or zero-filled). I have checked and the drivers are not
actually using the embedded connector for anything after linking it to
the drm_connector. So, by removing the encoder from the
drm_writeback_connector structure we are tying a loose end.

[1] https://lore.kernel.org/dri-devel/20250725050409.2687242-1-suraj.kandpal@intel.com/

-- 
With best wishes
Dmitry

