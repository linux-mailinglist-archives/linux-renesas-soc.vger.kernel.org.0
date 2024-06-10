Return-Path: <linux-renesas-soc+bounces-6028-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A6F902C73
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 01:32:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C50071F222D8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 23:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99EF15253B;
	Mon, 10 Jun 2024 23:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxDlwoZZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074AA22F08;
	Mon, 10 Jun 2024 23:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718062354; cv=none; b=ZKVO/UEBTJZjeh0cSyU5KOusdEIZmKuyk16nRqSHv7O2PiUV1QYzKsxZErvNVuysTq8dwG0Ro7L0ZGlrbrvByUwZ0/EyqX6ZWxC6DNVOw0uW8m0AF/zRpuYdb85k+USnq71knZbNKXVJztWKik+CaEY8YpeMKiCBGZFSAYSZzRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718062354; c=relaxed/simple;
	bh=T99HRziOstneITEz9AdXy1xgAKadvrIEwMbQkHExZq0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eSqHt2LhN9FB/5ww9laKwG7jiSNfJEThcHAQkVeZirDv+u+AYmPcoU+GBNM3b9+BRBEmhZ7z5cql340tuA+ii1gAeX0+7lmZkHYJyCE207dmV1758Ko63i1avzBPf7o6RY35n8qssqYr6jbQo47oD4JoOYvLS4wmV5aGdLZoxvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxDlwoZZ; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-35f1bc63981so1459179f8f.1;
        Mon, 10 Jun 2024 16:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718062351; x=1718667151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0AsGaDymAWxw07GYAhMzSMmOVAS1PJYqai0hF1S59o=;
        b=fxDlwoZZ03B6zHrZk85cZ+/loENydsUjayEfOC9FGK7ZfJYiPx5GtlkWZ1zuA3eCQk
         5EOHzhuFJsZE/GqK3WBOP+zypNZHd1LtZh1wVoXxDRWTYJy3mhbc2GDp9kDl0Ux7+pIX
         wg/yCPmlIS368ykOVwpqAWKOAni/CUwupyXurEL4foccj9WDl9E6sN9jA/uPFZCWO794
         qqXlV6UZkeMef9rihjO1zsa/nox0Y0zKFEcMWtF0j3PsqyuHg3Gnpg5gFwJr4FdtiUOm
         /EmBviHgxfMKaDXEBMVRJ4/vxquZ+ZP55fMcZl8lYUF/6IjOJtItnbtf6fomfVZvQzAR
         7Mhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718062351; x=1718667151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O0AsGaDymAWxw07GYAhMzSMmOVAS1PJYqai0hF1S59o=;
        b=TccbmH16nx5KKGFhIvsuIlFSyOVg/LUDmmz/OISz/gK8/GrPy97jJpgW6oxUNJOpG4
         vQnnVhQJe43+brk8/F81Vqbj/U3mzJwwlhgImw6Ri9ii0wWSHsfXE4KvIxza2WIts/xV
         iBRFvDQnX2TzXCpmpmm5hi9Oe9mfmMmAxGvr6ivNFBbgi5bWWt1xZRoaulpD3jZC4Ic5
         P+8URB6r0Pj1n3wjsiCVrqR3cl9HnUiyc3r+pfawqAA1wiI1yeccdXIy4LXv7H7GlKEN
         uxH2zTo6a3PYKJhp3KtV068jSrF86oUYIVughGbmd1EiphvzO+UHIavFtbpwZy/SkiiK
         vnpg==
X-Forwarded-Encrypted: i=1; AJvYcCUgUrFIJMN2CHBl1KRuSUoKWMtB30E8kr8fDUDFceaQAqDdDuIM/vpJ2I2dyiloq6Byexva5JxufWSUg0hK7iu9mizXa1h48psfeCS1/R+pHjyGDvzlQx9bvvtGbJ4Br1ib3HXMLNO0OAYoGUUPgXkh9tw9npAhuuDtUhPSW3mJ5o09SA==
X-Gm-Message-State: AOJu0YzSvE+SPTICT9fGvuoJ+rXM+v82DtPHbhnf/YZT4bqV+cA9yp+X
	XLxQJDxIqwAXo5hQ6LwT6G//NF2lX2d5KrllW7DG06gMlELzafLL
X-Google-Smtp-Source: AGHT+IG8nVPWNI4rOuZD13LflPQP3bLlPYgZUT9nOV+/tgaIigqn4gQd3NylAujHkfMUxWeNA7noDQ==
X-Received: by 2002:a5d:5650:0:b0:35f:2af4:cccd with SMTP id ffacd0b85a97d-35f2b28f8eemr978708f8f.17.1718062351048;
        Mon, 10 Jun 2024 16:32:31 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:74ea:e666:238d:5e76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f1efe9a74sm5447698f8f.104.2024.06.10.16.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 16:32:30 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH v2 1/4] dt-bindings: clock: renesas: Document RZ/V2H(P) SoC CPG
Date: Tue, 11 Jun 2024 00:32:18 +0100
Message-Id: <20240610233221.242749-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610233221.242749-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240610233221.242749-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Hi Geert,

WRT XIN_{RTCCLK/AUDCLK/MAINCLK)clks going to CPG I have created an
internal request for clarification if the clocks are inputs to CPG
or to respective clocks. As the board schematic doesnt have any of
these. For now I have just kept qextal clk as input to CPG.

Cheers, Prabhakar

v1->v2
- Updated commit message
- Updated description for binding as suggested by Geert
- Updated descriptions for clocks and resets property
- Renamed extal->qextal
- Updated '#power-domain-cells' value
---
 .../bindings/clock/renesas,rzv2h-cpg.yaml     | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
new file mode 100644
index 000000000000..03085308154c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
@@ -0,0 +1,81 @@
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
+description: |
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
+    maxItems: 1
+
+  clock-names:
+    description:
+      Clock source to CPG on QEXTAL pin.
+    const: qextal
+
+  '#clock-cells':
+    description: |
+      - For CPG core clocks, the two clock specifier cells must be "CPG_CORE"
+        and a core clock reference, as defined in
+        <dt-bindings/clock/r9a09g057-cpg.h>,
+      - For module clocks, the two clock specifier cells must be "CPG_MOD" and
+        a module number.  The module number is calculated as the CLKON register
+        offset index multiplied by 16, plus the actual bit in the register
+        used to turn the CLK ON. For example, for CGC_GIC_0_GICCLK, the
+        calculation is (1 * 16 + 3) = 19.
+    const: 2
+
+  '#power-domain-cells':
+    description:
+      SoC devices that are part of the CPG/Module Standby Mode Clock Domain and
+      can be power-managed through Module Standby should refer to the CPG device
+      node in their "power-domains" property, as documented by the generic PM
+      Domain bindings in Documentation/devicetree/bindings/power/power-domain.yaml.
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
+    cpg: clock-controller@10420000 {
+            compatible = "renesas,r9a09g057-cpg";
+            reg = <0x10420000 0x10000>;
+            clocks = <&extal_clk>;
+            clock-names = "qextal";
+            #clock-cells = <2>;
+            #power-domain-cells = <0>;
+            #reset-cells = <1>;
+    };
-- 
2.34.1


