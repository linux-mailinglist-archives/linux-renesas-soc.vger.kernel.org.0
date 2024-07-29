Return-Path: <linux-renesas-soc+bounces-7608-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A7F93FF79
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 22:30:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 725E91C227C8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 20:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A24318D4C7;
	Mon, 29 Jul 2024 20:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eK71l9jS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78CD189F53;
	Mon, 29 Jul 2024 20:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722284912; cv=none; b=tlVu2gPZInhi7mNjFKpQynySdBGNB2RNJbcIrO8Jjqx3BU51TwNY8mIwNPvCt6xqmKjlFvLMyxmG3NznHCCC3aFeu3DWmmj2mISGPQ+KK3OS/E8Xd9RCij2o1I2CvGFZwof6GrK07C53+nVP1ron90zNU9No1Hw7B6929PRCfk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722284912; c=relaxed/simple;
	bh=8DbwYsVWbmbnwxKqlMJ3uF5uBqQ1mu6PH3e2YsoBlXE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gs33sWwyOurob5em+vTMi/9WfX9wo3cEo5YQEutXmto0GRt7y6MZTrXjtmDfiiWlP32bwhq77YNAOrXjKL31YseEfvC1bBYuX6fzcVe+FdYUXWIv0pNwJ/o/antAefhfM6EFbXHN1c6MqKH1I4QS8uj7g6kLK+n25GveO6Pozgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eK71l9jS; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42812945633so20834785e9.0;
        Mon, 29 Jul 2024 13:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722284909; x=1722889709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DB16foEIWt6opkiO8Wk0Ctyr8jJ9aNPp4o+TbmpY744=;
        b=eK71l9jSo/2gYVJ7YByWYPM/isbKu6vpXmHaJBz6oWe9+vZeXGpK5H4Efyfy7SzTK0
         0ccfMlEHZpl7y1gWEumT5rWuSmgk+K7P/1KuqoNMToUpvHjrEUxHQN/z5vyX833vZZfB
         qRXXGCILq2t8z2iIJ2GhWx2Ud0t/GR8F5WD3FRmfDFC208IqWTyWIDlPJtymjSfjyaqj
         YTIajSAco73qkk20iqkTi7Wi9v6ja1VTjSS4aJca/6Qbsxudn3K6JURPA/jBAYAYdC0x
         Nt+F94RlpJW3sqYYJsarTj5dT/GagCxe8wMovOUZReLnAMReePMnUQYbXHW5d9oqCbtE
         koAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722284909; x=1722889709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DB16foEIWt6opkiO8Wk0Ctyr8jJ9aNPp4o+TbmpY744=;
        b=kJlDHbBtUYLbB/K6dbYX/II/7zgmvvGhK+pHt5AehnpAPsLc6Ck/QRfMLTZ+VoM+uU
         Qh5THoqJKjBnhYetV59HwxR3fV474jWLJICxVHgvJ8pba9YQkg6owJzOHyqL2bOPBnv5
         ohFV/pslW7gdXeCzOsvmhjuuBusrcDyl7ey4DjJZkPOOcFDW7Dzxy2taTUpIuObltyM8
         gycllwQxiW4z1oc5KUzocz08s1Fx3WgpnSWj/JAXMvcdguomMiNSbZXNmqFGoXOONcVr
         jcWkoKcmMVtSo+rGbJwkwcFSXNb/Slud9re/nCGXRulaFOXWlfgPMyTBJQcXyncjk1NJ
         wgWw==
X-Forwarded-Encrypted: i=1; AJvYcCWVRcHiWR7mEYKeAl/j4DjQAtXcc6iHTJVreOfXhmq9KIzp82EZdi3PwupRPFCHY/2wjvb9a1n53t34bugz0V7zerNPpHReMLpYrH78JUsrhb5pMIfPuuEpPhOchvihNuxF0lnG08tJzn+lc1KHnLzLTk7ypolDcUbSTRxVNyoMLGeQuQ==
X-Gm-Message-State: AOJu0YyawJt0HO1CRogdzzPQI6r6DEZh9ykAC49duJ8iQXPZ/qh2Vnrm
	AwECwS2wFpdrBYzNd9WrDXyjtKwQyJB14XDRE3eC9egneTMEIhLRDTAZ0SUi
X-Google-Smtp-Source: AGHT+IH0/SMmm7nghI/ofEg3Hwxf1N+FV+LIwr9wNpdbbWCXtN/NFg8zpGhmYPHnoLGWcMeEBVIBGw==
X-Received: by 2002:a05:600c:2143:b0:426:5471:156a with SMTP id 5b1f17b1804b1-42811d86408mr59174385e9.13.1722284908499;
        Mon, 29 Jul 2024 13:28:28 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:91c0:6bc7:8f80:c05e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4280f484cdesm125478115e9.44.2024.07.29.13.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 13:28:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/3] dt-bindings: clock: renesas: Document RZ/V2H(P) SoC CPG
