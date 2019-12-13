Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9427F11E883
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2019 17:42:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbfLMQlS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Dec 2019 11:41:18 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:58958 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728357AbfLMQlS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Dec 2019 11:41:18 -0500
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id dUhG2100Q5USYZQ01UhGqp; Fri, 13 Dec 2019 17:41:16 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ifo0C-0006uQ-FN; Fri, 13 Dec 2019 17:41:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ifo0C-0000yx-ER; Fri, 13 Dec 2019 17:41:16 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: sh73a0: Add missing clock-frequency for fixed clocks
Date:   Fri, 13 Dec 2019 17:41:09 +0100
Message-Id: <20191213164115.3697-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213164115.3697-1-geert+renesas@glider.be>
References: <20191213164115.3697-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

"clock-frequency" is a required property for devices nodes compatible
with "fixed-clock", leading to warnings when running

    $ make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/clock/fixed-clock.yaml
    arch/arm/boot/dts/sh73a0-kzm9g.dt.yaml: extcki: 'clock-frequency' is a required property

Fix this by adding the missing "clock-frequency" properties to the various
clocks, to be overridden by the board DTS files when populated.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/sh73a0.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/sh73a0.dtsi b/arch/arm/boot/dts/sh73a0.dtsi
index 7efe33c4d041a524..7c67581f57422a26 100644
--- a/arch/arm/boot/dts/sh73a0.dtsi
+++ b/arch/arm/boot/dts/sh73a0.dtsi
@@ -624,19 +624,25 @@
 		extal2_clk: extal2 {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
+			/* This value must be overridden by the board. */
+			clock-frequency = <0>;
 		};
 		extcki_clk: extcki {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
+			/* This value can be overridden by the board. */
+			clock-frequency = <0>;
 		};
 		fsiack_clk: fsiack {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
+			/* This value can be overridden by the board. */
 			clock-frequency = <0>;
 		};
 		fsibck_clk: fsibck {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
+			/* This value can be overridden by the board. */
 			clock-frequency = <0>;
 		};
 
-- 
2.17.1

