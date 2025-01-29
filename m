Return-Path: <linux-renesas-soc+bounces-12706-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 932C9A22230
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 17:52:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF4227A374C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 16:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC811DF997;
	Wed, 29 Jan 2025 16:52:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF5C51E0DB5;
	Wed, 29 Jan 2025 16:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738169521; cv=none; b=F7rvXZkCrZ2+/nNDEYAaOY1yWl7rVMSntRdNE2ycv41yt8svL5s+1zEBd5woFTGCGXzVT1q9cy4q34e8yxYtgog3Kktf3J2KR0v5Nan2lyJMAjlp0o9gyZ7swRB09aDqu9J7q7YsB5p31h+BXWa8QTUZDJsHo76rbLLgUx0RfIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738169521; c=relaxed/simple;
	bh=CUH9n+oPHOWyM3u6BZlgaSX/u3UOlrz9vO5jpb8oU30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D7jJFxRtnb6oohp8GwwpERhAFXnS6lGIGLqRXltqf5qTX4SgFoPVAbgxZmLn3F/1WwdH8rSNW7cSVqWqgPxjUUfxVepefvhZBslx0sQC3LCAMnpr0LJVe08jHXHP3kUXXdlYCPKaSVzSJR4sQYAfvYCYvjhdEzaZyNy0ZTS4nR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: hShsvux3TAmY5SDmWSSOGA==
X-CSE-MsgGUID: CJI+EUM4RICmJ+c+MDvTyQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 30 Jan 2025 01:51:58 +0900
Received: from wvbox.administration.lan (unknown [10.226.92.145])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9567F402EEE6;
	Thu, 30 Jan 2025 01:51:46 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 02/14] dt-bindings: serial: Document sci bindings for the Renesas RZ/T2H (a.k.a r9a09g077) SoC
Date: Wed, 29 Jan 2025 16:37:38 +0000
Message-ID: <20250129165122.2980-3-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document RZ/T2H (a.k.a r9a09g077) in SCI binding.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
 .../bindings/serial/renesas,rzsci.yaml        | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/renesas,rzsci.yaml

diff --git a/Documentation/devicetree/bindings/serial/renesas,rzsci.yaml b/Documentation/devicetree/bindings/serial/renesas,rzsci.yaml
new file mode 100644
index 000000000000..70e83bbcc79d
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/renesas,rzsci.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/renesas,rzsci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas Serial Communication Interface
+
+maintainers:
+  - Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+allOf:
+  - $ref: serial.yaml#
+
+description: |
+  The SCI is configurable to asynchronous and synchronous serial
+  interfaces:
+  - Asynchronous interfaces (UART and Asynchronous Communications Interface
+    Adapter (ACIA))
+  - 8-bit clock synchronous interface
+  - Simple I2C (master-only)
+  - Simple SPI
+  - Smart card interface
+  - Manchester mode
+  - Asynchronous interfaces (UART, RS485 and Asynchronous Communications
+    Interface Adapter (ACIA))
+  The smart card interface complies with the ISO/IEC 7816-3 standard for
+  electronic signals and transmission protocol. Each SCI has FIFO buffers to
+  enable continuous and full-duplex communication, and the data transfer speed
+  can be configured independently using a baud rate generator.
+
+properties:
+  compatible:
+    const: renesas,r9a09g077-sci     # RZ/T2H
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
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      enum:
+        - fck # UART functional clock
+        - sck # optional external clock input
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - power-domains
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r9a09g077-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    aliases {
+        serial0 = &sci0;
+    };
+
+    sci0: serial@80005000 {
+        compatible = "renesas,r9a09g077-sci";
+        reg = <0x80005000 0x400>;
+        interrupts = <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "eri", "rxi", "txi", "tei";
+        clocks = <&cpg CPG_MOD R9A09G077_SCI0_CLK>;
+        clock-names = "fck";
+        power-domains = <&cpg>;
+    };
-- 
2.43.0


