Return-Path: <linux-renesas-soc+bounces-20736-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1855EB2D0D2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 02:50:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB1B07B62B4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 00:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6CA31925BC;
	Wed, 20 Aug 2025 00:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M0G0lzwB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D031A18C91F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Aug 2025 00:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755651032; cv=none; b=oWfqM4w8Fvfs1UTyNxea51/yb14RkJYz4GAclIBtwjxr+AoXBTjsx6OCtCOf5xrZIjCyMCwvQBJ3T+thbNTJNpu73t+PLYNicEmAtuGtZyL9KaliCH4oW5HU94+DjZZ2fZ2dn6N9jGrkLRTV+fgCox0x7zEXNAuRLisoGyNtTlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755651032; c=relaxed/simple;
	bh=YIRpeSbZbQx4vA5wFVD+gkqsQApN85GMOE0/qPdsAM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OrUwGXAKTb+80GXjw7Pt2j1IyOkaXstBnQyavEBvHwjIv4v5MRMaxYGcGmsYQRE9QwkNwH5iEyvYigckU4SPkVw4wOHYQKzfPfpcoDGaA9DvuzEVX14FmGI+j6b29y51poeaD2wLJhXC+c04fTDhzR9q/eYXuPkmDXFptWx17n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M0G0lzwB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JL0xaK002979
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Aug 2025 00:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fFHU5Uj+jXoPoAM1BiBDUT8I
	hXi09SdGNJ1NomSthLE=; b=M0G0lzwBza41VuZ6YB1X0z5czf2rGCswbu0hfe1R
	nnq1jEIb87cSyTsnH4s8YEg6Td7mYwIGrN+KkXxAMTcmpceRz+IIfX65QJxluT4Z
	HnsR0h5Ebpoi3zg1yiLhdNXfMwOWQIqwuZ2rm8y96Cl1GlXh4zFyvgrxvD0VbXlD
	YMl39iKdWHMpBAHB+lO3dNnLHnoriq8seVJp03cVsT6/2WEcJ/9tsm3sETjzOid+
	F+zAOJr3yzJfB5aV2asOtw6XMANoIs1VbcUlszRDU1kooZOe8YvXnmuYFkZ72naN
	4a/kjdsfYe3eWKd5/zWByF8GT+qEhoPUt7XeVIyEQsWKaQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n0tj0dq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Aug 2025 00:50:28 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a9289baafso9443396d6.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 17:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755651028; x=1756255828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFHU5Uj+jXoPoAM1BiBDUT8IhXi09SdGNJ1NomSthLE=;
        b=uDFdaGypeGZ5WkzJp5KZqcMu4w/zS5Gu4XWTQyqtZfjfmcndONBCZU8zZpdKs01xQg
         wzloZ53kxtdFfnmWiqokUCoy/f7iCF/Ec0IGdyX3xsGOQxr/oFcVty6IWOIDKV23jZ7S
         6D1h9tNvlvCcKFE4buUIGgwRcjFyMdYdyQnxgpacykkEO3nkkuuPeoItDRyBwVbNMEYj
         s8SLB9PXHUWbu65ohSgWloCryIFHM9J+6JisdugJh+M6j252AgPi7A1eOFXzK18DKdma
         aXJMA4bc2qApLGFrTDMHjxYJhDE6I3hcaXOeAfara105/ghVYJQ0E2YMt6a10HepbF3n
         vtuw==
X-Forwarded-Encrypted: i=1; AJvYcCUiGCukJU6bqMdwUmo9Uz1yxgQPyLgTYFq1IBCRFnYFUigbHZNGSoqd76bNfCAOw//5X9GgIzhFh8YUP17GsxWiFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf2MPOmcc5r81GkUBd/KUupJX37ALiLnqipkH241t97z1q6gn0
	LztjxvEdivDg23tjfayP6cgGtiI9iMPPsSf3P8G3iaD+TvOveVnNoXIdhy7oOtzY18CvPa0TL+0
	O2SILsMWY4yuFj3m4a13KfqZJo/uWds3TNgLamKhfofrIa52jdoEhDd5mIafbGXftF9VfPAF6RQ
	==
X-Gm-Gg: ASbGncu6NMTLDBXYE3y3H5jZeu1UhE624PIObCSt5imSQXf8zS/on9s1x5/gRWvyUS+
	JJ6lP3DLGpwTmtaFv488f+nBDIPY6juXVxKAxNkSBQEdrN8AgFztTSQ6SqvTP2zAQJYZlVQGN/+
	Gsz8tXc9j/kKuAQhXPrLr+L9CnCHWidL6WGKItIVGWoNgL+U7/q6+k9VXjTQkwLg2so9wxOQTi8
	VFWY0vy3wUeGQll7PNkQjRiRw5tCB2P1kX1yS/h4E6IRIaTp88foxPPc7PcFOly3Uvy8YiSxqt+
	ZcRDraVmOmkp8Ri+t1i5hZ7ZPEpwxnL4H7dnmiJeZfVkWglNY1/d5siywWVvUn+dq+M8zowsDCm
	tw+6rHr3K3QCqBm4RBbZ5/PzfU/gkObjhkCuoenLhQ/MQlVmNaUbQ
