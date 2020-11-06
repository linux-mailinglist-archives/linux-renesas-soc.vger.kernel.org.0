Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 100492A928E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Nov 2020 10:28:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbgKFJ2A (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Nov 2020 04:28:00 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:47107 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725868AbgKFJ2A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Nov 2020 04:28:00 -0500
X-IronPort-AV: E=Sophos;i="5.77,456,1596466800"; 
   d="scan'208";a="61864019"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 06 Nov 2020 18:27:59 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 92319400D4E6;
        Fri,  6 Nov 2020 18:27:59 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] arm64: dts: renesas: add sdhi/mmc aliases
Date:   Fri,  6 Nov 2020 18:27:57 +0900
Message-Id: <1604654877-30010-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

After the commit 7320915c8861 ("mmc: Set PROBE_PREFER_ASYNCHRONOUS
for drivers that existed in v4.14"), the order of /dev/mmcblkN
was not fixed, so that we are hard to use the device as rootfs
by using a kernel parameter like root=/dev/mmcblkN. So, add
sdhi/mmc aliases.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 I'm afraid, but I only tested on r8a77951-salvator-xs.

 If possible, I would like to apply this patch into v5.10-stable
 because we are hard to use the device as rootfs as I described
 the commit description.

 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 4 ++++
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 7 +++++++
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 6 ++++++
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 7 +++++++
 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 4 ++++
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 4 ++++
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 7 +++++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 4 ++++
 arch/arm64/boot/dts/renesas/r8a77970.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r8a77980.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 3 +++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 4 ++++
 12 files changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index 8e80f50..9165e88 100644
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
index 49e5add..8fceb78 100644
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
index 4217119..11750db 100644
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
index 0f86cfd..9686ab6 100644
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
index 9beb8e7..3bebf44 100644
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
index 4dfb7f0..33bc1e0 100644
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
index 542c44c..8935178 100644
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
index fe4dc12..8c95231 100644
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
diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
index 2b9124a..748b015 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -22,6 +22,7 @@
 		i2c2 = &i2c2;
 		i2c3 = &i2c3;
 		i2c4 = &i2c4;
+		mmc0 = &mmc0;
 	};
 
 	/* External CAN clock - to be overridden by boards that provide it */
diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index 59f5bbd..fc98f09 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -23,6 +23,7 @@
 		i2c3 = &i2c3;
 		i2c4 = &i2c4;
 		i2c5 = &i2c5;
+		mmc0 = &mmc0;
 	};
 
 	/* External CAN clock - to be overridden by boards that provide it */
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 1991bdc..321cc8a 100644
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
diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 2c2272f..f1928b9 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -15,6 +15,10 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		mmc1 = &sdhi2;
+	};
+
 	/* External CAN clock - to be overridden by boards that provide it */
 	can_clk: can {
 		compatible = "fixed-clock";
-- 
2.7.4

