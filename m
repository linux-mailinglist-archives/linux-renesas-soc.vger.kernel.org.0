Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95600319DD3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Feb 2021 13:04:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbhBLMC6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Feb 2021 07:02:58 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:51400 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230368AbhBLMCe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Feb 2021 07:02:34 -0500
X-IronPort-AV: E=Sophos;i="5.81,173,1610377200"; 
   d="scan'208";a="72123785"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 12 Feb 2021 21:02:02 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C57D0424C610;
        Fri, 12 Feb 2021 21:02:02 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] ARM: dts: renesas: Add mmc aliases into R-Car Gen2 board dts files
Date:   Fri, 12 Feb 2021 21:01:56 +0900
Message-Id: <1613131316-30994-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

After set PROBE_PREFER_ASYNCHRONOUS flag on the mmc host drivers,
the order of /dev/mmcblkN was not fixed in some SoCs which have
multiple SDHI and/or MMCIF controllers. So, we were hard to use
such a device as rootfs by using the kernel parameter like
"root=/dev/mmcblkNpM".

According to the discussion on a mainling list [1], we can add
mmc aliases to fix the issue. So, add such aliases into R-Car Gen2
board dts files. Note that, since R-Car Gen2 is even more complicated
about SDHI and/or MMCIF channels variations and they share pins,
add the aliases into board dts files instead of SoC dtsi files.

[1]
https://lore.kernel.org/linux-arm-kernel/CAPDyKFptyEQNJu8cqzMt2WRFZcwEdjDiytMBp96nkoZyprTgmA@mail.gmail.com/

Fixes: 7320915c8861 ("mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.14")
Fixes: 21b2cec61c04 ("mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.4")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm/boot/dts/r8a7790-lager.dts   | 3 +++
 arch/arm/boot/dts/r8a7791-koelsch.dts | 3 +++
 arch/arm/boot/dts/r8a7791-porter.dts  | 2 ++
 arch/arm/boot/dts/r8a7793-gose.dts    | 3 +++
 arch/arm/boot/dts/r8a7794-alt.dts     | 3 +++
 arch/arm/boot/dts/r8a7794-silk.dts    | 2 ++
 6 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index 09a152b..1d6f0c5 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -53,6 +53,9 @@
 		i2c11 = &i2cexio1;
 		i2c12 = &i2chdmi;
 		i2c13 = &i2cpwr;
+		mmc0 = &mmcif1;
+		mmc1 = &sdhi0;
+		mmc2 = &sdhi2;
 	};
 
 	chosen {
diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
index f603cba..6af1727 100644
--- a/arch/arm/boot/dts/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
@@ -53,6 +53,9 @@
 		i2c12 = &i2cexio1;
 		i2c13 = &i2chdmi;
 		i2c14 = &i2cexio4;
+		mmc0 = &sdhi0;
+		mmc1 = &sdhi1;
+		mmc2 = &sdhi2;
 	};
 
 	chosen {
diff --git a/arch/arm/boot/dts/r8a7791-porter.dts b/arch/arm/boot/dts/r8a7791-porter.dts
index c6d563f..bf51e29 100644
--- a/arch/arm/boot/dts/r8a7791-porter.dts
+++ b/arch/arm/boot/dts/r8a7791-porter.dts
@@ -28,6 +28,8 @@
 		serial0 = &scif0;
 		i2c9 = &gpioi2c2;
 		i2c10 = &i2chdmi;
+		mmc0 = &sdhi0;
+		mmc1 = &sdhi2;
 	};
 
 	chosen {
diff --git a/arch/arm/boot/dts/r8a7793-gose.dts b/arch/arm/boot/dts/r8a7793-gose.dts
index abf487e..2b59a04 100644
--- a/arch/arm/boot/dts/r8a7793-gose.dts
+++ b/arch/arm/boot/dts/r8a7793-gose.dts
@@ -49,6 +49,9 @@
 		i2c10 = &gpioi2c4;
 		i2c11 = &i2chdmi;
 		i2c12 = &i2cexio4;
+		mmc0 = &sdhi0;
+		mmc1 = &sdhi1;
+		mmc2 = &sdhi2;
 	};
 
 	chosen {
diff --git a/arch/arm/boot/dts/r8a7794-alt.dts b/arch/arm/boot/dts/r8a7794-alt.dts
index 3f1cc5b..3202598 100644
--- a/arch/arm/boot/dts/r8a7794-alt.dts
+++ b/arch/arm/boot/dts/r8a7794-alt.dts
@@ -19,6 +19,9 @@
 		i2c10 = &gpioi2c4;
 		i2c11 = &i2chdmi;
 		i2c12 = &i2cexio4;
+		mmc0 = &mmcif0;
+		mmc1 = &sdhi0;
+		mmc2 = &sdhi1;
 	};
 
 	chosen {
diff --git a/arch/arm/boot/dts/r8a7794-silk.dts b/arch/arm/boot/dts/r8a7794-silk.dts
index 677596f..af066ee 100644
--- a/arch/arm/boot/dts/r8a7794-silk.dts
+++ b/arch/arm/boot/dts/r8a7794-silk.dts
@@ -31,6 +31,8 @@
 		serial0 = &scif2;
 		i2c9 = &gpioi2c1;
 		i2c10 = &i2chdmi;
+		mmc0 = &mmcif0;
+		mmc1 = &sdhi1;
 	};
 
 	chosen {
-- 
2.7.4

