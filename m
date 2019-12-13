Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 458EC11E88B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2019 17:42:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727974AbfLMQlU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Dec 2019 11:41:20 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:58952 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728355AbfLMQlU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Dec 2019 11:41:20 -0500
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id dUhG2100R5USYZQ01UhGqq; Fri, 13 Dec 2019 17:41:16 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ifo0C-0006uZ-J3; Fri, 13 Dec 2019 17:41:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ifo0C-0000zF-Ho; Fri, 13 Dec 2019 17:41:16 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/7] arm64: dts: renesas: Group tuples in regulator-gpio states properties
Date:   Fri, 13 Dec 2019 17:41:12 +0100
Message-Id: <20191213164115.3697-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213164115.3697-1-geert+renesas@glider.be>
References: <20191213164115.3697-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To improve human readability and enable automatic validation, the tuples
in the "states" properties of device nodes compatible with
"regulator-gpio" should be grouped, as reported by "make dtbs_check":

    $ make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/regulator/gpio-regulator.yaml
    arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dt.yaml: regulator-vccq-sdhi0: states:0: Additional items are not allowed (1800000, 0 were unexpected)
    arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dt.yaml: regulator-vccq-sdhi0: states:0: [3300000, 1, 1800000, 0] is too long
    arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dt.yaml: regulator-vccq-sdhi3: states:0: Additional items are not allowed (1800000, 0 were unexpected)
    arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dt.yaml: regulator-vccq-sdhi3: states:0: [3300000, 1, 1800000, 0] is too long
    ...

Fix this by grouping the tuples using angle brackets.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/hihope-common.dtsi   | 3 +--
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts  | 3 +--
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts   | 6 ++----
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 6 ++----
 arch/arm64/boot/dts/renesas/ulcb.dtsi            | 3 +--
 5 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
index 2c942a7eaeeba293..bd056904e8bdba3d 100644
--- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
@@ -109,8 +109,7 @@
 
 		gpios = <&gpio6 30 GPIO_ACTIVE_HIGH>;
 		gpios-states = <1>;
-		states = <3300000 1
-			  1800000 0>;
+		states = <3300000 1>, <1800000 0>;
 	};
 
 	wlan_en_reg: regulator-wlan_en {
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index c99b1dec52ef65f8..26aee004a44e2d03 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -110,8 +110,7 @@
 
 		gpios = <&gpio3 13 GPIO_ACTIVE_HIGH>;
 		gpios-states = <1>;
-		states = <3300000 1
-			  1800000 0>;
+		states = <3300000 1>, <1800000 0>;
 	};
 
 	wlan_en_reg: fixedregulator {
diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index b38f9d442fc08f2c..f1cd5e61c0015a4a 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -182,8 +182,7 @@
 
 		gpios = <&gpio5 18 GPIO_ACTIVE_HIGH>;
 		gpios-states = <1>;
-		states = <3300000 1
-			  1800000 0>;
+		states = <3300000 1>, <1800000 0>;
 	};
 
 	vcc_sdhi1: regulator-vcc-sdhi1 {
@@ -206,8 +205,7 @@
 
 		gpios = <&gpio3 15 GPIO_ACTIVE_HIGH>;
 		gpios-states = <1>;
-		states = <3300000 1
-			  1800000 0>;
+		states = <3300000 1>, <1800000 0>;
 	};
 
 	vga {
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 15ed5f769ae369e6..0abed3ceda74ea3a 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -238,8 +238,7 @@
 
 		gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
 		gpios-states = <1>;
-		states = <3300000 1
-			  1800000 0>;
+		states = <3300000 1>, <1800000 0>;
 	};
 
 	vcc_sdhi3: regulator-vcc-sdhi3 {
@@ -262,8 +261,7 @@
 
 		gpios = <&gpio3 14 GPIO_ACTIVE_HIGH>;
 		gpios-states = <1>;
-		states = <3300000 1
-			  1800000 0>;
+		states = <3300000 1>, <1800000 0>;
 	};
 
 	vga {
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index 3ef89171538ffd03..ff88af8e39d3fa10 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -120,8 +120,7 @@
 
 		gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
 		gpios-states = <1>;
-		states = <3300000 1
-			  1800000 0>;
+		states = <3300000 1>, <1800000 0>;
 	};
 
 	x12_clk: x12 {
-- 
2.17.1

