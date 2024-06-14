Return-Path: <linux-renesas-soc+bounces-6188-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C156390846C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 09:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C36D1F25DFE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 07:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F01118412F;
	Fri, 14 Jun 2024 07:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="WR/e30Uo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6811836DE
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 07:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718349602; cv=none; b=luN35F6uAXI9Jj6qYwaOGMVl3rbPu8+WDgLEBCgOFAsWpjMZAsN0PzdZfp7pPS/XdMjQfWAVG1leCB3X6mZ+8iwN9GfczPMi61bkCA4YvRh73G2vqVTnkXXZB095+fRDkvkcmmQ220VBuYfch8yosPHmsmu6HwNqIFc+rDYjtts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718349602; c=relaxed/simple;
	bh=+sPmTTkEHsi5OI2Ril+WrbrgmWyUr4giRSVYtUqk3dE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s2qlTow8ZF5AovjQbD8jhELp731L17ngsHbfLPWtM1XgCFle3MUVJnO1CE6Gof+mk8UgBtqDoEiNjrJZs0bWzmPuA7uZu0LAsP3tzTqPBtEuhkuxnEcz5550U1dszezcOM+FEAdViJpMstsEVrfIPdsbPITyN5k2qwmT+cONAJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=WR/e30Uo; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4217136a74dso17052525e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 00:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718349598; x=1718954398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7siOFVYUaSSVi4rSlfod3aMeNU0h2Ys5AF3R/iRB18=;
        b=WR/e30UoPB4LkcV/fFPYWW8Kz1fzER/xQY6A+PRZr5BpnEfn34+aOFVdQKWj3mrqWb
         oqNfi23Zcum6LinQ2dcmWqvfTyhbrjafNLj9n2zeUtM3/GbhxvWY+g+9Tece/XIyvkz4
         ZaZ4tWnfniZ5tMKYeTFoy4bzFOWKXQ9gp0EIK2+nB/2nnlnKNFUNqHuiCQ+KryOAtmzQ
         RFGLOAL5N0iJrCI+eeQdiLrXnIEL6nzkAG1D0SKPx2sTTySRZmZo3YEKYiwryxlv8yN+
         A15n3coWCSe2inyWlkDllT0hs34fWP/DSbQpvpN3Mpo7v1KqKbQl+AkpiNRKBhAS2fC7
         IjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718349598; x=1718954398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7siOFVYUaSSVi4rSlfod3aMeNU0h2Ys5AF3R/iRB18=;
        b=Q7ZcmrwfNMQeinoYmesOonH1w24SoX3SviX7bztsfIniQaq2K8naU55MKlcZCNndST
         gaylLrTZpQjoAdIjnE4pFidwtFc/Kxz8Jvib1FsyXikvNg1HX3GkBBp5eG3JTSncH4+n
         7tKk4F9NeeonWiwkal0RkN84OEE9mGYZAkz0WSE+7Y4aO2woJHcLIz7NrQxgrHG+6jLg
         4LZ2o7NEkgweHijeLpAvvHjGyOPvoZOyXw2o9aNgs2E8tBINnA/p3tJJBuvuvswen2Xx
         mBAIW/F9jqrshvwIWWqUqRjRvjuczDMlqTP+TL9/D6KNUQ5+W+w7ykioM7bZ6TTMT2Fm
         DZJA==
X-Gm-Message-State: AOJu0YwkyhvTdBRI8yCcZcGJhmL/sfrgeryLpc8s2U4z+10lCUbePCLh
	p6vZQxWhvRz22w1gTpodmtc1Tsl0Zk+F4eu2nanL9Oatr4mtad0uYsFMQExbuBc=
X-Google-Smtp-Source: AGHT+IHvJbe0MPxxmAy0Jaa+i29h6XRm4HO3GS+nYni4SEUr1oyYsazmbKlbSli1ZCLA+9ThckA7xQ==
X-Received: by 2002:a05:600c:a43:b0:421:ad:f104 with SMTP id 5b1f17b1804b1-42304827c4emr19665955e9.10.1718349598308;
        Fri, 14 Jun 2024 00:19:58 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286eef9eesm87272555e9.9.2024.06.14.00.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:19:57 -0700 (PDT)
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
Subject: [PATCH 05/12] dt-bindings: rtc: renesas,rzg3s-rtc: Document the Renesas RZ/G3S RTC
Date: Fri, 14 Jun 2024 10:19:25 +0300
Message-Id: <20240614071932.1014067-6-claudiu.beznea.uj@bp.renesas.com>
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

Document the RTC IP (RTCA-3) available on the Renesas RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 .../bindings/rtc/renesas,rzg3s-rtc.yaml       | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/renesas,rzg3s-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/renesas,rzg3s-rtc.yaml b/Documentation/devicetree/bindings/rtc/renesas,rzg3s-rtc.yaml
new file mode 100644
index 000000000000..0e17f8a36155
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/renesas,rzg3s-rtc.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/renesas,rzg3s-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Real Time Clock for Renesas RZ/G3S SoC
+
+maintainers:
+  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
+
+properties:
+  compatible:
+    const: renesas,rzg3s-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: alarm
+      - const: period
+      - const: carry
+
+  clocks:
+    maxItems: 1
+    description: RTC counter clock
+
+  clock-names:
+    maxItems: 1
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
+    rtc: rtc@1004ec00 {
+        compatible = "renesas,rzg3s-rtc";
+        reg = <0x1004ec00 0x400>;
+        interrupts = <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "alarm", "period", "carry";
+        clocks = <&vbattclk>;
+        clock-names = "counter";
+        status = "disabled";
+    };
-- 
2.39.2


