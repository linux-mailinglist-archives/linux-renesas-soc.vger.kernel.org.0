Return-Path: <linux-renesas-soc+bounces-20654-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B94B2B091
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 20:36:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 441D01B63399
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 18:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C0AB25CC69;
	Mon, 18 Aug 2025 18:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PjbJ4SF5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3B01B87C0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Aug 2025 18:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755542158; cv=none; b=Et4W033XgSuy8slwLhlFzHf/w+ylHRASc8cMEb7xnKVOYJfETmpzFpmA4FCDF3rxA0udG9HigFRJW6SwxlxH0qD3Z494DOUfD+5vXn/8B2fDhHEGUn/u3zTrpaJi48p3YhYcP2MGngeS9j4gpLx91iP0NvmbT3+1BN333g02X6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755542158; c=relaxed/simple;
	bh=Rr8NoDrHGFkfU2Y7NB9dvXe3YofOu3AGh+O7rT1zNOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SDkSAOyswSHNbAGfg3JJwye4++r+zgXihbNk4SZVtvqU2bEfif39qLqZRRN2dnOlWUMa6dlvuDPm/vpWk58citwV3AvMuuVGf04s3AL1x/G3CWX7siPaCTWFjsVv5olqRGXYYKU6x4LfVedXUltjV55f17SrCTep3g56rw2Wh+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PjbJ4SF5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IExHmj025131
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Aug 2025 18:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rTw5fI/EzQLooVwdnSKD6j5ks0u5Tik6uLBbFQaZ44I=; b=PjbJ4SF5jsGRuPM8
	lRiJxw1u113tX7wBLGTbQoy+3C6mIwKOJavCnyjt0KQfMN5t6oFVnQPOBVFoUtJQ
	EneaDEiUuLXqtzK5PTacSnK7X/Jr8zazde5n/R9zdJHoO0J3TXn/aWyG32UWilXy
	OEerE0aj750vPxvduioVB33IJ6wu32Xv0hGd25L/AAxffaXz9svr2Xyw7fYZ0mCI
	gZTWWjAwdv+B2UWYuVDb3HZcpSJkDNx/hvt7bjszyLHe2+Htog2zTVX1DJKuuthT
	Rl89WKPzZ9Ol2YfnDRgKI535EjA+i7w8peleWdhzNZHYS5+dWqKo66v+HOi3mb6f
	1Zs8Pw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jgxte1yv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Aug 2025 18:35:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2445823bc21so112090495ad.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Aug 2025 11:35:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755542155; x=1756146955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rTw5fI/EzQLooVwdnSKD6j5ks0u5Tik6uLBbFQaZ44I=;
        b=lsFPYf7s8mglqMTBPSVal/oGT2q3xQTNAIWVI3vbsveEbL6QkJNfTsTLEnzgKhjXPp
         v1gs5BrBILBajKKqcBJHEBNnB0Pox+hlpjn1CVFltclPw4BOOpzlm9Tcvy5kpRbbFZUs
         ZGYPsn4EhjZAvOI1aCtE2PqLhh7qDsHWcm7wVfmQ3zrXrHhBv9S+c2/Rpdyh9bVqaskj
         oyGWyjlwQTJOXBAFcz1kMbaI5h974xMQxZi3W0RbvnUsWkcT9T7NV7Awd21e1VN3LJng
         cniVf6euYVu85CAL01fdiZQM9tffeM8/3e7nDNYCe3n4kKoCGCzLl5o8t94tlV+1I0Ii
         tyNA==
X-Forwarded-Encrypted: i=1; AJvYcCWIyQtGVt0Y7WaPkMfpdmyC6TCZUQj40BvxqNKO2X6DAmJN+MZ9CwJEmYAx7d/aktoVT0PJVGXl4LKxb9oCrsgB4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8aLyA4jT2GWJ1CMW5aS1XtxNZiBlXWyyw/L+it6wEPb1Rj6NT
	/tADwjc5g360RW+vI8akeVcR6Zvb5dloLu0o5jyfRUckASDEFq/0h9K5JjEPMKhu43PiG81IVwk
	m3j6RMQLi4vfvDhM9ABGlzrvEUQpBMRk657ksQl6wDWSgoRf82vlZfLCX8fEvhYrqYbTVEYP23g
	==
