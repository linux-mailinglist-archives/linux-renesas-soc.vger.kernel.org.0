Return-Path: <linux-renesas-soc+bounces-21325-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F183B43A6A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 13:42:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEED93ACEBF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 11:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3982F616F;
	Thu,  4 Sep 2025 11:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXzKF9c5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C09242D6B;
	Thu,  4 Sep 2025 11:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756986135; cv=none; b=Poc8APRUVXJOPwSXkXzhPXx8AuptXTE9ybBsEbMLWPXKV8mOR+nfnH+S1eqqg5ziI1zAePfjDU2NBiKpF+2ljlawcBCLFFHZsqgyh/8yYuSABkSLIcwQNUQxkS1clH7pV7l69PWrIiav7ksL8YbPD8IQlFQQkSvPq+p3ZsRn9M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756986135; c=relaxed/simple;
	bh=UWSMqpNHoZkkI/DKUp8cVw1/LsOuzKeqMsYOOyPmSlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hlfB0v/XcgQoNQXo08xmgHVOE1R6ny/+BrKDhzycgvDpj1jt8s3azuRz8doQ0t+oadSpwoHK6pISLH3dkWpZkd/hi5PmKQcyqmXfcX1G2MBD90sHPdsrlY0oyObRsJDroFqc/RZ0QgV9riIaedlHhu5uU2pp+kUjACfpvFxct2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bXzKF9c5; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3c6abcfd142so463533f8f.2;
        Thu, 04 Sep 2025 04:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756986131; x=1757590931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wiHzNFj0sXhbbNytaeP0q9gONxcOf/J1oGe69aPoJ/c=;
        b=bXzKF9c5lfdXcWLi2tCqRFzAYcsHH9ZJluP3xLorm12FkB2louEs4QtWKGNRFLgIXH
         mOY+9OCBUR8myKWNx/jvI9CD+vy8fpnNUsaet6x9rTmuraONlT0VmjltmuyI4sxHlNYa
         zX6NxzyvjzJmyOWhOtlSd7J4Hr1Kkt67Yj8+croXprF7F6Z4WgYXTEea+jI42MbG98Tb
         2hnWDyNaj0+kUEmpH68NVB4JGyXf0V0EPTWNEwO5fjHTFFEb6ua9qAD44D+ahzmCA98D
         YhdUkjT6c4oVY90IebmC/2CRqkqaPTLQhmi0IeZLw2YO2LAGmW+x7gXz/eex2RaWp470
         +rHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756986131; x=1757590931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wiHzNFj0sXhbbNytaeP0q9gONxcOf/J1oGe69aPoJ/c=;
        b=lanba0syZyutEogNPn96ftyLyzeHrd9k6gXxeWGMEHCWtPEjcspbHiGiIJDNz73Vkk
         jtazJZ4qo7SW4XhdxR/QWlD8xxlzvN5Q2aGRSXlz/jV5c5Zk8mZ+7a3S4yI7FpF4+sQD
         fnBA/8LCYEKRZcONTVNkw3KNXFZPjlgC+1qC9i07ZjSIbUoGnjk4sl8ldKq33I3HrQAc
         zWDaMdwagV/d/zIejkWuPXEv9DSKYyKa2CN9dYz8m7S6xI3BnD3MFbEe9Fm9IyDKrMRu
         k5uF8G34kkHM3SCpcTrtsahu/lc2TwzLoVwLjJM/P4eVbHykxB1BxuXHVeGXTwzP0dwI
         Z4vQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2GBGxxS60s2OL1DLazucVRoAufjW3aHBNTuHGOhhV57fmqGHxm8tbVe2QO7uxqOQZQYdzJI8ZYRO1eru2@vger.kernel.org, AJvYcCUYPO5vqF4AQU9GrZIcPmTFscrES6xwir9BJoIwey745/sAK6Cd5AaWCmr440o3xQomAJIxPmy/@vger.kernel.org, AJvYcCWWMIcYpEv+94C9WHajW37ccXw1l5+T8JOnyLHEEAR0nExy9lz/bP+9NA612mR+vJaSarx44dYCMvxM@vger.kernel.org
X-Gm-Message-State: AOJu0YxnDEwBGFSzfdILwyo/+UDlNyDT3jTW0yVqE69WRQLZakQlOUFP
	7UiR0fdOYywQ+NNQe7hNEAZyyettjHjw5hIQ777vBWqgmjjxGql2bxuk
X-Gm-Gg: ASbGncvsDW8S5TXQTG7iUJrkKO3wxwINohtPbnSYZOGReuheb37G+ACYUCIcX5x6UhB
	2NOlzflyPnSuRY3GybXH5qtoD89DhtjdYJDCJQdBJ1ZBqBR0XF7R4SNIRF5yiqabohM1yOuAYCZ
	FhOc1xPMkZAJ2WXb2PvRSlL2izonIzK6MO2UtxdbZwMMf1Ncw2r+7wVyqyRPJgnfObIXDE4bEfe
	Pcwr0/mM6qe3ORUsF/jAh4DBEifoE06sfcKRn2huDHXAu1ktKENJJL3P8n23HwzO2MGariP0ouo
	HqQpH5v5Chtg2dcIOI4MZu5eNE8Ym1vjNgPn+J8x2MP7I/LSD1xjoRFfQkIBDa5xNXjeoFUq6TK
	gMMvzsDvcjb5Zn7Ng/wrZ4XfnWSKowbCi02l5Nr3TfyQ1yESTQBiA/ZxNhYroUGfZV/Di
X-Google-Smtp-Source: AGHT+IEMbYG8SVdojrwjIaHjYFEs8Zk2B3DIF87gp8205a+WHqyrZ0rpqJsgOWyr0e3EAwuXxrCtzQ==
X-Received: by 2002:a05:6000:2d0b:b0:3d3:b30:4cf0 with SMTP id ffacd0b85a97d-3d30b305300mr8211238f8f.15.1756986131103;
        Thu, 04 Sep 2025 04:42:11 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:904e:70c8:edf3:59a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd0aec70dsm14658475e9.0.2025.09.04.04.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 04:42:10 -0700 (PDT)
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
Subject: [PATCH net-next v2 1/9] dt-bindings: net: pcs: renesas,rzn1-miic: Add RZ/T2H and RZ/N2H support
Date: Thu,  4 Sep 2025 12:41:55 +0100
Message-ID: <20250904114204.4148520-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
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


