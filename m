Return-Path: <linux-renesas-soc+bounces-7346-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A9093152D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 14:58:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71CCC1F2218C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 12:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D9518D4D9;
	Mon, 15 Jul 2024 12:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z629bhwo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB0318C337;
	Mon, 15 Jul 2024 12:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721048163; cv=none; b=T8IsQbpRc6dpXDGclzKUQJyJc8jqn0ydQzvyylczZxrqOLkZyj+KjN02CQWZ/dx+aHEuKP1sQ89KJfZjmmxJhn4QDih2mlVHXOhNjfe1YcePt75ytLmpxTNGeDzs0xhY6DtjBmWIO59cLaTaJuroE11z+9b1u/biJJY/pVGF/IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721048163; c=relaxed/simple;
	bh=N0I9iOLKl2w3bQiztATzWKrDhssdkQAJvsDWVW0N8YI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n2D0F6LI7EmgjU9s9wRyr0JbNraB8j6wcbeZ+GcyLueTGazoS5HF0RXJcHuaDmhitvj0BWBGgH6HZULzW0sVNB7jX01zRx3V5wKauuNVKiX1avfUc6rvzpfCCa5SitvBXETVhu3px6B33XJqQKcDcAeziqptE5G0fsy/1KcQ9ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z629bhwo; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4266ed6c691so26762455e9.3;
        Mon, 15 Jul 2024 05:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721048160; x=1721652960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9STbwg9BLFPciB1o6ciA6y/YOSCEPGY0f2wBZwQ7D4=;
        b=Z629bhwo4xbcB5GXZ4YSGHP7m3xs4GiVquNHK4BMyUonxprLCcLPrgRNgAQRMo4Yhz
         fvMDOLcMVkSgLhcguZK27TqVPJfGmioZ50aUAOOpFDTThqd9Nd4gncrp++ipzlIZoeqZ
         W1heec780lP9vsUnLgfBJgiUEzgbPkuBiwWeOAb4e/wGQyrrseli9DGnm4TqUlyesH+0
         OpgWerImx0jcFkF2vY9OStQBTfFLhT+vN9sl9l9bAZJbipkkQcdocY5p0YsNNYM9OXCL
         heeuq8FzNBsGrxhMqFdw7vDl93Q4tcNmKf8j7PRXHy4UZ5VMtLnT670ePB/JKZ4a5ns+
         wZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721048160; x=1721652960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q9STbwg9BLFPciB1o6ciA6y/YOSCEPGY0f2wBZwQ7D4=;
        b=avK55FN/ju+VpVHvPoqdiA0m6CvG4jX8ykzeHNpIcqn3SLztBw55JFxmN0MLuf6KeN
         jfzMfuVPT76Eo28zL785fMVu44M5mgaeAvPCulw010LNydSWdm4Tb+SHwCWeQ1P2KcDR
         lxUDUnqbsc02djfa1DIiB2j9MUkLU7tGpg9vDSxKMo6lwNwO9q4cHnyP6GTB2tUTXpHC
         GQXRjMclvWVU/SEOqZWlJdnE5aPHxySSGYQN7hDz1frzmlsn8ZVtSmjeHtdlPCPOTAJC
         RoPvFr5EO9xwiAjqKypGDIOPseOF2RU0/8lg96s3wH2O0CRcU5HwVe9FUERMe8jvjKGu
         zpWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnbIXUI9hyYR6waqew+FJZVpuVlKZF2TRmhgqpp+C9/l1mbLBOhGnuwV4BBfTpN6/ez0qZr17MzyOZYleJVzNKN9SiefXMtPbjK3zSIG0s8mvRYAC3/la5J/9rnzDsTjSnoqYdhs3SK3IdgnnURZgKT96qQTjpSZyddIGV5vSIOg2EewnpUI6aV00=
X-Gm-Message-State: AOJu0YzENwEXmMR3SBysqZ/q7kn4oMEuuoLb61lFd50dY2EmNCi/krHO
	vELknfDYe9ylM3LlNkwTWRNcjW9E0WhL+jlw/AeH0M0/CR5cpjv5
X-Google-Smtp-Source: AGHT+IEmA/MGMGCBB/Vx7w+SrLHSyjbk6jctmSTNvFMTf5IHWZWqZAuOGl626UjEANbBGrTaaaQyrw==
X-Received: by 2002:a05:600c:54c3:b0:426:5440:854a with SMTP id 5b1f17b1804b1-426707cca09mr128903975e9.1.1721048159305;
        Mon, 15 Jul 2024 05:55:59 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e81f0dsm86091355e9.12.2024.07.15.05.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 05:55:58 -0700 (PDT)
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
Cc: devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/3] dt-bindings: clock: renesas: Document RZ/V2H(P) SoC CPG
Date: Mon, 15 Jul 2024 13:54:36 +0100
Message-Id: <20240715125438.553688-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240715125438.553688-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240715125438.553688-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
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


