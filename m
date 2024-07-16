Return-Path: <linux-renesas-soc+bounces-7363-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7519323FD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jul 2024 12:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAA82284B14
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jul 2024 10:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3502B19925F;
	Tue, 16 Jul 2024 10:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="POtFXHP2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1481991CF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jul 2024 10:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721125847; cv=none; b=jtMMoXtYkLo7aO957eac4D/J6sFlhP1VcSoL4PVFysTGr4Uq2PLO+hOCocgfQ6WDcCjJj/K6EqTJ1N5AyOkFlz8K/UrO/gis9gpWbnhqglnjL2xYvJTujgeeM6Ilm9Ipuwwh4EKfz6mmVk3oKmeXQMKpp4WhavFxD4mqZG9dnHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721125847; c=relaxed/simple;
	bh=ww/FT9sA68yQ9DNRM5qKKzoLjZnR43IIWUO39B1Sfuc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f7HXUXpqb57WdpICnzLLxXOghcKKO8BQzw+hOma3h+arEzxLso72srlmiqIfnYB5APgdGljM/Pf9Lh62HeWLq4NyxMj0TyEfhAGNu1HSK9ljK9jbKfZZtWTygw0sJX246LylKIM2uuCW9dg+tohiYpZTe42gcfnQRRAg7/Vvg14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=POtFXHP2; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-36794da7c96so1392004f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jul 2024 03:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1721125842; x=1721730642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DutJfFYyPW6LbOov2zw2hBuFnpsIDvuTXHPgZwrrhHw=;
        b=POtFXHP2POgN9KWUwPpVQydvrafjGIx36SpTG3EFyPdorVfoC3s+HJ3CKGRttD7Oik
         FnCcKn7kvtwTMx9thO0kyllljIi+eg4kLUmRIu6CDtf+6UA1TzmLKw1pUzQB+u3nzJ9G
         1z6YO6iBLQtfSwMy0CkaJCcXCpRJ3dFuH0jXizNF2r4+CvcjBSSQnkggUZ5plJ52zzxF
         S0QDsVOGrpc1spv0d8yGttmGw4pLoA7iN6fzIJ4kAIwJgWnHxqGCyqeZ5hQBnNUjRoIM
         wY8QM/o1KtIz+MKolOW6GCfJ7s1UpQGWcRn/PVwum2UwqWi2zf2XtY4q/RuVdBk48Uw3
         3tGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721125842; x=1721730642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DutJfFYyPW6LbOov2zw2hBuFnpsIDvuTXHPgZwrrhHw=;
        b=IGDrUrEZh0tv++/W+xf8WADSIXBpQJDeKsF/jL5KquuEZMnOZo2XSW7gJ/xt7tesMZ
         tbcT2TLLKelB6WNjJBf3h3aLyDOM1IxVJDmWLfKwgBMvejbxGLQJzdPJwJUsmz84X6Ts
         Ehp//AlHhXDSnyMOV+EK2afh/nQUxWV1mflsMBu+kWFEvU9cHW3L2gwLdRIiu8sOfbq6
         N8Ff0vNlzPK6AufrJIw6Pok0URFpoDytSBewiY+vIF3heLkltmqt2Z6w4fuE6kCC3ET3
         +G5NREX9PlpFc1WeTla52wdWuUlcdZCpx5C4H5T2bPzPG2mTZFVc1KC+TtRH+lF55mNd
         JUVA==
X-Forwarded-Encrypted: i=1; AJvYcCUeTjLZ6wb1r9nfEWff/wDXcgYWrkrbYtFKDbbL8S8PQe/Sqew2xX+mUui5FCbo0iRePuLwU68UahZEl7otrHzqNvx9VBQP4heIe/3saQYuQYg=
X-Gm-Message-State: AOJu0Yz9vnKg3y1PwJzZcqyhDuSViDJX24VDSpL3YRJA6vSvuL4Butqf
	smgDB12dKBJPEtpxQBULkBkHaAKJPUPrDOLSOr3ZliyVXGsKgoCX/UKwmytpNmw=
X-Google-Smtp-Source: AGHT+IFU3cDQXFUWCvhj2jbJm95VoDDyWAcY2PCPxU3FwC7xwW2+LqlxWB/VeBVZJ81bc0MyLsa17w==
X-Received: by 2002:a5d:6487:0:b0:367:91d8:a1d2 with SMTP id ffacd0b85a97d-3682614a8a8mr1354950f8f.30.1721125842490;
        Tue, 16 Jul 2024 03:30:42 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e77488sm121546145e9.9.2024.07.16.03.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 03:30:42 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 04/11] dt-bindings: rtc: renesas,rzg3s-rtc: Document the Renesas RTCA-3 IP
Date: Tue, 16 Jul 2024 13:30:18 +0300
Message-Id: <20240716103025.1198495-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Document the RTC IP (RTCA-3) available on the Renesas RZ/G3S SoC.
The RTC IP available on Renesas RZ/V2H is almost identical with the
one found on Renesas RZ/G3S (it misses the time capture functionality
which is not yet implemented on proposed driver). For this, added also a
generic compatible that will be used at the moment as fallback for both
RZ/G3S and RZ/V2H.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- updated patch description and title
- included reference to rtc.yaml
- updated compatible list with a generic compatible as explained in
  patch description; with this the node in examples section has also been
  updated
- used items to describe interrupts, interrupt-names, clock, clock-names
- updated title section

 .../bindings/rtc/renesas,rz-rtca3.yaml        | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml

diff --git a/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml b/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
new file mode 100644
index 000000000000..21f104b1e86b
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/renesas,rz-rtca3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RTCA-3 Real Time Clock
+
+maintainers:
+  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r9a08g045-rtca3 # RZ/G3S
+      - const: renesas,rz-rtca3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Alarm interrupt
+      - description: Periodic interrupt
+      - description: Carry interrupt
+
+  interrupt-names:
+    items:
+      - const: alarm
+      - const: period
+      - const: carry
+
+  clocks:
+    items:
+      - description: RTC counter clock
+
+  clock-names:
+    items:
+      - const: counter
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    rtc@1004ec00 {
+        compatible = "renesas,r9a08g045-rtca3", "renesas,rz-rtca3";
+        reg = <0x1004ec00 0x400>;
+        interrupts = <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "alarm", "period", "carry";
+        clocks = <&vbattclk>;
+        clock-names = "counter";
+    };
-- 
2.39.2


