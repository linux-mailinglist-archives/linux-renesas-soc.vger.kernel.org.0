Return-Path: <linux-renesas-soc+bounces-6840-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D124D91AC58
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 18:14:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDD611C23E31
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 16:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F240A1993B3;
	Thu, 27 Jun 2024 16:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ktkmUcDn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FA0199384;
	Thu, 27 Jun 2024 16:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719504851; cv=none; b=CGBs1+dRZjyCiaIQA49mMXvbkeYkS4PK0mdbB9ThgucUZg6Xy/WZBv1L+/ptIkgBPgawENLSPTFCRgLNW787xZfV53u+rAleK2x4LKLAZ0yQk7buT3fCK7No9CNZ5NwNEaiGUNbU7J3aOzMksN7OjRPegO/FnVFuFojLoiA3w3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719504851; c=relaxed/simple;
	bh=uHYfA0VsmKtgVxhtleGgOQnfTZlvQIDE0KLvAcgdeL0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E1KTnrmuBppryjG38F0OHKgFTqZAh6fbAjfMqKZgw3fn4InGGCcaCFR4Aij7/fTXDU923++K6Gc/8pxYCmkjgmUdtRySAJ8F17gl26KQpBXbrEtw0loxT7tvYIgsxCG1ufU+1MDbihJPjrJB49V4pBXz3ZlUEnMNVOrNNsepsiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ktkmUcDn; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ec5fad1984so70467181fa.0;
        Thu, 27 Jun 2024 09:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719504848; x=1720109648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFUyKc2jnvtsvH+YO9xtQTlSpfOXet6znjU39rch4oc=;
        b=ktkmUcDnFkHt0p30jNm/B1ASFDO1xG8TQrgvqdQDQjQnVwiki39LLEqLhuFzLvdERz
         Hzei4pRXUpjuZJ/vQG/Fn8l3KIalGUsS22JYvmxynr0bnPkXK/DYgwATjdgJTrBrajvF
         YQbcyRhNsuquhBRNUUxotzTztSPWm2ZKFaxEUHGQKBen5HmXdqyfXBj1a5w4kOEgI61T
         mgow0hefeN+6FURvmePDxVuMr2KCWFFvjLGzbTlEPAg6jCFVlFZpzlkGW6NvYCC27RGR
         iTAuL45iAl8WXHIE5IcPDpbGAeeaVcs0P72KWyoz9CfBeJKMw20ncSKsnsd52xKNgP3g
         uKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719504848; x=1720109648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JFUyKc2jnvtsvH+YO9xtQTlSpfOXet6znjU39rch4oc=;
        b=cZZTKR8BSbvFK1zC2naMZgTTflUtl175970LihnhnCc1hHax96YsJiMQXudYD5c7FS
         TjNNufXuLCzYhJMNJxEY0ksOurryz20rRo+2fPm7LbqLnKBOG9ExFNzMXOg4So53zunv
         N8998PBnoyUg4j6nOHHaGTinZwh1UCFeSTHVM88PWuA6QiKrFc2xYAitM4m/+1YCZhBH
         Derr1hDadUndn9oSOIqsFZAld3ce2/eN36pzP/tFXSgPIJQuberwStVUMriCr3vTy8E3
         ZhrMMA2SF5PcoGnK42hFr2VnpvW8vEQwE56P6xLX+lpZBi/7CA8g3uXi8RbQzDUXtdTJ
         riAA==
X-Forwarded-Encrypted: i=1; AJvYcCX8ETaUwX3kzza1FizfaWR3hZZ4dcv1EXvtGmRSPprCqd1VVjVHh8HGQXkjSuTQmuZYdLN6LA/PeLJrqycF9qA0yCEZ5wSsxFbmChvd0D7Uh9F5udQJF4pmNFX3QhPbeuXabZLdq2XpRpKqLK00u3ypobnOpbubK4y9qs/aq34gWULMsFDtpaKEyhE=
X-Gm-Message-State: AOJu0YziGw45Mt9AXtnDTHUM2Hp766Im4Yva38UoZ24hRezKMFxy9wz2
	BCruQJVXXLf1LKrFeMFrrImF8kSEiEWxRBKEkjTS3z5mXHth5iwu
X-Google-Smtp-Source: AGHT+IEWBiRKQXLD1furQnUzd/8DquiUPZvt9G7ZPBH4TxbTqSLcYKhCOUN2U+bPkEfHWAEPnlfZWw==
X-Received: by 2002:a2e:7a0a:0:b0:2ec:63f:fe91 with SMTP id 38308e7fff4ca-2ec5b357921mr101577831fa.38.1719504847747;
        Thu, 27 Jun 2024 09:14:07 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:9638:4c3:829:6df3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8424677sm72372435e9.35.2024.06.27.09.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 09:14:07 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 1/3] dt-bindings: clock: renesas: Document RZ/V2H(P) SoC CPG
Date: Thu, 27 Jun 2024 17:13:13 +0100
Message-Id: <20240627161315.98143-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627161315.98143-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240627161315.98143-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
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
index 000000000000..dbc2705b3529
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
+        calculation is (1 * 16 + 3) = 19.
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
+      for SYS_0_PRESETN, the calculation is (3 * 16 + 0) = 48.
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
index 000000000000..04653d90d78d
--- /dev/null
+++ b/include/dt-bindings/clock/renesas,r9a09g057-cpg.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_CLOCK_R9A09G057_CPG_H__
+#define __DT_BINDINGS_CLOCK_R9A09G057_CPG_H__
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
+#endif /* __DT_BINDINGS_CLOCK_R9A09G057_CPG_H__ */
-- 
2.34.1


