Return-Path: <linux-renesas-soc+bounces-21736-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9C8B52150
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 21:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 388AA584DCA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 19:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E202D9499;
	Wed, 10 Sep 2025 19:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4C4B47D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8582D8DA9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Sep 2025 19:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757533377; cv=none; b=glyPXe9PpmqtYt9SmeOeuuNaDu5HN6cjSHB7XHhcD3ZhfGlIDetMkR7aZO82wRoDRcCg9gqmnSDVGluVbbhNGW4rbbKREtrAWD26Vwr1kak3t3GYfqdBTKWdW7L1rUAipLlmhTKXP1pgR6/3u0jmv2SGcXocqzf15feQCdMlGak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757533377; c=relaxed/simple;
	bh=MQpBZcZUOtzDMkHLZE+Sa1KfkWkiVgX6IBFRTbdmMN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xm5YHGWlm8bcJJQvR1JdPkKD2PNJ8JjcEtLnBEhBvXeQ4ITcvEjVVaTTgNAwmdqgkNx4sGJwQT3wuMFChGZsu/tW6nPlHH76N9YPAi/ZbHYSVZ4Yod2ip8heww55pcjjFZEvdSia+iZOMw5Mr0bEeByZbOGcUBoZi0/4yydDZD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4C4B47D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgGJt020857
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Sep 2025 19:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AshvdUVEa9FiNe5UYmEu3NEb
	RFgCfkbR3d/lUj1X4cc=; b=M4C4B47DFelWfTtHXBl58OlfAnb9kgVzh2KD5MDP
	u21jR0DMliki4JJ9sbq0tg/a+i93jCDeMlXDMvHLvtf7lP6zdaXEhxxR40DF68h+
	rU/qxdJlK0+ZmRfhw4E6cF67By/Tr+FieX8DVNFtWhOFAWxwvGr5eR1s72BMLocK
	/g2sryaJrEckcY4rJKMHckuG4bRdtmZmv+k7ig0la9HsVvpcCZ4RXA1kAkttl361
	6ckX43sYScEE63NUml41VV+UYRTAp8Z6clD8qHBQqabTgKjKw1MHHCSsIvDTZ3y4
	RhcJ4PBDMquA6XnTAn+tQ4uLj2dtQHl0xxkg7UDOFdLxag==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2958g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Sep 2025 19:42:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b6090aeaacso110772341cf.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Sep 2025 12:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757533374; x=1758138174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AshvdUVEa9FiNe5UYmEu3NEbRFgCfkbR3d/lUj1X4cc=;
        b=davzauDkDTPH7Y02CM9lvG0EO0kfMbt59xhF7GzcBfnBNak1hwrZvyvr7rZ8zWzzdK
         DhAbw9mUTZLnOKTPsw/FmuoKk/uJlunpdDn89smJxqrglMSNAiROK/t/55ePTJ0pe8zR
         L/dpMNEsKiqaD8HEgJqdalVZIsXjIoq8SYlh5Wr4Kkl4VGSfk8VWOMPL20zuguSZnKfj
         YON9w96hzlXhrhJbcxGtZTQObA68K2jOgQYPrFAHBDYS6G8/IHppgqG77rqxXutbFPcw
         x9H0aztnXWiY1PKtsoponAqddLrYUYzJ0ItV4k+nFjh9cFAurvsb0HAks7TpMX89d+ky
         LgyA==
X-Forwarded-Encrypted: i=1; AJvYcCX08ApCehKUnH1dZAFuZJ2WGCTePr747J7pZ3X/mDla7dj2nQUTKzcMX6yiRTIXw8IspM4M0pj1fyuo+r9OslZSkg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1m1W6wlNiRfe77HAiHN3nzCFIu0bKpzTcNH0bFPKZH58BHla1
	frDC8/koQ7/R/l5K4hIJsNoGQGcVfJIR7VpYDrO7JhraLcDQyX08L6/l4ZRVsr2mjkEkTRKFLr+
	gwygK4dx1xo27XuMQ56GikF0lTHdlrwiT4PwoYYPv4JmDDHPK41QASMP3S8jfzTIQi5yZOPVvqA
	==
X-Gm-Gg: ASbGncsFGel+DtMx0BHtavhvqU1ROlDkugDTNFa566wnFX4vDsCkKBgLEw9VcGt8v12
	isxzbzq7cRIRtywmqXrdBw0guDLpt/gz03XHYf2R9HFLu8rMFbNPM5G0rUX1Brw6PmUJMMaccyx
	rab+SFcSEcDNSQLiCaUKCYy6A9SgXKqyai2kVtEeRwiCUEODU7QxanB4Ei5fwdgg9zmc+eOEPzm
	yqVLiDRe0a4K4d4xxexuSFiZc4qmmzPKAgWlMs4z6+iyRXsdsjOnxXKOiu9Rco7VQ+FZ44dH4wA
	dV1jikWcuHZBU+0nov0iqDXfZzdxO6oG7ZqHgxqS+iYsJY5wf9EJKclxRx4tvtiod7FjXB5kwB6
	9niRN3bIeGwYy3ch9Zp/tOau2he9sVG/Jq4LagMd/CeaJ08rVBlp5
X-Received: by 2002:a05:622a:1904:b0:4b2:8ac4:ef85 with SMTP id d75a77b69052e-4b5f84bdc04mr172828971cf.84.1757533373946;
        Wed, 10 Sep 2025 12:42:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4LM5n6q3x7O/nMFCbv+KTdGAJSRvFARvfiNuJedE701eBLHhZVYWWeXkwyAfYeYOBgycy0w==
