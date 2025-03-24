Return-Path: <linux-renesas-soc+bounces-14767-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CD7A6DC40
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 14:57:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9120516D42C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 13:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D495B25F98B;
	Mon, 24 Mar 2025 13:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="X45dn8fR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9476F2AD14
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 13:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742824635; cv=none; b=kldHWIBrLkgUw0fdKHvVrPDAwHi/sNXJmbLAh+7cvdDTqM0rcWqjBnoC0Br8S51qB887K3gfVDY6gUqWI32BT/j+EF2tafOKgM2fcKOPYRhFyHsM93SrVRel3mETWOaqWE3DEtyX30iBC6GM92obhImnUlzC8i7Qj85jBYAkCJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742824635; c=relaxed/simple;
	bh=UW1lKUt524Tfb01HBDHez5x3MQRpakzQrr2jiWuM+Jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u3ZXmQ5WRr0fhBhTIpPbQL/9FXtIFGnXa88PWlrLmU4Za02U/niFpTvCfkiT8I8JETj12sBn4w2/JC8Jn62jX3lC4eFj0lL1vu7jzpFU46uNfCJbtQ0YVQHxqukxKuLahX37Lsu7Qbarku8cbclFeMRCN7+f5UnRQ27Y6NkNlic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=X45dn8fR; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso27913755e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 06:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1742824631; x=1743429431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UNHK0UkXslOXK9Cojg+TA3Q9iNaUiBxGFRZEPfafnE=;
        b=X45dn8fRB6ECLj0BXlN4ltnBL8HQypUXYfLB6rojFJqmB3nn9P0Uk6jtOYWXbHWCqN
         L0q+CsiCZKpKCg2KGaZIrvi9y5/8rzj9Htr/MSibd63hQO9fhfXcphtref+1gtKf7E6u
         8tQRvLeaDcn4rU0bK59gBD8bX04E1Qk9y+c2aNF+WLDs4Eo69kUjSwCDEElFlUadekgC
         0n867a7PVO4PyfzKHJ4OfWcx9E5IFsQb8LTQu7O6eatjg4CZck/1zgW/kRPo7opJzjVQ
         zRo1HmGOysdRDsQcLXhSq4eTfZ0ycADd+bBFlIB0I8bkNPNk5UkR61UobF21roxaEQEu
         rh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742824631; x=1743429431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7UNHK0UkXslOXK9Cojg+TA3Q9iNaUiBxGFRZEPfafnE=;
        b=SkHC+mALcBuwlc9sVphqBY9SzLPe/tN6IAmfxr0BoNIdoh+0QGI8MZfnAkiSYSgnFT
         fSbA2aye7XG9Re5Px5r8GOA1irWYf00iyJmy6iPlSeD2f0ISZcQBaP1yIN3pEh2BVrBT
         a8zERnfo1L9ZE+M29jTVx/BdMaLhQ7giGQNAwhjzNqGtRGXFbbTWwrOpETRZymtLKyVY
         uP80G9/OvUg9fy+wNPwBm0blDCDy5l9NnSllmC8O0uz0KKHXGMo3vJJNbSzSenmfABfl
         ZdpDKtQ5PlXLc3x+UBIaiTKmgtzYsz4FhpE61vMO9yZpQl1kDOt70qH4+kppHkI5j8oi
         cOfA==
X-Forwarded-Encrypted: i=1; AJvYcCXdYW1pLuZ8wqygA6N5Lr2F9jXdCRNTqkYdwUmSSNlvAG6bqZl9wWlcYv1QxUeJaVK2UqsiEXhm68O36BdadLBZ8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtvBAjP4STTonp2RfAJRLGL19n3FLJB9HyR3xtJOVygnylc9IP
	yx6J658dcopEZbvNP5ZMi58wT8XXwgshqC7gyfy7ko6F9BnjXfivSgmLNhg5utU=
