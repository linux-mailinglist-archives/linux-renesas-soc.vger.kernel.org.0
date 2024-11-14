Return-Path: <linux-renesas-soc+bounces-10519-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB58E9C87E8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Nov 2024 11:43:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A70C1F25FF3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Nov 2024 10:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48A9C18991E;
	Thu, 14 Nov 2024 10:43:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97B518BC10
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Nov 2024 10:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731580986; cv=none; b=nHO0FW0m7KcXC09ja6j7x1GreH+4xhUDZ3H3xOaI51zdttRxZOhSdN3RpgCHfVUPLcaR7m8mrcgcN9CKO2whGFoLKstlWtjXUr0oNoAMrGKy+3b9oC/AN/KrmzlAD0ehBPb4WS1l64rAOfWn83X+IZ8DMwHO/v9EwttsfG2iVco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731580986; c=relaxed/simple;
	bh=8bz3ega2gIhXyEY/kIDsMpTCavzWJbXwfinZQdlZyR4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dz4rrW29cjEN13C584Trq+vOm52+cSHsPCoOfS53GnaOtnMCUoeAiJB2Cdi0RtHrzP604PpkdDMpgGGnBDTk6dkcTyUlx8/7TTjbGBtfBIiLYoub0HxKOFL/fnQHra3XliXGOHGEFq1j5dT2GnVL36fuGRSG1uTsrfs6uj6cD7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ab77:b6e5:88e8:df20])
	by albert.telenet-ops.be with cmsmtp
	id cais2D0080Ss59E06aisdf; Thu, 14 Nov 2024 11:42:56 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tBXIz-006zWB-RE;
	Thu, 14 Nov 2024 11:42:52 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tBXJM-003WqH-0p;
	Thu, 14 Nov 2024 11:42:52 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Ben Dooks <ben.dooks@codethink.co.uk>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] [RFC] dt-bindings: net: micrel: Convert to json-schema
Date: Thu, 14 Nov 2024 11:42:50 +0100
Message-Id: <943cb31d01d0da3a63911326e24fbf9b328f7206.1731580776.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Micrel PHY Device Tree binding documentation to json-schema.

Add a simple example.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Notes:
  1. I specified Ben Dooks as the maintainer, as he wrote the original
     bindings. Ben, are you OK with that?
  2. This schema is never applied, as there is no compatible value or
     select statement. Adding

	select:
	  properties:
	    $nodename:
	      pattern: "^ethernet-phy(@[a-f0-9]+)?$"

	  required:
	    - $nodename

     and changing

	-unevaluatedProperties: false
	+additionalProperties: true

     would fix that, and is mostly harmless, except for possible
     conflicts with other Ethernet PHYs having more than one clock, or
     using different clock-names.
     Documentation/devicetree/bindings/net/qca,ar803x.yaml has the same
     issue.
     Is there a proper way to handle this?  Are there other options than
     mandating specific compatible values for Ethernet PHYs?

Thanks for your comments!
---
 .../devicetree/bindings/net/micrel,phy.yaml   | 93 +++++++++++++++++++
 .../devicetree/bindings/net/micrel.txt        | 57 ------------
 2 files changed, 93 insertions(+), 57 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/micrel,phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/micrel.txt

