Return-Path: <linux-renesas-soc+bounces-2730-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A03B1853E32
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 23:10:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D34DBB2E25D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 22:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAE1464A82;
	Tue, 13 Feb 2024 22:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="eOsDf8H8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04447629EE
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Feb 2024 22:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707861788; cv=none; b=CCZ31usJIMtU97QpSlUra83B7Y45AhtmVJV2Xl0cXs6AWC5wodQr3IlAMOTkQuTDaltIn4+iB9mBLN/rVOf6PZq+Z/UVugqj3wwO8yGpzICPz6KXDyyX2LdHw4pFzHjsfFozxFgvdFOyoFM2FWrl+33vSkwIHpDdmBNWxG8Chvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707861788; c=relaxed/simple;
	bh=/NbPIAmNtikp+MPwHZ9GZ2HCof6dRoexpNHYP4pdtFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sbUhJHUyJ5yw0YZctdQsg95zOKV3Ig8FO5fDDsy6DHsqL9//6xMLXAP1Z5UDOQ/w+nszKGR3poifGp/Vb70Izj315YZrOUFplgooYlgjFkOvaVK7/3rQYiUb/w5khYV8A18zCOuc1UlzCZpcMtGQHqYAOSA8vKuX2Z3v0O82a4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=eOsDf8H8; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=8RxXVKDkgKtVpBldpmsRbkKgOxCKxWWUezfoGXGqq3A=; b=eOsDf8
	H8q2fpvBzLPYOA+dpU9LNZnDLX4fBAEqXfG+LZ/npjnBPxcJi8fGQjSk6H14vSYo
	7qJnfOlfH1SiC/QV6ICRoyCxG18lbJv5NHFXkr8L8L6LvqPbyZxUcHF3A5iBCqsd
	/MRYQvrrLMAWNyI1083/xEpqW8BcKDpQYxKMc5KB4bYIOeIoSUGVnMB97qYhnyIJ
	is4wyX/d84px45T5H8JESgX3MRHUtQ6gscT4Ot0MRVrCeMoGRRXCXuBbRXwqJttT
	xMyfBmXjtwO1NQQ7cE+HYuzk2XAhQocDGw79hhCR8LFRBYAvvy1rzoHjJAa+hD8t
	rryjYc8lU1ikANmg==
Received: (qmail 1211928 invoked from network); 13 Feb 2024 23:02:57 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Feb 2024 23:02:57 +0100
X-UD-Smtp-Session: l3s3148p1@XyyPjkoR/t8ujnsZ
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 6/6] mfd: tmio: Move header to platform_data
Date: Tue, 13 Feb 2024 23:02:25 +0100
Message-ID: <20240213220221.2380-14-wsa+renesas@sang-engineering.com>
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

All the MFD components are gone from the header meanwhile. Only the MMC
relevant data is left which makes it a platform_data for the MMC
controller. Move the header to the now fitting directory.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Lee Jones <lee@kernel.org>
Acked-by: Ulf Hansson <ulf.hansson@linaro.org> # For MMC
Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
---
 MAINTAINERS                                   | 2 +-
 arch/sh/boards/board-sh7757lcr.c              | 2 +-
 arch/sh/boards/mach-ap325rxa/setup.c          | 2 +-
 arch/sh/boards/mach-ecovec24/setup.c          | 2 +-
 arch/sh/boards/mach-kfr2r09/setup.c           | 2 +-
 arch/sh/boards/mach-migor/setup.c             | 2 +-
 arch/sh/boards/mach-se/7724/setup.c           | 2 +-
 drivers/mmc/host/renesas_sdhi_core.c          | 2 +-
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 2 +-
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 2 +-
 drivers/mmc/host/tmio_mmc_core.c              | 2 +-
 drivers/mmc/host/uniphier-sd.c                | 2 +-
 include/linux/{mfd => platform_data}/tmio.h   | 0
 13 files changed, 12 insertions(+), 12 deletions(-)
 rename include/linux/{mfd => platform_data}/tmio.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 73d898383e51..fb672e0bb0c1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22153,7 +22153,7 @@ L:	linux-renesas-soc@vger.kernel.org
 S:	Supported
 F:	drivers/mmc/host/renesas_sdhi*
 F:	drivers/mmc/host/tmio_mmc*
-F:	include/linux/mfd/tmio.h
+F:	include/linux/platform_data/tmio.h
 
 TMP401 HARDWARE MONITOR DRIVER
 M:	Guenter Roeck <linux@roeck-us.net>
diff --git a/arch/sh/boards/board-sh7757lcr.c b/arch/sh/boards/board-sh7757lcr.c
index f39c8196efdf..4014c042d2a5 100644
--- a/arch/sh/boards/board-sh7757lcr.c
+++ b/arch/sh/boards/board-sh7757lcr.c
@@ -14,9 +14,9 @@
 #include <linux/spi/spi.h>
 #include <linux/spi/flash.h>
 #include <linux/io.h>
-#include <linux/mfd/tmio.h>
 #include <linux/mmc/host.h>
 #include <linux/platform_data/sh_mmcif.h>
+#include <linux/platform_data/tmio.h>
 #include <linux/sh_eth.h>
 #include <linux/sh_intc.h>
 #include <linux/usb/renesas_usbhs.h>
diff --git a/arch/sh/boards/mach-ap325rxa/setup.c b/arch/sh/boards/mach-ap325rxa/setup.c
index 645cccf3da88..bb5004a8ac02 100644
--- a/arch/sh/boards/mach-ap325rxa/setup.c
+++ b/arch/sh/boards/mach-ap325rxa/setup.c
@@ -24,10 +24,10 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/memblock.h>
-#include <linux/mfd/tmio.h>
 #include <linux/mmc/host.h>
 #include <linux/mtd/physmap.h>
 #include <linux/mtd/sh_flctl.h>
