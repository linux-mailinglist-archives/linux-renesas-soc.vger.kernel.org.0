Return-Path: <linux-renesas-soc+bounces-30669-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HeqGFnFzGnxWgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30669-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 09:12:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F34343759EB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 09:12:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E051B3029A6F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2026 07:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBAD262A6;
	Wed,  1 Apr 2026 07:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Y6oWJDPh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DA528002B
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Apr 2026 07:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775027510; cv=none; b=slB0YD1uO80d5JfSEXY3jWO+Cyd9cdJhkRsJrcdjMg49FpUY4y0jIFK9O/UUYGwRax9OSXnlnKs1g73WDcV9t+yykeitwr756Zu10fqQUoHy+9V9pQm1I6b/oOJiiHUlVrN4gx1KNI4s7+WiFO81mScXuacI5zs0blufaL7JTck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775027510; c=relaxed/simple;
	bh=VTdm4OkN52SgGgzF9iThszuAdEwOxXkz1Y8OIXMB/ZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VO3UTY1V4bomBFNYkvWxDeERM6zViGjk+N3NnMukSXyc+W6x4BbfDfVGVY4RfBgIvk6pPXsaSAr7ik1IVRNgpPga54E6JtXz7U+mPls+547cTT5Cr/46zxWyCGaajK8xjal64l6mhAYljKy1KEdMWy+f8G1fdmPQMccTGM8e9p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Y6oWJDPh; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=0zcBsm8z4cMHDPon/rz6xzH1cvFqqtoHNP+rhk3J0VU=; b=Y6oWJD
	Phsy8eUKEmtIcLpXW+mTNxHPHR5y2v5jEniG/iLqTvL6AOXtjuLt4oTF7UUXvR6/
	KUOOovhU4ZJmQTu1KbRvR6X0nzNFW0zRgTJ3459rqcjCMrLnYiB9wAOPNKtJCzcc
	OGaAd80jO5C8LvADh4sDu5bYtscGcyxmyt7xPvMekFneMu1lgrek7EJY4DcP7NMH
	JnW4Hq/HZuZB7C7yajRpzDcrq9B56W11eM8rPz2s9Ntk0HPdg/9rlhYPa9ASKewT
	jOlN29YGiYgSDG9y+/TxB/P8NKVgOCjFmaaH8VRH0agh4GvyRaizsRcZNC0iTIVC
	Hpc5Wa9031oXoL6A==
Received: (qmail 1986510 invoked from network); 1 Apr 2026 09:11:44 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Apr 2026 09:11:44 +0200
X-UD-Smtp-Session: l3s3148p1@31Ley2BOUNEujnuR
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH 1/2] hwspinlock: u8500: delete driver
Date: Wed,  1 Apr 2026 09:11:39 +0200
Message-ID: <20260401071141.4718-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260401071141.4718-1-wsa+renesas@sang-engineering.com>
References: <20260401071141.4718-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30669-lists,linux-renesas-soc=lfdr.de,renesas];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,linaro.org:email]
X-Rspamd-Queue-Id: F34343759EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The U8500 platform was converted to DT around 2013 and is DT only
meanwhile. This driver has never been converted to a DT driver, so it
clearly hasn't been used since then. To ease upcoming refactoring in the
hwspinlock subsystem, remove this obsolete driver.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 MAINTAINERS                      |   1 -
 arch/arm/configs/u8500_defconfig |   1 -
 drivers/hwspinlock/Kconfig       |  10 --
 drivers/hwspinlock/Makefile      |   1 -
 drivers/hwspinlock/u8500_hsem.c  | 155 -------------------------------
 5 files changed, 168 deletions(-)
 delete mode 100644 drivers/hwspinlock/u8500_hsem.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c3fe46d7c4bc..7dc65fd62b6b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3155,7 +3155,6 @@ F:	drivers/clocksource/clksrc-dbx500-prcmu.c
 F:	drivers/dma/ste_dma40*
 F:	drivers/pmdomain/st/ste-ux500-pm-domain.c
 F:	drivers/gpio/gpio-nomadik.c
