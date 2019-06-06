Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 369CB37649
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 16:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728249AbfFFOVk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 10:21:40 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:35247 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727378AbfFFOVk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 10:21:40 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B7C682000E;
        Thu,  6 Jun 2019 14:21:34 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/20] dt-bindings: display: renesas,cmm: Add R-Car CMM documentation
Date:   Thu,  6 Jun 2019 16:22:01 +0200
Message-Id: <20190606142220.1392-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device tree bindings documentation for the Renesas R-Car Display
Unit Color Management Module.

CMM is the image enhancement module available on each R-Car DU video
channel on Gen2 and Gen3 SoCs (V3H and V3M excluded).

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../bindings/display/renesas,cmm.txt          | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/renesas,cmm.txt

diff --git a/Documentation/devicetree/bindings/display/renesas,cmm.txt b/Documentation/devicetree/bindings/display/renesas,cmm.txt
new file mode 100644
index 000000000000..d8d3cf9ce2ce
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/renesas,cmm.txt
@@ -0,0 +1,25 @@
+* Renesas R-Car Color Management Module (CMM)
+
+Renesas R-Car image enhancement module connected to R-Car DU video channels.
+
+Required properties:
+ - compatible: shall be one of:
+   - "renesas,cmm-gen3"
+   - "renesas,cmm-gen2"
+
+ - reg: the address base and length of the memory area where CMM control
+   registers are mapped to.
+
+ - clocks: phandle and clock-specifier pair to the CMM functional clock
+   supplier.
+
+Example:
+--------
+
+	cmm0: cmm@fea40000 {
+		compatible = "renesas,cmm";
+		reg = <0 0xfea40000 0 0x1000>;
+		power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+		clocks = <&cpg CPG_MOD 711>;
+		resets = <&cpg 711>;
+	};
-- 
2.21.0

