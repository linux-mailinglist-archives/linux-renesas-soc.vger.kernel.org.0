Return-Path: <linux-renesas-soc+bounces-21138-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4DAB3F118
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 00:44:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31A317A6D24
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 22:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236952857C2;
	Mon,  1 Sep 2025 22:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMO2fze3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2201028489D;
	Mon,  1 Sep 2025 22:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756766626; cv=none; b=T2++Oh0lzV2LJOhrZqLgBJaEbCC6zQLXLczDktM4MlYigAEUgn5mBTQ7g3JWYFJOZcAyLhdhc9CT8DouCRXZuAZB7g3yTY1gTV6bixj+st4U4FQ57SGhuRPgBXFuPbLETzPuV1WaU3jZuZJWfS2e9QK19tg9HDgFo7ArLibMnC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756766626; c=relaxed/simple;
	bh=Xk1uhRMah0qcfyg4xf5mj8mPVVW337J1ks6LiUZ9v1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WoNl39pbv3tFLQl0Nyl4scFy4znRYZyIeKqnzZVxMCQeJG1J9Q+Z+x9z/NVT++5e4n2FLKa4sZJ9m6ifbWGo4LIptKfk9BCGQA27GjGhTETgykENFbBxuOR1ZmSTijKnhSmEXCaMASJC/hG6h9epKnlaw8plViM2ZN3Yjw7H1ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMO2fze3; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45b883aa3c9so12370475e9.2;
        Mon, 01 Sep 2025 15:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756766622; x=1757371422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icrFmtmO+QecAfNtEL4t8ZYQuv8LDImS3Yehz1f8krU=;
        b=nMO2fze3F++Avs9ByAsyfAUCSh3btxntWTp4jrnqDRu6Ri3WRboqSFRyjx8TtPOHue
         lwpF6onKn45y8/70mkZjaNH73ORPtaCtNz9zdYWjtZE27yyAvuIXcXiWkyTlxdQahIKi
         YfOJYBP1/N8cOD+eL8DzvKCJxVlB1gp9742l1dh1gaB65WHxS/mkgQDil+wDNyaml9vU
         kcbejli8Oei88zWkvt1cgCvbnEoJmBmHYwADIUCDgl4hXQS4TXEzHbKdRKik7ajKVEaw
         dJoGGs9C33BlDJ/hAzlWQ5EciD2UYxXzmqZc9zPRzGJsIBfrjlb7hV/5E+04tNZYQCvd
         I+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756766622; x=1757371422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=icrFmtmO+QecAfNtEL4t8ZYQuv8LDImS3Yehz1f8krU=;
        b=c/mcWDPlEVr/QGDwbZt8ciaaRJBYaeQl2/XOxd7pRKEabQEnhXMcbCe5F7fP97eHK9
         rripmNzCvN1BDibi6AguvKxMRtv6B5nxwBum+cxPDPBudH10UMYYVz4FTgBQ0gRkwAe5
         xCRZohtlCQDYi7nYvjIDsW1UI/ux+fPye7MutDFNQFKFJAc22rxCRyOJSIH52cZbjgyC
         9voh5j5DFMAIJNYkg6Zm5Y9EnMr38X1XPSq9idxV02yF5fA3YHWit/a+c2OhAa2UD6u3
         Kx9RT1vl8cRzyMYcowKQ0AMHBQYx6kXydMdGn39vPvfL0V+jUGBTzgGI2mT2/7F47aBw
         1QEg==
X-Forwarded-Encrypted: i=1; AJvYcCVTXnkfIzVGgvkw2tEjt3+Xt1noBjXicsnr1x+W6/D1deZOw+g2HKCAJOM1Gcd7rJUOWsi+L4AJAPE63lRz@vger.kernel.org, AJvYcCWRU1tXXtdnt/XKLmA30HzcMNavL3qDYzncWP30iR4JhiOdNticbKIGP5GPmBy8x/97PjqtFrPc@vger.kernel.org, AJvYcCX4z3CX1Yj/mdViMaXNa3JABScgLMJ6aenNRK5sUzXyycYEzkYT8KiqE/6jWBFpnYU5Fz2YbBAVbaFt@vger.kernel.org
X-Gm-Message-State: AOJu0YxykyTkKmdqITG1nQKR9kxE58UPUD2JY19xU06zrZhcDMTACThh
	C/y7tVrJZAV+LYLFHQWzimUt39ezLTtiKH1oYPFuj0zx+D2jv72YSRdu
