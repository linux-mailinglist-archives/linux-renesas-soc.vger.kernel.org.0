Return-Path: <linux-renesas-soc+bounces-5461-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 849AB8CE256
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 May 2024 10:29:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 343CE2830A0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 May 2024 08:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCDA6129A72;
	Fri, 24 May 2024 08:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bcf7eL3m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0E3129A6B;
	Fri, 24 May 2024 08:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716539356; cv=none; b=Jl8s7sWVPQG09FAZUWwGNyTatTCPQDyhQN2qoIKxO3DSCyjl0LSpauDmzw7G+cIfLxTlBtbp/gCdZk7y1HhJcaieNLiOq9cdLIpAI2SzkHUmIon0R7yAI1m+yBDBMKhVPqMIEJlMnNaDmB0gIkCJTACEz/wJxILr0sBH5dYIgQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716539356; c=relaxed/simple;
	bh=Syu87wNYqOpjqLrHs86OT8Konj4WWmjdPyrSSiezLo8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DOUkcY6F3RvjzHVXrY7l+M4ybEagbzjLpEJeqWP3btX2X7BFUEn4sYBoN02dreRJ+rw0uAbfFbIsAl9RKFJRyHFpI0JJEXNHgBKrBTasm2LgKAFSkPAaGyDrjXC/PydZArWZAi14gaJMOpojYR0aSm5r4h0wEkdO0uPENfK2qwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bcf7eL3m; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f32b1b5429so17279835ad.2;
        Fri, 24 May 2024 01:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716539354; x=1717144154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYtd+WaaaxSNWNbp7C0zKrikX/14iQi067rnRw0S8DU=;
        b=Bcf7eL3myQJkYqtkfmu+4/Ld7DtkjBYxET1nXmjp5N0aiiGSOk+L7fnW9IOt3ZThMN
         Bkh6Cg3j3X99ebcQpXgZ2wO4xVmzz7TDNsmUwiCN2YwbVeBrUcKr9blXrJv/HdUC4/Zw
         z0PK/mcKMEK6k31Eqo1NMSF+HGVQXI4GiW0cURczZE1zdMy1TT7WvCTvCx5XEwFMMyi6
         rYjqZd5m6IR+4Xeb0ujLdyODxuXLOua/OmiJoT5L6AHmx8v0sypmmhOsu1LmZjK4U0wT
         Pu6sPmPwBtiGFshWrW2ABMGbBnzTmvCfYPtDHbhOxDZfGIz0i88SkTGccy5r1bfsRbkN
         mU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716539354; x=1717144154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYtd+WaaaxSNWNbp7C0zKrikX/14iQi067rnRw0S8DU=;
        b=sIy/38oXpuF+vDKIzb0Pbmp2mXeseL1Nbb/Skt9bmMO8cGnyRrncekMZ7Mpx6cFvqd
         KnSZD1o4pYE8UK38BAeXkIpJJ1pXWcID/+7TXEooR+N7E5fhjuDo/eEl/ST1ce5pGOq8
         sw15/48jmuZEyekGYKA9AGMAjMC4JWjNEqdt0brvTFuzMn7GNgFoSRwKDsfWZiFKEE7B
         RJj8yqOJbefJIXYujMPd8iWAXuuXf6b1VpqhMzPcYAE8n8cz3stduVt82YB6+FCqeO+C
         vtpTsX20QukDZpW7OtdzoOThwvoO0asKt4nWezZdU+p62vTNvXe/kASwvGlAQWmq9iOO
         WaXg==
X-Forwarded-Encrypted: i=1; AJvYcCXK3ro74SCg6liB6DdqI4dEzaCmFEyr4Lh2RdUHegYiDYs52mN28+aFxERYnf/cVnFVGJroJPjcOCAhWbFf3ZBKOFG3TTZ13NxltMU8xVB/V+OJleus+/6rmsgVJY3yhizo63kJgknp5trhw2M5Q8ZmvmA3OmDlqBoeyW87BvvEIiwHmw==
X-Gm-Message-State: AOJu0Yx9eigGipCkUCv3Vh6amjAKN6LpDeov3D+zZj7mn8Rldez6i+oo
	sQ8tCUYBqZoBdaJQpXnaZUf1F8vThGOmhHSBu9q/algklHubPf/T
X-Google-Smtp-Source: AGHT+IF+8CyXTiXdRmeOk5XTpQsrV0UpJpnqzH892lPxiVxY49FVhQ2viReqo2MlDn+hAHGhIJiGmw==
X-Received: by 2002:a17:902:e5d1:b0:1e2:81c1:b35e with SMTP id d9443c01a7336-1f4497dfedbmr19475755ad.54.1716539354510;
        Fri, 24 May 2024 01:29:14 -0700 (PDT)
Received: from prasmi.. ([2401:4900:1c07:bfcd:61e0:7fa9:84b8:25fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c9c6ea3sm8420325ad.277.2024.05.24.01.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 01:29:14 -0700 (PDT)
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
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/4] dt-bindings: clock: renesas: Document RZ/V2H(P) SoC CPG driver
Date: Fri, 24 May 2024 09:27:57 +0100
Message-Id: <20240524082800.333991-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524082800.333991-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240524082800.333991-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the device tree bindings of the Renesas RZ/V2H(P) SoC
Clock Pulse Generator (CPG).

CPG block handles the below operations:
- Handles the generation and control of clock signals for the IP modules
- The generation and control of resets
- Control over booting
- Low power consumption and the power supply domains

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/clock/renesas,rzv2h-cpg.yaml     | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
new file mode 100644
index 000000000000..baa0f2a5b6f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
@@ -0,0 +1,78 @@
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
+  On Renesas RZ/V2H(P) SoC's, the CPG (Clock Pulse Generator) handles the generation
+  and control of clock signals for the IP modules, the generation and control of resets,
+  and control over booting, low power consumption and the power supply domains.
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
+      Clock source to CPG can be either from external clock input (EXCLK) or
+      crystal oscillator (XIN/XOUT).
+    const: extal
+
+  '#clock-cells':
+    description: |
+      - For CPG core clocks, the two clock specifier cells must be "CPG_CORE"
+        and a core clock reference, as defined in
+        <dt-bindings/clock/r9a09g057-cpg.h>,
+      - For module clocks, the two clock specifier cells must be "CPG_MOD" and
+        a module number, as defined in <dt-bindings/clock/r9a09g057-cpg.h>.
+    const: 2
+
+  '#power-domain-cells':
+    description:
+      SoC devices that are part of the CPG/Module Standby Mode Clock Domain and
+      can be power-managed through Module Standby should refer to the CPG device
+      node in their "power-domains" property, as documented by the generic PM
+      Domain bindings in Documentation/devicetree/bindings/power/power-domain.yaml.
+      The power domain specifiers defined in <dt-bindings/clock/r9a09g057-cpg.h> could
+      be used to reference individual CPG power domains.
+
+  '#reset-cells':
+    description:
+      The single reset specifier cell must be the module number, as defined in
+      <dt-bindings/clock/r9a09g057-cpg.h>.
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
+            clock-names = "extal";
+            #clock-cells = <2>;
+            #power-domain-cells = <0>;
+            #reset-cells = <1>;
+    };
-- 
2.34.1


