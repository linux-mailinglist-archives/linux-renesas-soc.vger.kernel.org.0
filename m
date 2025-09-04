Return-Path: <linux-renesas-soc+bounces-21383-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6658FB4472F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 22:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A90B5836EA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 20:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E683527E05B;
	Thu,  4 Sep 2025 20:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O9nJJj8C"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B3C253F05
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Sep 2025 20:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757017269; cv=none; b=G7CIefu8T8wvtpLi7WPLU57IVbva1CDcqXiLVOjDyhDI0vC8q+sWrWliYtTgXGdWSZwfCvfl47qve9zy56cwCcrRyVCZ9OXVkInFuu7aKtInFNA+UDMsFA8sRK8wfsd3pE3I0qbcQCdEWzRud3wWdfAwTJKuFhmZG6iazz0Umdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757017269; c=relaxed/simple;
	bh=sblvuJxDOkIby9p9uicvxyoZlsbTwHNTNMzgFbFh7gM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYcjyoQWFIW5viHtuzMZBI1boHOpaUPzUiqRnyduMV6xa8pcx6yMLF0tkiyWLY233jihLg/tss3I6fm5SJ7mFkFzLEWgynoFvka6StiP2tce7vhlYwFB/H/2KoheFEmGGcq8TxPhgG6rObRo95frgnfQWaNgkm1iazCxhYtr23Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O9nJJj8C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IJsu9023074
	for <linux-renesas-soc@vger.kernel.org>; Thu, 4 Sep 2025 20:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+3HBgKIKoJKqQ2v1bUP7aLXl
	0r8wigJ+GtwUOON7BTA=; b=O9nJJj8CmOX6UIbSkqcoGtXwnsRGRpQy6bEoqACn
	lsdUQ3w8RglhjIk7tyEnhOuftLmITfKS+XaTfbeNXJg7LiN6hCn46FYdMMGsVqYb
	fC17LKqPwxluIFj5W48FipKTt+rVtC6FpxQbOr50GBCBn9hpIsDHC8qOHAgoe7Xp
	KpWdX3KIQ+3Tnoyq8yoLMFPUAxuU9B962vXcwhb8k0C3u1Pf/LlMB0q2z2KxWxgX
	J8lZN0kzCvwYNEWsKWgmbK4OPL2zSG8pzja/aivSd9LLEoXq3+yCUIWexf7jBwzj
	jInyjkI6NiIn0MuL8CuWGdbSn2Mjv2p2mtODnFIDxV1nWA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0erx7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Sep 2025 20:21:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b30d6ed3a4so29857021cf.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Sep 2025 13:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757017266; x=1757622066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+3HBgKIKoJKqQ2v1bUP7aLXl0r8wigJ+GtwUOON7BTA=;
        b=pv4aN520ASCbZnZF1XBO0wRqocgWwqiAdu+QO3xyIw8M/Zn7VlPYynIXrAlrUxJEDL
         LdItr28CHHE9glKPjsphnv+ZnauL7PtRL6tZGtN/MpmaLojGOtjim1vRjDOgtzGcnujO
         IQLrCauK74xi025Xmeu+DhGwA+GJ5qIZU5YiJHrUPofbXxdufwfqUUtTspUma2EqPPaz
         3VZo1Z45chJIfUcsna2qY6Gt5Cwklzc1GuQRRNgsW8Sq2CGatUmLANlCYuoWhxjpI1Lg
         savV7kDD0xubaiQcQTtcbx+jJkC5Wx9Rf8Yl+0XQbDENL3tgfd7R/r1FsLbSaxHHEFl8
         IIgw==
X-Forwarded-Encrypted: i=1; AJvYcCU3Z46P3A+kU/8uybLMSjk/N0vCFK4m/4Z4Xi1DM4IorNsC9dMz8wN3kwTkJ+dFnACsRmseJFRMYq5l+e8UMx/7vg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8tSWw5/tTk3Zrs1DrFn6OX9g/Jf+5+k8Rtvt5XSr8+Xo/HAI2
	GXfe9eNxtMlENbSSSLoxQ/hSiZsThhv6Ak+omSi7PswU3udpTIAHn/lw1DHyl3NchpI6gVDZqA7
	5ZUDZkun7GFoa0xH2g+wHUDVog43GVuoTe0Y0Z2kIdegKIgVxfbGecQHzdKJSv3/TB+m1i7HAFQ
	==
