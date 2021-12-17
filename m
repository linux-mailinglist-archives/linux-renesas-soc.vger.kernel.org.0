Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86ED6478D4E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Dec 2021 15:20:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234547AbhLQOUt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Dec 2021 09:20:49 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:43497 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232629AbhLQOUs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Dec 2021 09:20:48 -0500
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id C1E1D60014;
        Fri, 17 Dec 2021 14:20:45 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        <linux-mtd@lists.infradead.org>
Cc:     Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@kernel.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Ralph Siemsen <ralph.siemsen@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v6 4/4] ARM: dts: r9a06g032: Describe the NAND controller
Date:   Fri, 17 Dec 2021 15:20:33 +0100
Message-Id: <20211217142033.353599-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211217142033.353599-1-miquel.raynal@bootlin.com>
References: <20211217142033.353599-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe the NAND controller embedded in r9a06g032 SoCs.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r9a06g032.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
index c47896e4ab58..db657224688a 100644
--- a/arch/arm/boot/dts/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/r9a06g032.dtsi
@@ -173,6 +173,17 @@ pinctrl: pinctrl@40067000 {
 			status = "okay";
 		};
 
+		nand_controller: nand-controller@40102000 {
+			compatible = "renesas,r9a06g032-nandc", "renesas,rzn1-nandc";
+			reg = <0x40102000 0x2000>;
+			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sysctrl R9A06G032_HCLK_NAND>, <&sysctrl R9A06G032_CLK_NAND>;
+			clock-names = "hclk", "eclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@44101000 {
 			compatible = "arm,gic-400", "arm,cortex-a7-gic";
 			interrupt-controller;
-- 
2.27.0