+#include <linux/platform_data/tmio.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/fixed.h>
 #include <linux/regulator/machine.h>
diff --git a/arch/sh/boards/mach-ecovec24/setup.c b/arch/sh/boards/mach-ecovec24/setup.c
index 30d117f9ad7e..6f13557eecd6 100644
--- a/arch/sh/boards/mach-ecovec24/setup.c
+++ b/arch/sh/boards/mach-ecovec24/setup.c
@@ -17,13 +17,13 @@
 #include <linux/input/sh_keysc.h>
 #include <linux/interrupt.h>
 #include <linux/memblock.h>
-#include <linux/mfd/tmio.h>
 #include <linux/mmc/host.h>
 #include <linux/platform_data/sh_mmcif.h>
 #include <linux/mtd/physmap.h>
 #include <linux/gpio.h>
 #include <linux/gpio/machine.h>
 #include <linux/platform_data/gpio_backlight.h>
+#include <linux/platform_data/tmio.h>
 #include <linux/platform_data/tsc2007.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/fixed.h>
diff --git a/arch/sh/boards/mach-kfr2r09/setup.c b/arch/sh/boards/mach-kfr2r09/setup.c
index 6b775eae85c0..70236859919d 100644
--- a/arch/sh/boards/mach-kfr2r09/setup.c
+++ b/arch/sh/boards/mach-kfr2r09/setup.c
@@ -22,10 +22,10 @@
 #include <linux/input/sh_keysc.h>
 #include <linux/interrupt.h>
 #include <linux/memblock.h>
-#include <linux/mfd/tmio.h>
 #include <linux/mmc/host.h>
 #include <linux/mtd/physmap.h>
 #include <linux/platform_data/lv5207lp.h>
+#include <linux/platform_data/tmio.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/fixed.h>
 #include <linux/regulator/machine.h>
diff --git a/arch/sh/boards/mach-migor/setup.c b/arch/sh/boards/mach-migor/setup.c
index 773ee767d0c4..1853e6319a66 100644
--- a/arch/sh/boards/mach-migor/setup.c
+++ b/arch/sh/boards/mach-migor/setup.c
@@ -7,6 +7,7 @@
 #include <linux/clkdev.h>
 #include <linux/dma-map-ops.h>
 #include <linux/init.h>
+#include <linux/platform_data/tmio.h>
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
 #include <linux/input.h>
@@ -14,7 +15,6 @@
 #include <linux/memblock.h>
 #include <linux/mmc/host.h>
 #include <linux/mtd/physmap.h>
-#include <linux/mfd/tmio.h>
 #include <linux/mtd/platnand.h>
 #include <linux/i2c.h>
 #include <linux/regulator/fixed.h>
diff --git a/arch/sh/boards/mach-se/7724/setup.c b/arch/sh/boards/mach-se/7724/setup.c
index 787ddd3c627a..e500feb91053 100644
--- a/arch/sh/boards/mach-se/7724/setup.c
+++ b/arch/sh/boards/mach-se/7724/setup.c
@@ -21,9 +21,9 @@
 #include <linux/input/sh_keysc.h>
 #include <linux/interrupt.h>
 #include <linux/memblock.h>
-#include <linux/mfd/tmio.h>
 #include <linux/mmc/host.h>
 #include <linux/mtd/physmap.h>
+#include <linux/platform_data/tmio.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/fixed.h>
 #include <linux/regulator/machine.h>
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index c675dec587ef..f84f60139bcf 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -22,13 +22,13 @@
 #include <linux/delay.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
-#include <linux/mfd/tmio.h>
 #include <linux/mmc/host.h>
 #include <linux/mmc/mmc.h>
 #include <linux/mmc/slot-gpio.h>
 #include <linux/module.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/pinctrl-state.h>
+#include <linux/platform_data/tmio.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/regulator/consumer.h>
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 24e1c17908d7..97cd55fec0bf 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -11,12 +11,12 @@
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/io-64-nonatomic-hi-lo.h>
-#include <linux/mfd/tmio.h>
 #include <linux/mmc/host.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pagemap.h>
+#include <linux/platform_data/tmio.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index c18581897f8a..68e31c37cce6 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -11,12 +11,12 @@
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
-#include <linux/mfd/tmio.h>
 #include <linux/mmc/host.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pagemap.h>
+#include <linux/platform_data/tmio.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index c39141a5bd23..0c4397b3cffd 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -31,7 +31,6 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
-#include <linux/mfd/tmio.h>
 #include <linux/mmc/card.h>
 #include <linux/mmc/host.h>
 #include <linux/mmc/mmc.h>
@@ -39,6 +38,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pagemap.h>
+#include <linux/platform_data/tmio.h>
 #include <linux/platform_device.h>
 #include <linux/pm_qos.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/mmc/host/uniphier-sd.c b/drivers/mmc/host/uniphier-sd.c
index 1404989e6151..bd231dbe90ba 100644
--- a/drivers/mmc/host/uniphier-sd.c
+++ b/drivers/mmc/host/uniphier-sd.c
@@ -9,11 +9,11 @@
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/mfd/syscon.h>
-#include <linux/mfd/tmio.h>
 #include <linux/mmc/host.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/platform_data/tmio.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
diff --git a/include/linux/mfd/tmio.h b/include/linux/platform_data/tmio.h
similarity index 100%
rename from include/linux/mfd/tmio.h
rename to include/linux/platform_data/tmio.h
-- 
2.43.0


