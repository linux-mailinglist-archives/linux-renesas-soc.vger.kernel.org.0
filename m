Return-Path: <linux-renesas-soc+bounces-2726-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C368853E06
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 23:05:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F2021F21BCA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 22:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90686627EF;
	Tue, 13 Feb 2024 22:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Vn+ARP2H"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91580627E7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Feb 2024 22:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707861784; cv=none; b=ful3FPMM2cCBOSt/6FJuo7nPjM0PtiY7guM1CUfECi8Z9PrF8FQbm69ifJa8IcTuT7t39DFWl+P/jDa+84bR5lHiqr9+pUKqBreJEHaGFSsOZO2K+Q6Y0E3FCXS0p2kYOJGiuRHN8irPHA2XP4BiljGFx6NtgUGl/f0dPBzI47A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707861784; c=relaxed/simple;
	bh=4Cv/DKAqwiMA7u3CWshnEujZInnSy/3vqqV9OZtXUZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZToEbakG+8Jn+6/x2mjfSSMlhGtitmKG5qEdwWqFBJQn6054m6Aj2xiBnsh2tv6LMQVcDlrLJkBgutaVpVKyOG20/qMHe+yrIggsg0hMdK6Ax1ZDe7zg1CxVItKkoagl+bF0pee9MyEcqklQSCRWrqiEFvv7euqAQQff3Ip8Lgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Vn+ARP2H; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=QVjbmkicP3lKRzsUEP3UTuSHN1nf5jzXesx7Ut3oggE=; b=Vn+ARP
	2HJ1vJa25RDdk83FJ+sBNhL0XdCu0s8FlqER6BLSUkqR8pHNwYxxKD8pPB33M8YE
	Pds3/xRfold0LAcpDpz289HO7ei2aGrj5wCvuzNs4RnaYL1syPLPj5LYb8jAGRfz
	VAiQ+Cg9PSammZQvuj3EY2Vjp1qFkuqL8gyzaJ00/JNJdR6+3Z0uFTLrKwZTkjpB
	TqCD4+VCNpyQ+gaU9ZXNJ9zT33zR0g0ASbSt6w2Zf4agbiQkMxb4YOggXKJxhq1d
	JBxg5ihgDVC6aD5fsXQpuzzAnsB3cPVQNyC3jeBJkqTFLw4n1D3BqANfK7/fc874
	Q0pXfz/EK6kqBpNw==
Received: (qmail 1211814 invoked from network); 13 Feb 2024 23:02:53 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Feb 2024 23:02:53 +0100
X-UD-Smtp-Session: l3s3148p1@a5pQjkoR1t8ujnsZ
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	kernel test robot <lkp@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] mmc: tmio/sdhi: Fix includes
Date: Tue, 13 Feb 2024 23:02:22 +0100
Message-ID: <20240213220221.2380-11-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213220221.2380-8-wsa+renesas@sang-engineering.com>
References: <20240213220221.2380-8-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TMIO uses an of_* function, and SDHI uses pm_runtime functions. Add the
includes directly, so we can clean up another header properly. Sort the
pagemap include while we are here.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202402070323.JpYfFtkQ-lkp@intel.com/
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 3 ++-
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 3 ++-
 drivers/mmc/host/tmio_mmc_core.c              | 1 +
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 53d34c3eddce..24e1c17908d7 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -16,8 +16,9 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/platform_device.h>
 #include <linux/pagemap.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
 #include <linux/sys_soc.h>
 
diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index 9cf7f9feab72..c18581897f8a 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -16,8 +16,9 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/platform_device.h>
 #include <linux/pagemap.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
 #include <linux/sys_soc.h>
 
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index be7f18fd4836..c39141a5bd23 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -37,6 +37,7 @@
 #include <linux/mmc/mmc.h>
 #include <linux/mmc/slot-gpio.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/pagemap.h>
 #include <linux/platform_device.h>
 #include <linux/pm_qos.h>
-- 
2.43.0