X-Received: by 2002:a05:6214:2347:b0:707:6cf8:5963 with SMTP id 6a1803df08f44-70c6769d407mr51600306d6.9.1755651027805;
        Tue, 19 Aug 2025 17:50:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESN0BIvM6CuJAs/DUGKSJfPhZ/a+kgpIoYK/BoCUIvKjOBaanSEDI8cOaQ20OdYtUduS4y3A==
X-Received: by 2002:a05:6214:2347:b0:707:6cf8:5963 with SMTP id 6a1803df08f44-70c6769d407mr51600096d6.9.1755651027357;
        Tue, 19 Aug 2025 17:50:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35a187sm2325712e87.46.2025.08.19.17.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 17:50:26 -0700 (PDT)
Date: Wed, 20 Aug 2025 03:50:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Peng Fan <peng.fan@nxp.com>, linux-remoteproc@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v5] remoteproc: Use of_reserved_mem_region_* functions
 for "memory-region"
Message-ID: <6lbathmvpjxdvcnhtncxclcdro7nv6gjwkvznnpv5zrbh2lcde@qw3gjj5lp7ev>
References: <20250819213831.1368296-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819213831.1368296-1-robh@kernel.org>
X-Authority-Analysis: v=2.4 cv=B8LgEOtM c=1 sm=1 tr=0 ts=68a51bd4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=8b9GpE9nAAAA:8 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_lrZVZmJbgvpAXfrVDQA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: qQh-N52c3jyvdp9hpNOT0k_DRxQ1rI5P
X-Proofpoint-GUID: qQh-N52c3jyvdp9hpNOT0k_DRxQ1rI5P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NiBTYWx0ZWRfXxRASocSlZJA+
 Cp3iTAD7jKNmcaJ8NkW4V+TNOfxglhm6wzI7ytG1+sTwY3amPDQ4WAh/7+LO/V7uqujgASm+jAb
 XAvvgdVkoGmu6a+SXHuiHKXGZgasicV9+sK4SDl0nWUagJgo0QZMlSQfezMTgfHoAX7msSXxTO9
 YgVvqH12QD9suIyI6fA93wduK6o/rSpIlSltKbYb/yeqRIjtkYm9gWCni0v4ylw+xoHZN77u8eC
 zglcCGrMgQyRFv/OfPd9FvzZBeLsqDFZ9KL9gMwAx3PR0GzWO/dcbS7d4fvSfiyRa7FDC5ORAxN
 5tUa19nnXMM6p1/5xekXDcyGx+0X1dhFv5beRIOvy01geFI1RHhn2ry6bm5yipdI4XTwr3OiCNN
 B3qcdngp8GlbCB6QU9Xb3rzn2t0Pfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508190196

On Tue, Aug 19, 2025 at 04:38:27PM -0500, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() and
> of_reserved_mem_region_count() functions to handle "memory-region"
> properties.
> 
> The error handling is a bit different in some cases. Often
> "memory-region" is optional, so failed lookup is not an error. But then
> an error in of_reserved_mem_lookup() is treated as an error. However,
> that distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
> 
> Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Tested-by: Peng Fan <peng.fan@nxp.com> # i.MX93-11x11-EVK for imx_rproc.c
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # rcar
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v5:
>  - Drop some inadvertent whitespace changes in qcom_q6v5_pas.c and ti_k3.
>  - Fix error handling in adsp_alloc_memory_region()
>  - Drop unreachable returns after 'while (1)' loops
> 
> v4:
>  - Rebase on v6.17-rc1. qcom_q6v5_pas.c conflicted needing s/adsp/pas/
> 
> v3:
>  - Rebase on v6.16-rc1. Move TI K3 changes to new common file.
>  - Fix double increment of "i" in xlnx_r5
> 
> v2:
>  - Use strstarts instead of strcmp for resource names as they include
>    the unit-address.
>  - Drop the unit-address from resource name for imx and st drivers
> ---
>  drivers/remoteproc/imx_dsp_rproc.c      | 47 +++++++----------
>  drivers/remoteproc/imx_rproc.c          | 70 ++++++++++---------------
>  drivers/remoteproc/qcom_q6v5_adsp.c     | 24 ++++-----
>  drivers/remoteproc/qcom_q6v5_mss.c      | 60 +++++++--------------
>  drivers/remoteproc/qcom_q6v5_pas.c      | 69 +++++++++---------------
>  drivers/remoteproc/qcom_q6v5_wcss.c     | 25 ++++-----
>  drivers/remoteproc/qcom_wcnss.c         | 23 ++++----
>  drivers/remoteproc/rcar_rproc.c         | 38 +++++---------
>  drivers/remoteproc/st_remoteproc.c      | 41 +++++++--------
>  drivers/remoteproc/stm32_rproc.c        | 46 +++++++---------
>  drivers/remoteproc/ti_k3_common.c       | 28 ++++------
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 53 +++++++------------
>  12 files changed, 199 insertions(+), 325 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # msm


-- 
With best wishes
Dmitry

