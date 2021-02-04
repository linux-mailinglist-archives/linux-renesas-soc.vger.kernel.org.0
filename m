Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AE3D30FA62
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Feb 2021 18:57:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238229AbhBDRzr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Feb 2021 12:55:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238494AbhBDRvX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Feb 2021 12:51:23 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FD84C06178B
        for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Feb 2021 09:50:43 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id R5qf240044C55Sk065qfy1; Thu, 04 Feb 2021 18:50:39 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l7im6-003Fgj-RX; Thu, 04 Feb 2021 18:50:38 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l7f5F-006vvy-Vw; Thu, 04 Feb 2021 14:54:10 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 3/6] ARM: dts: r8a73a4: Add secondary CPU nodes
Date:   Thu,  4 Feb 2021 14:54:06 +0100
Message-Id: <20210204135409.1652604-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204135409.1652604-1-geert+renesas@glider.be>
References: <20210204135409.1652604-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add nodes for:
  - CPU1-3, which are Cortex A15 at 1.5 GHz, living in PM domain A2SL,
  - CPU4-7, which are Cortex A7 at 1.0 GHz, living in PM domain A2KL.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a73a4.dtsi | 70 ++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm/boot/dts/r8a73a4.dtsi b/arch/arm/boot/dts/r8a73a4.dtsi
index e5fb1ce261f72f2d..d498f848d34ab6ed 100644
--- a/arch/arm/boot/dts/r8a73a4.dtsi
+++ b/arch/arm/boot/dts/r8a73a4.dtsi
@@ -30,6 +30,76 @@ cpu0: cpu@0 {
 			next-level-cache = <&L2_CA15>;
 		};
 
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a15";
+			reg = <1>;
+			clocks = <&cpg_clocks R8A73A4_CLK_Z>;
+			clock-frequency = <1500000000>;
+			power-domains = <&pd_a2sl>;
+			next-level-cache = <&L2_CA15>;
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a15";
+			reg = <2>;
+			clocks = <&cpg_clocks R8A73A4_CLK_Z>;
+			clock-frequency = <1500000000>;
+			power-domains = <&pd_a2sl>;
+			next-level-cache = <&L2_CA15>;
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a15";
+			reg = <3>;
+			clocks = <&cpg_clocks R8A73A4_CLK_Z>;
+			clock-frequency = <1500000000>;
+			power-domains = <&pd_a2sl>;
+			next-level-cache = <&L2_CA15>;
+		};
+
+		cpu4: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x100>;
+			clocks = <&cpg_clocks R8A73A4_CLK_Z2>;
+			clock-frequency = <1000000000>;
+			power-domains = <&pd_a2kl>;
+			next-level-cache = <&L2_CA7>;
+		};
+
+		cpu5: cpu@101 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x101>;
+			clocks = <&cpg_clocks R8A73A4_CLK_Z2>;
+			clock-frequency = <1000000000>;
+			power-domains = <&pd_a2kl>;
+			next-level-cache = <&L2_CA7>;
+		};
+
+		cpu6: cpu@102 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x102>;
+			clocks = <&cpg_clocks R8A73A4_CLK_Z2>;
+			clock-frequency = <1000000000>;
+			power-domains = <&pd_a2kl>;
+			next-level-cache = <&L2_CA7>;
+		};
+
+		cpu7: cpu@103 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x103>;
+			clocks = <&cpg_clocks R8A73A4_CLK_Z2>;
+			clock-frequency = <1000000000>;
+			power-domains = <&pd_a2kl>;
+			next-level-cache = <&L2_CA7>;
+		};
+
 		L2_CA15: cache-controller-0 {
 			compatible = "cache";
 			clocks = <&cpg_clocks R8A73A4_CLK_Z>;
-- 
2.25.1