X-Gm-Gg: ASbGncskoMV9flZ3qaflLOqGr6RlmVARn/mVc90dUnFr/x/OknyZGjZXYpKLXFXVdD7
	PynzBUyqG9s3XzztlE0E7YVc5h2/bfKwCEWr34Qlo+bV5UVz0gsPg9AcaFbIqOQdn//fEGwmuG9
	gtrxVgfD6WwdrINSJztUdSZU0gMNcLnJMQydDCQEebt+WfJw+zVScPbNoTV7GNDZ+Afy5v0r3fP
	iAxJEUhr5dIn+yL7mHWIbA9vnvbPuUxv1SoPmSDMbf9GTwfQ9U72WEYti1kedk8YJNbzyZeUmcJ
	9FEMtXU2LUHJDX2z67V3MeNezM2DaXBgXHt5hVlF5rNL/nFIzpe5FOa22eCwfhS5XAZ7Wk9W8fX
	NvccNj6SJaVlIzD7JrDsq/8ikjK1mXeWiKA4+wwKUOX584Z8nmapk
X-Received: by 2002:a05:622a:1e8a:b0:4b3:27e:72d8 with SMTP id d75a77b69052e-4b31dcd86dfmr254532371cf.40.1757017265504;
        Thu, 04 Sep 2025 13:21:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVRAk329W+vmEnu3groyG+I6+iyAa2nIEVK56ANdVFZasJxWhkN9T13yfIcbmSN3ATB9FeJA==
X-Received: by 2002:a05:622a:1e8a:b0:4b3:27e:72d8 with SMTP id d75a77b69052e-4b31dcd86dfmr254531781cf.40.1757017264713;
        Thu, 04 Sep 2025 13:21:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c91d37sm16433841fa.19.2025.09.04.13.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 13:21:03 -0700 (PDT)
Date: Thu, 4 Sep 2025 23:21:02 +0300
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
Subject: Re: [PATCH 2/2] drm/panel: ilitek-ili9881c: Add configuration for 5"
 Raspberry Pi 720x1280
Message-ID: <33t4oznhr442t6xu2xccjanc5ujdbzo7m3gtmqe6aqpzevazgk@5fachuynkvsu>
References: <20250904200238.168307-1-marek.vasut+renesas@mailbox.org>
 <20250904200238.168307-2-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904200238.168307-2-marek.vasut+renesas@mailbox.org>
X-Proofpoint-GUID: l4QFxS4llxj98pVyhkwkFYQ_E-4vk8FY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX008rUc4t5TuX
 hqVm8Iw2zFxGl389MOhhmfKWncrZ4kMwyMQZcjL28woBGoUZjKoMHv5nDCz5U/pbOXuKT4O/DgO
 QVtzLxAIfQJD0LOys1OjdJ5okiX7Ajc47JYB7j35ZTVUlU87fEILZz6GiEU8eLZjAW5jR4INjS2
 7Ic8qMrP0/61Jx1f/yLd8O6dAT4bD9RImRknACT+oywnWRhCru6F34jtBjsMNF5NTTPNTOWGVY5
 dFMeFxXcv0vI+mpuF/l/fGYQrbfr7iPlR5VnVy8M57k5oLEy5IY8v6wWyi2Ajsq9TtuUj8JJukK
 CKG1tkUlNsr2VIgur9inpFzz9OL1m5V8kwez2h70SUAw1PeCQuyt2Dh4kiNGP8tugzA0uzTrKNO
 yHbqrXHx
X-Proofpoint-ORIG-GUID: l4QFxS4llxj98pVyhkwkFYQ_E-4vk8FY
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b9f4b3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=b3CbU_ItAAAA:8 a=VwQbUJbxAAAA:8 a=RF00TdSWAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8
 a=e5mUnYsNAAAA:8 a=32uUvSySa_7-NZi68RoA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Rv2g8BkzVjQTVhhssdqe:22 a=_nx8FpPT0le-2JWwMI5O:22
 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004

