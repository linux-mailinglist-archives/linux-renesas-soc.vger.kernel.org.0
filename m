Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E72FA7D9A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2019 10:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728604AbfIDIWd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Sep 2019 04:22:33 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:16592 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726045AbfIDIWd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Sep 2019 04:22:33 -0400
X-IronPort-AV: E=Sophos;i="5.64,465,1559487600"; 
   d="scan'208";a="25713204"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Sep 2019 17:22:31 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5D28741D38EA;
        Wed,  4 Sep 2019 17:22:28 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH RESEND v7 3/3] dt-bindings: usb: renesas_usb3: Document usb role switch support
Date:   Wed,  4 Sep 2019 09:15:41 +0100
Message-Id: <1567584941-13690-4-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567584941-13690-1-git-send-email-biju.das@bp.renesas.com>
References: <1567584941-13690-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Update the DT bindings documentation to support usb role switch
for USB Type-C connector using USB role switch class framework.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 V7--> V7 RESEND
  * Rebased to the new file name renesas,usb3-peri.txt.
  * Added Reviewed-by tags of Rob and Shimoda-San.
 V6-->V7
  * Incorporated shimoda-san's review comments.
    (https://patchwork.kernel.org/patch/10944631/)
 V5-->V6
  * Updated description
  * Added usb-role-switch-property
 V4-->V5
  * No Change
 V3-->V4
  * No Change
 V2-->V3
  * Added optional renesas,usb-role-switch property.
 V1-->V2
  * Added usb-role-switch-property
  * Updated the example with usb-role-switch property.
---
 .../devicetree/bindings/usb/renesas,usb3-peri.txt  | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.txt b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.txt
index 35039e7..5eecfbc 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.txt
+++ b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.txt
@@ -22,6 +22,12 @@ Required properties:
 Optional properties:
   - phys: phandle + phy specifier pair
   - phy-names: must be "usb"
+  - usb-role-switch: support role switch. see usb/generic.txt
+
+Sub-nodes:
+- any connector to the data bus of this controller should be modelled using the
+  OF graph bindings specified in bindings/graph.txt, if the "usb-role-switch"
+  property is used.
 
 Example of R-Car H3 ES1.x:
 	usb3_peri0: usb@ee020000 {
@@ -39,3 +45,20 @@ Example of R-Car H3 ES1.x:
 		interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cpg CPG_MOD 327>;
 	};
+
+Example of RZ/G2E:
+	usb3_peri0: usb@ee020000 {
+		compatible = "renesas,r8a774c0-usb3-peri",
+			     "renesas,rcar-gen3-usb3-peri";
+		reg = <0 0xee020000 0 0x400>;
+		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cpg CPG_MOD 328>;
+		companion = <&xhci0>;
+		usb-role-switch;
+
+		port {
+			usb3_role_switch: endpoint {
+				remote-endpoint = <&hd3ss3220_ep>;
+			};
+		};
+	};
-- 
2.7.4

