Return-Path: <linux-renesas-soc+bounces-15558-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11983A80596
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 14:19:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4FED3B52A3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 12:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DFF226A0F9;
	Tue,  8 Apr 2025 12:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UGSHs8Ie"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A161926A0EB
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Apr 2025 12:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114026; cv=none; b=r7SakK/8H/1bt8rGPPv+jtTm/uiEFGXjj5upHRWSEzleND6E5A2otIA5s8ay5yDVnxZidKLLW2ZELvr5BNcyQ+xsFplrDCOtZ7+sqZfItQlVHDBeOKm9UF5jPCerGzEIHw3IauXwjRIGBIy6/yci0mGOXaiQbmpit5l1w9qtk8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114026; c=relaxed/simple;
	bh=wcqcXnqgwA/2UFVEPkOb/WW5TyibBYqvJ5HM/5PHHSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SzElmXH5wRMVK73kgo0VrDsN4kHGdpyJaDD+tG0FWi5vAxzhcDcEsRmB5qe9x9lrjmGFjnG94xdUWk8qbfMMwNg0Wv9TVZ5BgEVnVeIG/jE5BpqzQrAy3N47pCO5ffExmTKNrNSIhAHjuoz70r/fTVq37UO9WXv9g4aiuNuEKdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UGSHs8Ie; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BJn5C019364
	for <linux-renesas-soc@vger.kernel.org>; Tue, 8 Apr 2025 12:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=okr4ff8snDUBXMIQ3O2Kjam3
	gElpjdiFVfB7cr7ArbI=; b=UGSHs8IecqIbnMxL8cE1GcJ8I8WeNKJR9JUc1AsP
	p2wvlCfST4uFdb8kTot56MzlQCypCTyqcHkcu2J3Qmv04DDP3odCH20qUYjQ/iTS
	kwXyL9wAxYAOKtbt689MAPkn7omIy0lc0PpDQJaXZgEyWtU8KXMEpVqisIDfCHRT
	bnq8uH65plRDMMdvgxhTBO752R41Uy/u53ibTzjTFWiJQAxUePstp8LhNa0vLEOa
	AbeGPbXj9HaHmT4/4Vm/khvxuTFXxbU9EUMvBR76FsXMDx9zvgfxxfbUUAd93t2U
	SsRWUWH/PFGqGXW7N15KN9AEjSCq4Ll8kmt8vWaOufuYjA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftfjn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Apr 2025 12:07:03 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6eeb5e86c5fso62668766d6.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Apr 2025 05:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744114022; x=1744718822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okr4ff8snDUBXMIQ3O2Kjam3gElpjdiFVfB7cr7ArbI=;
        b=qPwda9acYpZmg45Mw+vl1d9U+T2X99zNYvF01+BVjleXN7iuGwEEiMkGdsaT4mW6QI
         MqXZowBlzak53051uDmoWmUN1WP/6eh7Z+V7/EYBO5/Z1/5cJ1LG7PzE9uB7gCartze7
         Sda1rt36AB5pKGd8NVQ28DpI0M5XPTDLIespezf7js4S+kzpApVmcz5sBli/8dz89mUI
         4Ilfp6tEyshPNJqGUeX2YRhlAz8uy9MQw15lP54rN635Y9vBlGmdtwXV5QFjBjX0L5Rz
         Cd2Sjqym6bzCbyJFKCjckoorCGO0YEf7w24qJPUuzHj4EUpbeepEkAQI+CnxRNuM0WbX
         QCTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIwfM45NA2QTAicnAhwLgxeVc3KDB4QiTk5TMgc4dU49MJl0TTfJWXrtqeC1wXZHMRBbSBj89uL1BWQQ/B5HIJ2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbsETRYFeXmKITJ4EK7pLqz9N2ofuTKXRHRilw10wSaWxV/uKP
	d5GHi7rzUHOe9stInNLXjqv6UA+/ZvL9LoGjNIHBUefN7zWqkZjb3d+8mqalgNFBJVkl9aARwLK
	VXUX2ktUn1CJm0vmwhoR5OA33YLehbbN6+IgrDr2xs71UJKRvaNd1vnudFFY6TCtYwaAp3A==
X-Gm-Gg: ASbGncujuW8CI4+1174XH5s1y2y7yPN7WEFSBx+W8kAj051+OEoYGP8XzuidnK3lsXk
	mVzDFaj1EzeERlx1rLxPGz7MLqVoFCqr60+OvE7Pta9tWDKB+3DzKmrknjh7TmddPhg79OnDmwV
	nbVtR/roR4NncBKaOuRfpY7xw1zpglpO7DBIyTU8FFMz9Azq5BMm0sCSTU46WIAgHS6ZfBkV9wG
	madXkLI3cXnbqZ68sTe52+1Iqk35kQVttqOl5M7QD2oQ0LwxF/iK1VTSg3TGBXJXdWIlM5YY8/A
	D4xzW7G5maXhcLnQdYERiSuZ2gG+30kDQKckkWehWS9jc7L8T4WWQev5vO+W9suOk92Bc+WnBTz
	FRag=
X-Received: by 2002:a05:6214:2588:b0:6e6:5d61:4f01 with SMTP id 6a1803df08f44-6f0584a4650mr222250426d6.8.1744114022412;
        Tue, 08 Apr 2025 05:07:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9w2RBz2reqBHaAnbyBnIgRXepoq+7WOMXuECx/UyL5hge9Ble8kyyEI6oTqzp8dfXIATI6A==
X-Received: by 2002:a05:6214:2588:b0:6e6:5d61:4f01 with SMTP id 6a1803df08f44-6f0584a4650mr222250096d6.8.1744114022090;
        Tue, 08 Apr 2025 05:07:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e66377esm1493456e87.209.2025.04.08.05.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:07:00 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:06:57 +0300
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
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 06/34] drm/bridge: display-connector: convert to
 devm_drm_bridge_alloc() API
Message-ID: <o23cjtq5i6m5xwjj7ymknorjsv32e27anugbek42nao643kdct@6nghdmm746ij>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-6-42113ff8d9c0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-6-42113ff8d9c0@bootlin.com>
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f51167 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=IO8BAnyXGLrJ2ajCqTsA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: 7EjwUK6IqOiRRO1QC1QhoGQEmmz-S0fZ
X-Proofpoint-ORIG-GUID: 7EjwUK6IqOiRRO1QC1QhoGQEmmz-S0fZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=960
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080086

On Mon, Apr 07, 2025 at 04:23:21PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/display-connector.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