X-Gm-Gg: ASbGncvJdwp1sG1VKPtsZrBDWFDGO6y/9uY+xvIO37tSRw5VoJONkrTjqGDf17m4Yhb
	8EROT0KbQXSN3pZItJ40EcHSaOBj6lYNeddkbrXMJNklYf9oeLtXuh9E7CxdyOchbVkldoU5RDn
	FaH9aHZEtn3sOc+VtBHysGyZNJN2Egm1nSMhbLn2FD/B8Cy5TLEEmZUgxT6Yc5RxCTb8N65ZwMK
	7mvBgqrURBYfbZgGHZ3ce4XrjmW91IgoTeVeNjuqMcmEEEhUf706my18DZA0JYsNwUOij0pDAZH
	69aNJgSskDvdEDM9vQ+f1kwQ6N7Em8+TXZoNLipEb/Ix21RZjFeHyfoKsEEZmP+y69MbddLD5z4
	1LAXgOWY/MCMuUqZMcVuJNFyNqiFZyZs3CV3qkdQlQSRgWdUUGDpESk0Z
X-Google-Smtp-Source: AGHT+IEratetm3iHmdK/UCMa9q6UyEfirmYo8z3QVRuJQvckPIEePFLg/w62HioMszgStH8bxaQSlg==
X-Received: by 2002:a05:600c:1e8b:b0:45b:8324:d2fc with SMTP id 5b1f17b1804b1-45b8549c384mr83812805e9.0.1756766622372;
        Mon, 01 Sep 2025 15:43:42 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca6c:86b2:c8f:84d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d2250115fdsm11532607f8f.40.2025.09.01.15.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 15:43:41 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next 01/10] dt-bindings: net: pcs: renesas,rzn1-miic: Document RZ/T2H and RZ/N2H SoCs
Date: Mon,  1 Sep 2025 23:43:14 +0100
Message-ID: <20250901224327.3429099-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250901224327.3429099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250901224327.3429099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Extend the RZN1 MIIC device-tree binding schema to cover the RZ/T2H
and RZ/N2H SoCs. These SoCs have a MIIC converter similar to RZ/N1, but
with some differences:

- RZ/T2H has two reset lines; RZ/N1 has none.
- RZ/N1 supports 5 MIIC ports, whereas RZ/T2H supports 4 ports.
- On RZ/N1, MIIC ports can be mapped to various endpoints such as RTOS
  MAC ports, switch ports, EtherCAT ports, SERCOS ports, HSR ports, or
  fixed PHY ports (covering PHY input indices 0-13). On RZ/T2H, ports
  can connect to EtherCAT slave ports, Ethernet switch ports, or GMAC
  ports (mapped to PHY input indices 0-8).
- There are register bit differences between the SoCs, and RZ/N1 has
  additional registers currently unused by the driver.
- On RZ/T2H, the switch is connected to GMAC0 whereas on RZ/N1 the
  switch can be connected to GMAC2/HW-RTOS GMAC.

To accommodate these differences, a new generic compatible string
`renesas,rzt2h-miic` is introduced for both RZ/T2H and RZ/N2H variants.

The DT schema is updated to validate these differences and ensure proper
port and reset configurations per SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/net/pcs/renesas,rzn1-miic.yaml   | 171 +++++++++++++-----
 include/dt-bindings/net/pcs-rzt2h-miic.h      |  23 +++
 2 files changed, 148 insertions(+), 46 deletions(-)
 create mode 100644 include/dt-bindings/net/pcs-rzt2h-miic.h

diff --git a/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml b/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml
index 2d33bbab7163..832a49877a29 100644
--- a/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml
+++ b/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml
@@ -4,13 +4,14 @@
 $id: http://devicetree.org/schemas/net/pcs/renesas,rzn1-miic.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Renesas RZ/N1 MII converter
+title: Renesas RZ/{N1, N2H, T2H} MII converter
 
 maintainers:
   - Clément Léger <clement.leger@bootlin.com>
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
 
 description: |
-  This MII converter is present on the Renesas RZ/N1 SoC family. It is
+  This MII converter is present on the Renesas RZ/{N1, N2H, T2H} SoC families. It is
   responsible to do MII passthrough or convert it to RMII/RGMII.
 
 properties:
@@ -21,10 +22,17 @@ properties:
     const: 0
 
   compatible:
-    items:
-      - enum:
-          - renesas,r9a06g032-miic
-      - const: renesas,rzn1-miic
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a06g032-miic
+          - const: renesas,rzn1-miic
+
+      - items:
+          - enum:
+              - renesas,r9a09g077-miic # RZ/T2H
+              - renesas,r9a09g087-miic # RZ/N2H
+          - const: renesas,rzt2h-miic
 
   reg:
     maxItems: 1
@@ -43,11 +51,20 @@ properties:
       - const: rmii_ref
       - const: hclk
 
+  resets:
+    items:
+      - description: Converter register reset
+      - description: Converter reset
+
+  reset-names:
+    items:
+      - const: rst
+      - const: crst
+
   renesas,miic-switch-portin:
     description: MII Switch PORTIN configuration. This value should use one of
       the values defined in dt-bindings/net/pcs-rzn1-miic.h.
     $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [1, 2]
 
   power-domains:
     maxItems: 1
