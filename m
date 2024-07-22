Return-Path: <linux-renesas-soc+bounces-7428-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D69F5938EC9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 14:04:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8ACE3281612
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 12:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023CA1754B;
	Mon, 22 Jul 2024 12:04:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F58F16D4CE
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jul 2024 12:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721649850; cv=none; b=tbJljY2d5bMBEPwOgaYHnchIrd4dPTaA5rz46zA//9gM1oPja1dteoXsXFdCqIL9ag1MVHd2NXihvr1Quxplji4KoycEIV1lRC7ZrfxiTA9uXUXve91UCEeF+Y7FPWvOeEftjD5xcMKe50pIZREwL8W/1wNFoTX6mlwbil1vvDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721649850; c=relaxed/simple;
	bh=qWy9RXASZTPs6u+xH3wHysH2cA1hSPDfQUjvLKSWxbc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k35nMtaCihLONNB6hprWTJn5Ula8Bdi9X9Fs6CnRnsYeRwvVjoYqm1mzeSJgPqnGgOgGr35jIWQ2D+YudAMswkIjMWePAhZCTtSgZDKjplqVcoTMqCeTBLiSRK5IE1lX0q3sk5LXtNg1zZs62aZsfHHaXrONaJAbj/mnpLtlQ00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:173b:9414:53f5:de4c])
	by andre.telenet-ops.be with bizsmtp
	id qc452C00B1wvoRx01c45Lh; Mon, 22 Jul 2024 14:04:06 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrla-002zES-HX;
	Mon, 22 Jul 2024 14:04:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrls-00210E-Vl;
	Mon, 22 Jul 2024 14:04:05 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: sound: dlg,da7213: Convert to json-schema
Date: Mon, 22 Jul 2024 14:04:00 +0200
Message-Id: <7645c9024a1762d281f4067504bc32a7a3d27caa.1721649741.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Dialog Semiconductor DA7212/DA7213 Audio Codec Device Tree
binding documentation to json-schema.

Add missing properties.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/sound/da7213.txt      |  45 --------
 .../devicetree/bindings/sound/dlg,da7213.yaml | 103 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 3 files changed, 104 insertions(+), 45 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/da7213.txt
 create mode 100644 Documentation/devicetree/bindings/sound/dlg,da7213.yaml

diff --git a/Documentation/devicetree/bindings/sound/da7213.txt b/Documentation/devicetree/bindings/sound/da7213.txt
deleted file mode 100644
index 94584c96c4ae2237..0000000000000000
--- a/Documentation/devicetree/bindings/sound/da7213.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-Dialog Semiconductor DA7212/DA7213 Audio Codec bindings
-
-======
-
-Required properties:
-- compatible : Should be "dlg,da7212" or "dlg,da7213"
-- reg: Specifies the I2C slave address
-
-Optional properties:
-- clocks : phandle and clock specifier for codec MCLK.
-- clock-names : Clock name string for 'clocks' attribute, should be "mclk".
-
-- dlg,micbias1-lvl : Voltage (mV) for Mic Bias 1
-	[<1600>, <2200>, <2500>, <3000>]
-- dlg,micbias2-lvl : Voltage (mV) for Mic Bias 2
-	[<1600>, <2200>, <2500>, <3000>]
-- dlg,dmic-data-sel : DMIC channel select based on clock edge.
-	["lrise_rfall", "lfall_rrise"]
-- dlg,dmic-samplephase : When to sample audio from DMIC.
-	["on_clkedge", "between_clkedge"]
-- dlg,dmic-clkrate : DMIC clock frequency (Hz).
-	[<1500000>, <3000000>]
-
- - VDDA-supply : Regulator phandle for Analogue power supply
- - VDDMIC-supply : Regulator phandle for Mic Bias
- - VDDIO-supply : Regulator phandle for I/O power supply
-
-======
-
-Example:
-
-	codec_i2c: da7213@1a {
-		compatible = "dlg,da7213";
- 		reg = <0x1a>;
-
- 		clocks = <&clks 201>;
-		clock-names = "mclk";
-
-		dlg,micbias1-lvl = <2500>;
-		dlg,micbias2-lvl = <2500>;
-
-		dlg,dmic-data-sel = "lrise_rfall";
-		dlg,dmic-samplephase = "between_clkedge";
-		dlg,dmic-clkrate = <3000000>;
-	};
diff --git a/Documentation/devicetree/bindings/sound/dlg,da7213.yaml b/Documentation/devicetree/bindings/sound/dlg,da7213.yaml
new file mode 100644
index 0000000000000000..c2dede1e82ffa4d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/dlg,da7213.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/dlg,da7213.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dialog Semiconductor DA7212/DA7213 Audio Codec
+
+maintainers:
+  - Support Opensource <support.opensource@diasemi.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - dlg,da7212
+      - dlg,da7213
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: mclk
+
+  "#sound-dai-cells":
+    const: 0
+
+  dlg,micbias1-lvl:
+    description: Voltage (mV) for Mic Bias 1
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 1600, 2200, 2500, 3000 ]
+
+  dlg,micbias2-lvl:
+    description: Voltage (mV) for Mic Bias 2
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 1600, 2200, 2500, 3000 ]
+
+  dlg,dmic-data-sel:
+    description: DMIC channel select based on clock edge
+    enum: [ lrise_rfall, lfall_rrise ]
+
+  dlg,dmic-samplephase:
+    description: When to sample audio from DMIC
+    enum: [ on_clkedge, between_clkedge ]
+
+  dlg,dmic-clkrate:
+    description: DMIC clock frequency (Hz)
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 1500000, 3000000 ]
+
+  VDDA-supply:
+    description: Analogue power supply
+
+  VDDIO-supply:
+    description: I/O power supply
+
+  VDDMIC-supply:
+    description: Mic Bias
+
+  VDDSP-supply:
+    description: Speaker supply
+
+  ports:
+    $ref: audio-graph-port.yaml#/definitions/ports
+
+  port:
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        codec@1a {
+            compatible = "dlg,da7213";
+            reg = <0x1a>;
+
+            clocks = <&clks 201>;
+            clock-names = "mclk";
+
+            #sound-dai-cells = <0>;
+
+            dlg,micbias1-lvl = <2500>;
+            dlg,micbias2-lvl = <2500>;
+
+            dlg,dmic-data-sel = "lrise_rfall";
+            dlg,dmic-samplephase = "between_clkedge";
+            dlg,dmic-clkrate = <3000000>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index a577e41bd90cb1ac..990aced7e7a57e1f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6458,6 +6458,7 @@ F:	Documentation/devicetree/bindings/regulator/da92*.txt
 F:	Documentation/devicetree/bindings/regulator/dlg,da9*.yaml
 F:	Documentation/devicetree/bindings/regulator/dlg,slg51000.yaml
 F:	Documentation/devicetree/bindings/sound/da[79]*.txt
+F:	Documentation/devicetree/bindings/sound/dlg,da7213.yaml
 F:	Documentation/devicetree/bindings/thermal/dlg,da9062-thermal.yaml
 F:	Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
 F:	Documentation/hwmon/da90??.rst
-- 
2.34.1