X-Gm-Gg: ASbGncs8FbAcrzZmipqMEIJvxEB0OZ1v2mEXid8XMHrN8lwwJySv6B+dEnGiBPNBefg
	l6JE5PrtyCGuPLud458wn9wd6YyjVsu/TqCKi2AProdHxVucZYDgwwhSWQKzNkHM3b8H1NvJAv4
	RADvU9eOIPhdKFxFQQujTtRLlWxcCF47GgUnjjJLkAwx2t2aFsRM7kRaETAolN3gqOZjfAQ3Fv1
	RhsBB2dUToOnhhOEAS7LJJkLyhTN9iYCLoJPo5vEqxGtnTJTsre9P2sqLWD19VUxdtdPc4c5SXq
	G97VO0ZncAQWTzyW2bCQH92Gt4X8+HLOIBnqt59CQPoljErrQxFJ4rA/ryeotbPdZs17Xean0g=
	=
X-Google-Smtp-Source: AGHT+IF+aQ0FEvkhnRt3sxgn6g1Ze8bSrdmghjRhLESAenZp4cAyrmpvI0c8iq1nlVx+oM3A7YzpMg==
X-Received: by 2002:a05:600c:cc:b0:43b:c592:7e16 with SMTP id 5b1f17b1804b1-43d4915e6bemr141532175e9.3.1742824630850;
        Mon, 24 Mar 2025 06:57:10 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdbcfaasm120146525e9.35.2025.03.24.06.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 06:57:10 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 1/4] dt-bindings: thermal: r9a08g045-tsu: Document the TSU unit
Date: Mon, 24 Mar 2025 15:56:58 +0200
Message-ID: <20250324135701.179827-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250324135701.179827-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250324135701.179827-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S SoC includes a Thermal Sensor Unit (TSU) block designed
to measure the junction temperature. The temperature is measured using
the RZ/G3S ADC, with a dedicated ADC channel directly connected to the TSU.
Add documentation for it.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- collected tags

 .../thermal/renesas,r9a08g045-tsu.yaml        | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/renesas,r9a08g045-tsu.yaml

diff --git a/Documentation/devicetree/bindings/thermal/renesas,r9a08g045-tsu.yaml b/Documentation/devicetree/bindings/thermal/renesas,r9a08g045-tsu.yaml
new file mode 100644
index 000000000000..573e2b9d3752
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/renesas,r9a08g045-tsu.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/renesas,r9a08g045-tsu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G3S Thermal Sensor Unit
+
+description:
+  The thermal sensor unit (TSU) measures the temperature(Tj) inside
+  the LSI.
+
+maintainers:
+  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
+
+$ref: thermal-sensor.yaml#
+
+properties:
+  compatible:
+    const: renesas,r9a08g045-tsu
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: TSU module clock
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: TSU module reset
+
+  io-channels:
+    items:
+      - description: ADC channel which reports the TSU temperature
+
+  io-channel-names:
+    items:
+      - const: tsu
+
+  "#thermal-sensor-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - resets
+  - io-channels
+  - io-channel-names
+  - '#thermal-sensor-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r9a08g045-cpg.h>
+
+    tsu: thermal@10059000 {
+        compatible = "renesas,r9a08g045-tsu";
+        reg = <0x10059000 0x1000>;
+        clocks = <&cpg CPG_MOD R9A08G045_TSU_PCLK>;
+        resets = <&cpg R9A08G045_TSU_PRESETN>;
+        power-domains = <&cpg>;
+        #thermal-sensor-cells = <0>;
+        io-channels = <&adc 8>;
+        io-channel-names = "tsu";
+    };
+
+    thermal-zones {
+        cpu-thermal {
+            polling-delay-passive = <250>;
+            polling-delay = <1000>;
+            thermal-sensors = <&tsu>;
+
+            trips {
+                sensor_crit: sensor-crit {
+                    temperature = <125000>;
+                    hysteresis = <1000>;
+                    type = "critical";
+                };
+                target: trip-point {
+                    temperature = <100000>;
+                    hysteresis = <1000>;
+                    type = "passive";
+                };
+            };
+        };
+    };
-- 
2.43.0


