Return-Path: <linux-renesas-soc+bounces-21740-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 004DAB5226C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 22:41:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0DB147B4722
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 20:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B779A2F7449;
	Wed, 10 Sep 2025 20:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClFAhWtw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9704E2EE29F;
	Wed, 10 Sep 2025 20:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757536901; cv=none; b=K51X+WU7XDYJRjqOSapjX1XNuwYuT3sftipVaJdwUDZ95cp+goDM1bER1x3FS2d2XDQejoeXBFKOkOHi1Nzu1gsu2B6X+VMRofzrqmnTNh3phLcBbbOClEJyKpTIMw/wARAQtZPOex2u8DUtedId9lBjwLAmgMeAR72HQtQYDpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757536901; c=relaxed/simple;
	bh=18B9K2nM+cZ8Sf/u0XyAyS1sku1Q2UnI5kCm57NIxzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pGNj8I/e6KBxF/0g4XvjFNCXsEDPcw0Q88nY961Gy2tw+/S7FMU6aY/fxhtTiBp97AqLdU0sewMABg0gOxyGJQblbWtEzoS+uTT6nV2ApunxU3M903ZBQe/Oa2Q8v/J3pcMHTTIScgOc0IDB+mpLiqhyjNzXPGNX9STV41jCweg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ClFAhWtw; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45decc9e83dso198005e9.0;
        Wed, 10 Sep 2025 13:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757536898; x=1758141698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zVn5z+TE4bV1pQeMpIbkK5FgK0bRKS5voT7jl4t3xk=;
        b=ClFAhWtw8Kfh4trhmSSDkj2kQPCl3CgrckH1Jwmv1j3vlYwFEV4YImyVEAdVMp9LXY
         hgkD25SI5e/HqYUncPAkrwp/5PbRI5wipGW9HBr+rdV7r3A05osjPseJC7YrAiMnpjdV
         3UEBoZLcCBqC8oOurCEqRxd1eEUOTRU42sCNFhgV7jkw9mPpmTIirB646Cqlvx57n+PH
         m9ONCYJ51JElNr8g4MoR2B8/+0zpebiIuB9kdyfGUDsu4XS8W8udfjhbsiDn8fyM3IZS
         OU/6NM8RKM6dbUKHODS1g8nNwaocQxZ1pdF+XyhNFcdIcAiSQZqnygppuTHEEWC66S1C
         XLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757536898; x=1758141698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/zVn5z+TE4bV1pQeMpIbkK5FgK0bRKS5voT7jl4t3xk=;
        b=CURN5v1+VhiKC2pTux2m1/M7jVnnVRoE4FK3wkzygEywoKQUvc4xyukqv0eB4JC+d2
         ME5/mlWELy1LzGFhkiUqtNtdRUuWkhGt80tTtRg1dEoXq1UHD2hV2jy3h3KPBj14sRHf
         JWEAXczmORZsQVm7fW/XVi03qvdW49sMfS0Hd0rYH3KzquAYB4G3XElp3A/awvYyw3y5
         3Ixya9vdrw0yVEyEnCuvtbOLnPKufc/sqKrCC2vafH1VAz/yNAlZwe4J8XeLQgjmBV5P
         4ZsothC3DNO0TxRN0hRht+ZMjG53FOzVlbwIkJumhlG7QxgG4zubWg/PiPoUvCLo+od5
         Cmzg==
X-Forwarded-Encrypted: i=1; AJvYcCVYrYGgvdxcb0z/7pG5jn5pk9NpbgHphV0gb/Xzc6qaIzoK/jMInUmRBp2OjTcn7jpcdpgwSJo6@vger.kernel.org, AJvYcCWQwUIyzRCSL1D3ucVevWULXXP3rTyYCL8xO6kwIhdaIwwwH4s3MjgGb1HQ1MBubQJ+ApPSBl8RV7yCrGjS@vger.kernel.org, AJvYcCXjAKsi+tmk/fRULPNn41nlofpiIhfnIUfoHmS+s4USGXbpwBtEAT6Z6cmGJlW1HPanYa5lHwT0REYA@vger.kernel.org
X-Gm-Message-State: AOJu0YwuufUyieTujyBCJLa6Sl+RXHLJnn8aqT8pLifGfO1AFcbgye1C
	pIQOLTVYS6Oc1LkjSqgIVhl4vFyWo3xP1u1z62JDQu8iT5WH5aiebrWZ