-F:	drivers/hwspinlock/u8500_hsem.c
 F:	drivers/i2c/busses/i2c-nomadik.c
 F:	drivers/iio/adc/ab8500-gpadc.c
 F:	drivers/mfd/ab8500*
diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index e88533b78327..ba6ddaf82344 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -148,7 +148,6 @@ CONFIG_RTC_DRV_PL031=y
 CONFIG_DMADEVICES=y
 CONFIG_STE_DMA40=y
 CONFIG_HWSPINLOCK=y
-CONFIG_HSEM_U8500=y
 CONFIG_EXTCON_FSA9480=y
 CONFIG_IIO=y
 CONFIG_IIO_SW_TRIGGER=y
diff --git a/drivers/hwspinlock/Kconfig b/drivers/hwspinlock/Kconfig
index 3874d15b0e9b..d84e00084ee2 100644
--- a/drivers/hwspinlock/Kconfig
+++ b/drivers/hwspinlock/Kconfig
@@ -53,14 +53,4 @@ config HWSPINLOCK_SUN6I
 
 	  If unsure, say N.
 
-config HSEM_U8500
-	tristate "STE Hardware Semaphore functionality"
-	depends on ARCH_U8500 || COMPILE_TEST
-	help
-	  Say y here to support the STE Hardware Semaphore functionality, which
-	  provides a synchronisation mechanism for the various processor on the
-	  SoC.
-
-	  If unsure, say N.
-
 endif # HWSPINLOCK
