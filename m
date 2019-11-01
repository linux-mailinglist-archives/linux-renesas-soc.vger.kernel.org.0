Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB37EBE45
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Nov 2019 08:03:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729485AbfKAHDO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Nov 2019 03:03:14 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:63273 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728989AbfKAHDN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Nov 2019 03:03:13 -0400
X-IronPort-AV: E=Sophos;i="5.68,254,1569250800"; 
   d="scan'208";a="30605230"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Nov 2019 16:03:11 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id BB9FE419B1D2;
        Fri,  1 Nov 2019 16:03:11 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, geert+renesas@glider.be
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 2/4] dt-bindings: clock: renesas: rcar-usb2-clock-sel: Add power-domains and resets properties
Date:   Fri,  1 Nov 2019 16:03:09 +0900
Message-Id: <1572591791-11280-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572591791-11280-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1572591791-11280-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds missing required properties of power-domains and resets.
Fortunately, no one has this device node for now, so that we don't
need to think of backward compatibility.

Fixes: 311accb64570 ("clk: renesas: rcar-usb2-clock-sel: Add R-Car USB 2.0 clock selector PHY")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
index 5c1903f..8e96640 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
@@ -43,6 +43,9 @@ Required properties:
  - The USB_EXTAL clock pin must be "usb_extal"
  - The USB_XTAL clock pin must be "usb_xtal"
 - #clock-cells: Must be 0
+- power-domains: A phandle and symbolic PM domain specifier.
+                 See power/renesas,rcar-sysc.txt.
+- resets: A list of phandles and specifier pairs.
 
 Example (R-Car H3):
 
@@ -54,4 +57,6 @@ Example (R-Car H3):
 			 <&usb_extal>, <&usb_xtal>;
 		clock-names = "ehci_ohci", "hs-usb-if", "usb_extal", "usb_xtal";
 		#clock-cells = <0>;
+		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+		resets = <&cpg 703>, <&cpg 704>;
 	};
-- 
2.7.4

