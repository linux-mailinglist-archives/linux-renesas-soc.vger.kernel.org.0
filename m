Return-Path: <linux-renesas-soc+bounces-6081-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A92904076
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 17:51:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF5C51F21A99
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 15:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39AD381BE;
	Tue, 11 Jun 2024 15:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AF1uQOZb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF8639FD0;
	Tue, 11 Jun 2024 15:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718121056; cv=none; b=WMB/T0li0S3gxoruEwJxoSzsz/b3OIXxkP0YO0n4FvIiXN2YLY4u0Nfk+9XNydzlcqotrSuvlzQfBhbq4QOSHZGsXEc+NI2vuHaJlMJ/rDB9htJkWECbTHky5C5ld9CgmmGYq4P0XfWQ1E1PWrgscLlvuR45XCj7yhuUc1CGfy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718121056; c=relaxed/simple;
	bh=1hf7ILlsiKQrDB+6cO7qJ6f7m3CK1Em736xJQzqhS3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=aZ/YUI+Ln6hRfutQyMV3rK7g+ApUWUT1GxOdPerAn0DE+SHF1/m3d5SSywjQ6M+MIueK2TzY+S0kHqsaoZmTW2R9O0e+0Hh/dVy7ZL1QbISAkU4xP3v/56rA7wG1x0KsgWExb677OPlEw6QnvaUCGzVydP1ASfK2iQWiyaTUvkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AF1uQOZb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BFbApP002948;
	Tue, 11 Jun 2024 15:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yV/a4qNig3OAx1+D+1Wlzr
	MVEo0DI1QpqlIbu495V38=; b=AF1uQOZbURXHj4QCpqAEX9At4oyjaqyD27bjXS
	c7iGkRljdV60BnH9vzbRESJIMQALGlU9v92O8k4wUy+oJaerY/WaceZgV5KhqD6J
	PpqF8E/INNMJ+5DqmqP+VRPGZjhGS7UFmdZT8fFfiPPUnRtqTW/6UPyi6GVKrS+x
	0EEjZJMJ096nY3nukpMYFxorFAz0e9D8kL61z9Yl80gajCfKEyXVe+Ucb5EQ4V1J
	cPCF23IKT3ccor5OV5SIrYjGvOqQy4Ljlo/N3YdbnvxhDoE4j+CPkHKYTBA+fVEE
	mpMc8OMDk+hHtqsPUdFXJAoZWbP4lTLgWUMP1TX1GD3dhKig==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymg2epukd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 15:50:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45BFojjW017211
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 15:50:45 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Jun
 2024 08:50:45 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Tue, 11 Jun 2024 08:50:42 -0700
Subject: [PATCH v2] mmc: add missing MODULE_DESCRIPTION() macros
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240611-md-drivers-mmc-v2-1-2ef2cbcdc061@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAFJyaGYC/3WNQQ6CMBBFr2K6dgxtQaMr72FYtMMgk9iiUyAYw
 t0t7F2+5P/3FpVImJK6HRYlNHHiPmYwx4PCzsUnATeZlSlMWZx1AaGBRngiSRACAvqqNRfrK2+
 tyqe3UMvzLnzUmb1LBF5cxG7TvDiOMwSXBpJt3nEaevnu+Ulvp7+lSYMGNM5UV0ulNvr+GRk54
 gn7oOp1XX9iSdffzQAAAA==
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang
	<wsa+renesas@sang-engineering.com>,
        Dragan Simic <dsimic@manjaro.org>
CC: <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        "Jeff
 Johnson" <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: x8Ivgua2V_wEJh0-M6ybsghDNGaC98wl
X-Proofpoint-GUID: x8Ivgua2V_wEJh0-M6ybsghDNGaC98wl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_09,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110114

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/host/of_mmc_spi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/host/tmio_mmc_core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/host/renesas_sdhi_core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/mmc_core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/pwrseq_simple.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/pwrseq_sd8787.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/pwrseq_emmc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/sdio_uart.o

Add the missing invocations of the MODULE_DESCRIPTION() macro.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # for TMIO and SDHI
Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
Corrections to these descriptions are welcomed. I'm not an expert in
this code so in most cases I've taken these descriptions directly from
code comments, Kconfig descriptions, or git logs.  History has shown
that in some cases these are originally wrong due to cut-n-paste
errors, and in other cases the drivers have evolved such that the
original information is no longer accurate.
---
Changes in v2:
- Updated descriptions in core/pwrseq_emmc.c, core/pwrseq_simple.c, and
  host/renesas_sdhi_core.c per guidance from Dragan.
