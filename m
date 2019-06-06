Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABC4D36F0F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 10:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727450AbfFFIsc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 04:48:32 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:56490 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbfFFIsc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 04:48:32 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D2B8E25B746;
        Thu,  6 Jun 2019 18:48:30 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id C843DE21A74; Thu,  6 Jun 2019 10:48:28 +0200 (CEST)
Date:   Thu, 6 Jun 2019 10:48:28 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: rza2mevb: Add input switch
Message-ID: <20190606084827.2cg6eab3gvjvtfmd@verge.net.au>
References: <20190604200914.64896-1-chris.brandt@renesas.com>
 <20190604200914.64896-3-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190604200914.64896-3-chris.brandt@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jun 04, 2019 at 03:09:14PM -0500, Chris Brandt wrote:
> Add support for input switch SW3 on the Renesas RZ/A2M EVB
> development board.
> 
> Note that this uses the IRQ interrupt, as the RZ/A2 GPIO controller
> does not include interrupt support
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thanks Chris,

I have applied this for inclusion in v5.3.

There was a minor conflict when applying the pinctl portion
of the patch which I have resolved. The result is as follows.

From 198120684b54efe8de4309b359d1ed36fdefa68c Mon Sep 17 00:00:00 2001
From: Chris Brandt <chris.brandt@renesas.com>
Date: Tue, 4 Jun 2019 15:09:14 -0500
Subject: [PATCH] ARM: dts: rza2mevb: Add input switch

Add support for input switch SW3 on the Renesas RZ/A2M EVB
development board.

Note that this uses the IRQ interrupt, as the RZ/A2 GPIO controller
does not include interrupt support

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
[simon: resolved minor merge conflict]
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r7s9210-rza2mevb.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/r7s9210-rza2mevb.dts b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
index 991e09de1219..25dd813d966e 100644
--- a/arch/arm/boot/dts/r7s9210-rza2mevb.dts
+++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
@@ -9,6 +9,7 @@
 /dts-v1/;
 #include "r7s9210.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/r7s9210-pinctrl.h>
 
 / {
@@ -29,6 +30,21 @@
 		reg = <0x40000000 0x00800000>;	 /* HyperRAM */
 	};
 
+	keyboard {
+		compatible = "gpio-keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&keyboard_pins>;
+
+		key-3 {
+			interrupt-parent = <&irqc>;
+			interrupts = <0 IRQ_TYPE_EDGE_BOTH>;
+			linux,code = <KEY_3>;
+			label = "SW3";
+			wakeup-source;
+		};
+	};
+
 	lbsc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -57,6 +73,10 @@
 };
 
 &pinctrl {
+	keyboard_pins: keyboard {
+		pinmux = <RZA2_PINMUX(PORTJ, 1, 6)>;    /* IRQ0 */
+	};
+
 	/* Serial Console */
 	scif4_pins: serial4 {
 		pinmux = <RZA2_PINMUX(PORT9, 0, 4)>,	/* TxD4 */
-- 
2.11.0