X-Received: by 2002:a05:622a:1904:b0:4b2:8ac4:ef85 with SMTP id d75a77b69052e-4b5f84bdc04mr172828411cf.84.1757533373376;
        Wed, 10 Sep 2025 12:42:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56dbfb5d10fsm49073e87.108.2025.09.10.12.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 12:42:52 -0700 (PDT)
Date: Wed, 10 Sep 2025 22:42:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: kernel-list@raspberrypi.com, amd-gfx@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
        arun.r.murthy@intel.com, uma.shankar@intel.com, jani.nikula@intel.com,
        harry.wentland@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
        liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, robin.clark@oss.qualcomm.com,
        abhinav.kumar@linux.dev, tzimmermann@suse.de,
        jessica.zhang@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org,
        laurent.pinchart+renesas@ideasonboard.com, mcanal@igalia.com,
        dave.stevenson@raspberrypi.com,
        tomi.valkeinen+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, louis.chauvet@bootlin.com
Subject: Re: [PATCH 1/7] drm: writeback: Refactor drm_writeback_connector
 structure
Message-ID: <curkiddhkz6k4rtbxxmmmm4oqyjzvda3xc2bc5c6dmq2c5qgkk@z6cwzap2hwgy>
References: <20250909100649.1509696-1-suraj.kandpal@intel.com>
 <20250909100649.1509696-2-suraj.kandpal@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909100649.1509696-2-suraj.kandpal@intel.com>
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c1d4be cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=QyXUC8HyAAAA:8 a=ht3OSqXAj6RBLq6GiRYA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: tyUqA5rCSIVYzfDfTvzwtpUNqXQAorgV
X-Proofpoint-GUID: tyUqA5rCSIVYzfDfTvzwtpUNqXQAorgV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX0RYqu33tZInK
 5M56SsBlpoR3O5tt3voIqJMnKuG7T6WPvmlXjJ1K3xYulCgsz9NHrsM+OqNN9yiYn+uPUD7bg0w
 NeO8PiPgQfpAcfHRnCoJu8gX8mZaQBNPcACDE4JJmWLOwY3CPpWTk4KUWs/9+MkShHGPRZMw88g
 0zujNBSgqJLouYJciv5X+xAKRR6xwFaF0NZNBYVzaN0upn93Zw96+pN4NDZae9EfbxMgNhLmBWT
 gRcCW+P1mqTNYPveKSZZ0N/YwRi0yZG8wdZ6PL59v6cM7qm+x557b+Zz2Rmqt/Rwf6yey7fTS/J
 lI+McW4mGMBQCx4ku0O/+pFaI3SE7rYVSf1Af1nS3GWS6dt2ba4iBCiRZJnH/RynIu3BYuukykA
 1pMxT7LW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

On Tue, Sep 09, 2025 at 03:36:43PM +0530, Suraj Kandpal wrote:
> Some drivers cannot work with the current design where the connector
> is embedded within the drm_writeback_connector such as Intel and
> some drivers that can get it working end up adding a lot of checks
> all around the code to check if it's a writeback conenctor or not,
> this is due to the limitation of inheritance in C.
> To solve this we move the drm_writeback_connector within the

Please take a look at Documentation/process/submitting-patches.rst:
s/we //g, etc.

> drm_connector and remove the drm_connector base which was in
> drm_writeback_connector. We also make this drm_writeback_connector
> a union with hdmi connector to save memory and since a connector can
> never be both writeback and hdmi it should serve us well.
> We do all other requireda modifications that come with these changes
> along with addition of new function which returns the drm_connector
> when drm_writeback_connector is present.
> We also modify drivers using the drm_writeback_connector to
> allow them to use this connector without breaking them.
> The drivers modified here are amd, komeda, mali, vc4, vkms,
> rcar_du, msm
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c  |  8 +--
>  .../gpu/drm/arm/display/komeda/komeda_crtc.c  |  6 +-
>  .../gpu/drm/arm/display/komeda/komeda_kms.h   |  6 +-
>  .../arm/display/komeda/komeda_wb_connector.c  |  8 +--
>  drivers/gpu/drm/arm/malidp_crtc.c             |  2 +-
>  drivers/gpu/drm/arm/malidp_drv.h              |  2 +-
>  drivers/gpu/drm/arm/malidp_hw.c               |  6 +-
>  drivers/gpu/drm/arm/malidp_mw.c               |  8 +--
>  drivers/gpu/drm/drm_writeback.c               | 33 ++++++---
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 16 +++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h |  4 +-
>  .../gpu/drm/renesas/rcar-du/rcar_du_crtc.h    |  4 +-
>  .../drm/renesas/rcar-du/rcar_du_writeback.c   | 19 ++---
>  drivers/gpu/drm/vc4/vc4_txp.c                 | 14 ++--
>  drivers/gpu/drm/vkms/vkms_composer.c          |  2 +-
>  drivers/gpu/drm/vkms/vkms_drv.h               |  2 +-
>  drivers/gpu/drm/vkms/vkms_writeback.c         | 13 ++--
>  include/drm/drm_connector.h                   | 70 +++++++++++++++++--
>  include/drm/drm_writeback.h                   | 68 ++----------------
>  22 files changed, 163 insertions(+), 137 deletions(-)
> 
> @@ -2305,6 +2366,7 @@ struct drm_connector {
>  	 * @cec: CEC-related data.
>  	 */
>  	struct drm_connector_cec cec;
> +

Probably a refactoring leftover.

>  };
>  
>  #define obj_to_connector(x) container_of(x, struct drm_connector, base)

-- 
With best wishes
Dmitry

