Return-Path: <linux-renesas-soc+bounces-20749-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D21B2D8E5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 11:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0484F4E28A0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 09:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E039B3043AB;
	Wed, 20 Aug 2025 09:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="8QJZqQQO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D973043C3;
	Wed, 20 Aug 2025 09:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755682771; cv=none; b=fVSWnpiG+qII76BAio49gfs4FK4rpxk1Jy7LgDJo8iwfLcbn3iqt3y8ISBccCCdUXBNowS2qy+tK9n5CXAO1mn/eSMUvBBaK1WjSvsE9ls8A1fhMdcVsXr+rSQPr+pLCcMcsmSXKRjxBDGyEJk0g8dbJkisYVFKJmnGGp7sd3ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755682771; c=relaxed/simple;
	bh=Q8VzJff+p3t2MJWeaZj59BHBV3s7fo9abjatn7Q+l70=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jHA8vgU5DiddPtY7kLL90lyvzn5ExZMHryggQO1X/rM4ts8lPTIUIeHeHHIu/ozk/KQ9ybdwpL/isEHPkuItTqC7V9nKY+x/XaAnDUzbscspNGppTCcyC2F95glxlKRXVFQjje9UWXN0Q5E81KGdXFEqaVaEgBiFTou5GE5t8BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=8QJZqQQO; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K9Y2ox000924;
	Wed, 20 Aug 2025 11:39:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	vlariyUg/2e3sM/3EKHYDRoybrUl8t7Wg/1mNFbV/AA=; b=8QJZqQQOdu73pxWF
	/8WRjLizsLGRCWdqzd6mc0DDZXQIQF9pNKeVdKEpnR3UBd8645bs3uAi/GOBIsL2
	GaABo7FcA1YQDNzmubKpKd2ZLrVG8i638heMKjcO0UdXkEN39LmKJSHUMDMyXrof
	w7Jy0gPxVBdero2AIz18ReBuzWE/IJ2BPKH77fRYftkM98jOjc00eTL9ps4eFZJA
	CZDy0+OVHszAdaV4l5nEOpkDESwzRoKXuCtqcLukr8dsTjqbhEZm19rUpU0by2Xc
	HHpqbY38qmmuB2lHlYISbw2mAHCfH9RGomTFOGXLCZfqlAfopJkV+N9sVWEOcBKC
	OsLtVQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48n6uj9dxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 11:39:02 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 45DDA40044;
	Wed, 20 Aug 2025 11:37:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 623115FE4CD;
	Wed, 20 Aug 2025 11:35:58 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 20 Aug
 2025 11:35:57 +0200
Message-ID: <72c32584-26a8-41bc-9eb6-1b5c0b25a6b2@foss.st.com>
Date: Wed, 20 Aug 2025 11:35:56 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] remoteproc: Use of_reserved_mem_region_* functions for
 "memory-region"
To: Daniel Baluta <daniel.baluta@gmail.com>,
        "Rob Herring (Arm)"
	<robh@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Shawn
 Guo" <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "Pengutronix Kernel Team" <kernel@pengutronix.de>,
        Fabio Estevam
	<festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus
 Damm <magnus.damm@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>,
        Peng Fan <peng.fan@nxp.com>, <linux-remoteproc@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Iuliana Prodan
	<iuliana.prodan@nxp.com>,
        Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>
References: <20250819213831.1368296-1-robh@kernel.org>
 <CAEnQRZDga2cX=YPY5Z9NDyro94bxFjK9k5Xm5Vt2vVzf4ysKyA@mail.gmail.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <CAEnQRZDga2cX=YPY5Z9NDyro94bxFjK9k5Xm5Vt2vVzf4ysKyA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01



On 8/20/25 10:21, Daniel Baluta wrote:
> Hi Rob,
> 
> This patch will break IMX RPROC support.
> <snip>
> 
>> --- a/drivers/remoteproc/imx_rproc.c
>> +++ b/drivers/remoteproc/imx_rproc.c
> 
> <snip>
>>  static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> <snip>
> 
>> -               priv->mem[b].cpu_addr = devm_ioremap_wc(&pdev->dev, res.start, resource_size(&res));
>> +               priv->mem[b].cpu_addr = devm_ioremap_resource_wc(&pdev->dev, &res);
> 
> devm_ioremap_resource_wc works only for IORESOURCE_MEM resources:
> 
> lib/devres.c:124
> static void __iomem *
> __devm_ioremap_resource(struct device *dev, const struct resource *res,
> 
> »       if (!res || resource_type(res) != IORESOURCE_MEM) {
> »       »       ret = dev_err_probe(dev, -EINVAL, "invalid resource
> %pR\n", res);
> »       »       return IOMEM_ERR_PTR(ret);
> »       }
> 
> while the devm_ioremap_wc doesn't care about this.
> 
Hi All,

> So we cannot use devm_ioremap_resource_wc here unless you add
> IORESOURCE_MEM flags
> to  of_reserved_mem_region_to_resource as discussed here:

Agree with Daniel, IORESOURCE_MEM flags should be set in of_reserved_mem_region_to_resource().

I got a similar issue since commit defe01abfb7f ("spi: stm32-ospi: Use of_reserved_mem_region_to_resource() for "memory-region")
resource flags is unset, which causing the following error:

[   11.455387] stm32-ospi 40430000.spi: error -EINVAL: invalid resource [??? 0x60000000-0x6fffffff flags 0x0]

Thanks
Patrice
> 
> https://lkml.org/lkml/2025/4/28/759
> 
> The same issue we are already experiencing with Sound Open Firmware
> where the change was already merged
> and we have a bug already reported.
> 
> How should we fix this:
> 
> 1) Add  res->flags = IORESOURCE_MEM; in  of_reserved_mem_region_to_resource
> 
> OR
> 
> 2) Use devm_ioremap_wc instead of devm_ioremap_resource_wc.
> 
> thanks,
> Daniel.
> 
> 
> 
> Daniel.

