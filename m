Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B10F0A7D93
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2019 10:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728209AbfIDIW0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Sep 2019 04:22:26 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:62336 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726045AbfIDIWZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Sep 2019 04:22:25 -0400
X-IronPort-AV: E=Sophos;i="5.64,465,1559487600"; 
   d="scan'208";a="25494220"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 04 Sep 2019 17:22:24 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D477241D31D3;
        Wed,  4 Sep 2019 17:22:20 +0900 (JST)
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
Subject: [PATCH RESEND v7 1/3] dt-bindings: usb: hd3ss3220 device tree binding document
Date:   Wed,  4 Sep 2019 09:15:39 +0100
Message-Id: <1567584941-13690-2-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567584941-13690-1-git-send-email-biju.das@bp.renesas.com>
References: <1567584941-13690-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device tree binding document for TI HD3SS3220 Type-C DRP port
controller driver.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
V7--> V7 RESEND
   * Added Rob's Reviewed by tag.
v6-->V7
   * Removed Rob's reviewed by tag, since there is a rework
   * Incorporated Sergie and Shimoda-San's review comment
     (https://patchwork.kernel.org/patch/10944629/)
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
 .../devicetree/bindings/usb/ti,hd3ss3220.txt       | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt

diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
new file mode 100644
index 0000000..25780e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
@@ -0,0 +1,38 @@
+TI HD3SS3220 TypeC DRP Port Controller.
+
+Required properties:
+ - compatible: Must be "ti,hd3ss3220".
+ - reg: I2C slave address, must be 0x47 or 0x67 based on ADDR pin.
+ - interrupts: An interrupt specifier.
+
+Required sub-node:
+ - connector: The "usb-c-connector" attached to the hd3ss3220 chip. The
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
+	connector {
+		compatible = "usb-c-connector";
+		label = "USB-C";
+		data-role = "dual";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@1 {
+				reg = <1>;
+				hd3ss3220_ep: endpoint {
+					remote-endpoint = <&usb3_role_switch>;
+				};
+			};
+		};
+	};
+};
-- 
2.7.4

