Return-Path: <linux-renesas-soc+bounces-6077-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 849C1903E4B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 16:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8343E1C237AB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 14:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13261E4AF;
	Tue, 11 Jun 2024 14:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e86UUdKn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5431D52C;
	Tue, 11 Jun 2024 14:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718114502; cv=none; b=eQBRPtBwyzkGtaerpippdZ51EeL3mmr1glJgvuuS7ghZ2r4aeoK2noIp+eeiTcSiYl4esLDDWmhGiy0AxyiOHX8VnnNP//QZWv1t+vu8ETmytKblAWEl8t6Mp57PiBVW5J6mpFe0Z0JqQYCNhaDkOjguPrs6XsYGhf8OlAbMBPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718114502; c=relaxed/simple;
	bh=ZfXqe5DRStLJbbL+hA9tbL6IekOLbb51eB0k+L/00qA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lXlnNo36hTmDQBowoTJFrgzb+KBL8a640HtDROjfAQdtyqngKK0bMdvAoE8krrzsCRSLk5oVs2ugF4CDPdzDPhIzo1KlPdJOmsmhTtbSrln/Da7T8lyZ7q1FHdWFaHVAAzj4uucBPHqEDtdXRWHSS3vAB02QIwEDUQFbp+I14o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=e86UUdKn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B5B6Ki017540;
	Tue, 11 Jun 2024 14:01:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UI4ZVeDijMil2oU15QweqG+lgenlo/lXYwe5MUgORM0=; b=e86UUdKnR4WPbUoi
	n4hd07s5rfYxLjZxPXtVfxNRzvH8z8yfzoACLZChSK7HxKQAMgGw0wN51yPftVhK
	u1IETzTCY0P4quuc0gIroZxVaio69TGa02B0wzykkbWMmArfrFuIzAnEaMcQt6PM
	i2Dyn4tqb9WIXIGGrMqq8DQv94VC8knVeBmw/F7vGeNNmLx3N9CwYZyaSotXTB0X
	qV3Udz30drnhIOeXph0Dbe+eYvF3+MBn3p9eRfcwZpCHMY8+TxKSYJijokLYuaxp
	mjlJNRyS/GuVlVglm9en+qtUgpXmXiglB8e0wPMzewQ7QqjAwo3HaxC+6K9RL0n9
	mw2Skw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymg2epk82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 14:01:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45BE1OYr000587
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 14:01:24 GMT
Received: from [10.48.243.20] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Jun
 2024 07:01:24 -0700
Message-ID: <abef8935-3da2-4736-9ebc-1b5ad1c7e2a2@quicinc.com>
Date: Tue, 11 Jun 2024 07:01:23 -0700
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: add missing MODULE_DESCRIPTION() macros
Content-Language: en-US
To: Dragan Simic <dsimic@manjaro.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang
	<wsa+renesas@sang-engineering.com>,
        <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
References: <20240610-md-drivers-mmc-v1-1-c2a2593e4121@quicinc.com>
 <8f2e755bd711b566274119762b19505d@manjaro.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <8f2e755bd711b566274119762b19505d@manjaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 34JGQQK3mHppKrcAt8ATbXVOj5XiFZAm
X-Proofpoint-GUID: 34JGQQK3mHppKrcAt8ATbXVOj5XiFZAm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_07,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 clxscore=1011 adultscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110101

