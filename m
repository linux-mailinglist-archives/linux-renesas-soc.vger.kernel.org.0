Return-Path: <linux-renesas-soc+bounces-10203-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A735C9B60C1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Oct 2024 12:01:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 390441F2399F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Oct 2024 11:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C391E3DD7;
	Wed, 30 Oct 2024 11:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QB7wZK+m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15FE1E3DCB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Oct 2024 11:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730286103; cv=none; b=dZ7ucbnFE+OdfzQzdeDY1pkmLvSVNNTmh0Oohz0W4yftzrKWbg3jMhRgLjQd+xleRpRSQeqHqOx+c1qxtHY/EUFoWoa8+EyuNkR96cX1Ux8GbzAOgBc65SDYNGVIMgY+TGrf+Ndl4KilZd3U8IoVa+ZIErh2oXlAib8WFcGc1jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730286103; c=relaxed/simple;
	bh=YdpeMJoCXUJ1RxY/p6VhRloddkd3ds0I4meNGZvdr2k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bvIwerQdY87zI09IFRCAEyS4laTnQxIHRI4ZjWXh8lhs620wHT8ot7cp0XpoBQM1VhH0ksjxpdqvpJpfTjX/0kinIU8dpX1SPeKlQ7+OFYJP8zENPPjcrmIYSsAY2w5jU+TGARFP7KBET0SgHsTrFNGSg7xm9qZNyYDIbbZmD7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=QB7wZK+m; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43155afca99so4569755e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Oct 2024 04:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730286099; x=1730890899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPAY99/b86NU6xxyFr+lv4xE3Qrx/qwWg87o/3GcG2k=;
        b=QB7wZK+m72eSZEqBQZqC7/5QzBtyZUzf2nyPO15xx4ZOM3z3pb4Jich1ZqJXwtdxER
         l/WU7wQBwc0OZ3TNWWy1Hw4gB2sMjhOyLdUm4pHlaHETN6/vVyct9hWeya7CE7gBMpn/
         EIMr+NyaP+6nq1UV8B83UKuUbWoUxFUtvNDg6iJ0R6Rj5n30lotBaZ3d+Y19m+VqVd7V
         zj2EM97rUsjue8FLpOU5l+rlOxOXgyYVTNdvlfMpn5cmDcmQkVXGQ10KFheEmKG/+eZk
         oqSXooY6dDDSw4pnanD7FdTDKEwR5AS36nj+Qw2JYqhaH6+aN8XkkS3DGxeXXnaPETpp
         5trA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730286099; x=1730890899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VPAY99/b86NU6xxyFr+lv4xE3Qrx/qwWg87o/3GcG2k=;
        b=WgVBXY95QGrDvQM46XlFOYjJW/HAZvvy5mdCfEKHkoRS+bYvLqFZ5jn7KTLglnjxkM
         WF0ZAZeJYDQ1lozQ8KHrBl1sGTNFgtUz1H1DTUUJSRkzWiYJdJOnwYqkGHEQFakQGRQa
         ZvVXLh3PmQ3PWNUYS/cYNnPxlAJVGeUqhd8Fxjo7hocTPlwz/UM8aS7bhDryj1UQ8YVq
         fo0hRQsu/Y8rquvlMMvD973jc5TgKiy6tUOnmlU81vsrNNG1x7n0izI2Gf+4/0qdz3ez
         juhGRhKD5le6T4FZlh7fS7VvOTDTdLr1w173N4bHtmrojiMQ9zcdF3480n75KtR8M13d
         9DLw==
X-Gm-Message-State: AOJu0Yw6gjDQP7rSV81OEPpV0IcZt2c1fOaXO9AqgE85ZbWoqFTR6fgE
	v9IKAxJRmJiMAXDl88LmGnEkD477Wy9Jo2T/a6kpPgbaElZiM+Y7HoHeDIbZAU8=
X-Google-Smtp-Source: AGHT+IEHPgxDfD5Fa5a5J0wxXIUzXwZQ07u3mw8zxEnQypPfCK1PseGSZb+5VYyckxdfvK6nA0eerQ==
X-Received: by 2002:a05:600c:314e:b0:431:47e7:9f45 with SMTP id 5b1f17b1804b1-431bd8a09aamr15476845e9.11.1730286098704;
        Wed, 30 Oct 2024 04:01:38 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd99edebsm17956935e9.45.2024.10.30.04.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 04:01:38 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 01/10] dt-bindings: clock: renesas,r9a08g045-vbattb: Document VBATTB
Date: Wed, 30 Oct 2024 13:01:11 +0200
Message-Id: <20241030110120.332802-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The VBATTB IP of the Renesas RZ/G3S SoC controls the clock for RTC,
the tamper detector and a small general usage memory of 128B.

