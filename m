Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E431327CCE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Mar 2021 12:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233421AbhCALHI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 1 Mar 2021 06:07:08 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:30452 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232848AbhCALHA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Mar 2021 06:07:00 -0500
X-IronPort-AV: E=Sophos;i="5.81,215,1610377200"; 
   d="scan'208";a="73737995"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Mar 2021 20:06:29 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3627A42096A8;
        Mon,  1 Mar 2021 20:06:29 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v4] arm64: dts: renesas: Add mmc aliases into board dts files
Date:   Mon,  1 Mar 2021 20:06:26 +0900
Message-Id: <1614596786-22326-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

After the commit 7320915c8861 ("mmc: Set PROBE_PREFER_ASYNCHRONOUS
for drivers that existed in v4.14"), the order of /dev/mmcblkN
was not fixed in some SoCs which have multiple sdhi controllers.
So, we were hard to use an sdhi device as rootfs by using
the kernel parameter like "root=/dev/mmcblkNpM".

According to the discussion on a mainling list [1], we can add
mmc aliases to fix the issue. So, add such aliases into Renesas
arm64 board dts files. Notes that mmc0 is an eMMC channel if
available.

[1]
https://lore.kernel.org/linux-arm-kernel/CAPDyKFptyEQNJu8cqzMt2WRFZcwEdjDiytMBp96nkoZyprTgmA@mail.gmail.com/

Fixes: 7320915c8861 ("mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.14")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Changes from v3:
 - Set mmc0 as an eMMC channel if available.
 https://patchwork.kernel.org/project/linux-renesas-soc/patch/1614255382-6377-1-git-send-email-yoshihiro.shimoda.uh@renesas.com/

 Changes from v2:
 - Set the aliases into board dts files for consistency with R-Car Gen2.
 - Change the subject.
 - Add Fixes tag.
 https://patchwork.kernel.org/project/linux-renesas-soc/patch/1612752464-27838-1-git-send-email-yoshihiro.shimoda.uh@renesas.com/

 Changes from v1:
 - Revise the commit description.
 - Remove some alias which SoC has one sdhi controller only.
https://patchwork.kernel.org/project/linux-renesas-soc/patch/1604654877-30010-1-git-send-email-yoshihiro.shimoda.uh@renesas.com/

 arch/arm64/boot/dts/renesas/hihope-common.dtsi            | 3 +++
 arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts | 3 +++
 arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dts | 3 +++
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts           | 2 ++
 arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dts | 3 +++
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts            | 3 +++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi          | 3 +++
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi                  | 1 +
 arch/arm64/boot/dts/renesas/ulcb.dtsi                     | 2 ++
 9 files changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
index 7a3da9b..0c7e6f7 100644
--- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
@@ -12,6 +12,9 @@
 	aliases {
 		serial0 = &scif2;
 		serial1 = &hscif0;
+		mmc0 = &sdhi3;
+		mmc1 = &sdhi0;
+		mmc2 = &sdhi2;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts b/arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts
index 501cb05..3cf2e07 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts
@@ -21,6 +21,9 @@
 		serial4 = &hscif2;
 		serial5 = &scif5;
 		ethernet0 = &avb;
+		mmc0 = &sdhi3;
+		mmc1 = &sdhi0;
+		mmc2 = &sdhi2;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dts b/arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dts
index 71763f4..3c0d59d 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dts
@@ -22,6 +22,9 @@
 		serial5 = &scif5;
 		serial6 = &scif4;
 		ethernet0 = &avb;
+		mmc0 = &sdhi3;
+		mmc1 = &sdhi0;
+		mmc2 = &sdhi2;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index ea87cb5..33257c6 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -17,6 +17,8 @@
 	aliases {
 		serial0 = &scif2;
 		serial1 = &hscif2;
+		mmc0 = &sdhi0;
+		mmc1 = &sdhi3;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dts b/arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dts
index 273f062..7b6649a 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dts
@@ -22,6 +22,9 @@
 		serial5 = &scif5;
 		serial6 = &scif4;
 		ethernet0 = &avb;
+		mmc0 = &sdhi3;
+		mmc1 = &sdhi0;
+		mmc2 = &sdhi2;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index f74f8b9..6d6cdc4 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -16,6 +16,9 @@
 	aliases {
 		serial0 = &scif2;
 		ethernet0 = &avb;
+		mmc0 = &sdhi3;
+		mmc1 = &sdhi0;
+		mmc2 = &sdhi1;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index c22bb38..15bb1ee 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -36,6 +36,9 @@
 		serial0 = &scif2;
 		serial1 = &hscif1;
 		ethernet0 = &avb;
+		mmc0 = &sdhi2;
+		mmc1 = &sdhi0;
+		mmc2 = &sdhi3;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index e9ed259..61bd4df 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -16,6 +16,7 @@
 	aliases {
 		serial1 = &hscif0;
 		serial2 = &scif1;
+		mmc2 = &sdhi3;
 	};
 
 	clksndsel: clksndsel {
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index a04eae5..3d88e95 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -23,6 +23,8 @@
 	aliases {
 		serial0 = &scif2;
 		ethernet0 = &avb;
+		mmc0 = &sdhi2;
+		mmc1 = &sdhi0;
 	};
 
 	chosen {
-- 
2.7.4

