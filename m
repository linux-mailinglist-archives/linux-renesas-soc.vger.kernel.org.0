Return-Path: <linux-renesas-soc+bounces-15410-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 576DDA7C4E4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Apr 2025 22:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE1D8189DB7B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Apr 2025 20:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B4320E6E0;
	Fri,  4 Apr 2025 20:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pJVvUSiH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD15721D5AF
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Apr 2025 20:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743798504; cv=none; b=MGBDeDRyYepDTNixfqPC3fUSEz1JgaAs726jSuPYG3JX1JI4UJi+n9KFKH1RKL8VzBDhpRMqM5h32rThmQalwjfE8SeTd6K6eIGm3z6W2AAdSeSt7anXp+2MNP7WME5ApaEfvjmicBexlJ5aQfI+oy95cLLUYhvl4EHGKq/o4sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743798504; c=relaxed/simple;
	bh=6VdnbYhGy3r5+8eECcpomK5pToziEFD72vAtfF1wNLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VTvYGeD3jjWY/iBFsOc0HbsHYL+Z4dt2gvs3B4aZPaWkuNbXsoDFOJCytjwUtVBW3oTHMVX7gFN2R8EP2iakKwwm2al2v/N8apNxswKBZSuGxmh77fkQSJy7FpilQEws9YKz7wod9xn/FGR+4nejWWt8vlBQqeMg5WJVk7k6DHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pJVvUSiH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534JEj6H030103
	for <linux-renesas-soc@vger.kernel.org>; Fri, 4 Apr 2025 20:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GHRYAy9VYazkChkIxg8YtCXwmpRsQX0Tl5KM+EPPgvU=; b=pJVvUSiHwqmvo86h
	Mqz4Q/WnqANpbfqZlCaDSPUWlkMubqtdXp/NaRc9naRXuxP0prRMEmBbAV49djOi
	UK+On9tkJ5vdP0DhZ1mRJXRhJXZ5vwWRG8XadPvXFA7XtnAQtQQrfaKi999ImzN9
	BbLTI7PMR2ayw1pjmyL2JNIMFBjOIa/UvqdlknD7EToePBBBl2wQv0qZI1bqeDL5
	xPLtEJAugYwpzUGlPHz+tngdqJ9Ss8wnwxuAxNHJOyJ4KtmGPSbkZ7v9QzqrdQkU
	2hdWTedgIQq3DFuV39YYB9DewaZ+Y+vxeInHLQfMyWokX4IGTGB57SrId8+LNDot
	T7f62Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d52xx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Apr 2025 20:28:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6eeb8a269a7so5739156d6.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Apr 2025 13:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743798495; x=1744403295;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GHRYAy9VYazkChkIxg8YtCXwmpRsQX0Tl5KM+EPPgvU=;
        b=ZDF/Rho728Yo5HRUJlXH2t3QE05asjesZP2d1rzM/ZJzPDxilU+vbNVA7lwjNGvoN4
         49qD0sVo7HBW0zPvrNKvLfJVHmtEwfoGwnQFUduaeqv5zF0YxktBH+oisl4g0ysiN/qK
         bKZHWukOZtGdv8S7m9UkmX7TPrNimh/fzUuXDc0WgvHqpBRjfqK9/TQmRvfOihylhOY3
         x1JJdxXh6VtS0VBVA6TGU5LP0iI6UjqEnU8OXQKLTg8QcsuZszFeoQ2ctC84oCFMZHDE
         y7mIPSeGxO5XQG9czjEOMwdfSftzTqtLJMH6cUxAl+bqjVL1f3cSBSjigeJ4Ad90CDBu
         wbaA==
X-Forwarded-Encrypted: i=1; AJvYcCX6xr1wvicLwR3kCuM2jweoGpl6XyitRDETnZ2kYjDphcgqOX/ghgHnLWFqZw8KQPPQfyRmwn1IRQwypUWlyIFQXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzebMqgqhe92KFUt4xHLAb0qppKzpWA+N0BtaOX59z7gbsFa4eA
	aBoVEW7ttBW9fiavViEdMWq09QPTiwTZdk5HHT9kiCUU8MmKVheF9DQHiOrXHHOUyc+Ehlap28o
	ehMlr7ytM24yaT74DYchtIkDFn08PXIStAFl8+C2+IW2iBBOHgfHUKsp4MUaFluZkgcL88A==
X-Gm-Gg: ASbGnctE2xsY0Ax59oaOhze0qOVStDIGrZlemeVVD4GbNx3PvQQvzTSA6JEISTagwXY
	hCqcZCO/RIVKA1mvf0Adt0slxnbDOET76U506+El1SqjJMdhg2rpRloaIBQ6do/sE3We5cQb/CW
	EYTmciIVsUNDTKbeoKVrUETD0GWFJtA2J4s+gzPtLIHSUuZA8Bw4Z53AAuZ9bZjtVuyIdb+7YT0
	D4ofcastD8wV5yInKtLxfIC3vFMwzXCQcX/QbzUlLfOp+KFFjCceYadDFXEhdbcrdjypbVLR0XZ
	vhrTa0bkDegIwBFzqzO6mIqi8wkdowPmaRDclVtzduPgcTR5iuUjd7N9w1QlHzY2K3sWIA==
X-Received: by 2002:ad4:4eee:0:b0:6e8:fbaf:fad8 with SMTP id 6a1803df08f44-6f00deb2207mr23904526d6.5.1743798495079;
        Fri, 04 Apr 2025 13:28:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoIVAXrUTfJsMNH3k0XqfcfQJdY+GOn1kP1o4noSEmw/2wsl4BJad6Is0Sd5MjPz2dbgObFw==
X-Received: by 2002:ad4:4eee:0:b0:6e8:fbaf:fad8 with SMTP id 6a1803df08f44-6f00deb2207mr23904146d6.5.1743798494647;
        Fri, 04 Apr 2025 13:28:14 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe5d420sm309414066b.2.2025.04.04.13.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 13:28:14 -0700 (PDT)
Message-ID: <69da0db9-8f32-476a-a8fb-ddb5e6e185e7@oss.qualcomm.com>
Date: Fri, 4 Apr 2025 22:28:08 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/19] arm64: dts: qcom: qdu1000: Fix qcom,freq-domain
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
        Conor Dooley <conor@kernel.org>,
        Nicolas Ferre
 <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-5-076be7171a85@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250403-dt-cpu-schema-v1-5-076be7171a85@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: w3O7_yh9uP_50b8bKjpmPLwKEgmLlGuW
X-Proofpoint-GUID: w3O7_yh9uP_50b8bKjpmPLwKEgmLlGuW
X-Authority-Analysis: v=2.4 cv=Cvu/cm4D c=1 sm=1 tr=0 ts=67f040df cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nTi4DTMcPcBUEvcNss0A:9 a=QEXdDO2ut3YA:10
 a=3T6Gmkx0uuYA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_09,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=926 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040139

On 4/4/25 4:59 AM, Rob Herring (Arm) wrote:
> The correct property name is 'qcom,freq-domain', not
> 'qcom,freq-domains'.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Thanks for spotting this!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

