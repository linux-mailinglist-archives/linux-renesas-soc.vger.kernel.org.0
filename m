Return-Path: <linux-renesas-soc+bounces-21416-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4669DB44A11
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 01:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3584585C38
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 23:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 813202D12E3;
	Thu,  4 Sep 2025 23:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cxbgcgE1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3201078F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Sep 2025 23:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757026909; cv=none; b=ZIH0rfSFnB/4vJFab6WByVJUQorOXFamjSt/zUDDMC5ZcNLOTb1RVLD0k+/bQNqVP8ApSufHzSPxcH8LnzBvAuSc6QFzTalZHbYLCg1uuuJveXv06n0R36hxSZDY7Xb+NjXcyRvB2p2JWVc/4/cMLBILPfHe3OhVjIvySmQpMi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757026909; c=relaxed/simple;
	bh=QIAtTJTOWc2cm4r1AvvZcuu+0yp32J2PCv2mbv+ufT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WMov3oDMZmkUpsmb+1WlO1NejnPejqmgbO6KysB70zKWAF4JIsiQFtfFftLskGHTg2ecAddarynl58dFV13+Dr3N+852JVSpG9Zx9+7MN0pMx6d/siXUvSoWKFeTMBbdJ19z4xVbyNWnlB3cYvi9A4yaP1R/S3a+XCeBQhw+6KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cxbgcgE1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584Hk7wP013506
	for <linux-renesas-soc@vger.kernel.org>; Thu, 4 Sep 2025 23:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=etXN28r9jaaYlfuPDpTiD3hF
	bcuxX5byMenXbqFORPk=; b=cxbgcgE19sPkiCfBgjxSL0gtQ/GF3vK/15azlZvP
	rMuvJB/9qEBN0q6sBcwnl9uFN+JtlDrdp8dp+rYhd2DCbtiVVBW/iwZF2CydTRPj
	L+67D9ejpUL41AaGRfS5mticXJ6YXt/avFmZAIzh//5kypz7QoTbbZoUeWGRGSb3
	Rc3bkJEE4pjCW9wR/q7Xyfx64s4CDG8JHeDFB9Jtz8EWTPcisFAlCOEAVDB4wTg5
	RE2zApN6d9drKEa3jXmknkDaQ3r567urujro2hcAdKSC1fR7s6+cvQ3WgzPj94l/
	3wtLGq4KUK0kJsmF3YLwmxdVqpse6Ts7mdmEdpuCPio5dg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyd2g0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Sep 2025 23:01:46 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5353106c96cso817961137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Sep 2025 16:01:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757026906; x=1757631706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etXN28r9jaaYlfuPDpTiD3hFbcuxX5byMenXbqFORPk=;
        b=lMK89SYGMOV8l6GLHygavhJHm4K/Yq1epPpFpz1y/JGirNN1rMb6fh2XeQ7X5mxA10
         v3vln7pLIzs59PUgDxuNgFGcApELiceR4o2AY4oOdxnz14XBI96/WL8/pnSrb6oFLqaJ
         O1Nkio65dZ1Ut7XfN93N6FOPBm9k7tIOBAKCg+Vw4rL0QZStOZ1JQD8IGra1hCViUji1
         XJan6Hvx6V7RxB+85mt+8bTvPzk4qQ1/f4d/M9f6Z0GoCN5LADUVXPxO7ErSdyV2B0vF
         DTe6LSGo+ssYi+YmfU8AViLkGcerr+BS/3HyA2FXr8giWXMUoQUbDSm7G4Cx+hFZ9PDb
         olwA==
X-Forwarded-Encrypted: i=1; AJvYcCXdvOtDogo12neSa72SPUhd32zJH7mBbRAh/KCSB4rMGxh+iJ5Y90s1Rfh59CEHrnfWuiJlIhpOQcgx2glMJqsGTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNwyuzcELIVxbN/wphC1axRvzaA92ujqOr+AQKro9y/HrvMTjD
	kasbr48nUvvZxvW8YOLC3GldQFPCU74x9doII2qyCLxUYURK0GZEbmlaYGN1QPmgkq6J8uo+aAa
	U9WfXhKUOyoMX0lz27NPgkJrx0CIgm3ALaVAtaliaOkLfLYgTJ4qyxStVQUi7M7un6N6UYzYhHg
	==
