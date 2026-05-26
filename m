Return-Path: <linux-renesas-soc+bounces-33138-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECNGLL9QFWpMUQcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33138-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 09:50:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCC85D1ED6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 09:50:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0ACCC303D73C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 07:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4543911B2;
	Tue, 26 May 2026 07:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nuKOxmeB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DF93CC33D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 26 May 2026 07:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779781676; cv=none; b=K2TTHxEvhqvamLbFoFjro9NqK0qr5rkKI2IiTOr4nhkSdkBJbKs9IQ5+iCcbOOIDtGnNf7XMKZ9DG+wTR5bWc+Z5N3fXK058j4TH2qXMXQzs/xVnzpQc37leAjUwt+JVN0Qjj6pSg6bLBIsesCbMbhwbVZXVdK80H43a1XpILYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779781676; c=relaxed/simple;
	bh=n1DtoBZuhb6x6ID+/i33USvSYjT6QvCCgh+3YAxC/u4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=En8tNu+484eRvbMDFeagp1q2F5PvL++aR2Shdv2zn+8O0vXQvBME/wWlT9qcjwMEmmUmpDx9/uJ9JxyiCHo8Focqe1cTcXCJVHOPrjpV1h9UQMgq1gggoRbZ6RWeGfRvvwpUycqnJGnhqPzsF4tOFZ8yHiP8fa5oKryAkG/uoWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nuKOxmeB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso63881965e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 May 2026 00:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779781672; x=1780386472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LBh+uiKYVAcFVXpV57ihLoKRc6InQ9I4cC8J3sHjzn4=;
        b=nuKOxmeBT9m/6yHF7RE7yqqa3Z2L5LFhk+VG/dNTT5B7Q0ai2K+MFwuSkvIwSDiAYm
         ep+TINppXKeNL62IPlv2I2wbwQoSyqQ7+nuS2NQ7wEhSfXRiPRRK72EHot+FXgqACbDZ
         MEnyNDkW57Edigtf1iMa914m9kOt0pu5e/reGA30wjgUoLCOymTVrR0MukI9h/bdcU3U
         7HT5DyhfM7a3ymt9YbnMIkh4THd/SDXpWvzKRmz9yTCMQYJhYcTzILseSvuQyxrnYGzj
         PD6r9/mBmb/9pY4JyvKU4Xl7Gl9PWGAxnc2FT6Kaz22mC3GCF0udWgQruEO7IWp5cQgN
         Thag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779781672; x=1780386472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LBh+uiKYVAcFVXpV57ihLoKRc6InQ9I4cC8J3sHjzn4=;
        b=rdaZqDKZL8eucWJYm+AOOYxBt0sknYCijhc4gXiiwf1DgzeuuY+qfoxWjKBa7VRilv
         XGXecxU3hJiQTQkEVpbQny0WDrQKJZUpWPhlf1auSYmTKj3rRIG1n+Uy9mO1GkdB/Inp
         7/UzYXtKszbjqBfQZTIS/qoDBtMc0oHr3tdhYNjpTY0RzRA3QF0JvjAXQfGEYOrk1apm
         ldYS8+yfYfroL9kT9+wKCwABuYeoEz2iY3+KIYDxU8cQBbu0PtpHkGyrOVVGNzlgWhjP
         n6hDDs/LNGo7IgHsumInRcfmsOHlbY2jv0fPXgvtIdhAYD49q+eQhwF/9moCZhk04te2
         r/+A==
X-Forwarded-Encrypted: i=1; AFNElJ/8pfSTA+/TPvi4v2z0iKySUKbZ6SX1OIQIevu0uSGIPb+UJTbSpphQP+MSlvH/GmnZkHRp/B+YaC4+mRaOnoP7sQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiT6pJS9DjiokdYcdcLlUD5Q3w/vkw9l7N0NMHc9vrFLUS/rb+
	dp3DAHtJhgZMofKJA6ZL4pVHYEUxVMTwh2dFl1HMXA+rrsu+A4p1hwIv
