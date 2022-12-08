Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4787F64707E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Dec 2022 14:08:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbiLHNH5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Dec 2022 08:07:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230212AbiLHNHx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Dec 2022 08:07:53 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09DDE30F7F
        for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Dec 2022 05:07:47 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:5574:4fdf:a801:888e])
        by albert.telenet-ops.be with bizsmtp
        id tp7m2800D2deJRf06p7mz3; Thu, 08 Dec 2022 14:07:46 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p3GIF-002tBF-HV; Thu, 08 Dec 2022 13:46:27 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p3DeN-002fnQ-6n; Thu, 08 Dec 2022 10:57:07 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Tho Vu <tho.vu.wh@renesas.com>, linux-renesas-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] arm64: dts: renesas: r8a779g0: Add Cortex-A76 1.8 GHz opp
Date:   Thu,  8 Dec 2022 10:57:00 +0100
Message-Id: <cc2bae27776523f499d01655ef18fe463a3ae1ae.1670492384.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1670492384.git.geert+renesas@glider.be>
References: <cover.1670492384.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add an operating point for running the Cortex-A76 CPU cores on R-Car
V4H at 1.8 GHz (High Performance mode).

Based on a patch in the BSP by Tho Vu.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Tested on the Renesas White-Hawk development board by using the CPUfreq
userspace governor, enabling boost mode, writing the desired CPU clock
rate to the CPUfreq policy's "scaling_setspeed" file in sysfs, verifying
the clock rate of the Z0φ clock in debugfs, and running the dhrystones
benchmark on the various CPU cores.

$ echo 1 > /sys/devices/system/cpu/cpufreq/boost
$ echo 1800000 > /sys/devices/system/cpu/cpufreq/policy0/scaling_setspeed
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 83d1666a2ea16de2..7a87a5dc1b6ad219 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -39,6 +39,12 @@ opp-1700000000 {
 			clock-latency-ns = <500000>;
 			opp-suspend;
 		};
+		opp-1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <880000>;
+			clock-latency-ns = <500000>;
+			turbo-mode;
+		};
 	};
 
 	cpus {
-- 
2.25.1

