Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD6A231290C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Feb 2021 03:48:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbhBHCs1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 7 Feb 2021 21:48:27 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:3030 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229537AbhBHCs1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 Feb 2021 21:48:27 -0500
X-IronPort-AV: E=Sophos;i="5.81,160,1610377200"; 
   d="scan'208";a="71417525"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 08 Feb 2021 11:47:55 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id BD3F8416F85E;
        Mon,  8 Feb 2021 11:47:55 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2] arm64: dts: renesas: add sdhi/mmc aliases
Date:   Mon,  8 Feb 2021 11:47:44 +0900
Message-Id: <1612752464-27838-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
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
mmc aliases to fix the issue. So, add such aliases into R-Car Gen3
and RZ/G2 dtsi files. Note that, if an SoC like r8a77980 has one
sdhi controller only, the alias is not defined.

[1]
https://lore.kernel.org/linux-arm-kernel/CAPDyKFptyEQNJu8cqzMt2WRFZcwEdjDiytMBp96nkoZyprTgmA@mail.gmail.com/

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Changes from v1:
 - Revise the commit description.
 - Remove some alias which SoC has one sdhi controller only.
https://patchwork.kernel.org/project/linux-renesas-soc/patch/1604654877-30010-1-git-send-email-yoshihiro.shimoda.uh@renesas.com/

 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 4 ++++
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 7 +++++++
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 6 ++++++
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 7 +++++++
 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 4 ++++
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 4 ++++
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 7 +++++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 4 ++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 3 +++
 9 files changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index d64fb8b..4f7b917 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -26,6 +26,10 @@
 		i2c5 = &i2c5;
 		i2c6 = &i2c6;
 		i2c7 = &i2c_dvfs;
+		mmc0 = &sdhi0;
+		mmc1 = &sdhi1;
+		mmc2 = &sdhi2;
+		mmc3 = &sdhi3;
 	};
 
 	/*
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index 5b05474..a828bca 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -17,6 +17,13 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		mmc0 = &sdhi0;
+		mmc1 = &sdhi1;
+		mmc2 = &sdhi2;
+		mmc3 = &sdhi3;
+	};
+
 	/*
 	 * The external audio clocks are configured as 0 Hz fixed frequency
 	 * clocks by default.
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index 20fa3ca..f37ed49 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -14,6 +14,12 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		mmc0 = &sdhi0;
+		mmc1 = &sdhi1;
+		mmc3 = &sdhi3;
+	};
+
 	/*
 	 * The external audio clocks are configured as 0 Hz fixed frequency
 	 * clocks by default.
diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index 8eb006c..2c4b65c 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -17,6 +17,13 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		mmc0 = &sdhi0;
+		mmc1 = &sdhi1;
+		mmc2 = &sdhi2;
+		mmc3 = &sdhi3;
+	};
+
 	/*
 	 * The external audio clocks are configured as 0 Hz fixed frequency
 	 * clocks by default.
diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 5c39152..654f048 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -25,6 +25,10 @@
 		i2c5 = &i2c5;
 		i2c6 = &i2c6;
 		i2c7 = &i2c_dvfs;
+		mmc0 = &sdhi0;
+		mmc1 = &sdhi1;
+		mmc2 = &sdhi2;
+		mmc3 = &sdhi3;
 	};
 
 	/*
diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index 25d947a..d0b7236 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -25,6 +25,10 @@
 		i2c5 = &i2c5;
 		i2c6 = &i2c6;
 		i2c7 = &i2c_dvfs;
+		mmc0 = &sdhi0;
+		mmc1 = &sdhi1;
+		mmc2 = &sdhi2;
+		mmc3 = &sdhi3;
 	};
 
 	/*
diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index e8c31eb..57a3d6c 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -16,6 +16,13 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		mmc0 = &sdhi0;
+		mmc1 = &sdhi1;
+		mmc2 = &sdhi2;
+		mmc3 = &sdhi3;
+	};
+
 	/*
 	 * The external audio clocks are configured as 0 Hz fixed frequency
 	 * clocks by default.
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 657b20d..d111ef7 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -28,6 +28,10 @@
 		i2c5 = &i2c5;
 		i2c6 = &i2c6;
 		i2c7 = &i2c_dvfs;
+		mmc0 = &sdhi0;
+		mmc1 = &sdhi1;
+		mmc2 = &sdhi2;
+		mmc3 = &sdhi3;
 	};
 
 	/*
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 5010f23..f0e2d67 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -23,6 +23,9 @@
 		i2c5 = &i2c5;
 		i2c6 = &i2c6;
 		i2c7 = &i2c7;
+		mmc0 = &sdhi0;
+		mmc1 = &sdhi1;
+		mmc3 = &sdhi3;
 	};
 
 	/*
-- 
2.7.4

