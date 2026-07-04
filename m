Return-Path: <linux-renesas-soc+bounces-34695-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W4SlDXrUSGpSuQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34695-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 11:38:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 974BA7074AA
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 11:38:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Vb2QMAeh;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34695-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34695-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5672F3044C2D
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jul 2026 09:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0981E3A5456;
	Sat,  4 Jul 2026 09:34:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1523A839B
	for <linux-renesas-soc@vger.kernel.org>; Sat,  4 Jul 2026 09:34:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783157684; cv=none; b=LqXL/VGHV3ACnYw+kiEvRTImjPQ0fY8OS8Ur8qQLf2u1CnnBikHR+R5i8pTcXn87mpULzOV52AVCnMc/Co45UjRjBeg7hqWO73pdZ9w/LKJbaCXQufsDpgq7N0Bw+6CP9odgrVdEv6Cx2ergz+tT8u7fNsydwtSiH4vVvV58sus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783157684; c=relaxed/simple;
	bh=snKhglGWIckZcflOiwrDrE+S7TikdgqkutBxhxmoNH8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SkGhaxLrQJitD3TKQOb9falL91UAe8Mb0T/HJQQL52T01h0jP/pp7vydoTkgssoBtPp7uajSH5HT8g1Ebm9gEhthHDl9fWoetBa9rMC2dj/KWXwXdYNzqob41iifOAGVNVfgDF6wVbBIqDyQwWIRCVWia739UDrU/i8+GxwyjqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vb2QMAeh; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so9320795e9.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Jul 2026 02:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783157681; x=1783762481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9/dzwCtwRsf4jvkojppL8L2pC35nv095p5pFGvFxaFc=;
        b=Vb2QMAehqIddMN40T50YmQiH0bqm+fxDRfBDO+af5x0M2tO5dj5+/+hSR2jMs9xnUn
         jhzT6x/LfBPQ9dJgf6GQY65x931F/WWHdAMtKarzJ7OvWQjVbUML4FgYY75/epkttUQt
         9uxuvKr149Bpgu9v4HNct9+dhVO+0hpbXkPK3lZcit/OofC4v8Z56+ZMrZ99MyjsO5p9
         lmk5pAX76t3gwCXwuPw1mFYdJaZ13C0qzGh+nEXmk5ipCJHYZdIIjsIzerBWOvS4/Eg2
         wOEN1PiMuyZnGpAVo//Z/X0EbmDeg5RNGUziYze5k0GKDBPR/1Qbi0HlK5dqLAtD657q
         Mp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783157681; x=1783762481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9/dzwCtwRsf4jvkojppL8L2pC35nv095p5pFGvFxaFc=;
        b=j3D/3hvEgLmHtxGKsCRsqfa2N/A5TGotTldrBPQGbCoryNs8IZaTA55XKWOdDfGIkb
         R337hMKwtIPPsjmoJ5W/sSxtP4VGcw2bzGwvO14yAE0quKtdplz/kGQrQTf4ACN+2flu
         5gVct6pNF0pNkEtNsgIhrjQGCZ820KtILKhGFqaJ5GQpoZOZXqUCX+9HWmiKsIjJaRW6
         GT+O/pbBMoha4K+Q4M8HryDMGWSXuySuCPnbuEW+HU1Fk4baxvBtsB5RLLSsxmbDNr5x
         DTLSVimufnujCN5fk7HbCdDjOUWui9I8tU39uePxN9MYmSiO+LLwJ/Zgna143gUKur/g
         K5IA==
X-Forwarded-Encrypted: i=1; AFNElJ95M5daI4Wpc0Y2l4XHEj8lGcNjuRqhQeZZ1y8VaAjirvyq3OGXQ8OC5qkBVtG4+1jufx7ch7mwDKAiC7uSMznHLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ6JooZY49wz/sUVhyuRC8uH6VqkeVe74vP5wsD5AmqfLcmoCl
	e2v9ZZFXSNF5FKEEfq14g2LvS40e2uk/xWcDqufYerq9omCyVXNurL+d
X-Gm-Gg: AfdE7ckS7+spNjnBXMMhJY6bdD6rCGLcyDx0P5qBpTIr5dLlyfxhgNjbQnHeGsPno3k
	k+gmkLg/2Zi0ni2ZKwnJ/nblG96mvZUj8JwJy3mFaeBHP+N7IWAXver0Ubc6g27GgqV1Q3D2wrl
	pYO2k2ONEkG7IbJnqp5bVlOQDZN2xpNMJ+t4Sp5yfdIDpcR7rl8zqMYHB5Lo1Uz4RiTrMrvXATm
	LyMMvYmSDs1Z0UXAzvPuXfvvuw1JLQqjB4keHX7lSqV6lMIIBRFQWbE7JkzYUH4oYkGfpNz86wm
	kzL+eEWS8CixD3j28jov8HZRhT1OCk8S09AuB3MlFqHwQF60GgC2xkKg9HK5SnIhr2qpUET7Xoj
	8NQa981Gpx3iuqt4eXnwb7BaL3k3+hhFv5czyGJKTTAQ2k5nW6SITRa8Hkf54r3m88GqpMvfkph
	XlERPYZ03mi2ofUu9jkZph
