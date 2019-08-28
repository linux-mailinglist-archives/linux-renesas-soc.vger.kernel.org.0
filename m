Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89837A09A6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2019 20:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbfH1Sg7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Aug 2019 14:36:59 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:45272 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726711AbfH1Sg6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Aug 2019 14:36:58 -0400
X-IronPort-AV: E=Sophos;i="5.64,442,1559487600"; 
   d="scan'208";a="25166325"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 29 Aug 2019 03:36:56 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0B3614004953;
        Thu, 29 Aug 2019 03:36:52 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>, sam@ravnborg.org
Subject: [PATCH v3 1/8] dt-bindings: display: Add bindings for LVDS bus-timings
Date:   Wed, 28 Aug 2019 19:36:35 +0100
Message-Id: <1567017402-5895-2-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dual-LVDS connections need markers in the DT, this patch adds
some common documentation to be referenced by both panels and
bridges.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

---
v2->v3:
* new patch
---
 .../bindings/display/bus-timings/lvds.yaml         | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bus-timings/lvds.yaml

diff --git a/Documentation/devicetree/bindings/display/bus-timings/lvds.yaml b/Documentation/devicetree/bindings/display/bus-timings/lvds.yaml
new file mode 100644
index 0000000..f35b55a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bus-timings/lvds.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bus-timings/lvds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common Properties for bus timings of LVDS interfaces
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Fabrizio Castro <fabrizio.castro@bp.renesas.com>
+
+description: |
+  This document defines device tree properties common to LVDS and dual-LVDS
+  interfaces, where a dual-LVDS interface is a dual-link connection with even
+  pixels traveling on one connection, and with odd pixels traveling on the other
+  connection.
+  This document doesn't constitue a device tree binding specification by itself
+  but is meant to be referenced by device tree bindings.
+  When referenced from panel or bridge device tree bindings, the properties
+  defined in this document are defined as follows. The panel and bridge device
+  tree bindings are responsible for defining whether each property is required
+  or optional.
+
+properties:
+  dual-lvds-even-pixels:
+    type: boolean
+    description:
+      This property is specific to an input port of a sink device. When
+      specified, it marks the port as recipient of even-pixels.
+
+  dual-lvds-odd-pixels:
+    type: boolean
+    description:
+      This property is specific to an input port of a sink device. When
+      specified, it marks the port as recipient of odd-pixels.
+
+...
-- 
2.7.4

