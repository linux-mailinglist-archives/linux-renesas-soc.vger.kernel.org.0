Return-Path: <linux-renesas-soc+bounces-30768-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDbmJIiZzmkBowYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30768-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 18:30:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A9538BDD5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 18:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7773130D0607
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 16:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 968563EE1E9;
	Thu,  2 Apr 2026 16:25:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2F03F0744;
	Thu,  2 Apr 2026 16:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775147121; cv=none; b=QzP08FoCZl36i4Xd1BXecKmIm8NWafUsfYKqhezoN2Oon/KYmD6a4hzRXeK4dbjUSbMeZYhCoXEYcozQfLzfeF06JyIj3/tAy9Lmw9zbAevY0ka5ILQiE8RhYinUnzVTmwgkxBpgYPxbJFlxCOxq18tVULnIi1jZJHoJhU2MPuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775147121; c=relaxed/simple;
	bh=xNqsk9yPn5OWSbRJzRb3wWZcuYvlScUZcfM9DntjNZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eiw5SX1aMv3L8iUH4yPg72e4NA+e39kHjVTTqqXVhrljNFyKgmsKBJgUtd7I3ROqBWt8m85EJlcA2QAfIdmevm6P62Qn0r4cX4/tcc39Mixk62Vt6p0JLxLdTCvER5nkPdbKyH1BZe1H+pfQySPB1ZhXX0+/KAYzKPkI15CvfSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 2mTaNJxAQy6EGvc1Wt6Cfg==
X-CSE-MsgGUID: HJd5xDrXSpGD3bqn0oGrOw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 03 Apr 2026 01:25:18 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.38])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5E9024018E95;
	Fri,  3 Apr 2026 01:25:13 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCh v3 02/14] ASoC: dt-bindings: Add RZ/G3E (R9A09G047) sound binding
Date: Thu,  2 Apr 2026 18:24:24 +0200
Message-ID: <20260402162436.12059-3-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30768-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,perex.cz,suse.com,gmail.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.083];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 08A9538BDD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The RZ/G3E shares the same audio IP as the R-Car variants but differs
in several aspects: it supports up to 5 DMA controllers per audio
channel, requires additional clocks (47 total including per-SSI ADG
clocks, SCU domain clocks and SSIF supply) and additional reset lines
(14 total including SCU, ADG and Audio DMAC peri-peri resets).

Add a dedicated devicetree binding for the RZ/G3E sound controller.
The binding references the common renesas,rsnd-common.yaml schema for
shared property and subnode definitions.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v3: No changes
v2: New patch

 .../sound/renesas,r9a09g047-sound.yaml        | 371 ++++++++++++++++++
 1 file changed, 371 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml

