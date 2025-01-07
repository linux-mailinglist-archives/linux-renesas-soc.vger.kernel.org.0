Return-Path: <linux-renesas-soc+bounces-11940-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AF6A04BF9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 22:59:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F75A16510B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 21:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074441F75B2;
	Tue,  7 Jan 2025 21:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MnC5FwoW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356661F76A1;
	Tue,  7 Jan 2025 21:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736287137; cv=none; b=bNNimdVtpHIENF+S8OikQ419T2rwSIDk2k0X3m0cjHah5QlYBPbZOwJ8hDWkaYT6GSzSndSGLD1VHXDCVtmM1EHxmWS795x3rXUJRs/t1F1evZSOsUkoP3wX2NqUyJ8221So53urouUSAWVLKM7DhdVs+KclovPMonHqoXOx64c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736287137; c=relaxed/simple;
	bh=hGKoYo1hMSU3vnxjeHtDLIttZVPdCcUU29uR8y7Cjks=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MzIL0pZrgrPhyzBPsVvUXxYLclIpWJimXQKScqQdfcRZECksExX3E5Keryoznis56dMyjl17eXPozc6lSJMIp6jGHKRXLrMUR7LMX+7lTCGHqZFCW3gp8kW58CTY7RuIgaMUQnF6zQ7HUUK5r/xVRZAQxpbHb7PZFP0283c3Exc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MnC5FwoW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507L6Vb2023921;
	Tue, 7 Jan 2025 21:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TkDs/QZYmrQXTi03Pp24vtUN6ObtSJC3R4LqjvM4UVo=; b=MnC5FwoWSdb11lTF
	pvwUK7Py1pCXKa4vKilouit4Z4Yb+q9D6p+lVICAQxICnuFsasf5LSwAQEH72dIs
	KxgnvLXM/XxdbfDhsif0bjTe4g71+OEsvbh4APVksCN0bJ1R/jj/xRpaOaIpMdsY
	TGCr8oo8API0FTN8C5tHlMyg6TYYdjEuNbDZkRlk6X4HfO1NNkNgHkazV9mGJjz6
	wx+c1rD2rgDnmvKadbBc6DTI1f0ZQb3Elxn1Y6vcUNSkm2EQRPl3JHBjQ/VIGktE
	ppfl+eLZIrV44cACE0Ydo1GheV0k9otsNuiO26aL3f7mwAPNTv2lWB962JwzLnyL
	QDGXJw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441bvq032x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 21:58:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 507LwFgB015822
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 21:58:15 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 Jan 2025
 13:58:13 -0800
Message-ID: <f1cfce9b-9ba7-4e5c-a6e9-4ec342e43984@quicinc.com>
Date: Tue, 7 Jan 2025 13:58:10 -0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: display: Correct indentation and style in
 DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Kevin
 Hilman" <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>,
        Andrzej Hajda
	<andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        "Jernej
 Skrabec" <jernej.skrabec@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        "Sascha
 Hauer" <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team
	<kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Inki Dae
	<inki.dae@samsung.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        "Marek
 Szyprowski" <m.szyprowski@samsung.com>,
        Chun-Kuang Hu
	<chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark
	<robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Sean
 Paul" <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Lucas Stach
	<l.stach@pengutronix.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>, Mahadevan <quic_mahap@quicinc.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi
	<jacopo+renesas@jmondi.org>,
        <dri-devel@lists.freedesktop.org>, <linux-amlogic@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
        <linux-mediatek@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>, <linux-renesas-soc@vger.kernel.org>
References: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: n4BaLuqw1NxzkmEUGioIAarR_4r2enMr
X-Proofpoint-GUID: n4BaLuqw1NxzkmEUGioIAarR_4r2enMr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxlogscore=980 mlxscore=0
 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501070180



On 1/7/2025 4:58 AM, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../display/amlogic,meson-dw-hdmi.yaml        |  8 +-
>   .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 28 +++---
>   .../display/bridge/samsung,mipi-dsim.yaml     | 66 ++++++-------
>   .../display/mediatek/mediatek,aal.yaml        | 46 ++++-----
>   .../display/msm/dsi-controller-main.yaml      | 98 +++++++++----------
>   .../bindings/display/msm/dsi-phy-10nm.yaml    | 40 ++++----
>   .../bindings/display/msm/dsi-phy-14nm.yaml    | 34 +++----
>   .../bindings/display/msm/dsi-phy-20nm.yaml    | 36 +++----
>   .../bindings/display/msm/dsi-phy-28nm.yaml    | 34 +++----
>   .../bindings/display/msm/dsi-phy-7nm.yaml     | 34 +++----
>   .../display/msm/qcom,sa8775p-mdss.yaml        |  7 +-
>   .../bindings/display/renesas,cmm.yaml         | 12 +--
>   12 files changed, 221 insertions(+), 222 deletions(-)
> 

For display/msm,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