diff --git a/Documentation/devicetree/bindings/net/micrel,phy.yaml b/Documentation/devicetree/bindings/net/micrel,phy.yaml
new file mode 100644
index 0000000000000000..609bbd9729efe516
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/micrel,phy.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/micrel,phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Micrel PHY properties
+
+maintainers:
+  - Ben Dooks <ben.dooks@codethink.co.uk>
+
+properties:
+  micrel,led-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 0, 1, 2, 3 ]
+    description: |
+      LED mode value to set for PHYs with configurable LEDs.
+
+      Configure the LED mode with single value. The list of PHYs and the
+      bits that are currently supported:
+
+      KSZ8001: register 0x1e, bits 15..14
+      KSZ8041: register 0x1e, bits 15..14
+      KSZ8021: register 0x1f, bits 5..4
+      KSZ8031: register 0x1f, bits 5..4
+      KSZ8051: register 0x1f, bits 5..4
+      KSZ8081: register 0x1f, bits 5..4
+      KSZ8091: register 0x1f, bits 5..4
+      LAN8814: register EP5.0, bit 6
+
+      See the respective PHY datasheet for the mode values.
+
+  micrel,rmii-reference-clock-select-25-mhz:
+    description: |
+      RMII Reference Clock Select bit selects 25 MHz mode
+
+      Setting the RMII Reference Clock Select bit enables 25 MHz rather
+      than 50 MHz clock mode.
+
+      Note that this option in only needed for certain PHY revisions with a
+      non-standard, inverted function of this configuration bit.
+      Specifically, a clock reference ("rmii-ref" below) is always needed to
+      actually select a mode.
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: rmii-ref
+    description: |
+      supported clocks:
+        - KSZ8021, KSZ8031, KSZ8081, KSZ8091: "rmii-ref": The RMII reference
+          input clock. Used to determine the XI input clock.
+
+  micrel,fiber-mode:
+    type: boolean
+    description: |
+      If present the PHY is configured to operate in fiber mode.
+
+      Some PHYs, such as the KSZ8041FTL variant, support fiber mode, enabled
+      by the FXEN boot strapping pin. It can't be determined from the PHY
+      registers whether the PHY is in fiber mode, so this boolean device tree
+      property can be used to describe it.
+
+      In fiber mode, auto-negotiation is disabled and the PHY can only work in
+      100base-fx (full and half duplex) modes.
+
+  coma-mode-gpios:
+    description: |
+      If present the given gpio will be deasserted when the PHY is probed.
+
+      Some PHYs have a COMA mode input pin which puts the PHY into
+      isolate and power-down mode. On some boards this input is connected
+      to a GPIO of the SoC.
+
+      Supported on the LAN8814.
+
+dependencies:
+  micrel,rmii-reference-clock-select-25-mhz: [ clock-names ]
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ethernet {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@1 {
+            reg = <1>;
+            micrel,led-mode = <1>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/micrel.txt b/Documentation/devicetree/bindings/net/micrel.txt
deleted file mode 100644
index a407dd1b461459a6..0000000000000000
--- a/Documentation/devicetree/bindings/net/micrel.txt
+++ /dev/null
@@ -1,57 +0,0 @@
-Micrel PHY properties.
-
-These properties cover the base properties Micrel PHYs.
-
-Optional properties:
-
- - micrel,led-mode : LED mode value to set for PHYs with configurable LEDs.
-
-	Configure the LED mode with single value. The list of PHYs and the
-	bits that are currently supported:
-
-	KSZ8001: register 0x1e, bits 15..14
-	KSZ8041: register 0x1e, bits 15..14
-	KSZ8021: register 0x1f, bits 5..4
-	KSZ8031: register 0x1f, bits 5..4
-	KSZ8051: register 0x1f, bits 5..4
-	KSZ8081: register 0x1f, bits 5..4
-	KSZ8091: register 0x1f, bits 5..4
-	LAN8814: register EP5.0, bit 6
-
-	See the respective PHY datasheet for the mode values.
-
- - micrel,rmii-reference-clock-select-25-mhz: RMII Reference Clock Select
-						bit selects 25 MHz mode
-
-	Setting the RMII Reference Clock Select bit enables 25 MHz rather
-	than 50 MHz clock mode.
-
-	Note that this option in only needed for certain PHY revisions with a
-	non-standard, inverted function of this configuration bit.
-	Specifically, a clock reference ("rmii-ref" below) is always needed to
-	actually select a mode.
-
- - clocks, clock-names: contains clocks according to the common clock bindings.
-
-	supported clocks:
-	- KSZ8021, KSZ8031, KSZ8081, KSZ8091: "rmii-ref": The RMII reference
-	  input clock. Used to determine the XI input clock.
-
- - micrel,fiber-mode: If present the PHY is configured to operate in fiber mode
-
-	Some PHYs, such as the KSZ8041FTL variant, support fiber mode, enabled
-	by the FXEN boot strapping pin. It can't be determined from the PHY
-	registers whether the PHY is in fiber mode, so this boolean device tree
-	property can be used to describe it.
-
-	In fiber mode, auto-negotiation is disabled and the PHY can only work in
-	100base-fx (full and half duplex) modes.
-
- - coma-mode-gpios: If present the given gpio will be deasserted when the
-		    PHY is probed.
-
-	Some PHYs have a COMA mode input pin which puts the PHY into
-	isolate and power-down mode. On some boards this input is connected
-	to a GPIO of the SoC.
-
-	Supported on the LAN8814.
-- 
2.34.1