diff --git a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
new file mode 100644
index 000000000000..1dfe9bab3382
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
@@ -0,0 +1,371 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/renesas,r9a09g047-sound.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G3E Sound Controller
+
+maintainers:
+  - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
+  - John Madieu <john.madieu.xa@bp.renesas.com>
+
+description:
+  The RZ/G3E (R9A09G047) integrates an R-Car compatible sound controller
+  with extended DMA channel support (up to 5 DMACs per direction), additional
+  clock domains, and additional reset lines compared to the R-Car Gen2/Gen3
+  variants.
+
+allOf:
+  - $ref: renesas,rsnd-common.yaml#
+
+properties:
+  compatible:
+    const: renesas,r9a09g047-sound
+
+  reg:
+    maxItems: 5
+
+  reg-names:
+    items:
+      - const: scu
+      - const: adg
+      - const: ssiu
+      - const: ssi
+      - const: audmapp
+
+  clocks:
+    maxItems: 47
+
+  clock-names:
+    items:
+      - const: ssi-all
+      - const: ssi.9
+      - const: ssi.8
+      - const: ssi.7
+      - const: ssi.6
+      - const: ssi.5
+      - const: ssi.4
+      - const: ssi.3
+      - const: ssi.2
+      - const: ssi.1
+      - const: ssi.0
+      - const: src.9
+      - const: src.8
+      - const: src.7
+      - const: src.6
+      - const: src.5
+      - const: src.4
+      - const: src.3
+      - const: src.2
+      - const: src.1
+      - const: src.0
+      - const: mix.1
+      - const: mix.0
+      - const: ctu.1
+      - const: ctu.0
+      - const: dvc.0
+      - const: dvc.1
+      - const: clk_a
+      - const: clk_b
+      - const: clk_c
+      - const: clk_i
+      - const: ssif_supply
+      - const: scu
+      - const: scu_x2
+      - const: scu_supply
+      - const: adg.ssi.9
+      - const: adg.ssi.8
+      - const: adg.ssi.7
+      - const: adg.ssi.6
+      - const: adg.ssi.5
+      - const: adg.ssi.4
+      - const: adg.ssi.3
+      - const: adg.ssi.2
+      - const: adg.ssi.1
+      - const: adg.ssi.0
+      - const: audmapp
+      - const: adg
+
+  resets:
+    maxItems: 14
+
+  reset-names:
+    items:
+      - const: ssi-all
+      - const: ssi.9
+      - const: ssi.8
+      - const: ssi.7
+      - const: ssi.6
+      - const: ssi.5
+      - const: ssi.4
+      - const: ssi.3
+      - const: ssi.2
+      - const: ssi.1
+      - const: ssi.0
+      - const: scu
+      - const: adg
+      - const: audmapp
+
+  rcar_sound,dvc:
+    description: DVC subnode.
+    type: object
+    patternProperties:
+      "^dvc-[0-1]$":
+        type: object
+        additionalProperties: false
+        properties:
+          dmas:
+            maxItems: 5
+          dma-names:
+            maxItems: 5
+            allOf:
+              - items:
+                  enum:
+                    - tx
+        required:
+          - dmas
+          - dma-names
+    additionalProperties: false
+
+  rcar_sound,src:
+    description: SRC subnode.
+    type: object
+    patternProperties:
+      "^src-[0-9]$":
+        type: object
+        additionalProperties: false
+        properties:
+          interrupts:
+            maxItems: 1
+          dmas:
+            maxItems: 10
+          dma-names:
+            maxItems: 10
+            allOf:
+              - items:
+                  enum:
+                    - tx
+                    - rx
+    additionalProperties: false
+
+  rcar_sound,ssiu:
+    description: SSIU subnode.
+    type: object
+    patternProperties:
+      "^ssiu-[0-9]+$":
+        type: object
+        additionalProperties: false
+        properties:
+          dmas:
+            maxItems: 10
+          dma-names:
+            maxItems: 10
+            allOf:
+              - items:
+                  enum:
+                    - tx
+                    - rx
+        required:
+          - dmas
+          - dma-names
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    snd_rzg3e: sound@13c00000 {
+        #sound-dai-cells = <1>;
+        #clock-cells = <0>;
+        compatible = "renesas,r9a09g047-sound";
+        reg = <0x13c00000 0x10000>,
+              <0x13c20000 0x10000>,
+              <0x13c30000 0x1000>,
+              <0x13c31000 0x1f000>,
+              <0x13c50000 0x10000>;
+        reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
+
+        clocks = <&cpg 245>,
+                 <&cpg 394>, <&cpg 393>,
+                 <&cpg 392>, <&cpg 391>,
+                 <&cpg 390>, <&cpg 389>,
+                 <&cpg 388>, <&cpg 387>,
+                 <&cpg 386>, <&cpg 385>,
+                 <&cpg 381>, <&cpg 380>,
+                 <&cpg 379>, <&cpg 378>,
+                 <&cpg 377>, <&cpg 376>,
+                 <&cpg 375>, <&cpg 374>,
+                 <&cpg 373>, <&cpg 372>,
+                 <&cpg 371>, <&cpg 370>,
+                 <&cpg 371>, <&cpg 370>,
+                 <&cpg 368>, <&cpg 369>,
+                 <&audio_clk_a>, <&audio_clk_b>,
+                 <&audio_clk_c>, <&audio_clk_i>,
+                 <&cpg 384>,
+                 <&cpg 246>, <&cpg 247>,
+                 <&cpg 382>,
+                 <&cpg 361>, <&cpg 360>,
+                 <&cpg 359>, <&cpg 358>,
+                 <&cpg 357>, <&cpg 356>,
+                 <&cpg 355>, <&cpg 354>,
+                 <&cpg 353>, <&cpg 352>,
+                 <&cpg 248>, <&cpg 249>;
+
+        clock-names = "ssi-all",
+                      "ssi.9", "ssi.8",
+                      "ssi.7", "ssi.6",
+                      "ssi.5", "ssi.4",
+                      "ssi.3", "ssi.2",
+                      "ssi.1", "ssi.0",
+                      "src.9", "src.8",
+                      "src.7", "src.6",
+                      "src.5", "src.4",
+                      "src.3", "src.2",
+                      "src.1", "src.0",
+                      "mix.1", "mix.0",
+                      "ctu.1", "ctu.0",
+                      "dvc.0", "dvc.1",
+                      "clk_a", "clk_b",
+                      "clk_c", "clk_i",
+                      "ssif_supply",
+                      "scu", "scu_x2",
+                      "scu_supply",
+                      "adg.ssi.9", "adg.ssi.8",
+                      "adg.ssi.7", "adg.ssi.6",
+                      "adg.ssi.5", "adg.ssi.4",
+                      "adg.ssi.3", "adg.ssi.2",
+                      "adg.ssi.1", "adg.ssi.0",
+                      "audmapp", "adg";
+
+        power-domains = <&cpg>;
+
+        resets = <&cpg 225>,
+                 <&cpg 235>, <&cpg 234>, <&cpg 233>, <&cpg 232>,
+                 <&cpg 231>, <&cpg 230>, <&cpg 229>, <&cpg 228>,
+                 <&cpg 227>, <&cpg 226>,
+                 <&cpg 236>, <&cpg 238>, <&cpg 237>;
+        reset-names = "ssi-all",
+                      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
+                      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
+                      "ssi.1", "ssi.0",
+                      "scu", "adg", "audmapp";
+
+        rcar_sound,ssi {
+            ssi0: ssi-0 {
+                interrupts = <GIC_SPI 889 IRQ_TYPE_LEVEL_HIGH>;
+            };
+            ssi3: ssi-3 {
+                interrupts = <GIC_SPI 892 IRQ_TYPE_LEVEL_HIGH>;
+            };
+            ssi4: ssi-4 {
+                interrupts = <GIC_SPI 893 IRQ_TYPE_LEVEL_HIGH>;
+                shared-pin;
+            };
+        };
+
+        rcar_sound,ssiu {
+            ssiu30: ssiu-12 {
+                dmas = <&dmac0 0x1d79>, <&dmac0 0x1d7a>,
+                       <&dmac1 0x1d79>, <&dmac1 0x1d7a>,
+                       <&dmac2 0x1d79>, <&dmac2 0x1d7a>,
+                       <&dmac3 0x1d79>, <&dmac3 0x1d7a>,
+                       <&dmac4 0x1d79>, <&dmac4 0x1d7a>;
+                dma-names = "tx", "rx", "tx", "rx", "tx", "rx",
+                            "tx", "rx", "tx", "rx";
+            };
+            ssiu40: ssiu-16 {
+                dmas = <&dmac0 0x1d81>, <&dmac0 0x1d82>,
+                       <&dmac1 0x1d81>, <&dmac1 0x1d82>,
+                       <&dmac2 0x1d81>, <&dmac2 0x1d82>,
+                       <&dmac3 0x1d81>, <&dmac3 0x1d82>,
+                       <&dmac4 0x1d81>, <&dmac4 0x1d82>;
+                dma-names = "tx", "rx", "tx", "rx", "tx", "rx",
+                            "tx", "rx", "tx", "rx";
+            };
+        };
+
+        rcar_sound,src {
+            src0: src-0 {
+                interrupts = <GIC_SPI 902 IRQ_TYPE_LEVEL_HIGH>;
+                dmas = <&dmac0 0x1d9f>, <&dmac0 0x1da9>,
+                       <&dmac1 0x1d9f>, <&dmac1 0x1da9>,
+                       <&dmac2 0x1d9f>, <&dmac2 0x1da9>,
+                       <&dmac3 0x1d9f>, <&dmac3 0x1da9>,
+                       <&dmac4 0x1d9f>, <&dmac4 0x1da9>;
+                dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
+                            "rx", "tx", "rx", "tx";
+            };
+            src1: src-1 {
+                interrupts = <GIC_SPI 903 IRQ_TYPE_LEVEL_HIGH>;
+                dmas = <&dmac0 0x1da0>, <&dmac0 0x1daa>,
+                       <&dmac1 0x1da0>, <&dmac1 0x1daa>,
+                       <&dmac2 0x1da0>, <&dmac2 0x1daa>,
+                       <&dmac3 0x1da0>, <&dmac3 0x1daa>,
+                       <&dmac4 0x1da0>, <&dmac4 0x1daa>;
+                dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
+                            "rx", "tx", "rx", "tx";
+            };
+        };
+
+        rcar_sound,dvc {
+            dvc0: dvc-0 {
+                dmas = <&dmac0 0x1db3>,
+                       <&dmac1 0x1db3>,
+                       <&dmac2 0x1db3>,
+                       <&dmac3 0x1db3>,
+                       <&dmac4 0x1db3>;
+                dma-names = "tx", "tx", "tx", "tx", "tx";
+            };
+            dvc1: dvc-1 {
+                dmas = <&dmac0 0x1db4>,
+                       <&dmac1 0x1db4>,
+                       <&dmac2 0x1db4>,
+                       <&dmac3 0x1db4>,
+                       <&dmac4 0x1db4>;
+                dma-names = "tx", "tx", "tx", "tx", "tx";
+            };
+        };
+
+        rcar_sound,dai {
+            dai0 {
+                playback = <&ssi3>, <&src1>, <&dvc1>;
+                capture = <&ssi4>, <&src0>, <&dvc0>;
+            };
+        };
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            rsnd_port0: port@0 {
+                reg = <0>;
+                rsnd_endpoint0: endpoint {
+                    remote-endpoint = <&codec_endpoint>;
+                    dai-format = "i2s";
+                    bitclock-master = <&rsnd_endpoint0>;
+                    frame-master = <&rsnd_endpoint0>;
+                    playback = <&ssi3>, <&src1>, <&dvc1>;
+                    capture = <&ssi4>, <&src0>, <&dvc0>;
+                };
+            };
+        };
+    };
+
+    codec {
+        port {
+            codec_endpoint: endpoint {
+                remote-endpoint = <&rsnd_endpoint0>;
+            };
+        };
+    };
-- 
2.25.1