On 6/11/2024 12:29 AM, Dragan Simic wrote:
> Hello Jeff,
> 
> Thanks for the patch.  Please see a few comments below.
> 
> On 2024-06-10 16:17, Jeff Johnson wrote:
>> make allmodconfig && make W=1 C=1 reports:
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> drivers/mmc/host/of_mmc_spi.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in
>> drivers/mmc/host/tmio_mmc_core.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in
>> drivers/mmc/host/renesas_sdhi_core.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> drivers/mmc/core/mmc_core.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in
>> drivers/mmc/core/pwrseq_simple.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in
>> drivers/mmc/core/pwrseq_sd8787.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> drivers/mmc/core/pwrseq_emmc.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> drivers/mmc/core/sdio_uart.o
>>
>> Add the missing invocations of the MODULE_DESCRIPTION() macro.
>>
>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>> ---
>> Corrections to these descriptions are welcomed. I'm not an expert in
>> this code so in most cases I've taken these descriptions directly from
>> code comments, Kconfig descriptions, or git logs.  History has shown
>> that in some cases these are originally wrong due to cut-n-paste
>> errors, and in other cases the drivers have evolved such that the
>> original information is no longer accurate.
>> ---
>>  drivers/mmc/core/core.c              | 1 +
>>  drivers/mmc/core/pwrseq_emmc.c       | 1 +
>>  drivers/mmc/core/pwrseq_sd8787.c     | 1 +
>>  drivers/mmc/core/pwrseq_simple.c     | 1 +
>>  drivers/mmc/core/sdio_uart.c         | 1 +
>>  drivers/mmc/host/of_mmc_spi.c        | 1 +
>>  drivers/mmc/host/renesas_sdhi_core.c | 1 +
>>  drivers/mmc/host/tmio_mmc_core.c     | 1 +
>>  8 files changed, 8 insertions(+)
>>
>> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
>> index a8c17b4cd737..d6c819dd68ed 100644
>> --- a/drivers/mmc/core/core.c
>> +++ b/drivers/mmc/core/core.c
>> @@ -2362,4 +2362,5 @@ static void __exit mmc_exit(void)
>>  subsys_initcall(mmc_init);
>>  module_exit(mmc_exit);
>>
>> +MODULE_DESCRIPTION("MMC core driver");
>>  MODULE_LICENSE("GPL");
>> diff --git a/drivers/mmc/core/pwrseq_emmc.c 
>> b/drivers/mmc/core/pwrseq_emmc.c
>> index 3b6d69cefb4e..fff30330574f 100644
>> --- a/drivers/mmc/core/pwrseq_emmc.c
>> +++ b/drivers/mmc/core/pwrseq_emmc.c
>> @@ -115,4 +115,5 @@ static struct platform_driver 
>> mmc_pwrseq_emmc_driver = {
>>  };
>>
>>  module_platform_driver(mmc_pwrseq_emmc_driver);
>> +MODULE_DESCRIPTION("HW reset support for eMMC");
> 
> "Hardware reset support for eMMC" would read a bit better.
> 
>>  MODULE_LICENSE("GPL v2");
>> diff --git a/drivers/mmc/core/pwrseq_sd8787.c 
>> b/drivers/mmc/core/pwrseq_sd8787.c
>> index 0c5808fc3206..f24bbd68e251 100644
>> --- a/drivers/mmc/core/pwrseq_sd8787.c
>> +++ b/drivers/mmc/core/pwrseq_sd8787.c
>> @@ -130,4 +130,5 @@ static struct platform_driver 
>> mmc_pwrseq_sd8787_driver = {
>>  };
>>
>>  module_platform_driver(mmc_pwrseq_sd8787_driver);
>> +MODULE_DESCRIPTION("Power sequence support for Marvell SD8787 BT + 
>> Wifi chip");
>>  MODULE_LICENSE("GPL v2");
>> diff --git a/drivers/mmc/core/pwrseq_simple.c 
>> b/drivers/mmc/core/pwrseq_simple.c
>> index df9588503ad0..97f6d69d9c80 100644
>> --- a/drivers/mmc/core/pwrseq_simple.c
>> +++ b/drivers/mmc/core/pwrseq_simple.c
>> @@ -159,4 +159,5 @@ static struct platform_driver 
>> mmc_pwrseq_simple_driver = {
>>  };
>>
>>  module_platform_driver(mmc_pwrseq_simple_driver);
>> +MODULE_DESCRIPTION("Simple HW reset support for MMC");
> 
> "Simple power sequence management for MMC" would be more accurate.
> 
>>  MODULE_LICENSE("GPL v2");
>> diff --git a/drivers/mmc/core/sdio_uart.c 
>> b/drivers/mmc/core/sdio_uart.c
>> index 575ebbce378e..6b7471dba3bf 100644
>> --- a/drivers/mmc/core/sdio_uart.c
>> +++ b/drivers/mmc/core/sdio_uart.c
>> @@ -1162,4 +1162,5 @@ module_init(sdio_uart_init);
>>  module_exit(sdio_uart_exit);
>>
>>  MODULE_AUTHOR("Nicolas Pitre");
>> +MODULE_DESCRIPTION("SDIO UART/GPS driver");
>>  MODULE_LICENSE("GPL");
>> diff --git a/drivers/mmc/host/of_mmc_spi.c 
>> b/drivers/mmc/host/of_mmc_spi.c
>> index bf54776fb26c..05939f30a5ae 100644
>> --- a/drivers/mmc/host/of_mmc_spi.c
>> +++ b/drivers/mmc/host/of_mmc_spi.c
>> @@ -19,6 +19,7 @@
>>  #include <linux/mmc/core.h>
>>  #include <linux/mmc/host.h>
>>
>> +MODULE_DESCRIPTION("OpenFirmware bindings for the MMC-over-SPI 
>> driver");
>>  MODULE_LICENSE("GPL");
>>
>>  struct of_mmc_spi {
>> diff --git a/drivers/mmc/host/renesas_sdhi_core.c
>> b/drivers/mmc/host/renesas_sdhi_core.c
>> index 12f4faaaf4ee..d62a4ed86775 100644
>> --- a/drivers/mmc/host/renesas_sdhi_core.c
>> +++ b/drivers/mmc/host/renesas_sdhi_core.c
>> @@ -1162,4 +1162,5 @@ void renesas_sdhi_remove(struct platform_device 
>> *pdev)
>>  }
>>  EXPORT_SYMBOL_GPL(renesas_sdhi_remove);
>>
>> +MODULE_DESCRIPTION("Renesas SDHI driver");
> 
> "Renesas SDHI core driver" would be a bit more accurate.
> 
>>  MODULE_LICENSE("GPL v2");
>> diff --git a/drivers/mmc/host/tmio_mmc_core.c 
>> b/drivers/mmc/host/tmio_mmc_core.c
>> index 93e912afd3ae..c1a4ade5f949 100644
>> --- a/drivers/mmc/host/tmio_mmc_core.c
>> +++ b/drivers/mmc/host/tmio_mmc_core.c
>> @@ -1319,4 +1319,5 @@ int tmio_mmc_host_runtime_resume(struct device 
>> *dev)
>>  EXPORT_SYMBOL_GPL(tmio_mmc_host_runtime_resume);
>>  #endif
>>
>> +MODULE_DESCRIPTION("TMIO MMC core driver");
>>  MODULE_LICENSE("GPL v2");
>>
>> ---
>> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
>> change-id: 20240610-md-drivers-mmc-cb5f273b5b33

Thank you for your clarifications. I'll incorporate them in the next version.

/jeff

