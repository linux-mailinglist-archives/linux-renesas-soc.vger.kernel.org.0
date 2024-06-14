Return-Path: <linux-renesas-soc+bounces-6186-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CF2908463
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 09:20:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 026F6284FC1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 07:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AABB7148849;
	Fri, 14 Jun 2024 07:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NHwunxJO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCC0149DEF
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 07:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718349598; cv=none; b=q+DKIX+5cFCEdtkTCPZ66KD2a6yoj9cy/7PpDK+ARswICY+gZ45rFm3n6dEICZX/hg5dx01x+dBFEexibXSY5KObHzRlMfmdaDQpsK8cR3MjantRgjpiwV7GFqjZZmVKzQDHVpQuXTWARc7f9+ytODB02tAj0TpzpXRrzbd2EvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718349598; c=relaxed/simple;
	bh=NqslJuD2Md4sSqaTv1faHt6BcXuET0ezs+1AYj8Q+Qk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nPn2SvyTeg0jSvroQVX1CGhHRI86GVFDKEZSdXjaMSn62zYwkecqRPQmyzN+5c55VVVpFKgOjfLyjL7huRqfTIaUz4+U1N/eYYrlulIbzw2Z5dPPpNu/Ao1lSo8VNiku8crqp82ya6LBBmotcQiq0xl8pKlzk2fxHJelZcWEVPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NHwunxJO; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2eaafda3b5cso21133471fa.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 00:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718349594; x=1718954394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ixl009mBesNeSDDCyc0T/56E+aCT/BvPofzaYSLxjQA=;
        b=NHwunxJOpWkQN6Jwwjq9Fuc8RNluTeJaDVoJtXBvWit2lEcPpjGhmaTS71ScR/a5xT
         PCgItmML29+mwdrc7/FJALXIc6vuq0jhABmVuVVR+PU8f0XHDDUU5osNVf7QW8w70HaV
         5+hTu/0iOS9WJLJZ4NKCwokLqa+7ZSnScP3Zrrt7d/3wHKll2EEJz+jFUOJc9BR82YZ3
         hwc9TlBYE36FPDiMgAzeQgbGSkP23WH+NNA17ec9SNbK0en+12wbC7NcQmD3uQguSdW5
         axmpF0l+CHqGslVv0dmOJ0oU5baGcY/zIbxsdelr8I+hCy8rurBaB0KNQMc1tKeDStir
         P5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718349594; x=1718954394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ixl009mBesNeSDDCyc0T/56E+aCT/BvPofzaYSLxjQA=;
        b=mkTzVkeZy0NZXt3CCY1TJxIsGoz87ZLLluEv+9Uvm0xtlSZBR3N7vALDxSpCm5fUnQ
         CYMcrGbL9ZBEFhgLe6B17y7qKvINv/TBs1GrgDGsBcqk4FGdwRtV8GVDQyb3wvIAvMVM
         W66lMtutyaD7j5flScPSmpkutPSBuoDMULHEb2bPchb1vdfG50dOoFmscJ0jD0A/hi3v
         pnx5E2cHvdviaNPC7YiLPRGBVoEZ1PWaFH2HjdJ45alfsPuzyfG/4fA0mT+745/8Htgj
         CXWyGkYvCYanrKIgiBYWtVRQ36Ynl6UCajRJzQbF9HKRjC2Nm0N6eWlWYGvvQDsZe5Td
         UHyQ==
X-Gm-Message-State: AOJu0YwOP0isVpjGsuppWJIpCI3Uh7XuWioZJpXCi7R+MrJcpUdfN7jp
	+JcEe1/dcLFm44xH+J0nkWEp74i+M6XpQDUXKAdcazEcyQEypNW2Jchm+2kc6t4=
X-Google-Smtp-Source: AGHT+IFQvvveENgINLJWrLT4M0WKErWAJthxs4nbH1m2OyDevlrK0F+sl7H/gjqurZRQ2TaLMWaqNw==
X-Received: by 2002:a2e:b165:0:b0:2ec:1a8b:c379 with SMTP id 38308e7fff4ca-2ec1a8bc51bmr1997811fa.45.1718349594527;
        Fri, 14 Jun 2024 00:19:54 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286eef9eesm87272555e9.9.2024.06.14.00.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:19:53 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 03/12] dt-bindings: mfd: renesas,rzg3s-vbattb: Document VBATTB
Date: Fri, 14 Jun 2024 10:19:23 +0300
Message-Id: <20240614071932.1014067-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The VBATTB IP of the Renesas RZ/G3S SoC controls the clock for RTC,
the tamper detector and a small general usage memory of 128B. Add
documentation for it.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 .../bindings/mfd/renesas,rzg3s-vbattb.yaml    | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/renesas,rzg3s-vbattb.yaml

diff --git a/Documentation/devicetree/bindings/mfd/renesas,rzg3s-vbattb.yaml b/Documentation/devicetree/bindings/mfd/renesas,rzg3s-vbattb.yaml
new file mode 100644
index 000000000000..c0259e557dc5
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/renesas,rzg3s-vbattb.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/renesas,rzg3s-vbattb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas Battery Backup Function (VBATTB)
+
+description:
+  Renesas VBATTB is a module which controls the RTC clock (VBATTCLK), tamper
+  detection logic and a small general usage memory (128B).
+
+maintainers:
+  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
+
+properties:
+  compatible:
+    items:
+      - const: renesas,rzg3s-vbattb
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  ranges: true
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 2
+
+patternProperties:
+  "^clock-controller@[0-9a-f]+$":
+    $ref: /schemas/clock/renesas,rzg3s-vbattb-clk.yaml#
+    description: VBATTCLK clock
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - power-domains
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r9a08g045-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    vbattb: vbattb@1005c000 {
+        compatible = "renesas,rzg3s-vbattb", "syscon", "simple-mfd";
+        reg = <0x1005c000 0x1000>;
+        ranges = <0 0 0x1005c000 0 0x1000>;
+        interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "tampdi";
+        clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>;
+        clock-names = "bclk";
+        power-domains = <&cpg>;
+        resets = <&cpg R9A08G045_VBAT_BRESETN>;
+        #address-cells = <2>;
+        #size-cells = <2>;
+        status = "disabled";
+
+        vbattclk: clock-controller@1c {
+            compatible = "renesas,rzg3s-vbattb-clk";
+            reg = <0 0x1c 0 0x10>;
+            clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattb_xtal>;
+            clock-names = "bclk", "vbattb_xtal";
+            #clock-cells = <0>;
+            power-domains = <&cpg>;
+            status = "disabled";
+        };
+    };
+
+...
-- 
2.39.2


