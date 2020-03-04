Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C218B178ABB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2020 07:42:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727130AbgCDGmV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Mar 2020 01:42:21 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:51067 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725797AbgCDGmU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Mar 2020 01:42:20 -0500
X-IronPort-AV: E=Sophos;i="5.70,513,1574089200"; 
   d="scan'208";a="40932655"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Mar 2020 15:42:18 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5659841CBCC4;
        Wed,  4 Mar 2020 15:42:18 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v4 1/4] dt-bindings: clock: renesas: rcar-usb2-clock-sel: Fix clock[-name]s properties
Date:   Wed,  4 Mar 2020 15:42:14 +0900
Message-Id: <1583304137-28482-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583304137-28482-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1583304137-28482-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Since the hardware requires to enable both USB 2.0 host and peripheral
functional clock, this patch fixes the documentation.
Fortunately, no one has this device node for now, so that we don't
need to think of backward compatibility.

Fixes: 311accb64570 ("clk: renesas: rcar-usb2-clock-sel: Add R-Car USB 2.0 clock selector PHY")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt     | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
index 83f6c6a..5c1903f 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
@@ -38,7 +38,8 @@ Required properties:
 - reg: offset and length of the USB 2.0 clock selector register block.
 - clocks: A list of phandles and specifier pairs.
 - clock-names: Name of the clocks.
- - The functional clock must be "ehci_ohci"
+ - The functional clock of USB 2.0 host side must be "ehci_ohci"
+ - The functional clock of HS-USB side must be "hs-usb-if"
  - The USB_EXTAL clock pin must be "usb_extal"
  - The USB_XTAL clock pin must be "usb_xtal"
 - #clock-cells: Must be 0
@@ -49,7 +50,8 @@ Example (R-Car H3):
 		compatible = "renesas,r8a7795-rcar-usb2-clock-sel",
 			     "renesas,rcar-gen3-usb2-clock-sel";
 		reg = <0 0xe6590630 0 0x02>;
-		clocks = <&cpg CPG_MOD 703>, <&usb_extal>, <&usb_xtal>;
-		clock-names = "ehci_ohci", "usb_extal", "usb_xtal";
+		clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>,
+			 <&usb_extal>, <&usb_xtal>;
+		clock-names = "ehci_ohci", "hs-usb-if", "usb_extal", "usb_xtal";
 		#clock-cells = <0>;
 	};
-- 
2.7.4