X-Gm-Gg: ASbGnctyWHJF6IxeCOlscSs+HtsfVMPYRryfjRRKJGPhSUj1mXk9mfFX6jNy5oI7VKr
	brWSlVkTFJiqHAE2r3UD/+mmEYufLvl1ZiMi7SrTFf5EOAVVW/CHDK4kAdr/ivl78IMRe5NDptL
	oH85nm8vsuQooerNBFvcgF03PHKTw5LIanFa4HklmUw4kNe8IbN5Ek92G9SFvCSLgM8Hd5ff5Nd
	4+fDkC3Vj6kVWEK9Z/v8MPesmg3S74+nmYYYwNCv5ZWY9MF9GKQzG4Z1IFMzNwyfx6FsYnzZvxQ
	Hj5/+ZTdJ7PctAcHhlrgWDhTNmOLhB+2+lVmGdHVj8ZWI4jtF/RnIpzd5gCu9ILd/L5U0QPgKNC
	QWJL/DTC8Xk37NcY4Byt7+jFxAXD9jrewcphtRV5SCObIhslNeCR8M5dq9f7qedixLQBY
X-Google-Smtp-Source: AGHT+IESGsG3fLtfBLi1D6h540Gljr1S95bZG3YIGclvM24FvfAjDwfuRuPRnwpETdtkfofcUvbbtw==
X-Received: by 2002:a05:600c:4708:b0:45d:d287:d339 with SMTP id 5b1f17b1804b1-45ddded243amr147327745e9.25.1757536897723;
        Wed, 10 Sep 2025 13:41:37 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ee64:b92b:f8fd:6cd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0157d68esm320085e9.6.2025.09.10.13.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 13:41:37 -0700 (PDT)
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
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v3 1/9] dt-bindings: net: pcs: renesas,rzn1-miic: Add RZ/T2H and RZ/N2H support
Date: Wed, 10 Sep 2025 21:41:22 +0100
Message-ID: <20250910204132.319975-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910204132.319975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250910204132.319975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add device tree binding support for RZ/T2H and RZ/N2H SoCs to the
existing RZ/N1 MIIC converter binding. These SoCs share similar MIIC
functionality but have architectural differences that require schema
updates.

Add new compatible strings "renesas,r9a09g077-miic" for RZ/T2H and
"renesas,r9a09g087-miic" for RZ/N2H, with the latter falling back to
the RZ/T2H variant. The new SoCs require reset support with two reset
lines for converter register reset and converter reset, which are not
present on RZ/N1.

Update port configurations to accommodate the different architectures.
RZ/N1 supports 5 ports numbered 1-5 with complex input mappings
covering indices 0-13, while RZ/T2H and RZ/N2H support 4 ports
numbered 0-3 with simplified input mappings covering indices 0-8.
Extend the switch port configuration property to support value 0 for
the new SoCs.

Add a new dt-bindings header file with media interface connection
matrix constants that map GMAC, ESC, and ETHSW ports to numeric
identifiers for use with RZ/T2H and RZ/N2H device trees.

Update DT schema validation to ensure proper port numbering and input
mappings per SoC variant.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2->v3:
- Added Tested-by tag.

v1->v2:
- Dropped regx in title and description.
- As done for other IPs used T2H compatible as a fallback for N2H.
- Renamed pcs-rzt2h-miic.h -> renesas,r9a09g077-pcs-miic.h
- Added matrix table in the new header file.
- Corrected the resets check for RZ/N1.
- Updated the commit message.
---
 .../bindings/net/pcs/renesas,rzn1-miic.yaml   | 177 +++++++++++++-----
 .../net/renesas,r9a09g077-pcs-miic.h          |  36 ++++
 2 files changed, 165 insertions(+), 48 deletions(-)
 create mode 100644 include/dt-bindings/net/renesas,r9a09g077-pcs-miic.h

diff --git a/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml b/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml
index 2d33bbab7163..3adbcf56d2be 100644
--- a/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml
+++ b/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml
@@ -4,14 +4,15 @@
 $id: http://devicetree.org/schemas/net/pcs/renesas,rzn1-miic.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Renesas RZ/N1 MII converter
