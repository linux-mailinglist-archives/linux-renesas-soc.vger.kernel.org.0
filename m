Return-Path: <linux-renesas-soc+bounces-787-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 978A4807429
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Dec 2023 16:58:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7B6D1C20AB2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Dec 2023 15:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7863D45BFF;
	Wed,  6 Dec 2023 15:58:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 14CE0D41;
	Wed,  6 Dec 2023 07:58:17 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,255,1695654000"; 
   d="scan'208";a="189413102"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 07 Dec 2023 00:58:17 +0900
Received: from localhost.localdomain (unknown [10.226.92.248])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 26AE2400FC2B;
	Thu,  7 Dec 2023 00:58:11 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Support Opensource <support.opensource@diasemi.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 6/8] dt-bindings: thermal: Convert da906{1,2} thermal to json-schema
Date: Wed,  6 Dec 2023 15:57:38 +0000
Message-Id: <20231206155740.5278-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231206155740.5278-1-biju.das.jz@bp.renesas.com>
References: <20231206155740.5278-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the da906{1,2} thermal device tree binding documentation to
json-schema.

Update MAINTAINERS entries and description by referring to
dlg,da9062-thermal.yaml binding file.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v3->v4:
 * Restored the patch from v2.
 * Dropped example
 * Replaced enum->const for compatible property.
 * Added Rb tag from Rob and retained Rb tag as changes are trivial.
v2->v3:
 * Fixed bot errors related to MAINTAINERS entry, invalid doc
   references and thermal examples by merging patch#4.
v2:
 * New patch
---
 .../devicetree/bindings/mfd/da9062.txt        |  2 +-
 .../bindings/thermal/da9062-thermal.txt       | 36 -------------------
 .../bindings/thermal/dlg,da9062-thermal.yaml  | 35 ++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 4 files changed, 37 insertions(+), 38 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/thermal/da9062-thermal.txt
 create mode 100644 Documentation/devicetree/bindings/thermal/dlg,da9062-thermal.yaml

diff --git a/Documentation/devicetree/bindings/mfd/da9062.txt b/Documentation/devicetree/bindings/mfd/da9062.txt
index 154c31fa4443..c8a7f119ac84 100644
--- a/Documentation/devicetree/bindings/mfd/da9062.txt
+++ b/Documentation/devicetree/bindings/mfd/da9062.txt
@@ -88,7 +88,7 @@ Sub-nodes:
 
 - watchdog: See ../watchdog/dlg,da9062-watchdog.yaml
 
-- thermal : See ../thermal/da9062-thermal.txt
+- thermal : See ../thermal/dlg,da9062-thermal.yaml
 
 Example:
 
diff --git a/Documentation/devicetree/bindings/thermal/da9062-thermal.txt b/Documentation/devicetree/bindings/thermal/da9062-thermal.txt
deleted file mode 100644
index e241bb5a5584..000000000000
--- a/Documentation/devicetree/bindings/thermal/da9062-thermal.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-* Dialog DA9062/61 TJUNC Thermal Module
-
-This module is part of the DA9061/DA9062. For more details about entire
-DA9062 and DA9061 chips see Documentation/devicetree/bindings/mfd/da9062.txt
-
-Junction temperature thermal module uses an interrupt signal to identify
-high THERMAL_TRIP_HOT temperatures for the PMIC device.
-
-Required properties:
-
-- compatible: should be one of the following valid compatible string lines:
-        "dlg,da9061-thermal", "dlg,da9062-thermal"
-        "dlg,da9062-thermal"
-
-Optional properties:
-
-- polling-delay-passive : Specify the polling period, measured in
-    milliseconds, between thermal zone device update checks.
-
-Example: DA9062
-
-	pmic0: da9062@58 {
-		thermal {
-			compatible = "dlg,da9062-thermal";
-			polling-delay-passive = <3000>;
-		};
-	};
-
-Example: DA9061 using a fall-back compatible for the DA9062 onkey driver
-
-	pmic0: da9061@58 {
-		thermal {
-			compatible = "dlg,da9061-thermal", "dlg,da9062-thermal";
-			polling-delay-passive = <3000>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/thermal/dlg,da9062-thermal.yaml b/Documentation/devicetree/bindings/thermal/dlg,da9062-thermal.yaml
new file mode 100644
index 000000000000..206635f74850
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/dlg,da9062-thermal.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/dlg,da9062-thermal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dialog DA9062/61 TJUNC Thermal Module
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+
+description: |
+  This module is part of the DA9061/DA9062. For more details about entire
+  DA9062 and DA9061 chips see Documentation/devicetree/bindings/mfd/da9062.txt
+
+  Junction temperature thermal module uses an interrupt signal to identify
+  high THERMAL_TRIP_HOT temperatures for the PMIC device.
+
+properties:
+  compatible:
+    oneOf:
+      - const: dlg,da9062-thermal
+      - items:
+          - const: dlg,da9061-thermal
+          - const: dlg,da9062-thermal
+
+  polling-delay-passive:
+    description:
+      Specify the polling period, measured in milliseconds, between
+      thermal zone device update checks.
+
+required:
+  - compatible
+
+additionalProperties: false
diff --git a/MAINTAINERS b/MAINTAINERS
index ea171a18217c..2676bda79de3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6118,7 +6118,7 @@ F:	Documentation/devicetree/bindings/regulator/da92*.txt
 F:	Documentation/devicetree/bindings/regulator/dlg,da9*.yaml
 F:	Documentation/devicetree/bindings/regulator/dlg,slg51000.yaml
 F:	Documentation/devicetree/bindings/sound/da[79]*.txt
-F:	Documentation/devicetree/bindings/thermal/da90??-thermal.txt
+F:	Documentation/devicetree/bindings/thermal/dlg,da9062-thermal.yaml
 F:	Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
 F:	Documentation/hwmon/da90??.rst
 F:	drivers/gpio/gpio-da90??.c
-- 
2.39.2


