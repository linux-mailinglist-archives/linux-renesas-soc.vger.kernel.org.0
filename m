Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF89E19EE94
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Apr 2020 01:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727509AbgDEXjv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 5 Apr 2020 19:39:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34738 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727612AbgDEXjv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 5 Apr 2020 19:39:51 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E64D055B;
        Mon,  6 Apr 2020 01:39:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586129989;
        bh=A4s9WiGrTY3ZplkfZ3y9IrJCSbSlow02mxNcLe1d3XQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YhhRHmxVYfNdgz1pNnlYl56B7EfwS5t/AgBvpWKSA55mC3FnOMMtz0gHXyhCzAZIL
         mF1UoprrxpUI1SKAQMg17AoFQUj3HX9FzHnClbQZAkPe4FFYuMo+0Tuv56/z3ag150
         9fHQjibX78VVUvi7RtOUVL760QokhzOO4MfEAVCA=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     devicetree@vger.kernel.org
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mark Yao <mark.yao@rock-chips.com>,
        Sandy Huang <hjc@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH/RFC 1/6] dt-bindings: display: bridge: Add YAML schema for Synopsys DW-HDMI
Date:   Mon,  6 Apr 2020 02:39:30 +0300
Message-Id: <20200405233935.27599-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200405233935.27599-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200405233935.27599-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a .yaml schema containing the common properties for the Synopsys
DesignWare HDMI TX controller. This isn't a full device tree binding
specification, but is meant to be referenced by platform-specific
bindings for the IP core.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../display/bridge/synopsys,dw-hdmi.yaml      | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
new file mode 100644
index 000000000000..6ebb8f7d2ba8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
@@ -0,0 +1,68 @@
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
+      Width (in bytes) of the registers specified by the reg property. The
+      register width defaults to 1 if the property is not present.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [1, 4]
+
+  clocks:
+    minItems: 2
+    maxItems: 3
+    items:
+      - description: The bus clock for either AHB and APB
+      - description: The internal register configuration clock
+      - description: The HDMI CEC controller main clock
+
+  clock-names:
+    minItems: 2
+    maxItems: 3
+    items:
+      - const: iahb
+      - const: isfr
+      - const: cec
+
+  interrupts:
+    maxItems: 1
+
+  ports:
+    type: object
+    description: |
+      The connectivity of the DWC HDMI TX with the rest of the system is
+      expressed using ports as specified in the device graph bindings defined
+      in Documentation/devicetree/bindings/graph.txt. The numbering of the ports
+      is platform-specific.
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+...
-- 
Regards,

Laurent Pinchart

