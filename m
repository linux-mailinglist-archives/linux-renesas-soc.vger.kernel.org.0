Return-Path: <linux-renesas-soc+bounces-31289-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIW6ODOL32l5VAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31289-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 14:57:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 634B5404941
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 14:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B562730A4F6C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 12:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB8B330330;
	Wed, 15 Apr 2026 12:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tEJ5AWLj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD7D175A6D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2026 12:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776257260; cv=none; b=kF6xw0XQ9bQV9aUdw/o9KKjbqg7c4Tn5xPavlwFtLSj5lEJwW8WMnwpFrR/DnJUfnVJV1K0s9eYJ0oyIeMmRMokoD6EInc4WTkxezeTtR4dWPSNKz2mGgGVHng55jA+MfzjkPSAKjAxndXOsgT9cKSnJQKbyqUjCSWsjhF8MYmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776257260; c=relaxed/simple;
	bh=u99Ba/jfyWxfXzOVagVNrWOkCLQIkW/ZMylkvPL7NaA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vo2AYkq+Djc4EbEtIAxVWQ99XcaP+FT8kPPpkrc7Jcor3xagV8dB/XCJbqqqV4Pa6HYEASEKAOuxSCwUmHupgDLmZhZszznhCy6g3J728sAC9pHGPhBo76e7+dUtQu0YZ3DeZnywPR3dh82ZFiVYDCGv1sMmKWkZZRqpWvOfT4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tEJ5AWLj; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d6fbd0954so2888277f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2026 05:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776257256; x=1776862056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKgDJWomLvf9lU2SYAd3bGigAESYIyH8ynZXMmseh3A=;
        b=tEJ5AWLjAz+CZKhnF4K3HzQXdE7eWt+GepHqfBgx20z44yNly04Q8eNHir88g3tn5o
         fnQcGWMniUtiENlJ/dpJW3H6Hm/2KgHPuK4o8Lu/+5il4UUxSffyFH1PDb1ZWVfurGPv
         bMqSUhXLllAeSv78zCVJEbkjrBt2gT48+Ej6AnsySKeQbCt712JTk6wYEAann5zzRT4I
         XOXrq8OoszHXyJJC4NjF7st6xzd2nbHFksoWIo0azNHlONFiDa0bLoY241TlTw2ZqjfH
         LSrx+lMhwpsZ6ggt5OFLONbBtxLVNR7eVueOaHmW/IU4o6SKO/vzHMFP2i2HJDjMz5Sc
         S7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776257256; x=1776862056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xKgDJWomLvf9lU2SYAd3bGigAESYIyH8ynZXMmseh3A=;
        b=ahpBDea0xHEZR0Uv8tGT72fYAmZcGDuozxkPGQkuc9uOg8QVPM3HvzIPBGNJFYpFBl
         F3GGOvgekyBF4RolCfvs6PXcv6qStn/HOGgl/kzfes3CmL1Dl+0YAEiPYve5Z133N/Au
         MVI+MSZYWBOHgmrbP2sjURe558VH07TZZIjIBG9i6npzbwVsGfFtUw2PiXTu1lnO+4rf
         XCTnlwPaAsO1B+mxKHmdbOqUx2ydoGPpq5bVxSp/cA332Q2YHconA+n7u+R1bxR5AXPm
         +bO/WSui9o+sweacN1nBd6w6UmNp1+pjDejaKUPuM5DeO4spbH/pDizCDFNqSefydUH3
         ZSOA==
X-Forwarded-Encrypted: i=1; AFNElJ+8fu+4DRPSUHmIuYli+xXtEgiek0cbf4yXkXcITkoVrOqxJuOxilu81zC6Td5eEAsfKpWwXq1WNZsbd3IOL+EbkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzaPMzOFCzqOd7J6ZaIIdZLVNg20OX1vw7KHclJBxnHElBj8CJ
	UNOz1hZItdSYuRN3ZEZEL6q3Y3+eMsh8UzsWS42ZEIeAOBSXoI69fmP7
