Return-Path: <linux-renesas-soc+bounces-17585-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5A1AC64B1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 10:46:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 735951670D3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 08:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9424026A0EE;
	Wed, 28 May 2025 08:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NYX8fy24"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D86246796
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 08:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422012; cv=none; b=ExglQy111qJTH+P1n6to7FMIpvrx4lCuIo/fZ16eTlq/qweCSgvMzwHzCYtQkxEHqtAS8nHe00anherl6P5h0s51A1vYcIXHlRZVfZJNsjGqR9luHGnpgGa4ZgIUpafdAen0ANn6KmzRi0ts+yJce8p+D4aagvtkHAW4XpvpXaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422012; c=relaxed/simple;
	bh=Fi+QiGSJC8uF2K0X5kt8vPGp5bckmVAYGE46xxU1R40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZllrtDp/kLV6P7wcW+70kuJJENKyam1cBHwS8JQK7X9iINIp4AkRIbW2sQhbrlk1WaqQEqT4ILk7WTcCozHByEm1eTx3GKBbaC/+Wgz8rgLUsk1pKGelTm68J1FxtvESUrmtclib5MoO5RtFQAh8g6Da+Z1dRyPe9ilXfPxzqdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NYX8fy24; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S6uS7w001232
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 08:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DRzWkDK3ft+iwkKji/GjVMzB
	ocQDwCbSuP5DIc/EUys=; b=NYX8fy24OEESH86jLxZM9FLzbN+nsk41j6+K93rW
	ueBNg7KgmhdpslFMbhhc4lTXjuX2liHHDZxYeQ/+t5uz9RssxOwPIu4W9c2tZM+J
	CGtb5ziTFEhYj5WTXFiQn5KrflxgZV78v52nlevTu5N0Jjc4c+qYaCk8LOv+Tn+X
	X9OkFAJ3pBEtSkNYly3WQ2nZCCsEO0I5MNBO/kIJSpabr4MU67xuXpVyT/mgYo2N
	NHHOxlvQLJOx7rtO0uWJ3xj2jV7gU37aeb1yVu/1aXV7A4de+16hUocYKszCct8r
	MsQgCFogJEUBfWNdmeQitrcpH8XZeyPrbMesdFQBdkqzXA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g91mg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 08:46:49 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6faac45f582so41021426d6.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 01:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748422009; x=1749026809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRzWkDK3ft+iwkKji/GjVMzBocQDwCbSuP5DIc/EUys=;
        b=ama6fLB6ZwuNwAMyQzBfRwD6dcCcKmR4QOrcImCjUdIa4JNaaSKroT7vaIyl2Jwb39
         URIrgyQBueHh0cRsHP+AyRUYb4Py/PKGbHqfU5bO4HVADQNHq+TaWObs0HVw6lJ2bDKA
         VtfACXczgdvaGg1KbH/CNECJYlSzBLKB3AO5f2E50zKLKncr7zj9RNvUpw7+tBVnDV2V
         XTcRT+4efdy3uAlRoC4mC8CZfuVWOwoIyetKufmN6NBhW5ozECPGmm1lo6Ib2g+57dqE
         i6ozZk20PosqE32FMLn1KMw9jeB1aP18bgF7yVDIXgDdQRb5iJyw8WBaQdvKWkxYK6IY
         vwqw==
X-Forwarded-Encrypted: i=1; AJvYcCVp5QksPf5AhVyxke85U1BthlaPlUq6/GTngbl1R+kE/qosK9Cr/bJ6WoYvVLMGNrFKng5Is4X3CNSJ1o9aoVqeNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRA1eD1+IUtx9SWhX7QS9OzQWIT4dAEmJGVJ21bu+utLOX/N3f
	P2PWrhQ6iTyVJdz95EPAblOd5jJVfw7dVnSeEipmgiRVGc7zZX20yZXja4ummKKx3tCQK9Ee3HS
	GbPrtdo+NAaq+pAObH12CkJyB8mC03GeGrVdAKeQ6RvJsvDWJcN34sXnWjXdHTwwYBblr+taVLw
	==