The VBATTB controller controls the clock for the RTC on the Renesas
RZ/G3S. The HW block diagram for the clock logic is as follows:

           +----------+ XC   `\
RTXIN  --->|          |----->| \       +----+  VBATTCLK
           | 32K clock|      |  |----->|gate|----------->
           | osc      | XBYP |  |      +----+
RTXOUT --->|          |----->| /
           +----------+      ,/

One could connect as input to this HW block either a crystal or
an external clock device. This is board specific.

After discussions w/ Stephen Boyd the clock tree associated with this
hardware block was exported in Linux as:

input-xtal
  xbyp
  xc
     mux
        vbattclk

where:
- input-xtal is the input clock (connected to RTXIN, RTXOUT pins)
- xc, xbyp are mux inputs
- mux is the internal mux
- vbattclk is the gate clock that feeds in the end the RTC

to allow selecting the input of the MUX though assigned-clock DT
properties, using the already existing clock drivers and avoid adding
other DT properties.

This allows select the input of the mux based on the type of the
connected input clock:
- if the 32768 crystal is connected as input for the VBATTB,
  the input of the mux should be xc
- if an external clock device is connected as input for the VBATTB the
  input of the mux should be xbyp

Add bindings for the VBATTB controller.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- used spaces in the diagram from the patch description
- added "This is board specific" in the board description to emphasize
  the usage of the assigned-clocks in the example
- added default for quartz-load-femtofarads
- collected tags

Changes in v4:
- squashed with patch "Add clock IDs for the VBATTB controller" from v3
- removed "oscillator" word from commit description
- added assigned-clocks, assigned-clock-parents to the documentation example
- used clock-controller for the node name
- used "quartz-load-femtofarads" property for the load capacitance
- renamed include/dt-bindings/clock/r9a08g045-vbattb.h to
  include/dt-bindings/clock/renesas,r9a08g045-vbattb.h

Changes in v3:
- moved the file to clock dt bindings directory as it is the
  only functionality supported at the moment; the other functionalities
  (tamper detector, SRAM) are offered though register spreaded
  though the address space of the VBATTB IP and not actually
  individual devices; the other functionalities are not
  planned to be supported soon and if they will be I think they
  fit better on auxiliary bus than MFD
- dropped interrupt names as requested in the review process
- dropped the inner node for clock controller
- added #clock-cells
- added rtx clock
- updated description for renesas,vbattb-load-nanofarads
- included dt-bindings/interrupt-controller/irq.h in examples section

Changes in v2:
- changed file name and compatible
- updated title, description sections
- added clock controller part documentation and drop dedicated file
  for it included in v1
- used items to describe interrupts, interrupt-names, clocks, clock-names,
  resets
- dropped node labels and status
- updated clock-names for clock controller to cope with the new
  logic on detecting the necessity to setup bypass

 .../clock/renesas,r9a08g045-vbattb.yaml       | 84 +++++++++++++++++++
 .../clock/renesas,r9a08g045-vbattb.h          | 13 +++
 2 files changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml
 create mode 100644 include/dt-bindings/clock/renesas,r9a08g045-vbattb.h

diff --git a/Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml b/Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml
new file mode 100644
index 000000000000..3707e4118949
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/renesas,r9a08g045-vbattb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas Battery Backup Function (VBATTB)
+
+description:
+  Renesas VBATTB is an always on powered module (backed by battery) which
+  controls the RTC clock (VBATTCLK), tamper detection logic and a small
+  general usage memory (128B).
+
+maintainers:
+  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
+
+properties:
+  compatible:
+    const: renesas,r9a08g045-vbattb
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: tamper detector interrupt
+
+  clocks:
+    items:
+      - description: VBATTB module clock
+      - description: RTC input clock (crystal or external clock device)
+
+  clock-names:
+    items:
+      - const: bclk
+      - const: rtx
+
+  '#clock-cells':
+    const: 1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: VBATTB module reset
+
+  quartz-load-femtofarads:
+    description: load capacitance of the on board crystal
+    enum: [ 4000, 7000, 9000, 12500 ]
+    default: 4000
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - power-domains
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r9a08g045-cpg.h>
+    #include <dt-bindings/clock/renesas,r9a08g045-vbattb.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    clock-controller@1005c000 {
+        compatible = "renesas,r9a08g045-vbattb";
+        reg = <0x1005c000 0x1000>;
+        interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattb_xtal>;
+        clock-names = "bclk", "rtx";
+        assigned-clocks = <&vbattb VBATTB_MUX>;
+        assigned-clock-parents = <&vbattb VBATTB_XC>;
+        #clock-cells = <1>;
+        power-domains = <&cpg>;
+        resets = <&cpg R9A08G045_VBAT_BRESETN>;
+        quartz-load-femtofarads = <12500>;
+    };
diff --git a/include/dt-bindings/clock/renesas,r9a08g045-vbattb.h b/include/dt-bindings/clock/renesas,r9a08g045-vbattb.h
new file mode 100644
index 000000000000..67774eafad06
--- /dev/null
+++ b/include/dt-bindings/clock/renesas,r9a08g045-vbattb.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_CLOCK_R9A08G045_VBATTB_H__
+#define __DT_BINDINGS_CLOCK_R9A08G045_VBATTB_H__
+
+#define VBATTB_XC		0
+#define VBATTB_XBYP		1
+#define VBATTB_MUX		2
+#define VBATTB_VBATTCLK		3
+
+#endif /* __DT_BINDINGS_CLOCK_R9A08G045_VBATTB_H__ */
-- 
2.39.2