X-Gm-Gg: Acq92OEaiSXaGtAlIa2dTItVwcHZJyPLQtDt0N+qXWfqCxF4nDEfHjLkF+9c+6yieGS
	MBQQ1QiKBSO0AESN+PkQpk4qdSen+yCIrhuPW642QgnVv6yGXPnhYzvyr0HCCBaogYZKQMAPdZb
	AF7JUZGHCjrgN3kWdz4eSIeLcQeLF/4LGhjRkCtznEttYtMjWRukEJ4l9cqy5EJnPUB4SipWzHs
	XakZ/2ShyG7jZf6aE5dm2G9tZ0veZW06wd+EHZZJMAqQmxURzYiG9MVRGL72J47/yCI8YjreQbc
	YskJDCIVe/38YrMiX3hcA0fV6BiyiE9gPvEZGLl2EBf2qmdhwm/uY9ILBnfOaPUSJMn/5+7LYH1
	55NmS1fbvJ8C2cJI2Z6MPb7c+Zzut28SdIRqPLgqYWK0g3s7bdtDwZ9Zkt2Mryj4PD2AyLz5D05
	OfWjDx51viqMKkqPhuGEwUZL9AFAIVm/B7BQ+NBeIFxUPndvIYHT37o1rb2u8=
X-Received: by 2002:a05:600c:470e:b0:489:1cd2:610a with SMTP id 5b1f17b1804b1-490426aa413mr288737895e9.9.1779781671902;
        Tue, 26 May 2026 00:47:51 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:c204:f511:e9bc:10b7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490428d63f8sm102848155e9.18.2026.05.26.00.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 00:47:51 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/2] dt-bindings: display: bridge: Document Renesas RZ/G3L LVDS encoder
Date: Tue, 26 May 2026 08:47:42 +0100
Message-ID: <20260526074746.20371-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526074746.20371-1-biju.das.jz@bp.renesas.com>
References: <20260526074746.20371-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33138-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,microchip.com];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,gmail.com,ffwll.ch,linux.intel.com,suse.de,glider.be];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[108a0000:email,0.0.0.10:email,0.0.0.0:email,devicetree.org:url,renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.1:email,microchip.com:email]
X-Rspamd-Queue-Id: 1BCC85D1ED6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Document the LVDS encoder IP found on the RZ/G3L SoC. It supports
single-link mode. LVDS and the DSI interface share a peripheral clock and
the MIPI_DSI_PRESET_N reset signal. However, the LVDS module cannot be
used at the same time as MIPI-DSI.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Collected tag.
v2->v2[1]:
 * No change.
[1] https://lore.kernel.org/all/20260524195829.960401F000E9@smtp.kernel.org/
v1->v2:
 * Collected tag.
---
 .../bridge/renesas,r9a08g046-lvds.yaml        | 128 ++++++++++++++++++
 1 file changed, 128 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml
new file mode 100644
index 000000000000..b1f6d020ae7b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml
@@ -0,0 +1,128 @@
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
+  This binding describe the LVDS encoder embedded in the Renesas RZ/G3L
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
+    lvds-cmn@108a0000 {
+        compatible = "renesas,r9a08g046-lvds-cmn",
+                     "simple-mfd", "syscon";
+        reg = <0x108a0000 0x10000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        lvds0: lvds@10 {
+            compatible = "renesas,r9a08g046-lvds";
+            reg = <0x10 0x8>;
+            clocks = <&cpg CPG_MOD R9A08G046_MIPI_DSI_PCLK>,
+                     <&cpg CPG_MOD R9A08G046_LVDS_PLLCLK>,
+                     <&cpg CPG_MOD R9A08G046_LVDS_CLK_DOT0>;
+            clock-names = "pclk", "phyclk", "dotclk";
+            resets = <&cpg R9A08G046_LVDS_RESET_N>,
+                     <&cpg R9A08G046_MIPI_DSI_PRESET_N>,
+                     <&cpg R9A08G046_MIPI_DSI_CMN_RSTB>,
+                     <&cpg R9A08G046_MIPI_DSI_ARESET_N>;
+            reset-names = "lvdrst", "prst", "rst", "arst";
+            power-domains = <&cpg>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    lvds0_in: endpoint {
+                        remote-endpoint = <&du_out_lvds0>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    lvds0_out: endpoint {
+                        remote-endpoint = <&panel_in>;
+                    };
+                };
+            };
+        };
+    };
+...
-- 
2.43.0


