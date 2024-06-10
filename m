Return-Path: <linux-renesas-soc+bounces-6009-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9065F9023D7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 16:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 103741F23042
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 14:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F8F82889;
	Mon, 10 Jun 2024 14:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mVZRM2uD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8C623B0;
	Mon, 10 Jun 2024 14:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718029047; cv=none; b=UlwfqoOq5sVkOI92BOFakDcAbVuTmjTu4dHH0usySN2bg90xSOn8wwXT5V4/cRpsaGmaZtQDtN0cUDoFVypsTy6Ab7mfeTwlf2SkmJsp0p6WB5l5cgTZGMrCaq5bMEzipU3KA6zO4GxhpGoqN5+zgihDbwMmMnqB/GFQnr53iqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718029047; c=relaxed/simple;
	bh=0kBAWHKUioxPwsP0cOKMBLFQ/TodyuS7Yhv671eJmbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=udzW5EM3sRf1PzkQDIa0jebFk/77E4YRU8nCg3HS45G/wWBt5Mk6hWANI812KRlz3CtBVgxfgPX1qzZCY48ZvAx9EKpg1YU5X+R+DMviUm28zN6AhZSGtsYY2FLbGj8tMixKMgXxklDRi+M3LKux/PV3NxyePNr1Yj+9JQXunSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mVZRM2uD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45A007YT005752;
	Mon, 10 Jun 2024 14:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZvmT6xcxZ7fKHo6lcksZ8X
	lbUVuNwFgyUKsTa7jHC/U=; b=mVZRM2uDSD8lSk5zX1WldBu5dGoGRY21IPVKnl
	pOX1jLSdS8QwHWohu+K6x+D7AIZmE/iS56YAZqfLMQgRPLzW+1Gyqc5Hd6YSLp12
	tbrn62f1RVgnQGMpLeT+QDlE5sbehF6zudk6d3soypWzpbDBEhmovbMwRUjvSphC
	9sQu92NMyuDKvH8xVO3uvt7WQ0eZ7pFjwpFBjUKfG+cmBsXawlCOxjrmH4FOIUYi
	T4TztynDh+HimJcETz9bBUQFHYJS6QBTI4LJNybQI+lqP7EovX8Ag471a2SiIoA0
	7LsMJMNgCYOGPv/e1FLFOz7ltVkmDLCRuVK8EqLj24HV4vcw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymd0ec9ks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 14:17:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45AEHJOU002770
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 14:17:19 GMT
Received: from [169.254.0.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 07:17:18 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Mon, 10 Jun 2024 07:17:18 -0700
Subject: [PATCH] mmc: add missing MODULE_DESCRIPTION() macros
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240610-md-drivers-mmc-v1-1-c2a2593e4121@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAO0KZ2YC/x3MwQrCMAyA4VcZORvoWqfgq4iHps1cwFZJdAzG3
 t1ux+/w/ysYq7DBrVtBeRaTd23oTx2kKdYno+Rm8M6f3aV3WDJmlZnVsJSEiYbRXwMNFAK06KM
 8ynIM749misZIGmua9s1L6m/BEu3LCtv2B9XfSLB/AAAA
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang
	<wsa+renesas@sang-engineering.com>
CC: <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        "Jeff
 Johnson" <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sOEy7AWb7EoyhgcQfM4iRDmWO2-dc6nA
X-Proofpoint-ORIG-GUID: sOEy7AWb7EoyhgcQfM4iRDmWO2-dc6nA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 adultscore=0 spamscore=0 mlxscore=0 clxscore=1011 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406100108

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

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
Corrections to these descriptions are welcomed. I'm not an expert in
this code so in most cases I've taken these descriptions directly from
code comments, Kconfig descriptions, or git logs.  History has shown
that in some cases these are originally wrong due to cut-n-paste
errors, and in other cases the drivers have evolved such that the
original information is no longer accurate.
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
index 3b6d69cefb4e..fff30330574f 100644
--- a/drivers/mmc/core/pwrseq_emmc.c
+++ b/drivers/mmc/core/pwrseq_emmc.c
@@ -115,4 +115,5 @@ static struct platform_driver mmc_pwrseq_emmc_driver = {
 };
 
 module_platform_driver(mmc_pwrseq_emmc_driver);
+MODULE_DESCRIPTION("HW reset support for eMMC");
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
index df9588503ad0..97f6d69d9c80 100644
--- a/drivers/mmc/core/pwrseq_simple.c
+++ b/drivers/mmc/core/pwrseq_simple.c
@@ -159,4 +159,5 @@ static struct platform_driver mmc_pwrseq_simple_driver = {
 };
 
 module_platform_driver(mmc_pwrseq_simple_driver);
+MODULE_DESCRIPTION("Simple HW reset support for MMC");
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
index 12f4faaaf4ee..d62a4ed86775 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -1162,4 +1162,5 @@ void renesas_sdhi_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(renesas_sdhi_remove);
 
+MODULE_DESCRIPTION("Renesas SDHI driver");
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