- Link to v1: https://lore.kernel.org/r/20240610-md-drivers-mmc-v1-1-c2a2593e4121@quicinc.com
---
 drivers/mmc/core/core.c              | 1 +
 drivers/mmc/core/pwrseq_emmc.c       | 1 +
 drivers/mmc/core/pwrseq_sd8787.c     | 1 +
 drivers/mmc/core/pwrseq_simple.c     | 1 +
 drivers/mmc/core/sdio_uart.c         | 1 +
 drivers/mmc/host/of_mmc_spi.c        | 1 +
 drivers/mmc/host/renesas_sdhi_core.c | 1 +
 drivers/mmc/host/tmio_mmc_core.c     | 1 +
 8 files changed, 8 insertions(+)

diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index a8c17b4cd737..d6c819dd68ed 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -2362,4 +2362,5 @@ static void __exit mmc_exit(void)
 subsys_initcall(mmc_init);
 module_exit(mmc_exit);
 
+MODULE_DESCRIPTION("MMC core driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/mmc/core/pwrseq_emmc.c b/drivers/mmc/core/pwrseq_emmc.c
index 3b6d69cefb4e..96fa4c508900 100644
--- a/drivers/mmc/core/pwrseq_emmc.c
+++ b/drivers/mmc/core/pwrseq_emmc.c
@@ -115,4 +115,5 @@ static struct platform_driver mmc_pwrseq_emmc_driver = {
 };
 
 module_platform_driver(mmc_pwrseq_emmc_driver);
+MODULE_DESCRIPTION("Hardware reset support for eMMC");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/mmc/core/pwrseq_sd8787.c b/drivers/mmc/core/pwrseq_sd8787.c
index 0c5808fc3206..f24bbd68e251 100644
--- a/drivers/mmc/core/pwrseq_sd8787.c
+++ b/drivers/mmc/core/pwrseq_sd8787.c
@@ -130,4 +130,5 @@ static struct platform_driver mmc_pwrseq_sd8787_driver = {
 };
 
 module_platform_driver(mmc_pwrseq_sd8787_driver);
+MODULE_DESCRIPTION("Power sequence support for Marvell SD8787 BT + Wifi chip");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/mmc/core/pwrseq_simple.c b/drivers/mmc/core/pwrseq_simple.c
index df9588503ad0..154a8921ae75 100644
--- a/drivers/mmc/core/pwrseq_simple.c
+++ b/drivers/mmc/core/pwrseq_simple.c
@@ -159,4 +159,5 @@ static struct platform_driver mmc_pwrseq_simple_driver = {
 };
 
 module_platform_driver(mmc_pwrseq_simple_driver);
+MODULE_DESCRIPTION("Simple power sequence management for MMC");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/mmc/core/sdio_uart.c b/drivers/mmc/core/sdio_uart.c
index 575ebbce378e..6b7471dba3bf 100644
--- a/drivers/mmc/core/sdio_uart.c
+++ b/drivers/mmc/core/sdio_uart.c
@@ -1162,4 +1162,5 @@ module_init(sdio_uart_init);
 module_exit(sdio_uart_exit);
 
 MODULE_AUTHOR("Nicolas Pitre");
+MODULE_DESCRIPTION("SDIO UART/GPS driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/mmc/host/of_mmc_spi.c b/drivers/mmc/host/of_mmc_spi.c
index bf54776fb26c..05939f30a5ae 100644
--- a/drivers/mmc/host/of_mmc_spi.c
+++ b/drivers/mmc/host/of_mmc_spi.c
@@ -19,6 +19,7 @@
 #include <linux/mmc/core.h>
 #include <linux/mmc/host.h>
 
+MODULE_DESCRIPTION("OpenFirmware bindings for the MMC-over-SPI driver");
 MODULE_LICENSE("GPL");
 
 struct of_mmc_spi {
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 12f4faaaf4ee..58536626e6c5 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -1162,4 +1162,5 @@ void renesas_sdhi_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(renesas_sdhi_remove);
 
+MODULE_DESCRIPTION("Renesas SDHI core driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 93e912afd3ae..c1a4ade5f949 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1319,4 +1319,5 @@ int tmio_mmc_host_runtime_resume(struct device *dev)
 EXPORT_SYMBOL_GPL(tmio_mmc_host_runtime_resume);
 #endif
 
+MODULE_DESCRIPTION("TMIO MMC core driver");
 MODULE_LICENSE("GPL v2");

---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240610-md-drivers-mmc-cb5f273b5b33


