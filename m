Return-Path: <linux-renesas-soc+bounces-20125-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1982B1E221
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 08:19:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D64C18C4509
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 06:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C2D1232369;
	Fri,  8 Aug 2025 06:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="hgQb1jy/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE8D227563
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Aug 2025 06:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754633913; cv=none; b=Anl9V+ow6W09Q7dvi4/qLYHPO1PWeHu3SBFTNir6m+kETQXVS3j/1onCl6VQ9MNgc/DvPPygD8A+uNQt3u3KAs0GCCw/HhRIVas9soE+e9bgpX/tuCrr6cy9Rug40uuNTG99gK+tgMtdvcrs919ZNFRxVKKh3HUa4Ex41V55vbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754633913; c=relaxed/simple;
	bh=pXE+TdwEh4NC3Uyy+NCB/X403bzHaC0FLc3b7KtPkRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iR1RwyC1cslp3HY01Uh/2hvJ8gWiXyDTIj0bfGanKk9g4RlFPvvtLaP9xsd8CDQK8G7OhgybTGdr/y1Ra4CdoKDm9rsBJ68Am9FuTsRr/67audbfW4YAP+vWImEW9Ootv+e+PyyFho8EuQC8C72x4OgYcIq/b0yEtaX7lTcIt+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=hgQb1jy/; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-af95d5c0736so288288166b.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Aug 2025 23:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754633909; x=1755238709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7LP9d+H6CPlnAcNit9gY8gkr92HzBXHt7ewsUzb2PWg=;
        b=hgQb1jy/HUL/Ru8HLV1qa/B6wU5CXxs06camBosyz4Owz1120jJyEsmGHI0mkWNEGM
         2MFRHx7E0aQ+4RFoniQMEsUZaFZC8Ef2XEufE4NbN//1cqkmuZps41+BwbZxTkQAlOvY
         19MzGT64lTW25RMLhmDXurRhONbp6LzfGiQ+PfoeZMh6AyaOInWAjO9rsFQ2IL2zGWCT
         BOskvjH72Xrmoh6fnQLaVffHAAnKXOFPkwI3mzWc54k4Oo+9lAf9jg9R3+U0guaju/wv
         8mLqiEB5lG5lskWzRq5r5LbCL4Y83TULezWbzV8w3ZhV1hBvczpEQSHLG6j2Hg0fEDT1
         +Blw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754633909; x=1755238709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7LP9d+H6CPlnAcNit9gY8gkr92HzBXHt7ewsUzb2PWg=;
        b=FafhGV5QonllBR10Lmg0mjSMfINxT40tHUXd+qigGPPRw9UHcKq5sA9cRqTnc44ieH
         sjde4QJvq0P/VTJkr7eQmEEbjWVeXMQjDKsp60vfGSaYDqwTyGtxDPYR4E40lTY7ZF3Z
         svjjmHXZcROlR7TJwURu1bOQBMEFWvoBtYJxiE82+b7Pk/dL/wDS+AfQya4NhrKbOpWj
         C+ZCILaEZcd6MQ2vXU2AJNgaHdRDonwYpirXJpI6OhQHXOu1CkWLtrQYOdZCibJtdlX8
         FG50HY22gQJYngkz57qUg3QHCd1/hvIjhCbg5wg32Wc1KXODUTbBUwrtJqHotFnw8bMA
         Z2YQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg+a5fuFsPMB1k13UnUR3W3NfVQmklVn/wWsEOBQbo7Mml7Y6gQT93dSo2Xj63P3vaYRtp2ES9BeSePRYKrIj+YA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyrQ5cKubfZ1toALgsbpK2Pn1eKUb//3sD/ZkTSXdTHi88QJ7/
	aOs7TLIADGMqiO81lQST57ezHq+cyYvzk/u2uHqPeFtjovvinLEsYwrdXPOkHBm4GVg=