X-Gm-Gg: AeBDieuCng/+SGGllYLZARjnsFbcjf/wPul7tYCs0OrVndQ3icaTM0azR6HujPyIFQq
	7sVzHzLgfqpCjKrYIuBVAjAUKT1HxMhUvQVLU2rA5oyxqOgkEkQ62TSrIXfh0ps4maoGnWjR6Kn
	DgePuRx95G2pyZReyrba/4JRQ5KrQfOWE62E+Lxu11UA4o7MQbURYHzmTVuLlZQVZG4MM+i6QuT
	AQx4wRkaSmNV8JV5GzClLLnOqHRj/1jDqFz6Vw9N5GZ7OZZjYneMrx03Azi1HC5HqetAVAIqzLh
	aA33VmlkyDAWrcwFPvN74HUr+fTQ9FCjT54CDgvnZZ8DtioveE8jCbL7rsnFG9rvnDdHDnShoBh
	QbdXW+kM04eKZ2JtNGTLAgsY16ocrau2KjF0ED9is4spgNhnQm1l8iQE5Kl4lnZgp2Is9bjwI9b
	3PulP7bTl1cLkPmQc11NtbpXzCBlQtCvWbd47fCw==
X-Received: by 2002:a05:6000:220b:b0:43d:30b4:1859 with SMTP id ffacd0b85a97d-43d64235cf5mr31995415f8f.7.1776257256294;
        Wed, 15 Apr 2026 05:47:36 -0700 (PDT)