X-Gm-Gg: ASbGncu6/vY2Vz3GYukqUdh3zo3m6tQKe7uVvl0vydh/a9PrtfQDYSSi0TiBPv0ETzF
	I0OoHutM6MfSkD/dgMQa31Aq25v/8ztqz4mw6u0l6Uw1I+HqqbL9rSCEvO0FCXKF4y0ZmC+kn7f
	UNWKWxRUBdTihy+bYG+v9FBwAG4tSGSSko4MteQkY9a/3pm9pzipTnliJLaCfqg3Fyb1ttkkQNw
	jB3355jjhiK62OHIp2u3/0KyuUWAT9LNwWZ/K368SsFW6p/61LwQzDKXz5/7u/Jy5sZOLZEqKps
	8xH/lJngGyQOvKoJask8jMv+MHVP8I7eTIMDYYuE/wm8e/26sgmU5imy0J885DKd5l03Dbyj3jG
	hyjlOs5jfIDdTrT058knqvcI2jcdn8FbTTYODab+O8ZzYAbl5yf7T
X-Received: by 2002:a05:6102:4412:b0:508:aeba:ac31 with SMTP id ada2fe7eead31-52b198509ddmr6977184137.2.1757026905746;
        Thu, 04 Sep 2025 16:01:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZFTY0xHZC0fSrJeqcA/zXmLkbjpVOO2YoQKWjdh8znnPj9BanzEoFDRvnxif8pLwlmRxjVg==
X-Received: by 2002:a05:6102:4412:b0:508:aeba:ac31 with SMTP id ada2fe7eead31-52b198509ddmr6977153137.2.1757026905323;
        Thu, 04 Sep 2025 16:01:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608acea11fsm1477286e87.80.2025.09.04.16.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 16:01:44 -0700 (PDT)
Date: Fri, 5 Sep 2025 02:01:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        David Airlie <airlied@gmail.com>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm/panel: ilitek-ili9881c: Turn
 ILI9881C_COMMAND_INSTR() parameters lowercase
Message-ID: <tzz75sv4orkbydpd2wmqxvsoyhc6as3uusjmt6rcw45mjz74wi@r7wm7wibzaom>
References: <20250904205541.186001-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904205541.186001-1-marek.vasut+renesas@mailbox.org>
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68ba1a5a cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=b3CbU_ItAAAA:8 a=VwQbUJbxAAAA:8 a=RF00TdSWAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8
 a=e5mUnYsNAAAA:8 a=dCZUmJHuHaGrPOQQW1IA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=Rv2g8BkzVjQTVhhssdqe:22 a=_nx8FpPT0le-2JWwMI5O:22
 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: LbK0wFZlQfD7J5x8o33T53nfLb79hcyU
X-Proofpoint-ORIG-GUID: LbK0wFZlQfD7J5x8o33T53nfLb79hcyU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX5IMnR0iDmA06
 ZRxNn5e7zLiaeyz0OeK40Z1PJzud+8gcJIuqoQfDIg14j6eMIV790qncBwPpv2T/WEAfw4GIKKn
 F7XA6iZKdOHEwNxWNe0Obr1N0TNj13PTlYO+pQfPSdpXbSo8xkmWkEJvR5Voa4SiBsAGdo09szX
 QkZUe3rhWMYn5jgNJmY/3SJhncVu0X5LzsIqtv+giFg+H/aDMP7Lad9Tvr+ocHqzkL7SYhRbShf
 AfbzDQnFuXdWp9YREb17fVulJyHUvCCXy9QajT2e5sE9/3zn96ziRFshxXMezmd6Q+brJws2C76
 qeFNKeeSb+QpjQq3NkSvhtI0QKvCeeRVbRU+z6llhVn1HHQiUrn9ixhu5ckyxLJcfJfqXJc2N2c
 TLqq4oOf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

On Thu, Sep 04, 2025 at 10:55:15PM +0200, Marek Vasut wrote:
> Make all ILI9881C_COMMAND_INSTR() parameters consistently lowercase.
> No functional change.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> NOTE: Use vim :%s@ILI9881C_COMMAND_INSTR\(.0x.*\)),@ILI9881C_COMMAND_INSTR\L\1),
> ---
>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 888 +++++++++---------
>  1 file changed, 444 insertions(+), 444 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

