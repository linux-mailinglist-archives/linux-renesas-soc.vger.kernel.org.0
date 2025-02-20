Return-Path: <linux-renesas-soc+bounces-13425-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C65A3DEA2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 16:33:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D1BF3B5542
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 15:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578271FECBF;
	Thu, 20 Feb 2025 15:27:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416B71FECB7;
	Thu, 20 Feb 2025 15:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740065279; cv=none; b=GkALMfww5VmshV+RWC+/IraAAdNG6Ydz5FYuW6eL1BYSV3jVyJ+9UYfM4xhUhC2Lrk0MVIxNmwyWztlEW1TpokzTx0a65Rq2aQZl4JtR3L36JOeHBqQB7Nuph+yyo+E2XSziqxY6Dh3pe6PmfL58o55KjXJIN5y1aB7m9658t/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740065279; c=relaxed/simple;
	bh=lltjCxSACX4dIgRaewwZ3RjDCnc5CGhnssBfqxb+fO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C8qFddTpCJZSLk0lMyhP3Svo+00vkW90GSsJvNbB8Vsr8NDCd/0fVnJZFBLxwDzU8Ez9Uh6ka8oVVjTix/TfhmKlzG7syS/v/Q7sN5SYy7x7hW0H9FD0zewLn2tsFckMK6inE4xM0amOougcnlYTcvXN1I3NNcOIJp1WZu5+dVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: HN3gl9ZlScWFVVc5LlRkdw==
X-CSE-MsgGUID: IrStMltHSSaW9AU/DCDXzQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 Feb 2025 00:27:56 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.134])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4F11B40436EB;
	Fri, 21 Feb 2025 00:27:50 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: mturquette@baylibre.com,
	magnus.damm@gmail.com,
	krzk+dt@kernel.org,
	rui.zhang@intel.com,
	daniel.lezcano@linaro.org,
	sboyd@kernel.org,
	geert+renesas@glider.be,
	lukasz.luba@arm.com,
	rafael@kernel.org,
	robh@kernel.org,
	p.zabel@pengutronix.de
Cc: biju.das.jz@bp.renesas.com,
	claudiu.beznea.uj@bp.renesas.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	john.madieu@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH 3/7] dt-bindings: thermal: r9a09g047-tsu: Document the TSU unit
Date: Thu, 20 Feb 2025 16:26:08 +0100
Message-ID: <20250220152640.49010-4-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250220152640.49010-1-john.madieu.xa@bp.renesas.com>
References: <20250220152640.49010-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Renesas RZ/G3E SoC includes a Thermal Sensor Unit (TSU) block designed
to measure the junction temperature. The device provides real-time temperature
measurements for thermal management, utilizing a single dedicated channel
(channel 1) for temperature sensing.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 .../thermal/renesas,r9a09g047-tsu.yaml        | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml

diff --git a/Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml b/Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
new file mode 100644
index 000000000000..dbd3860a31d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/renesas,r9a09g047-tsu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G3E Temperature Sensor Unit (TSU)
+
+maintainers:
+  - John Madieu <john.madieu.xa@bp.renesas.com>
+
+description: |
+  The Temperature Sensor Unit (TSU) is an integrated thermal sensor that monitors
+  the chip temperature on the Renesas RZ/G3E SoC. The TSU provides real-time
+  temperature measurements for thermal management.
+
+properties:
+  compatible:
+    const: renesas,r9a09g047-tsu
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  interrupts:
+    description: |
+      Interrupt specifiers for the TSU:
+      - S12TSUADI1: Conversion complete interrupt signal (pulse)
+      - S12TSUADCMPI1: Comparison result interrupt signal (level)
+
+  interrupt-names:
+    items:
+      - const: S12TSUADI1
+      - const: S12TSUADCMPI1
+
+  "#thermal-sensor-cells":
+    const: 0
+
+  renesas,tsu-calibration-sys:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Phandle to the system controller (sys) that contains the TSU
+      calibration values used for temperature calculations.
+
+  renesas,tsu-operating-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description: |
+      TSU operating mode:
+      0: Mode 0 - Conversion started by software
+      1: Mode 1 - Conversion started by ELC trigger
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+  - power-domains
+  - interrupts
+  - interrupt-names
+  - "#thermal-sensor-cells"
+  - renesas,tsu-operating-mode
+  - renesas,tsu-calibration-sys
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/renesas,r9a09g047-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    tsu: thermal@14002000 {
+        compatible = "renesas,r9a09g047-tsu";
+        reg = <0 0x14002000 0 0x1000>;
+        clocks = <&cpg CPG_MOD 0x10a>;
+        resets = <&cpg 0xf8>;
+        power-domains = <&cpg>;
+        interrupts = <GIC_SPI 250 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "S12TSUADI1", "S12TSUADCMPI1";
+        #thermal-sensor-cells = <0>;
+        renesas,tsu-operating-mode = <0>;
+        renesas,tsu-calibration-sys = <&sys>;
+    };
+
+    thermal-zones {
+        cpu-thermal {
+            polling-delay = <1000>;
+            polling-delay-passive = <250>;
+            thermal-sensors = <&tsu>;
+
+            cooling-maps {
+                map0 {
+                    trip = <&target>;
+                    cooling-device = <&cpu0 0 3>, <&cpu1 0 3>,
+                                     <&cpu2 0 3>, <&cpu3 0 3>;
+                    contribution = <1024>;
+                };
+            };
+
+            trips {
+                target: trip-point {
+                    temperature = <95000>;
+                    hysteresis = <1000>;
+                    type = "passive";
+                };
+
+                sensor_crit: sensor-crit {
+                    temperature = <120000>;
+                    hysteresis = <1000>;
+                    type = "critical";
+                };
+            };
+        };
+    };
-- 
2.25.1