On Thu, Sep 04, 2025 at 10:01:55PM +0200, Marek Vasut wrote:
> Add configuration for the 5" Raspberry Pi 720x1280 DSI panel
> based on ili9881. This uses 10px longer horizontal sync pulse
> and 10px shorter HBP to avoid very short hsync pulse.
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
>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 214 ++++++++++++++++++
>  1 file changed, 214 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> index 39929c6ebdad9..98c6b28691e42 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -1224,6 +1224,194 @@ static const struct ili9881c_instr am8001280g_init[] = {
>  	ILI9881C_COMMAND_INSTR(MIPI_DCS_WRITE_POWER_SAVE, 0x00),
>  };
>  
> +static const struct ili9881c_instr rpi_5inch_init[] = {
> +	ILI9881C_SWITCH_PAGE_INSTR(3),
> +	ILI9881C_COMMAND_INSTR(0x01, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x02, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x03, 0x73),
> +	ILI9881C_COMMAND_INSTR(0x04, 0x73),
> +	ILI9881C_COMMAND_INSTR(0x05, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x06, 0x06),
> +	ILI9881C_COMMAND_INSTR(0x07, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x08, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x09, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x0a, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x0b, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x0c, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x0d, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x0e, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x0f, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x10, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x11, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x12, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x13, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x14, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x15, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x16, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x17, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x18, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x19, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1a, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1b, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1c, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1d, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1e, 0xc0),
> +	ILI9881C_COMMAND_INSTR(0x1f, 0x80),
> +	ILI9881C_COMMAND_INSTR(0x20, 0x04),
> +	ILI9881C_COMMAND_INSTR(0x21, 0x03),
> +	ILI9881C_COMMAND_INSTR(0x22, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x23, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x24, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x25, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x26, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x27, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x28, 0x33),
> +	ILI9881C_COMMAND_INSTR(0x29, 0x03),
> +	ILI9881C_COMMAND_INSTR(0x2a, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x2b, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x2c, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x2d, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x2e, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x2f, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x30, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x31, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x32, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x33, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x34, 0x03),
> +	ILI9881C_COMMAND_INSTR(0x35, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x36, 0x03),
> +	ILI9881C_COMMAND_INSTR(0x37, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x38, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x39, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3a, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3b, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3c, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3d, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3e, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3f, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x40, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x41, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x42, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x43, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x44, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x50, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x51, 0x23),
> +	ILI9881C_COMMAND_INSTR(0x52, 0x45),
> +	ILI9881C_COMMAND_INSTR(0x53, 0x67),
> +	ILI9881C_COMMAND_INSTR(0x54, 0x89),
> +	ILI9881C_COMMAND_INSTR(0x55, 0xab),
> +	ILI9881C_COMMAND_INSTR(0x56, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x57, 0x23),
> +	ILI9881C_COMMAND_INSTR(0x58, 0x45),
> +	ILI9881C_COMMAND_INSTR(0x59, 0x67),
> +	ILI9881C_COMMAND_INSTR(0x5a, 0x89),
> +	ILI9881C_COMMAND_INSTR(0x5b, 0xab),
> +	ILI9881C_COMMAND_INSTR(0x5c, 0xcd),
> +	ILI9881C_COMMAND_INSTR(0x5d, 0xef),
> +	ILI9881C_COMMAND_INSTR(0x5e, 0x10),
> +	ILI9881C_COMMAND_INSTR(0x5f, 0x09),
> +	ILI9881C_COMMAND_INSTR(0x60, 0x08),
> +	ILI9881C_COMMAND_INSTR(0x61, 0x0f),
> +	ILI9881C_COMMAND_INSTR(0x62, 0x0e),
> +	ILI9881C_COMMAND_INSTR(0x63, 0x0d),
> +	ILI9881C_COMMAND_INSTR(0x64, 0x0c),
> +	ILI9881C_COMMAND_INSTR(0x65, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x66, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x67, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x68, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x69, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6a, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6b, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6c, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6d, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6e, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6f, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x70, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x71, 0x06),
> +	ILI9881C_COMMAND_INSTR(0x72, 0x07),
> +	ILI9881C_COMMAND_INSTR(0x73, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x74, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x75, 0x06),
> +	ILI9881C_COMMAND_INSTR(0x76, 0x07),
> +	ILI9881C_COMMAND_INSTR(0x77, 0x0e),
> +	ILI9881C_COMMAND_INSTR(0x78, 0x0f),
> +	ILI9881C_COMMAND_INSTR(0x79, 0x0c),
> +	ILI9881C_COMMAND_INSTR(0x7a, 0x0d),
> +	ILI9881C_COMMAND_INSTR(0x7b, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x7c, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x7d, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x7e, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x7f, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x80, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x81, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x82, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x83, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x84, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x85, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x86, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x87, 0x09),
> +	ILI9881C_COMMAND_INSTR(0x88, 0x08),
> +	ILI9881C_COMMAND_INSTR(0x89, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x8A, 0x02),
> +	ILI9881C_SWITCH_PAGE_INSTR(4),
> +	ILI9881C_COMMAND_INSTR(0x6C, 0x15),
> +	ILI9881C_COMMAND_INSTR(0x6E, 0x2a),
> +	ILI9881C_COMMAND_INSTR(0x6F, 0x57),
> +	ILI9881C_COMMAND_INSTR(0x3A, 0xa4),
> +	ILI9881C_COMMAND_INSTR(0x8D, 0x1a),
> +	ILI9881C_COMMAND_INSTR(0x87, 0xba),
> +	ILI9881C_COMMAND_INSTR(0x26, 0x76),
> +	ILI9881C_COMMAND_INSTR(0xB2, 0xd1),
> +	ILI9881C_SWITCH_PAGE_INSTR(1),
> +	ILI9881C_COMMAND_INSTR(0x22, 0x0A),
> +	ILI9881C_COMMAND_INSTR(0x31, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x53, 0x35),
> +	ILI9881C_COMMAND_INSTR(0x55, 0x50),
> +	ILI9881C_COMMAND_INSTR(0x50, 0xaf),
> +	ILI9881C_COMMAND_INSTR(0x51, 0xaf),
> +	ILI9881C_COMMAND_INSTR(0x60, 0x14),
> +	ILI9881C_COMMAND_INSTR(0xA0, 0x08),
> +	ILI9881C_COMMAND_INSTR(0xA1, 0x1d),
> +	ILI9881C_COMMAND_INSTR(0xA2, 0x2c),
> +	ILI9881C_COMMAND_INSTR(0xA3, 0x14),
> +	ILI9881C_COMMAND_INSTR(0xA4, 0x19),
> +	ILI9881C_COMMAND_INSTR(0xA5, 0x2e),
> +	ILI9881C_COMMAND_INSTR(0xA6, 0x22),
> +	ILI9881C_COMMAND_INSTR(0xA7, 0x23),
> +	ILI9881C_COMMAND_INSTR(0xA8, 0x97),
> +	ILI9881C_COMMAND_INSTR(0xA9, 0x1e),
> +	ILI9881C_COMMAND_INSTR(0xAA, 0x29),
> +	ILI9881C_COMMAND_INSTR(0xAB, 0x7b),
> +	ILI9881C_COMMAND_INSTR(0xAC, 0x18),
> +	ILI9881C_COMMAND_INSTR(0xAD, 0x17),
> +	ILI9881C_COMMAND_INSTR(0xAE, 0x4b),
> +	ILI9881C_COMMAND_INSTR(0xAF, 0x1f),
> +	ILI9881C_COMMAND_INSTR(0xB0, 0x27),
> +	ILI9881C_COMMAND_INSTR(0xB1, 0x52),
> +	ILI9881C_COMMAND_INSTR(0xB2, 0x63),
> +	ILI9881C_COMMAND_INSTR(0xB3, 0x39),
> +	ILI9881C_COMMAND_INSTR(0xC0, 0x08),
> +	ILI9881C_COMMAND_INSTR(0xC1, 0x1d),
> +	ILI9881C_COMMAND_INSTR(0xC2, 0x2c),
> +	ILI9881C_COMMAND_INSTR(0xC3, 0x14),
> +	ILI9881C_COMMAND_INSTR(0xC4, 0x19),
> +	ILI9881C_COMMAND_INSTR(0xC5, 0x2e),
> +	ILI9881C_COMMAND_INSTR(0xC6, 0x22),
> +	ILI9881C_COMMAND_INSTR(0xC7, 0x23),
> +	ILI9881C_COMMAND_INSTR(0xC8, 0x97),
> +	ILI9881C_COMMAND_INSTR(0xC9, 0x1e),
> +	ILI9881C_COMMAND_INSTR(0xCA, 0x29),
> +	ILI9881C_COMMAND_INSTR(0xCB, 0x7b),
> +	ILI9881C_COMMAND_INSTR(0xCC, 0x18),
> +	ILI9881C_COMMAND_INSTR(0xCD, 0x17),
> +	ILI9881C_COMMAND_INSTR(0xCE, 0x4b),
> +	ILI9881C_COMMAND_INSTR(0xCF, 0x1f),
> +	ILI9881C_COMMAND_INSTR(0xD0, 0x27),
> +	ILI9881C_COMMAND_INSTR(0xD1, 0x52),
> +	ILI9881C_COMMAND_INSTR(0xD2, 0x63),
> +	ILI9881C_COMMAND_INSTR(0xD3, 0x39),
> +};

Should the hex be lower-cased? Other than that LGTM.


-- 
With best wishes
Dmitry

