Return-Path: <linux-renesas-soc+bounces-15346-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9A4A7B15D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Apr 2025 23:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E03CA1896CAC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Apr 2025 21:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 786A71DC98B;
	Thu,  3 Apr 2025 21:30:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 929941A5B8B;
	Thu,  3 Apr 2025 21:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715801; cv=none; b=Qgg1SNk/BjjE1Oh9LADWSSYOr3lP7AOu2z9k5yt3J1vNWIl2qcSZsjRKHZp+071JTu/Vlwbm6AbxP7OyBmvkyXEpOIQ5Jf5eFAZq3sSXaen0VokgGP5vEkfGj1TZTPMI2h/F1lRAOjDQunEPlKpZs6Yrs4BZNqQ9z1E8oYsj8R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715801; c=relaxed/simple;
	bh=Vqzp6xIYMHJ7A/BZZJB/3UKo+fgZraSaSVDlPNyIG4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R1g5/46D/5Yzl0RH353sNh0RmsiZmP+H4PCjZuC7q//tRSsvZnR1ilNdJBreXCENFrm7fYYKltV9fsJvKrvlGXR4w5HmzjWg0LV0YyuGsSk7CGSwTvL31s0neQzKWgddACTz9fSUNrdDSLmb0z9xgTKEmfQpyKvrVSjIZvEuxB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: IzfZHhiSRUGryFAdDcKyBw==
X-CSE-MsgGUID: djGHs0TkQSS+DxEj7moOdA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Apr 2025 06:29:57 +0900
Received: from superbuilder.administration.lan (unknown [10.226.92.33])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id B3AEE40B446A;
	Fri,  4 Apr 2025 06:29:53 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v7 03/13] dt-bindings: serial: Add compatible for Renesas RZ/T2H SoC in sci
Date: Thu,  3 Apr 2025 23:29:05 +0200
Message-ID: <20250403212919.1137670-4-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com>
References: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RSCI of RZ/T2H SoC (a.k.a r9a09g077), as a lot
of similarities with SCI in other Renesas SoC like G2L, G3S, V2L;
However, it has a different set of registers, and in addition to serial,
this IP also supports SCIe (encoder), SmartCard, i2c and spi.
This is why the 'renesas,sci' fallback for generic SCI does not apply for it.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
Changes v6->v7: 
  - Moved all rsci in a separate file
  - Added example
Changes v5->v6: none
Changes v4->v5: none
Changes v3->v4:
  - Added more details in commit description about why renesas,sci 
    does not apply.
  - Removed uart-has-rtscts for !rzsci.
----
 .../bindings/serial/renesas,rsci.yaml         | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/renesas,rsci.yaml

diff --git a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
new file mode 100644
index 000000000000..ea879db5f485
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/renesas,rsci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RSCI Serial Communication Interface
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+  - Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
+
+allOf:
+  - $ref: serial.yaml#
+
+properties:
+  compatible:
+    const: renesas,r9a09g077-rsci      # RZ/T2H
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Error interrupt
+      - description: Receive buffer full interrupt
+      - description: Transmit buffer empty interrupt
+      - description: Transmit end interrupt
+
+  interrupt-names:
+    items:
+      - const: eri
+      - const: rxi
+      - const: txi
+      - const: tei
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: fck # UART functional clock
+
+  power-domains:
+    maxItems: 1
+
+  uart-has-rtscts: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+    aliases {
+        serial0 = &sci0;
+    };
+
+    sci0: serial@80005000 {
+        compatible = "renesas,r9a09g077-rsci";
+        reg = <0x80005000 0x400>;
+        interrupts = <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 591 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 592 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "eri", "rxi", "txi", "tei";
+        clocks = <&cpg CPG_MOD 108>;
+        clock-names = "fck";
+        power-domains = <&cpg>;
+    };
-- 
2.43.0


