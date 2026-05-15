Return-Path: <linux-renesas-soc+bounces-32662-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0H1tMMDsBmq4owIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32662-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 11:52:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2152D54CC60
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 11:51:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BA24317E5DE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 09:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D90438FF9;
	Fri, 15 May 2026 09:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DHKkwbeS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7033F436362;
	Fri, 15 May 2026 09:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836205; cv=none; b=n1z5HPXfNVdTQBlm+JkhDI7BFBSDZKa6MwWaG4btiPMHfY8Jadc5SUjicXQxcIPDIS9bJbQc6JOo8IrYyiJrQ6iq1mnmUMgQ6NhqwZDr4y+TtCvs1kgEo3zCOUFMqPK/oe620cFzIRM6/nNjEFhZaG5vPGPiz2rLatRrybxXnJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836205; c=relaxed/simple;
	bh=kHksZJfpFMV47h8nwdHcFDKgVfCurmMft/yFeQpokLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LS/0ZLk7wCwHv3/js7Cvjdtfn5K/YXVox3aWFUcSpzANR/CMdcByjW+cHjueNobQ1tz1vvDKFEv7KA4Xix1eAJW/vn4xwoV3nvJitrP9ce4Zw0EJruSnZ4ERQk12/9ZUYQr1y37iaMKK/tNZFzBg76KZ+FFmTNriR6dF/dogDJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DHKkwbeS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A0508FA;
	Fri, 15 May 2026 11:09:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778836190;
	bh=kHksZJfpFMV47h8nwdHcFDKgVfCurmMft/yFeQpokLU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DHKkwbeSS5VYcx4gG5/X+1z7Y/8pVMELOaeTkpby2KYZcrKfSEZzBUOBOHWotYAMx
	 M0sGiedY/dy1qwq4TaVD4qbhi/jDtxdj+akVcK9sUSaddgjACvJa9rKZQwdzl00saV
	 5nxi5M/woIWNq9VIK7B69IFUGh3742lRAwK1rzWg=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Fri, 15 May 2026 12:09:27 +0300
Subject: [PATCH v3 2/7] dt-bindings: display: bridge: Document Renesas
 R-Car V4H DSC bindings
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-rcar-du-dsc-v3-2-164157820498@ideasonboard.com>
References: <20260515-rcar-du-dsc-v3-0-164157820498@ideasonboard.com>
In-Reply-To: <20260515-rcar-du-dsc-v3-0-164157820498@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3100;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=2I8UDeCqT/cBmhnGJPNLMM2v8v1+nikKwEBiZMwtls4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqBuLhbW1mhCjr09AFE2KgytB8mnKa6AjvIuikT
 NyD2PGebFmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCagbi4QAKCRD6PaqMvJYe
 9TSfD/0YKMJMP2O2NflaziOWV6m+6vSbdgJxqk1w/6BmTL8dSzVAeNYs03V0D7qyb6+dgYdwpwQ
 oE1QxE5RbhQbgScVDrFRpy5CzjLQG5ivXgq3fbGE5VOSDXQdgu5Y4BjimG2Z1LY9uml8LUjRMhf
 2a2AyCJuitisvfvXAvOklFqax+njfL7bEEENgIUdyOMXq3xHEmtjBqniVpYb2xDATFjbr8NSh9g
 LmTUYLU7HfYrv9vw8CsHAwBkBpqPrmPvgytbTHFOsW3/eclBhNLJWvQg8N/6sZPVtoGmWSFv3DT
 9+Gz2BBr/Cm8BK1yro6z0Pb72vuukaIIOS9Tz7V+i9DT0jyTZgzene86mwD22kkKeUgtcq00ikw
 xqh7kRnag/g2zUVUJxNblJZW80+l+ACfl5lxif2f8FW+ep2TYta2bhjP8iUo+x7xmPwu/wyy2Nw
 l1tzkCQKRagba9DJPqM8IUmvoF2nrtA8lq2JmsbHhZtOZTUtWFJ2RKgtkPCXO/MamEeApKlahO8
 XM0l4G9/0Bqwf7jJtpZgicyD3YbPSY6sQULQKnrlHVSBwJnV7xhCLT+BRPCVetsr1y1bB3yvloh
 ZCmji19tyhi8gaCNj0esJJA7Unuc7slB+pH8dns88nVkEuX1jBk8piw3ZorJlfZu+haZSGIWeRt
 H7CCBOKyMrV3b7g==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Queue-Id: 2152D54CC60
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32662-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,mailbox.org,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_TWELVE(0.00)[28];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

From: Marek Vasut <marek.vasut+renesas@mailbox.org>

The Renesas DSC Display Stream Compression is a bridge embedded in the
Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
8k or 400 Mpixel/s .

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
[tomi.valkeinen: fix the example]
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 .../bindings/display/bridge/renesas,dsc.yaml       | 96 ++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml
new file mode 100644
index 000000000000..2918d592732b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/renesas,dsc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car DSC Display Stream Compression
+
+maintainers:
+  - Marek Vasut <marek.vasut+renesas@mailbox.org>
+
+description: |
+  This binding describes the VESA DSC Display Stream Compression encoder
+  embedded in the Renesas R-Car V4H SoC. The encoder supports all DSC1.1
+  encoding mechanisms, configurable bits-per-pixel, resolution up to 8k.
+
+properties:
+  compatible:
+    const: renesas,r8a779g0-dsc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: R-Car DU input port
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: R-Car DSI output port
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - power-domains
+  - resets
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/r8a779g0-sysc.h>
+
+    dsc@feb8d000 {
+        compatible = "renesas,r8a779g0-dsc";
+        reg = <0xfeb8d000 0x400>;
+        interrupts = <GIC_SPI 559 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 2819>;
+        power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+        resets = <&cpg 2819>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                dsc_in_dsi1: endpoint {
+                    remote-endpoint = <&du_out_dsi1>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                dsc_out_dsi1: endpoint {
+                    remote-endpoint = <&dsi1_in>;
+                };
+            };
+        };
+    };
+...

-- 
2.43.0