@@ -60,11 +77,11 @@ patternProperties:
     properties:
       reg:
         description: MII Converter port number.
-        enum: [1, 2, 3, 4, 5]
 
       renesas,miic-input:
         description: Converter input port configuration. This value should use
-          one of the values defined in dt-bindings/net/pcs-rzn1-miic.h.
+          one of the values defined in dt-bindings/net/pcs-rzn1-miic.h for RZ/N1 SoC
+          and include/dt-bindings/net/pcs-rzt2h-miic.h for RZ/{T2H, N2H} SoCs.
         $ref: /schemas/types.yaml#/definitions/uint32
 
     required:
@@ -73,47 +90,109 @@ patternProperties:
 
     additionalProperties: false
 
-    allOf:
-      - if:
-          properties:
-            reg:
-              const: 1
-        then:
-          properties:
-            renesas,miic-input:
-              const: 0
-      - if:
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,rzn1-miic
+    then:
+      properties:
+        renesas,miic-switch-portin:
+          enum: [1, 2]
+      patternProperties:
+        "^mii-conv@[0-5]$":
           properties:
             reg:
-              const: 2
-        then:
-          properties:
-            renesas,miic-input:
-              enum: [1, 11]
-      - if:
-          properties:
-            reg:
-              const: 3
-        then:
-          properties:
-            renesas,miic-input:
-              enum: [7, 10]
-      - if:
+              enum: [1, 2, 3, 4, 5]
+            resets: false
+            reset-names: false
+          allOf:
+            - if:
+                properties:
+                  reg:
+                    const: 1
+              then:
+                properties:
+                  renesas,miic-input:
+                    const: 0
+            - if:
+                properties:
+                  reg:
+                    const: 2
+              then:
+                properties:
+                  renesas,miic-input:
+                    enum: [1, 11]
+            - if:
+                properties:
+                  reg:
+                    const: 3
+              then:
+                properties:
+                  renesas,miic-input:
+                    enum: [7, 10]
+            - if:
+                properties:
+                  reg:
+                    const: 4
+              then:
+                properties:
+                  renesas,miic-input:
+                    enum: [4, 6, 9, 13]
+            - if:
+                properties:
+                  reg:
+                    const: 5
+              then:
+                properties:
+                  renesas,miic-input:
+                    enum: [3, 5, 8, 12]
+    else:
+      properties:
+        renesas,miic-switch-portin:
+          const: 0
+      required:
+        - resets
+        - reset-names
+      patternProperties:
+        "^mii-conv@[0-5]$":
           properties:
             reg:
-              const: 4
-        then:
-          properties:
-            renesas,miic-input:
-              enum: [4, 6, 9, 13]
-      - if:
-          properties:
-            reg:
-              const: 5
-        then:
-          properties:
-            renesas,miic-input:
-              enum: [3, 5, 8, 12]
+              enum: [0, 1, 2, 3]
+          allOf:
+            - if:
+                properties:
+                  reg:
+                    const: 0
+              then:
+                properties:
+                  renesas,miic-input:
+                    enum: [0, 3, 6]
+            - if:
+                properties:
+                  reg:
+                    const: 1
+              then:
+                properties:
+                  renesas,miic-input:
+                    enum: [1, 4, 7]
+            - if:
+                properties:
+                  reg:
+                    const: 2
+              then:
+                properties:
+                  renesas,miic-input:
+                    enum: [2, 5, 8]
+            - if:
+                properties:
+                  reg:
+                    const: 3
+              then:
+                properties:
+                  renesas,miic-input:
+                    const: 1
 
 required:
   - '#address-cells'
diff --git a/include/dt-bindings/net/pcs-rzt2h-miic.h b/include/dt-bindings/net/pcs-rzt2h-miic.h
new file mode 100644
index 000000000000..c1f35fc0f1cd
--- /dev/null
+++ b/include/dt-bindings/net/pcs-rzt2h-miic.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2025 Renesas Electronics Corporation.
+ */
+
+#ifndef _DT_BINDINGS_PCS_RZT2H_ETHSS
+#define _DT_BINDINGS_PCS_RZT2H_ETHSS
+
+/*
+ * Refer to the datasheet Internal Connection of Ethernet
+ * Ports to check the available combination
+ */
+#define ETHSS_GMAC0_PORT		0
+#define ETHSS_GMAC1_PORT		1
+#define ETHSS_GMAC2_PORT		2
+#define ETHSS_ETHERCAT_PORT0		3
+#define ETHSS_ETHERCAT_PORT1		4
+#define ETHSS_ETHERCAT_PORT2		5
+#define ETHSS_SWITCH_PORT0		6
+#define ETHSS_SWITCH_PORT1		7
+#define ETHSS_SWITCH_PORT2		8
+
+#endif
-- 
2.51.0