Received: from localhost.localdomain ([2001:41d0:406:c100::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead356616sm5123319f8f.13.2026.04.15.05.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:47:35 -0700 (PDT)
From: John Madieu <john.madieu@gmail.com>
X-Google-Original-From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
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
Subject: [PATCH v5 01/14] ASoC: dt-bindings: sound: Add DT binding for RZ/G3E sound
Date: Wed, 15 Apr 2026 12:47:18 +0000
Message-Id: <20260415124731.3684773-2-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
References: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [5.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31289-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,body];
	FREEMAIL_CC(0.00)[kernel.org,perex.cz,suse.com,glider.be,gmail.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johnmadieu@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.932];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid,13c00000:email]
X-Rspamd-Queue-Id: 634B5404941
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a standalone device tree binding for the Renesas RZ/G3E (R9A09G047)
sound controller.

The RZ/G3E sound IP is based on R-Car Sound but differs in several ways:
- Uses unprefixed sub-node names (ssi, ssiu, src, dvc, mix, ctu) instead
  of R-Car's rcar_sound,xxx prefixed names.
- Supports up to 5 DMA controllers per direction, allowing multiple DMA
  entries with repeated channel names in SSIU, SRC and DVC sub-nodes.
- Has 47 clocks including per-SSI ADG clocks (adg.ssi.0-9), SCU clocks
  (scu, scu_x2, scu_supply), SSIF supply clock, AUDMAC peri-peri clock,
  and ADG clock.
- Has 14 reset lines including SCU, ADG and AUDMAC peri-peri resets.
- SSI operates exclusively in BUSIF mode.

These differences make the RZ/G3E binding incompatible with the existing
renesas,rsnd.yaml, so it is added as a separate standalone binding with
its own $ref to dai-common.yaml.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:
 
v5:
 - Drop the two-patch rsnd.yaml split approach from v4.
   Replace with a single self-contained standalone binding that does
   not touch renesas,rsnd.yaml at all.
 - Remove select: false, redundant blanket properties (compatible: true,
   reg: true, etc.) and pointless patternProperties per Krzystof's review
 - Add missing #clock-cells and #sound-dai-cells constraints
 - Add hardware description text instead of "Binding for ..." phrasing
 - Move G3E-specific DMA comment into the binding itself rather than
   relying on a shared schema
 - Use unprefixed sub-node names (ssi, ssiu, src, dvc, mix, ctu) to
   reflect the actual RZ/G3E DT binding

v4: No changes
v3: No changes
v2:
 - Introduce RZ/G3E sound binding as a standalone schema

 .../sound/renesas,r9a09g047-sound.yaml        | 770 ++++++++++++++++++
 1 file changed, 770 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml

diff --git a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
new file mode 100644
index 000000000000..b7e5348636bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
@@ -0,0 +1,770 @@
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
+  The RZ/G3E (R9A09G047) sound controller is based on R-Car Sound IP
+  with extended DMA channel support (up to 5 DMACs per direction),
+  additional clock domains (47 clocks including per-SSI ADG clocks),
+  and additional reset lines (14 including SCU, ADG and Audio DMAC
+  peri-peri resets). SSI operates exclusively in BUSIF mode with
+  2-4 BUSIF channels per SSI.
+
+allOf:
+  - $ref: dai-common.yaml#
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
+  "#sound-dai-cells":
+    enum: [0, 1]
+
+  "#clock-cells":
+    const: 0
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
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
+  power-domains:
+    maxItems: 1
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
+  clock-frequency:
+    description: Audio clock output frequency.
+
+  clkout-lr-asynchronous:
+    description: audio_clkoutn is asynchronous with lr-clock.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  dvc:
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
+  mix:
+    type: object
+    patternProperties:
+      "^mix-[0-1]$":
+        type: object
+        additionalProperties: false
+    additionalProperties: false
+
+  ctu:
+    type: object
+    patternProperties:
+      "^ctu-[0-7]$":
+        type: object
+        additionalProperties: false
+    additionalProperties: false
+
+  src:
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
+  ssiu:
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
+  ssi:
+    type: object
+    patternProperties:
+      "^ssi-[0-9]$":
+        type: object
+        additionalProperties: false
+        properties:
+          interrupts:
+            maxItems: 1
+          dmas: true
+          dma-names: true
+          shared-pin:
+            description: Shared clock pin.
+            $ref: /schemas/types.yaml#/definitions/flag
+        required:
+          - interrupts
+    additionalProperties: false
+
+  port:
+    $ref: audio-graph-port.yaml#/definitions/port-base
+    unevaluatedProperties: false
+    patternProperties:
+      "^endpoint(@[0-9a-f]+)?$":
+        $ref: audio-graph-port.yaml#/definitions/endpoint-base
+        properties:
+          playback:
+            $ref: /schemas/types.yaml#/definitions/phandle-array
+          capture:
+            $ref: /schemas/types.yaml#/definitions/phandle-array
+        unevaluatedProperties: false
+
+patternProperties:
+  '^dai(@[0-9a-f]+)?$':
+    type: object
+    patternProperties:
+      "^dai([0-9]+)?$":
+        type: object
+        additionalProperties: false
+        properties:
+          playback:
+            $ref: /schemas/types.yaml#/definitions/phandle-array
+          capture:
+            $ref: /schemas/types.yaml#/definitions/phandle-array
+        anyOf:
+          - required:
+              - playback
+          - required:
+              - capture
+    additionalProperties: false
+
+  'ports(@[0-9a-f]+)?$':
+    $ref: audio-graph-port.yaml#/definitions/port-base
+    unevaluatedProperties: false
+    patternProperties:
+      '^port(@[0-9a-f]+)?$':
+        $ref: "#/properties/port"
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
+    sound@13c00000 {
+      #sound-dai-cells = <1>;
+      #clock-cells = <0>;
+      compatible = "renesas,r9a09g047-sound";
+      reg = <0x13c00000 0x10000>,
+            <0x13c20000 0x10000>,
+            <0x13c30000 0x1000>,
+            <0x13c31000 0x1f000>,
+            <0x13c50000 0x10000>;
+      reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
+      clocks = <&cpg 245>,
+               <&cpg 394>, <&cpg 393>,
+               <&cpg 392>, <&cpg 391>,
+               <&cpg 390>, <&cpg 389>,
+               <&cpg 388>, <&cpg 387>,
+               <&cpg 386>, <&cpg 385>,
+               <&cpg 381>, <&cpg 380>,
+               <&cpg 379>, <&cpg 378>,
+               <&cpg 377>, <&cpg 376>,
+               <&cpg 375>, <&cpg 374>,
+               <&cpg 373>, <&cpg 372>,
+               <&cpg 371>, <&cpg 370>,
+               <&cpg 371>, <&cpg 370>,
+               <&cpg 368>, <&cpg 369>,
+               <&cpg 251>, <&cpg 252>,
+               <&cpg 253>, <&cpg 250>,
+               <&cpg 384>,
+               <&cpg 246>, <&cpg 247>,
+               <&cpg 382>,
+               <&cpg 361>, <&cpg 360>,
+               <&cpg 359>, <&cpg 358>,
+               <&cpg 357>, <&cpg 356>,
+               <&cpg 355>, <&cpg 354>,
+               <&cpg 353>, <&cpg 352>,
+               <&cpg 248>, <&cpg 249>;
+      clock-names = "ssi-all",
+                    "ssi.9", "ssi.8",
+                    "ssi.7", "ssi.6",
+                    "ssi.5", "ssi.4",
+                    "ssi.3", "ssi.2",
+                    "ssi.1", "ssi.0",
+                    "src.9", "src.8",
+                    "src.7", "src.6",
+                    "src.5", "src.4",
+                    "src.3", "src.2",
+                    "src.1", "src.0",
+                    "mix.1", "mix.0",
+                    "ctu.1", "ctu.0",
+                    "dvc.0", "dvc.1",
+                    "clk_a", "clk_b",
+                    "clk_c", "clk_i",
+                    "ssif_supply",
+                    "scu", "scu_x2",
+                    "scu_supply",
+                    "adg.ssi.9", "adg.ssi.8",
+                    "adg.ssi.7", "adg.ssi.6",
+                    "adg.ssi.5", "adg.ssi.4",
+                    "adg.ssi.3", "adg.ssi.2",
+                    "adg.ssi.1", "adg.ssi.0",
+                    "audmapp", "adg";
+      power-domains = <&cpg>;
+      resets = <&cpg 225>,
+               <&cpg 235>, <&cpg 234>,
+               <&cpg 233>, <&cpg 232>,
+               <&cpg 231>, <&cpg 230>,
+               <&cpg 229>, <&cpg 228>,
+               <&cpg 227>, <&cpg 226>,
+               <&cpg 236>, <&cpg 238>, <&cpg 237>;
+      reset-names = "ssi-all",
+                    "ssi.9", "ssi.8",
+                    "ssi.7", "ssi.6",
+                    "ssi.5", "ssi.4",
+                    "ssi.3", "ssi.2",
+                    "ssi.1", "ssi.0",
+                    "scu", "adg",
+                    "audmapp";
+
+      ctu {
+        ctu-0 { };
+        ctu-1 { };
+        ctu-2 { };
+        ctu-3 { };
+        ctu-4 { };
+        ctu-5 { };
+        ctu-6 { };
+        ctu-7 { };
+      };
+
+      dvc {
+        dvc-0 {
+          dmas = <&dmac0 0x1db3>, <&dmac1 0x1db3>,
+                 <&dmac2 0x1db3>, <&dmac3 0x1db3>,
+                 <&dmac4 0x1db3>;
+          dma-names = "tx", "tx", "tx", "tx", "tx";
+        };
+        dvc-1 {
+          dmas = <&dmac0 0x1db4>, <&dmac1 0x1db4>,
+                 <&dmac2 0x1db4>, <&dmac3 0x1db4>,
+                 <&dmac4 0x1db4>;
+          dma-names = "tx", "tx", "tx", "tx", "tx";
+        };
+      };
+
+      mix {
+        mix-0 { };
+        mix-1 { };
+      };
+
+      src {
+        src-0 {
+          interrupts = <GIC_SPI 902 IRQ_TYPE_LEVEL_HIGH>;
+          dmas = <&dmac0 0x1d9f>, <&dmac0 0x1da9>,
+                 <&dmac1 0x1d9f>, <&dmac1 0x1da9>,
+                 <&dmac2 0x1d9f>, <&dmac2 0x1da9>,
+                 <&dmac3 0x1d9f>, <&dmac3 0x1da9>,
+                 <&dmac4 0x1d9f>, <&dmac4 0x1da9>;
+          dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
+                      "rx", "tx", "rx", "tx";
+        };
+        src-1 {
+          interrupts = <GIC_SPI 903 IRQ_TYPE_LEVEL_HIGH>;
+          dmas = <&dmac0 0x1da0>, <&dmac0 0x1daa>,
+                 <&dmac1 0x1da0>, <&dmac1 0x1daa>,
+                 <&dmac2 0x1da0>, <&dmac2 0x1daa>,
+                 <&dmac3 0x1da0>, <&dmac3 0x1daa>,
+                 <&dmac4 0x1da0>, <&dmac4 0x1daa>;
+          dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
+                      "rx", "tx", "rx", "tx";
+        };
+        src-2 {
+          interrupts = <GIC_SPI 904 IRQ_TYPE_LEVEL_HIGH>;
+          dmas = <&dmac0 0x1da1>, <&dmac0 0x1dab>,
+                 <&dmac1 0x1da1>, <&dmac1 0x1dab>,
+                 <&dmac2 0x1da1>, <&dmac2 0x1dab>,
+                 <&dmac3 0x1da1>, <&dmac3 0x1dab>,
+                 <&dmac4 0x1da1>, <&dmac4 0x1dab>;
+          dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
+                      "rx", "tx", "rx", "tx";
+        };
+        src-3 {
+          interrupts = <GIC_SPI 905 IRQ_TYPE_LEVEL_HIGH>;
+          dmas = <&dmac0 0x1da2>, <&dmac0 0x1dac>,
+                 <&dmac1 0x1da2>, <&dmac1 0x1dac>,
+                 <&dmac2 0x1da2>, <&dmac2 0x1dac>,
+                 <&dmac3 0x1da2>, <&dmac3 0x1dac>,
+                 <&dmac4 0x1da2>, <&dmac4 0x1dac>;
+          dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
+                      "rx", "tx", "rx", "tx";
+        };
+        src-4 {
+          interrupts = <GIC_SPI 906 IRQ_TYPE_LEVEL_HIGH>;
+          dmas = <&dmac0 0x1da3>, <&dmac0 0x1dad>,
+                 <&dmac1 0x1da3>, <&dmac1 0x1dad>,
+                 <&dmac2 0x1da3>, <&dmac2 0x1dad>,
+                 <&dmac3 0x1da3>, <&dmac3 0x1dad>,
+                 <&dmac4 0x1da3>, <&dmac4 0x1dad>;
+          dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
+                      "rx", "tx", "rx", "tx";
+        };
+        src-5 {
+          interrupts = <GIC_SPI 907 IRQ_TYPE_LEVEL_HIGH>;
+          dmas = <&dmac0 0x1da4>, <&dmac0 0x1dae>,
+                 <&dmac1 0x1da4>, <&dmac1 0x1dae>,
+                 <&dmac2 0x1da4>, <&dmac2 0x1dae>,
+                 <&dmac3 0x1da4>, <&dmac3 0x1dae>,
+                 <&dmac4 0x1da4>, <&dmac4 0x1dae>;
+          dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
+                      "rx", "tx", "rx", "tx";
+        };
+        src-6 {
+          interrupts = <GIC_SPI 908 IRQ_TYPE_LEVEL_HIGH>;
+          dmas = <&dmac0 0x1da5>, <&dmac0 0x1daf>,
+                 <&dmac1 0x1da5>, <&dmac1 0x1daf>,
+                 <&dmac2 0x1da5>, <&dmac2 0x1daf>,
+                 <&dmac3 0x1da5>, <&dmac3 0x1daf>,
+                 <&dmac4 0x1da5>, <&dmac4 0x1daf>;
+          dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
+                      "rx", "tx", "rx", "tx";
+        };
+        src-7 {
+          interrupts = <GIC_SPI 909 IRQ_TYPE_LEVEL_HIGH>;
+          dmas = <&dmac0 0x1da6>, <&dmac0 0x1db0>,
+                 <&dmac1 0x1da6>, <&dmac1 0x1db0>,
+                 <&dmac2 0x1da6>, <&dmac2 0x1db0>,
+                 <&dmac3 0x1da6>, <&dmac3 0x1db0>,
+                 <&dmac4 0x1da6>, <&dmac4 0x1db0>;
+          dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
+                      "rx", "tx", "rx", "tx";
+        };
+        src-8 {
+          interrupts = <GIC_SPI 910 IRQ_TYPE_LEVEL_HIGH>;
+          dmas = <&dmac0 0x1da7>, <&dmac0 0x1db1>,
+                 <&dmac1 0x1da7>, <&dmac1 0x1db1>,
+                 <&dmac2 0x1da7>, <&dmac2 0x1db1>,
+                 <&dmac3 0x1da7>, <&dmac3 0x1db1>,
+                 <&dmac4 0x1da7>, <&dmac4 0x1db1>;
+          dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
+                      "rx", "tx", "rx", "tx";
+        };
+        src-9 {
+          interrupts = <GIC_SPI 911 IRQ_TYPE_LEVEL_HIGH>;
+          dmas = <&dmac0 0x1da8>, <&dmac0 0x1db2>,
+                 <&dmac1 0x1da8>, <&dmac1 0x1db2>,
+                 <&dmac2 0x1da8>, <&dmac2 0x1db2>,
+                 <&dmac3 0x1da8>, <&dmac3 0x1db2>,
+                 <&dmac4 0x1da8>, <&dmac4 0x1db2>;
+          dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
+                      "rx", "tx", "rx", "tx";
+        };
+      };
+
+      ssi {
+        ssi-0 {
+          interrupts = <GIC_SPI 889 IRQ_TYPE_LEVEL_HIGH>;
+        };
+        ssi-1 {
+          interrupts = <GIC_SPI 890 IRQ_TYPE_LEVEL_HIGH>;
+        };
+        ssi-2 {
+          interrupts = <GIC_SPI 891 IRQ_TYPE_LEVEL_HIGH>;
+        };
+        ssi-3 {
+          interrupts = <GIC_SPI 892 IRQ_TYPE_LEVEL_HIGH>;
+        };
+        ssi-4 {
+          interrupts = <GIC_SPI 893 IRQ_TYPE_LEVEL_HIGH>;
+          shared-pin;
+        };
+        ssi-5 {
+          interrupts = <GIC_SPI 894 IRQ_TYPE_LEVEL_HIGH>;
+        };
+        ssi-6 {
+          interrupts = <GIC_SPI 895 IRQ_TYPE_LEVEL_HIGH>;
+        };
+        ssi-7 {
+          interrupts = <GIC_SPI 896 IRQ_TYPE_LEVEL_HIGH>;
+        };
+        ssi-8 {
+          interrupts = <GIC_SPI 897 IRQ_TYPE_LEVEL_HIGH>;
+        };
+        ssi-9 {
+          interrupts = <GIC_SPI 898 IRQ_TYPE_LEVEL_HIGH>;
+        };
+      };
+
+      ssiu {
+        ssiu-0 {
+          dmas = <&dmac0 0x1d61>, <&dmac0 0x1d62>,
+                 <&dmac1 0x1d61>, <&dmac1 0x1d62>,
+                 <&dmac2 0x1d61>, <&dmac2 0x1d62>,
+                 <&dmac3 0x1d61>, <&dmac3 0x1d62>,
+                 <&dmac4 0x1d61>, <&dmac4 0x1d62>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-1 {
+          dmas = <&dmac0 0x1d63>, <&dmac0 0x1d64>,
+                 <&dmac1 0x1d63>, <&dmac1 0x1d64>,
+                 <&dmac2 0x1d63>, <&dmac2 0x1d64>,
+                 <&dmac3 0x1d63>, <&dmac3 0x1d64>,
+                 <&dmac4 0x1d63>, <&dmac4 0x1d64>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-2 {
+          dmas = <&dmac0 0x1d65>, <&dmac0 0x1d66>,
+                 <&dmac1 0x1d65>, <&dmac1 0x1d66>,
+                 <&dmac2 0x1d65>, <&dmac2 0x1d66>,
+                 <&dmac3 0x1d65>, <&dmac3 0x1d66>,
+                 <&dmac4 0x1d65>, <&dmac4 0x1d66>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-3 {
+          dmas = <&dmac0 0x1d67>, <&dmac0 0x1d68>,
+                 <&dmac1 0x1d67>, <&dmac1 0x1d68>,
+                 <&dmac2 0x1d67>, <&dmac2 0x1d68>,
+                 <&dmac3 0x1d67>, <&dmac3 0x1d68>,
+                 <&dmac4 0x1d67>, <&dmac4 0x1d68>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-4 {
+          dmas = <&dmac0 0x1d69>, <&dmac0 0x1d6a>,
+                 <&dmac1 0x1d69>, <&dmac1 0x1d6a>,
+                 <&dmac2 0x1d69>, <&dmac2 0x1d6a>,
+                 <&dmac3 0x1d69>, <&dmac3 0x1d6a>,
+                 <&dmac4 0x1d69>, <&dmac4 0x1d6a>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-5 {
+          dmas = <&dmac0 0x1d6b>, <&dmac0 0x1d6c>,
+                 <&dmac1 0x1d6b>, <&dmac1 0x1d6c>,
+                 <&dmac2 0x1d6b>, <&dmac2 0x1d6c>,
+                 <&dmac3 0x1d6b>, <&dmac3 0x1d6c>,
+                 <&dmac4 0x1d6b>, <&dmac4 0x1d6c>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-6 {
+          dmas = <&dmac0 0x1d6d>, <&dmac0 0x1d6e>,
+                 <&dmac1 0x1d6d>, <&dmac1 0x1d6e>,
+                 <&dmac2 0x1d6d>, <&dmac2 0x1d6e>,
+                 <&dmac3 0x1d6d>, <&dmac3 0x1d6e>,
+                 <&dmac4 0x1d6d>, <&dmac4 0x1d6e>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-7 {
+          dmas = <&dmac0 0x1d6f>, <&dmac0 0x1d70>,
+                 <&dmac1 0x1d6f>, <&dmac1 0x1d70>,
+                 <&dmac2 0x1d6f>, <&dmac2 0x1d70>,
+                 <&dmac3 0x1d6f>, <&dmac3 0x1d70>,
+                 <&dmac4 0x1d6f>, <&dmac4 0x1d70>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-8 {
+          dmas = <&dmac0 0x1d71>, <&dmac0 0x1d72>,
+                 <&dmac1 0x1d71>, <&dmac1 0x1d72>,
+                 <&dmac2 0x1d71>, <&dmac2 0x1d72>,
+                 <&dmac3 0x1d71>, <&dmac3 0x1d72>,
+                 <&dmac4 0x1d71>, <&dmac4 0x1d72>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-9 {
+          dmas = <&dmac0 0x1d73>, <&dmac0 0x1d74>,
+                 <&dmac1 0x1d73>, <&dmac1 0x1d74>,
+                 <&dmac2 0x1d73>, <&dmac2 0x1d74>,
+                 <&dmac3 0x1d73>, <&dmac3 0x1d74>,
+                 <&dmac4 0x1d73>, <&dmac4 0x1d74>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-10 {
+          dmas = <&dmac0 0x1d75>, <&dmac0 0x1d76>,
+                 <&dmac1 0x1d75>, <&dmac1 0x1d76>,
+                 <&dmac2 0x1d75>, <&dmac2 0x1d76>,
+                 <&dmac3 0x1d75>, <&dmac3 0x1d76>,
+                 <&dmac4 0x1d75>, <&dmac4 0x1d76>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-11 {
+          dmas = <&dmac0 0x1d77>, <&dmac0 0x1d78>,
+                 <&dmac1 0x1d77>, <&dmac1 0x1d78>,
+                 <&dmac2 0x1d77>, <&dmac2 0x1d78>,
+                 <&dmac3 0x1d77>, <&dmac3 0x1d78>,
+                 <&dmac4 0x1d77>, <&dmac4 0x1d78>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-12 {
+          dmas = <&dmac0 0x1d79>, <&dmac0 0x1d7a>,
+                 <&dmac1 0x1d79>, <&dmac1 0x1d7a>,
+                 <&dmac2 0x1d79>, <&dmac2 0x1d7a>,
+                 <&dmac3 0x1d79>, <&dmac3 0x1d7a>,
+                 <&dmac4 0x1d79>, <&dmac4 0x1d7a>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-13 {
+          dmas = <&dmac0 0x1d7b>, <&dmac0 0x1d7c>,
+                 <&dmac1 0x1d7b>, <&dmac1 0x1d7c>,
+                 <&dmac2 0x1d7b>, <&dmac2 0x1d7c>,
+                 <&dmac3 0x1d7b>, <&dmac3 0x1d7c>,
+                 <&dmac4 0x1d7b>, <&dmac4 0x1d7c>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-14 {
+          dmas = <&dmac0 0x1d7d>, <&dmac0 0x1d7e>,
+                 <&dmac1 0x1d7d>, <&dmac1 0x1d7e>,
+                 <&dmac2 0x1d7d>, <&dmac2 0x1d7e>,
+                 <&dmac3 0x1d7d>, <&dmac3 0x1d7e>,
+                 <&dmac4 0x1d7d>, <&dmac4 0x1d7e>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-15 {
+          dmas = <&dmac0 0x1d7f>, <&dmac0 0x1d80>,
+                 <&dmac1 0x1d7f>, <&dmac1 0x1d80>,
+                 <&dmac2 0x1d7f>, <&dmac2 0x1d80>,
+                 <&dmac3 0x1d7f>, <&dmac3 0x1d80>,
+                 <&dmac4 0x1d7f>, <&dmac4 0x1d80>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-16 {
+          dmas = <&dmac0 0x1d81>, <&dmac0 0x1d82>,
+                 <&dmac1 0x1d81>, <&dmac1 0x1d82>,
+                 <&dmac2 0x1d81>, <&dmac2 0x1d82>,
+                 <&dmac3 0x1d81>, <&dmac3 0x1d82>,
+                 <&dmac4 0x1d81>, <&dmac4 0x1d82>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-17 {
+          dmas = <&dmac0 0x1d83>, <&dmac0 0x1d84>,
+                 <&dmac1 0x1d83>, <&dmac1 0x1d84>,
+                 <&dmac2 0x1d83>, <&dmac2 0x1d84>,
+                 <&dmac3 0x1d83>, <&dmac3 0x1d84>,
+                 <&dmac4 0x1d83>, <&dmac4 0x1d84>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-18 {
+          dmas = <&dmac0 0x1d85>, <&dmac0 0x1d86>,
+                 <&dmac1 0x1d85>, <&dmac1 0x1d86>,
+                 <&dmac2 0x1d85>, <&dmac2 0x1d86>,
+                 <&dmac3 0x1d85>, <&dmac3 0x1d86>,
+                 <&dmac4 0x1d85>, <&dmac4 0x1d86>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-19 {
+          dmas = <&dmac0 0x1d87>, <&dmac0 0x1d88>,
+                 <&dmac1 0x1d87>, <&dmac1 0x1d88>,
+                 <&dmac2 0x1d87>, <&dmac2 0x1d88>,
+                 <&dmac3 0x1d87>, <&dmac3 0x1d88>,
+                 <&dmac4 0x1d87>, <&dmac4 0x1d88>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-20 {
+          dmas = <&dmac0 0x1d89>, <&dmac0 0x1d8a>,
+                 <&dmac1 0x1d89>, <&dmac1 0x1d8a>,
+                 <&dmac2 0x1d89>, <&dmac2 0x1d8a>,
+                 <&dmac3 0x1d89>, <&dmac3 0x1d8a>,
+                 <&dmac4 0x1d89>, <&dmac4 0x1d8a>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-21 {
+          dmas = <&dmac0 0x1d8b>, <&dmac0 0x1d8c>,
+                 <&dmac1 0x1d8b>, <&dmac1 0x1d8c>,
+                 <&dmac2 0x1d8b>, <&dmac2 0x1d8c>,
+                 <&dmac3 0x1d8b>, <&dmac3 0x1d8c>,
+                 <&dmac4 0x1d8b>, <&dmac4 0x1d8c>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-22 {
+          dmas = <&dmac0 0x1d8d>, <&dmac0 0x1d8e>,
+                 <&dmac1 0x1d8d>, <&dmac1 0x1d8e>,
+                 <&dmac2 0x1d8d>, <&dmac2 0x1d8e>,
+                 <&dmac3 0x1d8d>, <&dmac3 0x1d8e>,
+                 <&dmac4 0x1d8d>, <&dmac4 0x1d8e>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-23 {
+          dmas = <&dmac0 0x1d8f>, <&dmac0 0x1d90>,
+                 <&dmac1 0x1d8f>, <&dmac1 0x1d90>,
+                 <&dmac2 0x1d8f>, <&dmac2 0x1d90>,
+                 <&dmac3 0x1d8f>, <&dmac3 0x1d90>,
+                 <&dmac4 0x1d8f>, <&dmac4 0x1d90>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-24 {
+          dmas = <&dmac0 0x1d91>, <&dmac0 0x1d92>,
+                 <&dmac1 0x1d91>, <&dmac1 0x1d92>,
+                 <&dmac2 0x1d91>, <&dmac2 0x1d92>,
+                 <&dmac3 0x1d91>, <&dmac3 0x1d92>,
+                 <&dmac4 0x1d91>, <&dmac4 0x1d92>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-25 {
+          dmas = <&dmac0 0x1d93>, <&dmac0 0x1d94>,
+                 <&dmac1 0x1d93>, <&dmac1 0x1d94>,
+                 <&dmac2 0x1d93>, <&dmac2 0x1d94>,
+                 <&dmac3 0x1d93>, <&dmac3 0x1d94>,
+                 <&dmac4 0x1d93>, <&dmac4 0x1d94>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-26 {
+          dmas = <&dmac0 0x1d95>, <&dmac0 0x1d96>,
+                 <&dmac1 0x1d95>, <&dmac1 0x1d96>,
+                 <&dmac2 0x1d95>, <&dmac2 0x1d96>,
+                 <&dmac3 0x1d95>, <&dmac3 0x1d96>,
+                 <&dmac4 0x1d95>, <&dmac4 0x1d96>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+        ssiu-27 {
+          dmas = <&dmac0 0x1d97>, <&dmac0 0x1d98>,
+                 <&dmac1 0x1d97>, <&dmac1 0x1d98>,
+                 <&dmac2 0x1d97>, <&dmac2 0x1d98>,
+                 <&dmac3 0x1d97>, <&dmac3 0x1d98>,
+                 <&dmac4 0x1d97>, <&dmac4 0x1d98>;
+          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+        };
+      };
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        port@0 {
+          reg = <0>;
+          rsnd_endpoint0: endpoint {
+            remote-endpoint = <&codec_endpoint>;
+            dai-format = "i2s";
+            bitclock-master = <&rsnd_endpoint0>;
+            frame-master = <&rsnd_endpoint0>;
+            playback = <&ssi3>, <&src1>, <&dvc1>;
+            capture = <&ssi4>, <&src0>, <&dvc0>;
+          };
+        };
+      };
+    };
-- 
2.25.1


