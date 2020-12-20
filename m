Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4659C2DF6B6
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Dec 2020 20:54:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbgLTTy0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Dec 2020 14:54:26 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:53110 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726584AbgLTTy0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Dec 2020 14:54:26 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E7D8045E;
        Sun, 20 Dec 2020 20:50:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608493819;
        bh=r500VogUG2STcIuAc/UQqHpr6ZmYpBHy/1ydmJVZ+iE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aDLO70XhaTfutHDLgfyVxG0/2ew1kZyGDSvijuVuts5lf4D/LIzKnagsDOBb838Uf
         jPrS2o1qkz/YHbEsLNAQv2wLpzHYG8ckmph0Z862k12knCNkUJNf/UKKX65t+whUdC
         nuWtLGbHKgxtAvBzqBtETBQfNZWNJHc72AczDodU=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Herring <robh+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
        linux-renesas-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Mark Yao <mark.yao@rock-chips.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 1/6] dt-bindings: display: bridge: Add YAML schema for Synopsys DW-HDMI
Date:   Sun, 20 Dec 2020 21:50:00 +0200
Message-Id: <20201220195005.26438-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201220195005.26438-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201220195005.26438-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a .yaml schema containing the common properties for the Synopsys
DesignWare HDMI TX controller. This isn't a full device tree binding
specification, but is meant to be referenced by platform-specific
bindings for the IP core.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Add default to reg-io-width property
- Add additionalProperties
- Rebase on top of OF graph schema, dropped redundant properties
- Drop cec clock as it's device-specific
- Increase max clocks to 5 to accommodate the Rockchip DW-HDMI
---
 .../display/bridge/synopsys,dw-hdmi.yaml      | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
new file mode 100644
index 000000000000..96c4bc06dbe7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/synopsys,dw-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common Properties for Synopsys DesignWare HDMI TX Controller
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+
+description: |
+  This document defines device tree properties for the Synopsys DesignWare HDMI
+  TX controller (DWC HDMI TX) IP core. It doesn't constitute a full device tree
+  binding specification by itself but is meant to be referenced by device tree
+  bindings for the platform-specific integrations of the DWC HDMI TX.
+
+  When referenced from platform device tree bindings the properties defined in
+  this document are defined as follows. The platform device tree bindings are
+  responsible for defining whether each property is required or optional.
+
+properties:
+  reg:
+    maxItems: 1
+
+  reg-io-width:
+    description:
+      Width (in bytes) of the registers specified by the reg property.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [1, 4]
+    default: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 5
+    items:
+      - description: The bus clock for either AHB and APB
+      - description: The internal register configuration clock
+    additionalItems: true
+
+  clock-names:
+    minItems: 2
+    maxItems: 5
+    items:
+      - const: iahb
+      - const: isfr
+    additionalItems: true
+
+  interrupts:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+additionalProperties: true
+
+...
-- 
Regards,

Laurent Pinchart

