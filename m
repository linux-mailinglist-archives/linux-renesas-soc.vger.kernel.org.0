Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01FCA9C415
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 25 Aug 2019 15:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728402AbfHYNuk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 25 Aug 2019 09:50:40 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:51951 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727941AbfHYNuk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Aug 2019 09:50:40 -0400
X-Originating-IP: 87.18.63.98
Received: from uno.homenet.telecomitalia.it (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 3D5D2C0003;
        Sun, 25 Aug 2019 13:50:35 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli@fpond.eu, airlied@linux.ie, daniel@ffwll.ch
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com
Subject: [PATCH v3 01/14] dt-bindings: display: renesas,cmm: Add R-Car CMM documentation
Date:   Sun, 25 Aug 2019 15:51:41 +0200
Message-Id: <20190825135154.11488-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device tree bindings documentation for the Renesas R-Car Display
Unit Color Management Module.

CMM is the image enhancement module available on each R-Car DU video
channel on R-Car Gen2 and Gen3 SoCs (V3H and V3M excluded).

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../bindings/display/renesas,cmm.txt          | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/renesas,cmm.txt

diff --git a/Documentation/devicetree/bindings/display/renesas,cmm.txt b/Documentation/devicetree/bindings/display/renesas,cmm.txt
new file mode 100644
index 000000000000..bc599b69c278
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/renesas,cmm.txt
@@ -0,0 +1,33 @@
+* Renesas R-Car Color Management Module (CMM)
+
+Renesas R-Car image enhancement module connected to R-Car DU video channels.
+
+Required properties:
+ - compatible: shall be one or more of the following:
+   - "renesas,cmm-r8a7795": for R8A7795 (R-Car H3) compatible CMM.
+   - "renesas,cmm-r8a7796": for R8A7796 (R-Car M3-W) compatible CMM.
+   - "renesas,cmm-r8a77965": for R8A77965 (R-Car M3-N) compatible CMM.
+   - "renesas,cmm-r8a77990": for R8A77990 (R-Car E3) compatible CMM.
+   - "renesas,cmm-r8a77995": for R8A77995 (R-Car D3) compatible CMM.
+   - "renesas,rcar-gen3-cmm": for a generic R-Car Gen3 compatible CMM.
+   - "renesas,rcar-gen2-cmm": for a generic R-Car Gen2 compatible CMM.
+
+   When the generic compatible string is specified, the SoC-specific
+   version corresponding to the platform should be listed first.
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
+		compatible = "renesas,cmm-r8a7796";
+		reg = <0 0xfea40000 0 0x1000>;
+		power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+		clocks = <&cpg CPG_MOD 711>;
+		resets = <&cpg 711>;
+	};
--
2.22.0

