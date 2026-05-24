Return-Path: <linux-renesas-soc+bounces-33057-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LUTHVRVE2oT+wYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33057-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 May 2026 21:45:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBDA5C3D9D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 May 2026 21:45:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29007300BCA8
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 May 2026 19:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D72531E84E;
	Sun, 24 May 2026 19:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HlfEX2kB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550BF315785
	for <linux-renesas-soc@vger.kernel.org>; Sun, 24 May 2026 19:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779651904; cv=none; b=inXVkFHY00B8U58kgn3+++ttG3dMW5AeHsaf/fyzWwUWyAYqRmY8FbIsAAJZE509vcyW3ysod/L/fBVrQqF7FMRtVt+gNteIcLMzAC9vaB9khYUbFcEA5PaYllZN5BgXwQujumeNsaiaoW9MW8qJ7sWbqEgxEJiOojCuCHHw+/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779651904; c=relaxed/simple;
	bh=S9yv0ppDny13+PFHIZntF7i0NLLrmOWsJlGQ0136268=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gcaZrhqJ7sAYF6kzh3faNwjc6pqCqOuQ/Uoqn3KH/19oim143Vmw8rNdKQpJMQPBh1fGopQyaxcbLhHzzW1+yrGGoR8Lmjsi17BnikwQmIJdEaecq+0eoYVMCmTbIU+jvRovjNb5zGIqbPAHkzn13PH/apVRNkVcPu4Ttq1ilvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HlfEX2kB; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4903cbfad68so21776585e9.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 24 May 2026 12:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779651901; x=1780256701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Y9GPXTLGAUIBWqeRqyMnJLPiEzYcwSV+9lPF8ht34M=;
        b=HlfEX2kB7WoIYFpXFN45JFc/yGSSoSp2kc91/cjtTj7lmKm6N36iUsD3jvzHS9ZyNq
         2SLg6r4tGrYSe53AGIAwMB62VJ+PdBFYeJ4oqmU6keyvkRWEKtLcj5Yre8YXr5c3K9fH
         bxPVB8W8z0WJxBt6pYtsX8dm8XNJMt5wwRCqXktyw54qnuRSxUETq0DaaLHygbyRvHnJ
         uqBYtFuH+PaELqNmtP0Y+hokULAvR+VUIzp+NtIzT4/k43CVqjqg52OcWwkPK8Gkr6So
         n0HlbYHVQCF4jV4cD9h0r4pquQ6l7AWz7CmCLmPsqqTuyls7/OpJqsfGqpzlKvt3KBWC
         1WNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779651901; x=1780256701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Y9GPXTLGAUIBWqeRqyMnJLPiEzYcwSV+9lPF8ht34M=;
        b=GyYtzN8iH2HItQb2EwTPbdvcU8FIcPn9/+/f5DCTtWJN1L/8rfEk1zuEInRYsV+P6q
         /QOh5/JhGzF7DauFIN4rD1JQ370sZ2N4pPSACLt+1dJDhYbwYvY7Q71FjWsNKRT9/kfS
         FveVY8pryl/y3/7s74N5nwTwKkYjQCZHi6WM3y82I6hQltO7dwn8qOYVgRzDUouwvHet
         AdyldwPZZ2aI9uMYmmMLVFCsmheH3DMW0rm3iJvgoOEUDxIJ4pr+sG6nelNfjS6A77yO
         szT+OYTce5pwHOvf3owAO1q6n9Q1M/vfT50KDTMYB0dgp/crdBFbz8lcbqeP9MPKH4mr
         Q2Rg==
X-Forwarded-Encrypted: i=1; AFNElJ97pvC2ZXThwOmW3vF+uJrkCPn8Lz4gjIVYqxh+jwzEGTFFJdGLgwaknEWBffAJRPWg8pPqaEsSZWfaz8DK0uju7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwP8Pu3GB1477BZ0K0Yy1FFBgNIR0i0H9b8uTG/OYSEjbzc0R1F
	6JRT0c+I8ZmSPUaI3MhhNA5PaSsiGrbLUZSbiJPaTv7YQU9prkRFdoMm
X-Gm-Gg: Acq92OEAnMCQr3+Q0+OIWdk+RpFuepXVrgCHElfD3mvoEY9mkExI78rHhjLBZByod39
	qtVvIQyv4SwP/sLGYJ7tr8IdPJcTjvNuYWgVQ3LBSOiy7sFhlOa9P2qKgUkJLbrJHtbF2IMv1gQ
	hvQbJpchjiZypvVXTXGZ1uCIdoKc7wglb6B/UDdrN3aUhc1QBtMJTp1M1CS+XDzO1QEV4AYL4ls
	MMzYql65lP1zSUVduB8rMxW8WWAIlAKnsBxeoqGBlJLmRKAMgwZmf3ydxN127I4euAqcgtbaoPl
	UYw++aMvNHAlyOsphS7zXQQd7atCDDthCz1cwPkoYfcJ3/P2pd97D+y+DY6RHXCFdeF/dUfZthk
	eCOA411khdDuHCcZE24Ls5BSXfASbGIJteTeWBcV9tER1K3BDD3HPXVbWCQ/szqZe3ik+gfOwf3
	Xe48f9JEpE+tcFK1T1gI3yp4tZqtf7Ctg=
X-Received: by 2002:a05:600c:46cb:b0:48f:e044:927d with SMTP id 5b1f17b1804b1-49042480f2dmr161584355e9.10.1779651900589;
        Sun, 24 May 2026 12:45:00 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a700:7301:ae73:a12b:ca55:91be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49042cde62csm68224515e9.32.2026.05.24.12.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:45:00 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: display: bridge: Document Renesas RZ/G3L LVDS encoder
Date: Sun, 24 May 2026 20:44:50 +0100
Message-ID: <20260524194457.479681-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524194457.479681-1-biju.das.jz@bp.renesas.com>
References: <20260524194457.479681-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	TAGGED_FROM(0.00)[bounces-33057-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,microchip.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,gmail.com,ffwll.ch,linux.intel.com,suse.de,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_PROHIBIT(0.00)[0.0.0.1:email,0.0.0.0:email];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.995];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,0.0.0.10:email,devicetree.org:url,renesas.com:email,108a0000:email]
X-Rspamd-Queue-Id: 0FBDA5C3D9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Document the LVDS encoder IP found on the RZ/G3L SoC. It supports
single-link mode. LVDS and the DSI interface share a peripheral clock and
the MIPI_DSI_PRESET_N reset signal. However, the LVDS module cannot be
used at the same time as MIPI-DSI.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
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


