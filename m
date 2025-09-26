Return-Path: <linux-renesas-soc+bounces-22414-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6FFBA3792
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 13:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0210C4E1245
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 11:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E2862EA48D;
	Fri, 26 Sep 2025 11:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Qrx3vp3H"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B26285C91
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 11:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758885746; cv=none; b=FbHrmRmh+ObnnVq00h9XwkW3q7/kUfEw8+/aiTXogc3Fj3YCJgaN1OfglT4QWYnv8gB+V1YoXwa5KpPdRHAYDNt0DRhvb9iW3InJJZSI9cLCHjPuJoZZR/GTQfN3gGjy0HfLGdDVNZNbn/ux5+Jok09sIbVmZX2O1QbqS6Qas/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758885746; c=relaxed/simple;
	bh=/fII+r2GIukj0AWzVwB/NW1U9lbGzXSOP7IJ+61KdUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NiYdcur10Tiv3VgwnlaGGN3xTzsYxufOGBSt47UBvYJLDctOKN7E6rFXZ2GHYStY9vERE0xmL2dIs2khw/iFkTXPY1LThis+pjHkIIUgvwhKigjh8/06eqdYbLui0ViV4S97LC0RaoC3MsiIXmKApoU2IzpmYl47hDJCP589szE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Qrx3vp3H; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=+iFA6/afO5JYMvHEQtSsOxvo665zlmWSAYQN7WMLiyI=; b=Qrx3vp
	3HBKiCHKzstbfcKrs1rj6vFoFvkmXpYJohI7dTrZe85fU68gMIt8sd3omMGKhjdY
	QhCjwYK7fXRBa08h2N01SyRhY012KONvVMYsw+ByJFtiJvysIp9qpGzWx7PNtVzp
	xAe8oEx7D86LhmsJT8+oFdGZFsgIAQCuUBWQNtT/Ls8oXwXVXT4UNCduDhe04kqf
	K91IyqU5Cmc/nLzVMxlD151BsCqazcks0nCFACM1vt185/34/J7AyzjWQ3YxV7g5
	SY8K2lFlUY4eWyMjvqpg57PQyCtwjzktZiBCkZBdp+k9s3702L4nT009ie0vPeTJ
	S++bz7fJRxHjzWpw==
Received: (qmail 2235325 invoked from network); 26 Sep 2025 13:22:21 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2025 13:22:21 +0200
X-UD-Smtp-Session: l3s3148p1@K6bVf7I/oIsgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: watchdog: factor out RZ/N1 watchdog
Date: Fri, 26 Sep 2025 13:22:14 +0200
Message-ID: <20250926112218.28723-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250926112218.28723-1-wsa+renesas@sang-engineering.com>
References: <20250926112218.28723-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renesas created different watchdog IPs but they are all handled in the
same binding documentation. This leads to a lot of conditional handling
which makes it unnecessarily hard to add new items. Factor out the RZ/N1
watchdog to make handling easier.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../bindings/watchdog/renesas,rzn1-wdt.yaml   | 49 +++++++++++++++++++
 .../bindings/watchdog/renesas,wdt.yaml        |  6 ---
 2 files changed, 49 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml
new file mode 100644
index 000000000000..01eab6cc1110
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/renesas,rzn1-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/N1 Watchdog Timer (WDT) Controller
+
+maintainers:
+  - Wolfram Sang <wsa+renesas@sang-engineering.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r9a06g032-wdt    # RZ/N1D
+      - const: renesas,rzn1-wdt      # RZ/N1
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+allOf:
+  - $ref: watchdog.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r9a06g032-sysctrl.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    wdt0: watchdog@40008000 {
+            compatible = "renesas,r9a06g032-wdt", "renesas,rzn1-wdt";
+            reg = <0x40008000 0x1000>;
+            interrupts = <GIC_SPI 73 IRQ_TYPE_EDGE_RISING>;
+            clocks = <&sysctrl R9A06G032_CLK_WATCHDOG>;
+    };
diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index 8a25e0c6271f..12ba07781763 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -13,11 +13,6 @@ maintainers:
 properties:
   compatible:
     oneOf:
-      - items:
-          - enum:
-              - renesas,r9a06g032-wdt    # RZ/N1D
-          - const: renesas,rzn1-wdt      # RZ/N1
-
       - items:
           - enum:
               - renesas,r9a07g043-wdt    # RZ/G2UL and RZ/Five
@@ -134,7 +129,6 @@ allOf:
             contains:
               enum:
                 - renesas,r9a09g077-wdt
-                - renesas,rzn1-wdt
     then:
       required:
         - power-domains
-- 
2.47.2