X-Received: by 2002:a05:600c:64c7:b0:492:7019:caca with SMTP id 5b1f17b1804b1-493d11f52f9mr26388245e9.26.1783157681044;
        Sat, 04 Jul 2026 02:34:41 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8c5b:5b11:f6a5:9bc9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce040b4sm153180235e9.10.2026.07.04.02.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 02:34:40 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 09/16] dt-bindings: display: bridge: Document Renesas RZ/G3L LVDS encoder
Date: Sat,  4 Jul 2026 10:34:19 +0100
Message-ID: <20260704093433.273672-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
References: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34695-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:tommaso.merciai.xr@bp.renesas.com,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,gmail.com,ffwll.ch,linux.intel.com,suse.de,glider.be];
	FREEMAIL_CC(0.00)[bp.renesas.com,ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,devicetree.org:url,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 974BA7074AA

From: Biju Das <biju.das.jz@bp.renesas.com>

Document the LVDS encoder IP found on the RZ/G3L SoC. It supports
single-link mode. LVDS and the DSI interface share a peripheral clock and
the MIPI_DSI_PRESET_N reset signal. However, the LVDS module cannot be
used at the same time as MIPI-DSI.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5[1]->v1:
 * No change.
v5 [1] https://lore.kernel.org/all/20260625172359.292631-2-biju.das.jz@bp.renesas.com/#t
v4->v5:
 * Collected tag.
v3->v4:
 * Dropped the tags as it is a rework dropping parent node that contains
   simple-mfd and syscon.
v2->v3:
 * Collected tag.
v2->v2[1]:
 * No change.
[1] https://lore.kernel.org/all/20260524195829.960401F000E9@smtp.kernel.org/
v1->v2:
 * Collected tag.
---
 .../bridge/renesas,r9a08g046-lvds.yaml        | 120 ++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml
new file mode 100644
index 000000000000..4cd7b688fbf7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/renesas,r9a08g046-lvds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G3L LVDS Encoder
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+  - Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
+
+description: |
+  This binding describes the LVDS encoder embedded in the Renesas RZ/G3L
+  SoC. The encoder can operate in LVDS Single-link mode with 4 lanes
+  (Data) + 1 lane (Clock).
+
+properties:
+  compatible:
+    const: renesas,r9a08g046-lvds
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Peripheral clock
+      - description: PHY clock
+      - description: Dot clock
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: phyclk
+      - const: dotclk
+
+  resets:
+    items:
+      - description: LVDS_RESET_N
+      - description: MIPI_DSI_PRESET_N
+      - description: MIPI_DSI_CMN_RSTB
+      - description: MIPI_DSI_ARESET_N
+
+  reset-names:
+    items:
+      - const: lvdrst
+      - const: prst
+      - const: rst
+      - const: arst
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input channel, directly connected to the Display Unit.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: |
+          Output channel, directly connected to the LVDS panel or bridge.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/renesas,r9a08g046-cpg.h>
+
+    lvds@108a0000 {
+        compatible = "renesas,r9a08g046-lvds";
+        reg = <0x108a0000 0x10000>;
+        clocks = <&cpg CPG_MOD R9A08G046_MIPI_DSI_PCLK>,
+                 <&cpg CPG_MOD R9A08G046_LVDS_PLLCLK>,
+                 <&cpg CPG_MOD R9A08G046_LVDS_CLK_DOT0>;
+        clock-names = "pclk", "phyclk", "dotclk";
+        resets = <&cpg R9A08G046_LVDS_RESET_N>,
+                 <&cpg R9A08G046_MIPI_DSI_PRESET_N>,
+                 <&cpg R9A08G046_MIPI_DSI_CMN_RSTB>,
+                 <&cpg R9A08G046_MIPI_DSI_ARESET_N>;
+        reset-names = "lvdrst", "prst", "rst", "arst";
+        power-domains = <&cpg>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                lvds0_in: endpoint {
+                    remote-endpoint = <&du_out_lvds0>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                lvds0_out: endpoint {
+                    remote-endpoint = <&panel_in>;
+                };
+            };
+        };
+    };
+...
-- 
2.43.0


