Return-Path: <linux-renesas-soc+bounces-15560-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29565A80528
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 14:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 071C81B6728F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 12:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B46F26B2AE;
	Tue,  8 Apr 2025 12:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XCnJ3igm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A53F269D09
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Apr 2025 12:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114075; cv=none; b=IQjpUw3Kj94rQmQi2RBmgZJrpOrscLceMG0c4MMcib3sE0OvdLKVgRsQqIgKo31FQY1FgHN31cxJ8RGjmGOgy9+VRltK6gs24pfk3MpNFZQCBkckDbL2AlzCVgOiVRGU2azYhFEPIUL2nPAN1AZ+8CRFcAhBcyI1Ov/+D2esgQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114075; c=relaxed/simple;
	bh=doIBbH06P5ovXkVq2McdyHPCl29PiqcG20/MYPUBpE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nTSJbM9mrQeHzfkzKNZHqYEyQT7fQxVQI6ARpsOXFJMTkgCoc9urvRnvsG+/rOyWKNijji5h1gZ0FV9m5xD7tJO9BYFhHW6q9j0SjDePFRDNDG5Y+dSI0DHBEE0UmBslR6zofEp2MZ/RRL89EzfMNsiA5hEX/UNgm9S3xCuXXBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XCnJ3igm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538Aj2im019568
	for <linux-renesas-soc@vger.kernel.org>; Tue, 8 Apr 2025 12:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vFThqq7ILooH+RLGqVKM/XdZ
	cU6OAYhPWLK/0HqsQ6M=; b=XCnJ3igmR+clyI6eG7KCsy4++SCt3rnvgEcoddjz
	hb7g1vwListu13hpLmJk5ufeGmsBt0Qdu0SnQ/QRAtTZfdE5QShMPt8TbeY7A41l
	VFsCbPyorFtJTrjqkySeyNxr8C8CHT5PZGvanfmxNv66Cvbl1PDci8yRDawVnuAd
	Zc+YHj3bC/Vgx9sgZzbgdUB9JZPfXjP9ra1wzTgm9rPrPVNGFkET1SosGzdGwTbV
	67RFqwbcoSc3ZUYaJ5uURcPI7zK7KMC/shGPG8BM8iXpre0Ofe5yGNZJ8QhOtwDN
	ZO3Q//fI/7LjIqCriXeZ+MbfbK+sqhgGbmnKIv263WLRtQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3fne8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Apr 2025 12:07:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c760637fe5so971193285a.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Apr 2025 05:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744114071; x=1744718871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFThqq7ILooH+RLGqVKM/XdZcU6OAYhPWLK/0HqsQ6M=;
        b=AWV2hAHyh9h1m9GoFUoO1E2UUlVgsJUAz0YTj5PUrIYuxPyI2hgIX54WiE6Azl8RwW
         V1x26QGxByarg1673PKU4Oa91Lpi8ALv0LR6kfCofGv5sy1tKeH0/wvgJUCnShEBzwXy
         0Cqe387kn2l5XFPo54fC8a1bMFydkM+FVqpHSb9s9hUb3TtUG26ypjDuhmqaDZ8VLJwy
         Fi9pWIPaSZIHM3v9JPSEvUJLaQyPRq8Y9umuqtYH7HoagdVVewAdPX23GSOrqmpNgjNI
         H97v3M9LqXHYlibLslQN843I0PQy6igipPXXNkBYZoGiXpIHu4LHtPLdqTxfECB1SA0d
         JFlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA9TBHcjcpPq337tJKJMNPLKiycrhKBSjBXeL7jFfSUW0RQjQreQlQdhLxxSjb0ghdZCMGq9WJiCNsfDqxDxj1OA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2o0CHVyZVAf9OhE8pOCEHg1IVnK8NTdUggEDPKJwQgRDJekkg
	/Jf8rFU92m1KZB0/ceBfWeT6upSZLtI8aSiRKF4DubKbCVewdXoWUVrLADiMAdmrxX3QHEe+ZCE
	papYTPHToxf791SR8A9fgQvgtK+i7XCra0seq8YozXri/aJnG3hHxBUM7bpK6CYZ18PHgig==
X-Gm-Gg: ASbGncsfaHoXCB0eMESebTtqABN6BhVAvVmaNdXvFPHVxYNYgDO2KwNUyQC1lEvBg2k
	kQiHZBAil2FCWhnaWDKK+uLDLikfxIibBsPYAPYzOkbFllcGrP1dhfvhsDqmjTKytjVXywh9elR
	09aWzixW3sopMIUl7BE/AMQ8mFnKZ471N6fEhFwS9k/FPThqbedABF2lXMIMjHMT3Ru6fAVJJGI
	vIsy7qtCfq+gxRzbkvRn3u5WiCO/yuAlMIBqXrUms718JoAVsGUurLOZvhBOYcuONak+GuFD2mD
	00a6wlgmrreVOZ8tsiyx97gBLMQ7oMzywb/kroX7OCgiDx2XR8X1eVTwwOdPRjWd0ioL0gVYWQi
	SIQM=
X-Received: by 2002:a05:620a:17a7:b0:7c0:bb3f:e285 with SMTP id af79cd13be357-7c77dd62725mr1589590285a.24.1744114071318;
        Tue, 08 Apr 2025 05:07:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEi/xFz1Y/FUnJgwy2p/a82dsZcDfNqrlyFtWekzBv5M8uIRg3fMoN8KW/g0lGhJUXSQz8Eyg==
X-Received: by 2002:a05:620a:17a7:b0:7c0:bb3f:e285 with SMTP id af79cd13be357-7c77dd62725mr1589584485a.24.1744114070904;
        Tue, 08 Apr 2025 05:07:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e66377esm1493668e87.209.2025.04.08.05.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:07:50 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:07:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Anusha Srivatsa <asrivats@redhat.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Dmitry Baryshkov <lumag@kernel.org>,
        =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
        Hui Pu <Hui.Pu@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH 12/34] drm/bridge: tda998x: convert to
 devm_drm_bridge_alloc() API
Message-ID: <kgobwv6zldlyb7vxyy4fyhe73krnsjr6aczpwl6agompne3tiw@vyk4m65vaqul>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-12-42113ff8d9c0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-12-42113ff8d9c0@bootlin.com>
X-Proofpoint-GUID: 8EjkmldljyYywojCyinF1R364rvykKRs
X-Proofpoint-ORIG-GUID: 8EjkmldljyYywojCyinF1R364rvykKRs
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f51198 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=hcs5bi09U0a-O7-gtRoA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=d3PnA9EDa4IxuAV0gXij:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=891 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080086

On Mon, Apr 07, 2025 at 04:23:27PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Cc: Russell King <linux@armlinux.org.uk>
> ---
>  drivers/gpu/drm/bridge/tda998x_drv.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

