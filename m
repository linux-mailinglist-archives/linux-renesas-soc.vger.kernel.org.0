Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFEEB2FE848
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jan 2021 12:03:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729990AbhAULCZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Jan 2021 06:02:25 -0500
Received: from www.zeus03.de ([194.117.254.33]:34610 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730048AbhAULBK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Jan 2021 06:01:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=jHDhm5fWDOHhM7
        7MBwWbH2SYTOFCkn6jC6cC3L2A5TQ=; b=sheb5ZuJ5vG8bC9wDJ4Si3UgjF7eb6
        aGe7jdGdb2XYGM6F43VBeSgBCU29R91f8Hsc1BSbG3OSMCT3z6SX47EotzkpmTok
        VkNEOQYBNwqn+iJ+ieHPWE6cAczWvK/HIDD+J4+diIEjhWN+NdzBXOIZV4CA4Q0V
        fJc4nu9CRfL+0=
Received: (qmail 1815195 invoked from network); 21 Jan 2021 12:00:14 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jan 2021 12:00:14 +0100
X-UD-Smtp-Session: l3s3148p1@Z6rr+Wa5GL8gAwDPXyX1ACWcscxtZ2TX
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 2/4] arm64: dts: renesas: falcon: add SCIF0 nodes
Date:   Thu, 21 Jan 2021 12:00:06 +0100
Message-Id: <20210121110008.15894-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121110008.15894-1-wsa+renesas@sang-engineering.com>
References: <20210121110008.15894-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SCIF0 has been enabled by the firmware, so it worked already. Still, add
the proper nodes to make it work in any case.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Changes since v1:
* moved to Falcon CPU dtsi

 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
index c54d1e287a49..1a36239cdc5d 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
@@ -225,6 +225,9 @@ &mmc0 {
 };
 
 &pfc {
+	pinctrl-0 = <&scif_clk_pins>;
+	pinctrl-names = "default";
+
 	avb0_pins: avb0 {
 		mux {
 			groups = "avb0_link", "avb0_mdio", "avb0_rgmii", "avb0_txcrefclk";
@@ -368,8 +371,26 @@ mmc_pins: mmc {
 		function = "mmc";
 		power-source = <1800>;
 	};
+
+	scif0_pins: scif0 {
+		groups = "scif0_data", "scif0_ctrl";
+		function = "scif0";
+	};
+
+	scif_clk_pins: scif_clk {
+		groups = "scif_clk";
+		function = "scif_clk";
+	};
 };
 
 &scif0 {
+	pinctrl-0 = <&scif0_pins>;
+	pinctrl-names = "default";
+
+	uart-has-rtscts;
 	status = "okay";
 };
+
+&scif_clk {
+	clock-frequency = <24000000>;
+};
-- 
2.29.2

