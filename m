Return-Path: <linux-renesas-soc+bounces-11818-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F470A00C3B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 17:39:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F018A3A3F8D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 16:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD86B1FC7E8;
	Fri,  3 Jan 2025 16:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="N2+qqblB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911F11FC104
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Jan 2025 16:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735922318; cv=none; b=J6ME+9T9+JVa6c2Ov9NsmIPY0F/u7EkcOhKejC4Mkof+JLw7SOolqe2Hn0n24oOUxGt7rIy5+cCCQr/uupdNQ2jeLN+cqXjXz4DG2EVXkP6jzjRg6DcQNFQkXahPmbPTMgpxE9QUAGhoTYbn2/r3XZVI70PO0rzrSd9pwt/mNTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735922318; c=relaxed/simple;
	bh=by0/KQXncjgvS4hPgMtbUixzVUWVB8vOz9ZHoJHsfvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NKvACp8mDBRalpx1Dx9WT7VshjPs7n/zQWBoxdbbmveC+p4F75YNylfS6nMexgPUm9Ry1BG1brMJ51C7e70hNV/42+kueOBQ8F6mBlD/APpgvRppd8FaR51WLGFHOngyZN5hxZE/9HVi7swKt+YzYhLJrtCCCujBy0dca1q1h70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=N2+qqblB; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aaf60d85238so512077866b.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Jan 2025 08:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1735922314; x=1736527114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evyYwVG9jAAn2LfhNe4V0lOQ6hGXTx/eRi/lhEE4KRI=;
        b=N2+qqblBJABy/HiJ39CiJSTr/k9VsvnKY93fbC1hgknuHymghaGPTQr0RaGu+kry5g
         Es8S6jaR4nOgQXBjMFm11ZR302yKOFcCS18Jq+myD/g+NwIottNepYn7x0ZD7xCHOgap
         9rn/LuWiYxtmrFQ3GiMadGW1R+Jrbt9D75JyV3mQKWv4FbbZMgUl4tVkrQ4ykxerMwcq
         TkXqq/GpcVAesymgPtK1q/U0EtHUZbYspfx0Eys6ki5PvJZ83xjbb5ezfU0A9q/k0a3T
         wdMq7ilwNd481GuvlPOgXM+wmMAlqIZe0/GkdPM2tk0KjLkuSsCzrat00siwnucI78Np
         qFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735922314; x=1736527114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evyYwVG9jAAn2LfhNe4V0lOQ6hGXTx/eRi/lhEE4KRI=;
        b=NfEMuJQfHRJ0Cwi9pnJdlQScMLnaEAXEOoBRvdgG+K6FKzyM0j2AAotMN5+KRhh631
         pO0IN/9fq2cbBrbsS89kifLHnxjvFgIy/dTsQtiYtqPPpCoT2nMpwoqRm7qYjt6qaZGP
         7PpqJ7JyP1KGSjyi8OU+QpR15ZK0Jy7/KXmtZTbgRIyC+3JKFapRRrS+t+hEeQZdIob5
         gsUwgFjJj4U5Qeyoc8CgCXFgQX0AoRsrKdYfKmZvmCSZu0RdyQgjbU36ttp+kVUE8hvP
         FibuNlWJ+f8khX0vgV5KbZ274QFtAQO4fkc60i78X/YCvV2+GLwDZ0MYTx3uI1jGTjdR
         K/2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvNE5EaGx7Sg6qLyXcLYEOGmEe6ogXuft9LjcEbTIwwqfNRZRvwfgWn1XkNJ2HPUXijtrIKvviW3Vncjmka+wriA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiUjgJKS5jfe+4SJznR4MvHNxROtBhIt3iOYfYROJxDa0amamd
	8+pDdyU6wJomcyqn1B5BKo26XS3eh7wJMWr2vHQ8v2e3/UK2BbasYjequD9uKP0=
X-Gm-Gg: ASbGncsRMe/Zd0rBmqRpbsB+Qx07qyKuVVdgzPS0XhFS0m4hjdPl2Azf55md1yWR0ZJ
	hgcAxWXSAlgJnp4ZhaVSAXNRW5661ZAOuSNp0MXVkdIZw8EeZrdd2BLahJC26LiQcislMYtAnvG
	ErxxOXhP3b2B9YiNw/JGF5+o35fOHxhHBzeDQYyfzFTuuvOUitwZYnrmT+tlGyQxNGHUGuMA4hJ
	PDiPmfGNGxw2Q0DP5PtslGlxE3nzaAr21QwniKYfGtjouncOkzKU3ze6qf2V4pMhqpSAaktEPFY
	vIFptfaaaWs=
X-Google-Smtp-Source: AGHT+IGZziQN526Qz2cC4SM+sDiCIJGAjK04HVz8g4TFUK5HQL4oXUkqdbEpUHeE3KBwEfQsCEVxQA==
X-Received: by 2002:a17:907:1c85:b0:aa6:29dc:11b with SMTP id a640c23a62f3a-aac3342c7f4mr4934010766b.16.1735922313975;
        Fri, 03 Jan 2025 08:38:33 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e8953b6sm1932984066b.65.2025.01.03.08.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 08:38:33 -0800 (PST)
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
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	ulf.hansson@linaro.org
Cc: claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 3/6] dt-bindings: thermal: r9a08g045-tsu: Document the TSU unit
Date: Fri,  3 Jan 2025 18:38:02 +0200
Message-ID: <20250103163805.1775705-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
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

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
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