X-Gm-Gg: ASbGncvOYknmXWNiu1d2IyALvAb2h2v4pj1+TrpGO5AMZ6nbaAbhEk8UgDgnf/0vyi9
	xLQJvPPrPgLvS6A/1F5w4rD/ZywC5onCoB8H9W4yqrTlCsrmWnNUfVCgYFeoJicx0xw4sU4zqn6
	pgvkDyTCn1IobmZpHcWU+Zks+aekFVBpBELOmqNLeX5IR6PyaaHhfF82XHUefUe124db93dpYsI
	mWDNY6k0GF07v3E+rXPJZ9iSLnkuRjrJIpHItWBfgXpv/aK1gETBlElzDiAbFCkyMj8JP7f0rpu
	yquBO5iThuc3B/hJISeZBQL6LhKj175euaYlvuawqq2mLbKlbVIxS3UmADJuJtcbRldwQniM+fK
	/k85JtEieLAcsQWaQIBXuNg==
X-Received: by 2002:a17:902:e883:b0:234:b743:c7a4 with SMTP id d9443c01a7336-2449d05e2e0mr6013415ad.38.1755542154901;
        Mon, 18 Aug 2025 11:35:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxDSynULb4PcFzZsBZRbHZngTsBrC0gfJFLCUyi3LdHcS+4FTyZjXC2laEfmopJd/tkxjqtA==
X-Received: by 2002:a17:902:e883:b0:234:b743:c7a4 with SMTP id d9443c01a7336-2449d05e2e0mr6012665ad.38.1755542154422;
        Mon, 18 Aug 2025 11:35:54 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446ca9d9a7sm87175925ad.23.2025.08.18.11.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 11:35:54 -0700 (PDT)
Message-ID: <eddfb43e-2d8c-4e6a-83a7-00c88b3ccf7d@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 11:35:47 -0700
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] drm/msm/dpu: use drmm_writeback_connector_init()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        "Kandpal, Suraj" <suraj.kandpal@intel.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com>
 <20250816-wb-drop-encoder-v2-4-f951de04f4f9@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250816-wb-drop-encoder-v2-4-f951de04f4f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nxJeoKVaBYRi2fRv2IX5HW_jRrsooNcJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX0qEeod73GVPM
 DwKchHhy3qIFPZA6HDZgt/4Syal/FltRKQ2gixviHsQ2XnVgXaEnQhVRKtK4LxVRs8QDoCWVlSQ
 40qgps9Qdcalp39956N47vvUMLq/gj6I00yImxEX64UaHOE2zcDxHfrvARbrGJaJ4/1a13usn1j
 LvoJjJNGp6jkhd0FLrWyFHfHfpHtb2gyFhDucU35JImXBvjjmn/unCsodGKN0ep7yqwQqXWTqDZ
 xtoZKZj6kQBIR+WKRYIvF1LGmigP59ZnDz8qA+vhI1HCZIYhC/tzffdHO+pVlCh+HnIuN3PtUMe
 CFnKjsWm3H0iyKbhG9AsOrw32JdlvAgt+sYXnimkb0WZdfhAii8oiFhp8Jsq2Rl7A5vMETvAGUT
 4urCXHCJ
X-Proofpoint-GUID: nxJeoKVaBYRi2fRv2IX5HW_jRrsooNcJ
X-Authority-Analysis: v=2.4 cv=V7B90fni c=1 sm=1 tr=0 ts=68a3728c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=hy87YkSEx0gxqBhA-1kA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 clxscore=1011
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160020



On 8/16/2025 8:19 AM, Dmitry Baryshkov wrote:
> Use drmm_plain_encoder_alloc() to allocate simple encoder and
> drmm_writeback_connector_init() in order to initialize writeback
> connector instance.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Thanks,

Jessica Zhang

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> index 8ff496082902b1ee713e806140f39b4730ed256a..cd73468e369a93c50303db2a7d4499bcb17be5d1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> @@ -80,7 +80,6 @@ static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
>   static const struct drm_connector_funcs dpu_wb_conn_funcs = {
>   	.reset = drm_atomic_helper_connector_reset,
>   	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = drm_connector_cleanup,
>   	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>   	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>   };
> @@ -131,12 +130,9 @@ int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
>   
>   	drm_connector_helper_add(&dpu_wb_conn->base.base, &dpu_wb_conn_helper_funcs);
>   
> -	/* DPU initializes the encoder and sets it up completely for writeback
> -	 * cases and hence should use the new API drm_writeback_connector_init_with_encoder
> -	 * to initialize the writeback connector
> -	 */
> -	rc = drm_writeback_connector_init_with_encoder(dev, &dpu_wb_conn->base, enc,
> -			&dpu_wb_conn_funcs, format_list, num_formats);
> +	rc = drmm_writeback_connector_init(dev, &dpu_wb_conn->base,
> +					   &dpu_wb_conn_funcs, enc,
> +					   format_list, num_formats);
>   
>   	if (!rc)
>   		dpu_wb_conn->wb_enc = enc;
> 


