Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAEEF1F3A7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 14:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728544AbfEOMQj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 08:16:39 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:22171 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727929AbfEOMQi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 08:16:38 -0400
X-IronPort-AV: E=Sophos;i="5.60,472,1549897200"; 
   d="scan'208";a="15815955"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 15 May 2019 21:16:37 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 16FC9400F515;
        Wed, 15 May 2019 21:16:33 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 1/7] dt-bindings: usb: hd3ss3220 device tree binding document
Date:   Wed, 15 May 2019 13:09:06 +0100
Message-Id: <1557922152-16449-2-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557922152-16449-1-git-send-email-biju.das@bp.renesas.com>
References: <1557922152-16449-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device tree binding document for TI HD3SS3220 Type-C DRP port
controller driver.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
V5-->V6
  * No change.
V4-->V5
  * No Change.
V3-->V4
  * No Change.
V2-->V3
  * Added Rob's Reviewed by tag.
V1-->V2
  * Added connector node.
  * updated the example with connector node.
---
 .../devicetree/bindings/usb/ti,hd3ss3220.txt       | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt

diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
new file mode 100644
index 0000000..7f41400
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
@@ -0,0 +1,37 @@
+TI HD3SS3220 TypeC DRP Port Controller.
+
+Required properties:
+ - compatible: Must be "ti,hd3ss3220".
+ - reg: I2C slave address, must be 0x47 or 0x67 based on ADDR pin.
+ - interrupts: <a b> where a is the interrupt number and b represents an
+   encoding of the sense and level information for the interrupt.
+
+Required sub-node:
+ - connector : The "usb-c-connector" attached to the hd3ss3220 chip. The
+   bindings of the connector node are specified in:
+
+	Documentation/devicetree/bindings/connector/usb-connector.txt
+
+Example:
+hd3ss3220@47 {
+	compatible = "ti,hd3ss3220";
+	reg = <0x47>;
+	interrupt-parent = <&gpio6>;
+	interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+
+	usb_con: connector {
+		compatible = "usb-c-connector";
+		label = "USB-C";
+		data-role = "dual";
+	};
+
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hd3ss3220_ep: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&usb3peri_role_switch>;
+		};
+	};
+};
-- 
2.7.4