+title: Renesas RZ/N1, RZ/N2H and RZ/T2H MII converter
 
 maintainers:
   - Clément Léger <clement.leger@bootlin.com>
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
 
 description: |
-  This MII converter is present on the Renesas RZ/N1 SoC family. It is
-  responsible to do MII passthrough or convert it to RMII/RGMII.
+  This MII converter is present on the Renesas RZ/N1, RZ/N2H and RZ/T2H SoC
+  families. It is responsible to do MII passthrough or convert it to RMII/RGMII.
 
 properties:
   '#address-cells':
@@ -21,10 +22,16 @@ properties:
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
+      - items:
+          - const: renesas,r9a09g077-miic # RZ/T2H
+      - items:
+          - const: renesas,r9a09g087-miic # RZ/N2H
+          - const: renesas,r9a09g077-miic
 
   reg:
     maxItems: 1
@@ -43,11 +50,22 @@ properties:
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
-      the values defined in dt-bindings/net/pcs-rzn1-miic.h.
+      the values defined in dt-bindings/net/pcs-rzn1-miic.h for RZ/N1 SoC and
+      include/dt-bindings/net/renesas,r9a09g077-pcs-miic.h for RZ/N2H, RZ/T2H SoCs.
     $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [1, 2]
+    enum: [0, 1, 2]
 
   power-domains:
     maxItems: 1
@@ -60,11 +78,12 @@ patternProperties:
     properties:
       reg:
         description: MII Converter port number.
-        enum: [1, 2, 3, 4, 5]
+        enum: [0, 1, 2, 3, 4, 5]
 
       renesas,miic-input:
         description: Converter input port configuration. This value should use
-          one of the values defined in dt-bindings/net/pcs-rzn1-miic.h.
+          one of the values defined in dt-bindings/net/pcs-rzn1-miic.h for RZ/N1 SoC
+          and include/dt-bindings/net/renesas,r9a09g077-pcs-miic.h for RZ/N2H, RZ/T2H SoCs.
         $ref: /schemas/types.yaml#/definitions/uint32
 
     required:
@@ -73,47 +92,109 @@ patternProperties:
 
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
+        resets: false
+        reset-names: false
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
diff --git a/include/dt-bindings/net/renesas,r9a09g077-pcs-miic.h b/include/dt-bindings/net/renesas,r9a09g077-pcs-miic.h
new file mode 100644
index 000000000000..43a2b5743a63
--- /dev/null
+++ b/include/dt-bindings/net/renesas,r9a09g077-pcs-miic.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2025 Renesas Electronics Corporation.
+ */
+
+#ifndef _DT_BINDINGS_RENASAS_R9A09G077_PCS_MIIC_H
+#define _DT_BINDINGS_RENASAS_R9A09G077_PCS_MIIC_H
+
+/*
+ * Media Interface Connection Matrix
+ * ===========================================================
+ *
+ * Selects the function of the Media interface of the MAC to be used
+ *
+ * SW_MODE[2:0] | Port 0      | Port 1      | Port 2      | Port 3
+ * -------------|-------------|-------------|-------------|-------------
+ * 000b         | ETHSW Port0 | ETHSW Port1 | ETHSW Port2 | GMAC1
+ * 001b         | ESC Port0   | ESC Port1   | GMAC2       | GMAC1
+ * 010b         | ESC Port0   | ESC Port1   | ETHSW Port2 | GMAC1
+ * 011b         | ESC Port0   | ESC Port1   | ESC Port2   | GMAC1
+ * 100b         | ETHSW Port0 | ESC Port1   | ESC Port2   | GMAC1
+ * 101b         | ETHSW Port0 | ESC Port1   | ETHSW Port2 | GMAC1
+ * 110b         | ETHSW Port0 | ETHSW Port1 | GMAC2       | GMAC1
+ * 111b         | GMAC0       | GMAC1       | GMAC2       | -
+ */
+#define ETHSS_GMAC0_PORT		0
+#define ETHSS_GMAC1_PORT		1
+#define ETHSS_GMAC2_PORT		2
+#define ETHSS_ESC_PORT0			3
+#define ETHSS_ESC_PORT1			4
+#define ETHSS_ESC_PORT2			5
+#define ETHSS_ETHSW_PORT0		6
+#define ETHSS_ETHSW_PORT1		7
+#define ETHSS_ETHSW_PORT2		8
+
+#endif
-- 
2.51.0


