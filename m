Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E817CD9454
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2019 16:52:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731578AbfJPOwN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Oct 2019 10:52:13 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:44022 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389201AbfJPOwM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 10:52:12 -0400
Received: from ramsan ([84.194.98.4])
        by albert.telenet-ops.be with bizsmtp
        id EEsA2100Z05gfCL06EsALn; Wed, 16 Oct 2019 16:52:10 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iKkeo-0003ry-Bc; Wed, 16 Oct 2019 16:52:10 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iKkeo-0007l2-9Q; Wed, 16 Oct 2019 16:52:10 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: clock: renesas: Remove R-Car Gen2 legacy DT bindings
Date:   Wed, 16 Oct 2019 16:52:07 +0200
Message-Id: <20191016145207.29779-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As of commit 362b334b17943d84 ("ARM: dts: r8a7791: Convert to new
CPG/MSSR bindings"), all upstream R-Car Gen2 device tree source files
use the unified "Renesas Clock Pulse Generator / Module Standby and
Software Reset" DT bindings.

Hence remove the old R-Car Gen2 DT bindings describing a hierarchical
representation of the various CPG and MSTP clocks.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas-for-v5.5.

The abovementioned commit was part of the v4.15 release.
The conversion was backported to v4.14.75-ltsi, and included in any
R-Car BSP based on v4.14 (rcar-3.6.0 and later).
---
 .../clock/renesas,rcar-gen2-cpg-clocks.txt    | 60 -------------------
 1 file changed, 60 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/renesas,rcar-gen2-cpg-clocks.txt

diff --git a/Documentation/devicetree/bindings/clock/renesas,rcar-gen2-cpg-clocks.txt b/Documentation/devicetree/bindings/clock/renesas,rcar-gen2-cpg-clocks.txt
deleted file mode 100644
index f8c05bb4116eae54..0000000000000000
--- a/Documentation/devicetree/bindings/clock/renesas,rcar-gen2-cpg-clocks.txt
+++ /dev/null
@@ -1,60 +0,0 @@
-* Renesas R-Car Gen2 Clock Pulse Generator (CPG)
-
-The CPG generates core clocks for the R-Car Gen2 SoCs. It includes three PLLs
-and several fixed ratio dividers.
-The CPG also provides a Clock Domain for SoC devices, in combination with the
-CPG Module Stop (MSTP) Clocks.
-
-Required Properties:
-
-  - compatible: Must be one of
-    - "renesas,r8a7790-cpg-clocks" for the r8a7790 CPG
-    - "renesas,r8a7791-cpg-clocks" for the r8a7791 CPG
-    - "renesas,r8a7792-cpg-clocks" for the r8a7792 CPG
-    - "renesas,r8a7793-cpg-clocks" for the r8a7793 CPG
-    - "renesas,r8a7794-cpg-clocks" for the r8a7794 CPG
-    and "renesas,rcar-gen2-cpg-clocks" as a fallback.
-
-  - reg: Base address and length of the memory resource used by the CPG
-
-  - clocks: References to the parent clocks: first to the EXTAL clock, second
-    to the USB_EXTAL clock
-  - #clock-cells: Must be 1
-  - clock-output-names: The names of the clocks. Supported clocks are "main",
-    "pll0", "pll1", "pll3", "lb", "qspi", "sdh", "sd0", "sd1", "z", "rcan", and
-    "adsp"
-  - #power-domain-cells: Must be 0
-
-SoC devices that are part of the CPG/MSTP Clock Domain and can be power-managed
-through an MSTP clock should refer to the CPG device node in their
-"power-domains" property, as documented by the generic PM domain bindings in
-Documentation/devicetree/bindings/power/power_domain.txt.
-
-
-Examples
---------
-
-  - CPG device node:
-
-	cpg_clocks: cpg_clocks@e6150000 {
-		compatible = "renesas,r8a7790-cpg-clocks",
-			     "renesas,rcar-gen2-cpg-clocks";
-		reg = <0 0xe6150000 0 0x1000>;
-		clocks = <&extal_clk &usb_extal_clk>;
-		#clock-cells = <1>;
-		clock-output-names = "main", "pll0, "pll1", "pll3",
-				     "lb", "qspi", "sdh", "sd0", "sd1", "z",
-				     "rcan", "adsp";
-		#power-domain-cells = <0>;
-	};
-
-
-  - CPG/MSTP Clock Domain member device node:
-
-	thermal@e61f0000 {
-		compatible = "renesas,thermal-r8a7790", "renesas,rcar-thermal";
-		reg = <0 0xe61f0000 0 0x14>, <0 0xe61f0100 0 0x38>;
-		interrupts = <0 69 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&mstp5_clks R8A7790_CLK_THERMAL>;
-		power-domains = <&cpg_clocks>;
-	};
-- 
2.17.1

