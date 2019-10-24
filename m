Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E989E3018
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Oct 2019 13:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408076AbfJXLRE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Oct 2019 07:17:04 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:14863 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2408067AbfJXLRE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Oct 2019 07:17:04 -0400
X-IronPort-AV: E=Sophos;i="5.68,224,1569250800"; 
   d="scan'208";a="29695327"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 24 Oct 2019 20:17:01 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B6AC14209FBF;
        Thu, 24 Oct 2019 20:17:01 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, geert+renesas@glider.be
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/3] dt-bindings: clock: renesas: rcar-usb2-clock-sel: Fix clock[-name]s properties
Date:   Thu, 24 Oct 2019 20:16:59 +0900
Message-Id: <1571915821-1620-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571915821-1620-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1571915821-1620-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
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

