Return-Path: <linux-renesas-soc+bounces-15557-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9491CA8049C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 14:10:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43123880E5C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 12:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17BC926A0CF;
	Tue,  8 Apr 2025 11:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kAsOPgkP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C00026A0FF
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Apr 2025 11:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744113593; cv=none; b=vDIiG9D1TYQ16E0JfwiHvF1XM51pYPtvtmKQZ0/WwvUasUHwj5yhOPm7s9j0cCRnN1LV+hTGfOKc9Prj/2/MDeld1a7FfRR4njDIju6iA2RkjHMNEiwfSPX6CPnt/HEI0OcvMLBs2rO//3WL3OoAJnAi36otcBKkPKmFQNGYzeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744113593; c=relaxed/simple;
	bh=O/+jAgGAxbyjXO4PAZC5MX8LL4I1nO1tb+Jf+oRpypY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IG6MgVn6fjfgO5xu3iaHpmZ2zxLqiQaIQODj9Fw2KG6cA2hLEKh9T4/HQyyEYbyHrQMhVEZpCie6vIvAe1n25Fa2PElAb0x5Mk/hKARPe/f9NhhNHDGnru6Vx6PtRi9EQAJaME7XWThKnFm3Jd0Y+P3vIFu4HKELW2e8PSWxehM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kAsOPgkP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538B00la027714
	for <linux-renesas-soc@vger.kernel.org>; Tue, 8 Apr 2025 11:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J5UKc7ae/UXmKHiunvfff8Ov
	kaw6Ua5MEgH+S/e5ZyQ=; b=kAsOPgkPIbWTYpxxLnV2o/tiI/3bdehvaBEoCyZ0
	dKGf+6HEMV+mOXtQg3TKew5ae8DTSn+qdcXvJtxK8ge+EnSr0tx+sCis1veuSQzg
	3edDDEClKZRUG3Frlttq3EXW9eGg6Cq4X/qOzYcAUEzeYFIgmgXGz/jg2tCX0Qeh
	VWNmF31+A/CHv5/qZ4QGp8dwZPB7U8WGPeLlfGkV1qCdeh+Pr9a3vvCkTGjqRHjf
	xF2zmMvSqSQDEiIKdecpulOEdxi8iAwxtfFzVa7K2HvKyiTWyAFBTNH+DWP29d2W
	vg8Y4qTFoI8b2c5ttNqjBRTpAkdNMdU6PF+BTUhr0+c3xA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcyynwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Apr 2025 11:59:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54767e507so919044885a.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Apr 2025 04:59:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744113589; x=1744718389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5UKc7ae/UXmKHiunvfff8Ovkaw6Ua5MEgH+S/e5ZyQ=;
        b=NYejgxBfhvlxFfCJ95FLgfCIUuqoiNvT8INqQ0QkOv3qLAzgcgfNAtCIoKhRDHtdqr
         nj5kHhCMPw0w77Rz58Ypin4sdeF6SA0lyUswo4x2n3lCtav/SZZIhxihkEq0afKymB+I
         l6g5Q8rkAYwUtjqkwaf5rTQ9jENhj0u4vJi5HnS7Aj+a6vH7McVozCIkn9uHaOQtdIIy
         XWhLwhroYyOtPpkc8sJBd4T99P+Ebth/mTJ5jWTDvYoZHnTQrwqKeKKvfUvmnIQt8KWl
         Ifw3Jbd2zL3qqOhpc5WRdgIc+kFisT8qsFA9WzIn2v6BdV7cWuiRGk8pxWbYEPO3Yi7/
         ZmOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHDTd2Mk4haLsn19xv3s5RMAlDptRXGQnbTJj0JN3g3eL4d22nRJKQGIyBs/8MOb0N4BVq68QhIjbgA/6QVBYjtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YydXMkI2YdMgTEfXNqjqJJFcInVBHsjZRbpPhTBdCdnDNdKR/oS
	MhPpzIOsQUCZwdSt0HV8XKjRROH5XssQP00D/HwH9CJEMFfdWztxrFNFvLIqEQ0D+hwDiMn2VRY
	Pbl4JOuOL/vjiMKR25J7mRyfvaOj2g+93fIGxkQPhQCPAUKJxTupmFRJIEv017Vf+1rUGXA==
X-Gm-Gg: ASbGnctXfR5wW58d1b0e0LXKzLVZUwOtdaL2qLL71BpwxkBOi+tFmGrBRsZMIlPWHfZ
	GbZgtSkgXHeu+b3m5Lo2FWpAFquB7ONzifosm90leYRCYit52jBXRATnhOAeJq+ik6b3yE/Tu+h
	lxvNl/wjpe9/9QQyVo/1MqRylSljhBDde6pvzGZsJ+90gKjLs0YtGLECt5vz0pnG4v4SHH4oN90
	UR7/L5yGanGbwShsiEpVD/PfnN3mXU1+cZ6epuT/gpuYpqg0G1fmUQNKblffJkLOgjBFNukOqpu
	soz+VIADdx895u6KZEzuNdquBm47+3UYO1txhcgrMxKg9EINPZ7wDA0juJvVU5wlYRt7t9s7iun
	NOaA=
X-Received: by 2002:a05:620a:3189:b0:7c5:a513:1fd2 with SMTP id af79cd13be357-7c7759e8788mr2682363085a.6.1744113589009;
        Tue, 08 Apr 2025 04:59:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLjG0AgWeS1WAQhJR3SCJI5Qh4YJ14xwCKURGmhWqtrP5XHH87RDOupWg+DezPfWGcaUO7og==
X-Received: by 2002:a05:620a:3189:b0:7c5:a513:1fd2 with SMTP id af79cd13be357-7c7759e8788mr2682358785a.6.1744113588696;
        Tue, 08 Apr 2025 04:59:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e6370ebsm1479003e87.130.2025.04.08.04.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 04:59:47 -0700 (PDT)
Date: Tue, 8 Apr 2025 14:59:46 +0300
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 16/34] drm/msm/dp: convert to devm_drm_bridge_alloc() API
Message-ID: <s5uvbdcv7pqogwg7gyy42vfxv3ubffj4ww7nili6sd3y67kdf5@byctauuurvwe>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-16-42113ff8d9c0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-16-42113ff8d9c0@bootlin.com>
X-Proofpoint-ORIG-GUID: JtHIxD3mJsVFvel1QIgN9l6Qcli91ec7
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f50fb5 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=COk6AnOGAAAA:8 a=tVI0ZWmoAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=Yq7wtpIrRiHUN6cIw-cA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-GUID: JtHIxD3mJsVFvel1QIgN9l6Qcli91ec7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080085

On Mon, Apr 07, 2025 at 04:23:31PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Bjorn Andersson <quic_bjorande@quicinc.com>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> ---
>  drivers/gpu/drm/msm/dp/dp_drm.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