Date: Mon, 29 Jul 2024 21:26:43 +0100
Message-Id: <20240729202645.263525-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729202645.263525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240729202645.263525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the device tree bindings for the Renesas RZ/V2H(P) SoC
Clock Pulse Generator (CPG).

CPG block handles the below operations:
- Generation and control of clock signals for the IP modules
- Generation and control of resets
- Control over booting
- Low power consumption and power supply domains

Also define constants for the core clocks of the RZ/V2H(P) SoC. Note the
core clocks are a subset of the ones which are listed as part of section
4.4.2 of HW manual Rev.1.01 which cannot be controlled by CLKON register.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4->v5
- Included RB tag from Geert

v3->v4
- Included RB tag form Krzysztof
- Changed reset and clock values to hex
- Renamed __DT_BINDINGS_CLOCK_R9A09G057_CPG_H__ to
  __DT_BINDINGS_CLOCK_RENESAS_R9A09G057_CPG_H__

v2->v3
- Dropped '|' for CPG description
- Dropped description for '#power-domain-cells' property
- Added 3 clock inputs for CPG
- Dropped label in example node
- Used 4 spaces for example node
- Renamed r9a09g057-cpg.h -> renesas,r9a09g057-cpg.h
- Merged adding renesas,r9a09g057-cpg.h in DT binding patch
- Updated commit message

v1->v2
- Updated commit message
- Updated description for binding as suggested by Geert
- Updated descriptions for clocks and resets property
- Renamed extal->qextal
- Updated '#power-domain-cells' value
---
 .../bindings/clock/renesas,rzv2h-cpg.yaml     | 80 +++++++++++++++++++
 .../dt-bindings/clock/renesas,r9a09g057-cpg.h | 21 +++++
 2 files changed, 101 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g057-cpg.h

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
new file mode 100644
index 000000000000..926c503bed1f
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/V2H(P) Clock Pulse Generator (CPG)
+
+maintainers:
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+
+description:
+  On Renesas RZ/V2H(P) SoCs, the CPG (Clock Pulse Generator) handles generation
+  and control of clock signals for the IP modules, generation and control of resets,
+  and control over booting, low power consumption and power supply domains.
+
+properties:
+  compatible:
+    const: renesas,r9a09g057-cpg
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: AUDIO_EXTAL clock input
+      - description: RTXIN clock input
+      - description: QEXTAL clock input
+
+  clock-names:
+    items:
+      - const: audio_extal
+      - const: rtxin
+      - const: qextal
+
+  '#clock-cells':
+    description: |
+      - For CPG core clocks, the two clock specifier cells must be "CPG_CORE"
+        and a core clock reference, as defined in
+        <dt-bindings/clock/renesas,r9a09g057-cpg.h>,
+      - For module clocks, the two clock specifier cells must be "CPG_MOD" and
+        a module number.  The module number is calculated as the CLKON register
+        offset index multiplied by 16, plus the actual bit in the register
+        used to turn the CLK ON. For example, for CGC_GIC_0_GICCLK, the
+        calculation is (1 * 16 + 3) = 0x13.
+    const: 2
+
+  '#power-domain-cells':
+    const: 0
+
+  '#reset-cells':
+    description:
+      The single reset specifier cell must be the reset number. The reset number
+      is calculated as the reset register offset index multiplied by 16, plus the
+      actual bit in the register used to reset the specific IP block. For example,
+      for SYS_0_PRESETN, the calculation is (3 * 16 + 0) = 0x30.
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - '#power-domain-cells'
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@10420000 {
+        compatible = "renesas,r9a09g057-cpg";
+        reg = <0x10420000 0x10000>;
+        clocks = <&audio_extal_clk>, <&rtxin_clk>, <&qextal_clk>;
+        clock-names = "audio_extal", "rtxin", "qextal";
+        #clock-cells = <2>;
+        #power-domain-cells = <0>;
+        #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/renesas,r9a09g057-cpg.h b/include/dt-bindings/clock/renesas,r9a09g057-cpg.h
new file mode 100644
index 000000000000..541e6d719bd6
--- /dev/null
+++ b/include/dt-bindings/clock/renesas,r9a09g057-cpg.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_CLOCK_RENESAS_R9A09G057_CPG_H__
+#define __DT_BINDINGS_CLOCK_RENESAS_R9A09G057_CPG_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* Core Clock list */
+#define R9A09G057_SYS_0_PCLK			0
+#define R9A09G057_CA55_0_CORE_CLK0		1
+#define R9A09G057_CA55_0_CORE_CLK1		2
+#define R9A09G057_CA55_0_CORE_CLK2		3
+#define R9A09G057_CA55_0_CORE_CLK3		4
+#define R9A09G057_CA55_0_PERIPHCLK		5
+#define R9A09G057_CM33_CLK0			6
+#define R9A09G057_CST_0_SWCLKTCK		7
+#define R9A09G057_IOTOP_0_SHCLK			8
+
+#endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G057_CPG_H__ */
-- 
2.34.1