diff --git a/drivers/hwspinlock/Makefile b/drivers/hwspinlock/Makefile
index a0f16c9aaa82..3a740805949d 100644
--- a/drivers/hwspinlock/Makefile
+++ b/drivers/hwspinlock/Makefile
@@ -9,4 +9,3 @@ obj-$(CONFIG_HWSPINLOCK_QCOM)		+= qcom_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_SPRD)		+= sprd_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_STM32)		+= stm32_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_SUN6I)		+= sun6i_hwspinlock.o
-obj-$(CONFIG_HSEM_U8500)		+= u8500_hsem.o
diff --git a/drivers/hwspinlock/u8500_hsem.c b/drivers/hwspinlock/u8500_hsem.c
deleted file mode 100644
index 5a2d8c3e0d80..000000000000
--- a/drivers/hwspinlock/u8500_hsem.c
+++ /dev/null
@@ -1,155 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * u8500 HWSEM driver
- *
- * Copyright (C) 2010-2011 ST-Ericsson
- *
- * Implements u8500 semaphore handling for protocol 1, no interrupts.
- *
- * Author: Mathieu Poirier <mathieu.poirier@linaro.org>
- * Heavily borrowed from the work of :
- *   Simon Que <sque@ti.com>
- *   Hari Kanigeri <h-kanigeri2@ti.com>
- *   Ohad Ben-Cohen <ohad@wizery.com>
- */
-
-#include <linux/module.h>
-#include <linux/delay.h>
-#include <linux/io.h>
-#include <linux/slab.h>
-#include <linux/spinlock.h>
-#include <linux/hwspinlock.h>
-#include <linux/platform_device.h>
-
-#include "hwspinlock_internal.h"
-
-/*
- * Implementation of STE's HSem protocol 1 without interrutps.
- * The only masterID we allow is '0x01' to force people to use
- * HSems for synchronisation between processors rather than processes
- * on the ARM core.
- */
-
-#define U8500_MAX_SEMAPHORE		32	/* a total of 32 semaphore */
-#define RESET_SEMAPHORE			(0)	/* free */
-
-/*
- * CPU ID for master running u8500 kernel.
- * Hswpinlocks should only be used to synchonise operations
- * between the Cortex A9 core and the other CPUs.  Hence
- * forcing the masterID to a preset value.
- */
-#define HSEM_MASTER_ID			0x01
-
-#define HSEM_REGISTER_OFFSET		0x08
-
-#define HSEM_CTRL_REG			0x00
-#define HSEM_ICRALL			0x90
-#define HSEM_PROTOCOL_1			0x01
-
-static int u8500_hsem_trylock(struct hwspinlock *lock)
-{
-	void __iomem *lock_addr = lock->priv;
-
-	writel(HSEM_MASTER_ID, lock_addr);
-
-	/* get only first 4 bit and compare to masterID.
-	 * if equal, we have the semaphore, otherwise
-	 * someone else has it.
-	 */
-	return (HSEM_MASTER_ID == (0x0F & readl(lock_addr)));
-}
-
-static void u8500_hsem_unlock(struct hwspinlock *lock)
-{
-	void __iomem *lock_addr = lock->priv;
-
-	/* release the lock by writing 0 to it */
-	writel(RESET_SEMAPHORE, lock_addr);
-}
-
-/*
- * u8500: what value is recommended here ?
- */
-static void u8500_hsem_relax(struct hwspinlock *lock)
-{
-	ndelay(50);
-}
-
-static const struct hwspinlock_ops u8500_hwspinlock_ops = {
-	.trylock	= u8500_hsem_trylock,
-	.unlock		= u8500_hsem_unlock,
-	.relax		= u8500_hsem_relax,
-};
-
-static int u8500_hsem_probe(struct platform_device *pdev)
-{
-	struct hwspinlock_pdata *pdata = pdev->dev.platform_data;
-	struct hwspinlock_device *bank;
-	struct hwspinlock *hwlock;
-	void __iomem *io_base;
-	int i, num_locks = U8500_MAX_SEMAPHORE;
-	ulong val;
-
-	if (!pdata)
-		return -ENODEV;
-
-	io_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(io_base))
-		return PTR_ERR(io_base);
-
-	/* make sure protocol 1 is selected */
-	val = readl(io_base + HSEM_CTRL_REG);
-	writel((val & ~HSEM_PROTOCOL_1), io_base + HSEM_CTRL_REG);
-
-	/* clear all interrupts */
-	writel(0xFFFF, io_base + HSEM_ICRALL);
-
-	bank = devm_kzalloc(&pdev->dev, struct_size(bank, lock, num_locks),
-			    GFP_KERNEL);
-	if (!bank)
-		return -ENOMEM;
-
-	platform_set_drvdata(pdev, bank);
-
-	for (i = 0, hwlock = &bank->lock[0]; i < num_locks; i++, hwlock++)
-		hwlock->priv = io_base + HSEM_REGISTER_OFFSET + sizeof(u32) * i;
-
-	return devm_hwspin_lock_register(&pdev->dev, bank,
-					 &u8500_hwspinlock_ops,
-					 pdata->base_id, num_locks);
-}
-
-static void u8500_hsem_remove(struct platform_device *pdev)
-{
-	struct hwspinlock_device *bank = platform_get_drvdata(pdev);
-	void __iomem *io_base = bank->lock[0].priv - HSEM_REGISTER_OFFSET;
-
-	/* clear all interrupts */
-	writel(0xFFFF, io_base + HSEM_ICRALL);
-}
-
-static struct platform_driver u8500_hsem_driver = {
-	.probe		= u8500_hsem_probe,
-	.remove		= u8500_hsem_remove,
-	.driver		= {
-		.name	= "u8500_hsem",
-	},
-};
-
-static int __init u8500_hsem_init(void)
-{
-	return platform_driver_register(&u8500_hsem_driver);
-}
-/* board init code might need to reserve hwspinlocks for predefined purposes */
-postcore_initcall(u8500_hsem_init);
-
-static void __exit u8500_hsem_exit(void)
-{
-	platform_driver_unregister(&u8500_hsem_driver);
-}
-module_exit(u8500_hsem_exit);
-
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Hardware Spinlock driver for u8500");
-MODULE_AUTHOR("Mathieu Poirier <mathieu.poirier@linaro.org>");
-- 
2.51.0


