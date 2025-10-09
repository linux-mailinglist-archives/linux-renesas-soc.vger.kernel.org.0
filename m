Return-Path: <linux-renesas-soc+bounces-22817-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 375A4BC88EB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Oct 2025 12:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87ACF3A5D15
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Oct 2025 10:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4417A2C21F9;
	Thu,  9 Oct 2025 10:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cqwRvgYL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D1C189
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Oct 2025 10:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760006723; cv=none; b=saJAdYtexx+cSCwL36AZl9klCLIyfELGLLV2GJE3xq7QM1FB43jGH3H0by2vSjVvABZ44gVmplaqsgTNgdGW4cKiwHqguKG8J3gx5iOTmBlY4v8rYiOrgEL0SgQ0jr9dIg+m6DwVmT4KwNMTZIhJx6tmI2jmddJjRhUhTVQhIMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760006723; c=relaxed/simple;
	bh=2aAJ6hZjEMqmH6hq8w2FQYgoNNCTOOf+gW19mcCAQHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZhN6w+/PauSvPS/K2cR5bgRx88WTqrcZZL6ZaJAdIKl+NzbWXmXt7Ao/ZnzLJNrTAE+73/osQtJqqanytkPq7+RoiRRQfbVY24/J/QSVVpiDKBloqL3N6nU2YVa6QQuzD/omSGvykTtyrmaJ/X6EdKeaZpCf7GhA6hQ8cv+gkMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cqwRvgYL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=iCrDqVJIszjuk0LNYiPm4c8KwtjOmBs+G+v5Q4yaIRw=; b=cqwRvg
	YLpegUleMzMFtuwBku+HJIEDkEGIHXqP/uxWQq5rOwCMGocCAwMV4xO81wmhiaHf
	hW8KsBmfh9+T4L6OSXDjJmn6JosWBew1Oqt0MAXX3ZDcs1/lonJqb0yD2hQqDKDj
	A0O5TAHQXFkbnKvfOVTt1JPgfzx2CdU+Qd9dPyN/SAL1nrUrwug6p9XVgKX46LHi
	5cxUI+2TEnHI3H9coDnLaqZv1uQoRZibdiBg9IqwvayMe/8zePm27amGWQnTpy7U
	pNjrApUC1aA2qvFr3MBBAPWN+KWeIdHiKJdl+rhsIFSHmp2mF9ebSLGE3SBtMsec
	0fwq1i9VzrmMlhrg==
Received: (qmail 1043366 invoked from network); 9 Oct 2025 12:45:17 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Oct 2025 12:45:17 +0200
X-UD-Smtp-Session: l3s3148p1@HLk0f7dAcq0gAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 2/5] dt-bindings: watchdog: factor out RZ/N1 watchdog
Date: Thu,  9 Oct 2025 12:45:00 +0200
Message-ID: <20251009104500.69787-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251009104500.69787-7-wsa+renesas@sang-engineering.com>
References: <20251009104500.69787-7-wsa+renesas@sang-engineering.com>
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

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v3:
* added tags from Geert and Rob (Thanks!)
* enabled 'timeout-sec' as the WDT core handles larger timeouts for us

 .../bindings/watchdog/renesas,rzn1-wdt.yaml   | 50 +++++++++++++++++++
 .../bindings/watchdog/renesas,wdt.yaml        |  6 ---
 2 files changed, 50 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml
new file mode 100644
index 000000000000..7e3ee533cd56
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml
@@ -0,0 +1,50 @@
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
+      - const: renesas,r9a06g032-wdt # RZ/N1D
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
+  timeout-sec: true
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
+    watchdog@40008000 {
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


