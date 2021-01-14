Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C151F2F5AD8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Jan 2021 07:46:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbhANGpn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Jan 2021 01:45:43 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:47076 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbhANGpm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jan 2021 01:45:42 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69D9C8D7;
        Thu, 14 Jan 2021 07:44:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610606699;
        bh=yAvGiS6Vk7kdeRqJr5jBbpyrqcepI1I6oN3UWiPS+Uc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Xj4LP6jgG4ZngYnYYcfwJVq5H+qtj8ZxeiKZuEq2QGj2sYHuMaE8zMK46hvRGDB3S
         B7Kx0uiczfnjqdujQ8l1am98H3mCNBsEwRDOWiTEIYrCiPHsq3f2sjOSok5JrvkovV
         60BlsEtDYRNTbKOyXXSwNGqXUALVmztvNvZniVYo=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Sandy Huang <hjc@rock-chips.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Yao <markyao0591@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v4 2/7] dt-bindings: display: bridge: Add YAML schema for Synopsys DW-HDMI
Date:   Thu, 14 Jan 2021 08:44:32 +0200
Message-Id: <20210114064437.5793-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210114064437.5793-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210114064437.5793-1-laurent.pinchart+renesas@ideasonboard.com>
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
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes since v3:

- Drop ports property

Changes since v1:

- Add default to reg-io-width property
- Add additionalProperties
- Rebase on top of OF graph schema, dropped redundant properties
- Drop cec clock as it's device-specific
- Increase max clocks to 5 to accommodate the Rockchip DW-HDMI
---
 .../display/bridge/synopsys,dw-hdmi.yaml      | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
new file mode 100644
index 000000000000..9be44a682e67
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
@@ -0,0 +1,55 @@
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
+additionalProperties: true
+
+...
-- 
Regards,

Laurent Pinchart