X-Gm-Gg: ASbGncsRJmmECwaDE60b39R3k1ezavxouDS0vEoBK84lrCjqhL8vINsAY/Ep2GHje7A
	dryUBsUipHQCHML4UqzlfsG+ZSlV1Fk/N+983VNqZIwI6GQZ+6xvrWjkCQpgIPiEmeUHriX/NzJ
	jQ1kbtUDiKhxV9tj3Y4174gHzhR6XRstOb0wRjQlTJPn02NQrMxddzTP6AfkgIchvcVdAU+ujyH
	eFc4SBrTLSYSbAiVKfsjSs5ZojfryTTiil+pU+gyrwrxKW3tJtXwvG6f4e4imv49mAYCfKDGwO+
	tNdYnm8GcMl8BJmqsK2klwvS1+W+j4WRXWnPty8cKJUZQ6JpdXceQc0qM/dcDAk8t7mKZ91p0+2
	8TrgKTPCybhckTF7cm1NXbvQGQ35lZ6f+JIP1jz/InvydrAsl2TdFzSRqRqEU7i0=
X-Google-Smtp-Source: AGHT+IHBGypz2csrT01KrszUBTtkYO2Kq59PbibkZ10/vGO1t9o/yLlL1WxFizfyiFcAA87qUi9uGw==
X-Received: by 2002:a17:907:7e89:b0:ae0:35fb:5c83 with SMTP id a640c23a62f3a-af9c64bf042mr131826866b.28.1754633908938;
        Thu, 07 Aug 2025 23:18:28 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a218ab4sm1440488566b.92.2025.08.07.23.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 23:18:28 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	yoshihiro.shimoda.uh@renesas.com,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 4/8] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3S support
Date: Fri,  8 Aug 2025 09:18:02 +0300
Message-ID: <20250808061806.2729274-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250808061806.2729274-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250808061806.2729274-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas USB PHY hardware block needs to have the PWRRDY bit in the
system controller set before applying any other settings. The PWRRDY bit
must be controlled during power-on, power-off, and system suspend/resume
sequences as follows:
- during power-on/resume, it must be set to zero before enabling clocks and
  modules
- during power-off/suspend, it must be set to one after disabling clocks
  and modules

Add the renesas,sysc-pwrrdy device tree property, which allows the
reset-rzg2l-usbphy-ctrl driver to parse, map, and control the system
controller PWRRDY bit at the appropriate time. Along with it add a new
compatible for the RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- dropped blank line from compatible section
- s/renesas,sysc-signals/renesas,sysc-pwrrdy/g
- dropped description from renesas,sysc-pwrrdy
- updated description of renesas,sysc-pwrrdy items
- updated patch description

Changes in v3:
- none; this patch is new

 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 40 ++++++++++++++++---
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
index b0b20af15313..c1d5f3228aa9 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
@@ -15,12 +15,14 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a07g043-usbphy-ctrl # RZ/G2UL and RZ/Five
-          - renesas,r9a07g044-usbphy-ctrl # RZ/G2{L,LC}
-          - renesas,r9a07g054-usbphy-ctrl # RZ/V2L
-      - const: renesas,rzg2l-usbphy-ctrl
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a07g043-usbphy-ctrl # RZ/G2UL and RZ/Five
+              - renesas,r9a07g044-usbphy-ctrl # RZ/G2{L,LC}
+              - renesas,r9a07g054-usbphy-ctrl # RZ/V2L
+          - const: renesas,rzg2l-usbphy-ctrl
+      - const: renesas,r9a08g045-usbphy-ctrl # RZ/G3S
 
   reg:
     maxItems: 1
@@ -48,6 +50,19 @@ properties:
     $ref: /schemas/regulator/regulator.yaml#
     unevaluatedProperties: false
 
+  renesas,sysc-pwrrdy:
+    description: The system controller PWRRDY indicates to the USB PHY if the
+                 power supply is ready. PWRRDY needs to be set during power-on
+                 before applying any other settings. It also needs to
+                 be set before powering off the USB.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: System controller phandle required by USB PHY CTRL
+                         driver to set PWRRDY
+          - description: Register offset associated with PWRRDY
+          - description: Register bitmask associated with PWRRDY
+
 required:
   - compatible
   - reg
@@ -57,6 +72,19 @@ required:
   - '#reset-cells'
   - regulator-vbus
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a08g045-usbphy-ctrl
+    then:
+      required:
+        - renesas,sysc-pwrrdy
+    else:
+      properties:
+        renesas,sysc-pwrrdy: false
+
 additionalProperties: false
 
 examples:
-- 
2.43.0


