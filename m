Return-Path: <linux-renesas-soc+bounces-33983-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id smY+BL6bL2q9DAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33983-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 08:29:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A26C7683CF8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 08:29:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=ccBqnPwE;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33983-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33983-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 98FA730058D4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 06:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB8B3B388D;
	Mon, 15 Jun 2026 06:29:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AFF3B27DB;
	Mon, 15 Jun 2026 06:29:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781504942; cv=none; b=jX1svZlffexVe0+9etCVKYCA6jvf8j7d397bwCru/M0Fcc5zr1wpyiNVBu0S0YPe7NUZGAgHvm+LF21hhFZm6ra5xbLQ+YqTU/it0UavHERWku7nKKwoq8ED4vkg2vS8wdC99C0sEWWR/XEXMwISDaqFx7wg+DlhKDvO49yD/DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781504942; c=relaxed/simple;
	bh=Q+vWROCkyxbdePgyDNdwmpIRQZm9nnAfy3QsDQuHiik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S5inOBI75kD4rAv4GTBaAjuLf7HF5kugP8wlnhoSCdKe8Rqu3zQluuLWYqy2okJavFsYurwMh69QyppKfs5Oe8RdO844Iv+5THX/j97xVPZAtGLq+S/UcXu8cmIsGr080mpu2pn2nT2I65IA4deKnkmL9TiSg4IqkuHsczRQKJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ccBqnPwE; arc=none smtp.client-ip=213.167.242.64
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A509B176E;
	Mon, 15 Jun 2026 08:28:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781504898;
	bh=Q+vWROCkyxbdePgyDNdwmpIRQZm9nnAfy3QsDQuHiik=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ccBqnPwEqzfEVJnquOZWMG5bd/F9807STACiVb1ybXSmm3mhjUU7lK9hClFNHO9DL
	 9HJw6C2iGdF7823m0gMWHWeKubeDYF9lBiurfHnKY4KQcW3oqo51BMopyybVr8BCBX
	 T4U5lyXtexuA1x+bEtbWP3hpojEEi7XUQWjzvf5g=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 15 Jun 2026 09:28:07 +0300
Subject: [PATCH v4 2/7] dt-bindings: display: bridge: Document Renesas
 R-Car V4H DSC bindings
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-rcar-du-dsc-v4-2-93096a1b56a3@ideasonboard.com>
References: <20260615-rcar-du-dsc-v4-0-93096a1b56a3@ideasonboard.com>
In-Reply-To: <20260615-rcar-du-dsc-v4-0-93096a1b56a3@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3295;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=ATBIlWckMfWT6M2iqlfX1jDB+TBcgODuf+LM9aYDXLc=;
 b=kA0DAAgB+j2qjLyWHvUByyZiAGovm5vIuUqBMro5gEZvXgSG103+LjhG/liLVeJKEFqy2SHkH
 IkCMwQAAQgAHRYhBMQ4DD6WXv2BB5/zp/o9qoy8lh71BQJqL5ubAAoJEPo9qoy8lh71lZ4P/jtl
 nykXdzw8e3zmUivQA8LT4axHg3ZtOjCDLDKBGGxpnAGTrOkx2md8v1spiXt8qnkG3iHbC64m8/G
 nCwp2MWeHFFmWqco0cILV6gVZL5CLAYzgeFI74YRYsSOtV82pFWDd9Q14fdZ7ifC6pynTFnLzcC
 wnbmtQtK52Fmjb6rLzvWXoNWpFF8bD3Onr7MXPN+q1PPPDZfpmcv+gqUDdql65yV0FVULtYLrAH
 zE0WQ5f5+AjhAEPW7VIkao+YIqxc5U2icv3aoIyr03AlSCE+pG80nwWvUyUHd7H/9A/c4MjdRBV
 rZ6tuUWTbislGKpLotTZ8sA8+l/ut1KyetP+lq21LggEq+98nFpDxAoMQesXm6ccdrJaekPXbrj
 5pfyxiy3xlorKRJo1Q2wTu6Y9bNTnj+5mSmGoIliKKq3NWlN95P8t/sZ5d5yxG95otMZJdzeAbo
 JRa1S/BAJRTB+yYPa2mahYLOeunQ3iZosDrFjoxKRfjNn8PtdFZ2Ufe1bLJryMrvmj4yciRQanu
 mtgYj0a80LK6JaFHTyZiynKcUONeHurngwxFa5N02c8Obds9b+UkUIh0gUt7q9pvwKqDYddE9NI
 LYpq3epSyxBHi20YXWMio3X4UPjAG1UZ91j0Iihv2nrliR01OdG3y8jY7yOJk3EUiv5ItOno2T7
 JJzCz
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33983-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:marek.vasut+renesas@mailbox.org,m:laurent.pinchart+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:tomi.valkeinen+renesas@ideasonboard.com,m:conor.dooley@microchip.com,m:geert@glider.be,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:marek.vasut@mailbox.org,m:laurent.pinchart@ideasonboard.com,m:kier
 an.bingham@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,mailbox.org,pengutronix.de];
	FORGED_SENDER(0.00)[tomi.valkeinen@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime,mailbox.org:email,vger.kernel.org:from_smtp,devicetree.org:url,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A26C7683CF8

From: Marek Vasut <marek.vasut+renesas@mailbox.org>

The Renesas DSC Display Stream Compression is a bridge embedded in the
Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
8k or 400 Mpixel/s .

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
[tomi.valkeinen: fix the example]
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/display/bridge/renesas,dsc.yaml       | 99 ++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml
new file mode 100644
index 000000000000..4d2c2c6cb1f0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml
@@ -0,0 +1,99 @@
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
+    items:
+      - enum:
+          - renesas,r8a779g0-dsc
+      - const: renesas,rcar-dsc
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
+    bridge@feb8d000 {
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