X-Gm-Gg: ASbGncs+hCxeRUP8D73A/gXpP/NvP89ChToCZPoCJq4dqQZl51vlKohIL47AkHgo09q
	AJmi49Kw2o0ZmuNh6SOG2FYtPd8ogKljDPCZLEleHPYEJBRfcSMuKKYdhmsaZZKwGkE/acmbS4J
	AY8gx79TBetsKhcm3BYIwrQbn45OJ2ODC4JLW1sI4dg6tbKZAhGwpqZfrOn9fSDCEerLoEp2Vha
	/CPxO7Y/K8pXnYYFlN190tSJdwnzB+tPIyhbgWYUyE7Hr13Uj4+SpAB3zLDswMCUnwo1tuL/jcX
	ib1VCyw57uHLSZUYAN1ILkBsSSexBxrEN7PJJ5M02jN6QhYNQ2q1Ijw3CBXDSRQh9ww1WtCIplw
	=
X-Received: by 2002:ad4:5b81:0:b0:6f8:e367:8440 with SMTP id 6a1803df08f44-6fa9d0330admr302008806d6.23.1748422008970;
        Wed, 28 May 2025 01:46:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGo9qqoQrF01ykPGF/17EjYHoPs6gmbavsSE2zy6sawKd53Clq0hMx0BlOXLpAzfgtNG6M5ag==
X-Received: by 2002:ad4:5b81:0:b0:6f8:e367:8440 with SMTP id 6a1803df08f44-6fa9d0330admr302008336d6.23.1748422008535;
        Wed, 28 May 2025 01:46:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f6b3e3asm182752e87.234.2025.05.28.01.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 01:46:47 -0700 (PDT)
Date: Wed, 28 May 2025 11:46:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ai Chao <aichao@kylinos.cn>
Cc: perex@perex.cz, tiwai@suse.com, johannes@sipsolutions.net,
        kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
        broonie@kernel.org, jbrunet@baylibre.com, neil.armstrong@linaro.org,
        khilman@baylibre.com, martin.blumenstingl@googlemail.com,
        shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
        nicoleotsuka@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        srinivas.kandagatla@linaro.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
        kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 6/6] ASoC: qcom: Use helper function
 for_each_child_of_node_scoped()
Message-ID: <vjtgxpbpaowlz7ftryudf44f35jyaislvkckuzrzlpj25z25cf@vytjvui65gec>
References: <20250527082446.2265500-1-aichao@kylinos.cn>
 <20250527082446.2265500-7-aichao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527082446.2265500-7-aichao@kylinos.cn>
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=6836cd79 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=uJ6pKfArofpzZCl0i4YA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: uUNLe0Oh7VgA-9g880_RYhlwC5LqGH8D
X-Proofpoint-GUID: uUNLe0Oh7VgA-9g880_RYhlwC5LqGH8D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA3NSBTYWx0ZWRfX84pBqCnUFhem
 DztlSfaKE9Zw2YTcz4WK/F2RvSbxLRYQ0OYwMYBjL6nrf9cUZ0LAd/TFxhV6vmwgFXnjy0pcidc
 YBRI/wgftrGKV/T2w3K5exwjDIdLsJvX7801ZOUZ3/M+Y5XvQdoydNPPHwtI8aXSksx2OOTOGTf
 ms6nH3JrruKiExqQovSaLtl9fT4v3lZVvD2hGx5qwn99YrKllEKmGCIEH7UOLrDhYhu4+TdElvR
 CC4lXCWycjXf0mAo6iusmdh/81phsXDhKrc33QFdBFShE+r7nbHEhW8318Zb5HyPrFnkiXoYCCZ
 /DFq2FPcw2UQpFnQGfOtM3b4FlQMbUNfgu0cCFeq+Up9hD0N5hMmU2Ze00y50NuAtmcztjtw1dS
 qhCfL9YFlSS4MkLPJVI7evIm6T8Zq9JsaZ1TbdTqQ23Rasj3W7mwGRKyOyqq/WnX7OQ44gHT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_04,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=478
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280075

On Tue, May 27, 2025 at 04:24:46PM +0800, Ai Chao wrote:
> The for_each_child_of_node_scoped() helper provides a scope-based
> clean-up functionality to put the device_node automatically.

There are no calls to put the node. In the patched files the nodes are
already automatically put by the looping macro, there is nothing to
cleanup. Please stop sending this patch.

> 
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
>  sound/soc/qcom/lpass-cpu.c       | 3 +--
>  sound/soc/qcom/qdsp6/q6afe-dai.c | 3 +--
>  sound/soc/qcom/qdsp6/q6asm-dai.c | 4 +---
>  3 files changed, 3 insertions(+), 7 deletions(-)
> 

-- 
With best wishes
Dmitry

