Return-Path: <linux-renesas-soc+bounces-255-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 639857F9050
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Nov 2023 00:30:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D27C1C209F2
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Nov 2023 23:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9877D315A3;
	Sat, 25 Nov 2023 23:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20230601.gappssmtp.com header.i=@ragnatech-se.20230601.gappssmtp.com header.b="fxKsJ4SH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F152C12D
	for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Nov 2023 15:30:09 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5098e423ba2so4403076e87.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Nov 2023 15:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1700955008; x=1701559808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6JeHPkrCz2x21gN6swII6jOqyRkgWc8AL6bynhgEO/0=;
        b=fxKsJ4SHMfquPS1ovzsOZ4GLOmDpnpVhVDgrFzGF5SwQk1OoreACvH6nvegrmTxmus
         NjMED+NLQvcHrPPOKVSEyfvcFEML7MHoko02sN4PybbEFPQCkD5+TtRJXJM9l3mOgQOX
         0ULefNnzXWKspCLt+ZAKG8JLLlmL9dCfbJ4xREapTj95m7+DAgYoiFb2/Hyz9rW7g6du
         5uzRQ6wGBkWsZI+Z5g4jnfmyqGkxECbUieMj6eMZn3cm7wSetnHVGgGl0kzdOK2l8Mo+
         2s5yBp0Pv7yXgUIB5UVsjzAC3dF2IdudWtDJdrdyMheqSxz4B3HzyQpFuaHyQQBwYUox
         7GGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700955008; x=1701559808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6JeHPkrCz2x21gN6swII6jOqyRkgWc8AL6bynhgEO/0=;
        b=KUaf64XxMi3wU0PvWRNYRg5/KqjO7LntTcZvVHjLi01FOzPyEmXAnZdc6EO6/fx9Bi
         DX2nIm1BarQnTSW5wql3A2SR04tzWa3gKMcVfWDA7E1vSqTYWEEJp0uo2YLHj4Q/6H/Q
         sgJ02OZAgMnGG/VHhOyvljVccdGd4xLQnAdeM51cnarVIcBKf3T5thzv6+cOvInASaeb
         I+yquse2RwRchnSQnUEj8pHlTAKL7sdf8RVkNrlD4fY64NaLOn84lB6nt22oi7pUmy9t
         l6UaD/bW4zX687444lMRumeH7p/MdWh4M2iriQ7FCJKPyopry+upKyLkZ88cv/44mcgV
         BZ2g==
X-Gm-Message-State: AOJu0YwihmQSesVg6dLASZkzDW6fLfImlYEGY8eokQqJzEemmvlMRsTn
	r85VS+omLx9FGmMm/vEocJeVQw==
X-Google-Smtp-Source: AGHT+IExTPRXkZbt0mZGQ75qRJ4r3F4ukLnSemVozFVGsL/xkmje/7MI3cPiFvfPE1LvPERhVFK3Eg==
X-Received: by 2002:a19:2d1e:0:b0:507:9a00:d6c7 with SMTP id k30-20020a192d1e000000b005079a00d6c7mr3966089lfj.33.1700955007403;
        Sat, 25 Nov 2023 15:30:07 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8a96.dip0.t-ipconnect.de. [79.204.138.150])
        by smtp.googlemail.com with ESMTPSA id bn10-20020a170906c0ca00b00a0949d4f637sm2617583ejb.222.2023.11.25.15.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 15:30:06 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: renesas: Document preferred compatible naming
Date: Sun, 26 Nov 2023 00:28:21 +0100
Message-ID: <20231125232821.234631-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Compatibles can come in two formats. Either "vendor,ip-soc" or
"vendor,soc-ip". Add a DT schema file documenting Renesas preferred
policy and enforcing it for all new compatibles, except few existing
patterns.

Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since RFC
- Moved to Documentation/devicetree/bindings/soc/renesas.
- Changed the pattern in the initial select to match on .*-.*.
- Added a lot of missing compatible values.

Compared to the RFC I did not use make dt_binding_check and manual
reading of the bindings to find all compatibles. Instead I generated
YAML of all renesas related files under arch/arm and arc/arm64 and
parsed all the compatible values.

For v6.7-rc2 the hits on each pattern where,

^renesas,emev2-[a-z0-9-]+$ = 14
^renesas,r7s[0-9]+-[a-z0-9-]+$ = 58
^renesas,r8a[a-z0-9]+-[a-z0-9-]+$ = 1661
^renesas,r9a[0-9]+g[a-z0-9]+-[a-z0-9-]+$ = 160
^renesas,rcar-[a-z0-9-]+$ = 4522
^renesas,rz-[a-z0-9-]+$ = 26
^renesas,rza-[a-z0-9-]+$ = 4
^renesas,rza1-[a-z0-9-]+$ = 10
^renesas,rza2-[a-z0-9-]+$ = 6
^renesas,rzg2l-[a-z0-9-]+$ = 54
^renesas,rzn1[a-z0-9]*-[a-z0-9-]+$ = 22
^renesas,rzv2m-[a-z0-9-]+$ = 9
^renesas,sh-[a-z0-9-]+$ = 36
^renesas,sh7[a-z0-9]+-[a-z0-9-]+$ = 27
renesas,cpg-div6-clock = 45
renesas,cpg-mstp-clocks = 49
renesas,intc-irqpin = 20
renesas,smp-sram = 20
^renesas,can-[a-z0-9]+$ = 136
^renesas,dmac-[a-z0-9]+$ = 326
^renesas,du-[a-z0-9]+$ = 77
^renesas,ether-[a-z0-9]+$ = 21
^renesas,etheravb-[a-z0-9]+$ = 84
^renesas,etheravb-rcar-gen[0-9]$ = 82
^renesas,gether-[a-z0-9]+$ = 4
^renesas,gpio-[a-z0-9]+$ = 608
^renesas,hscif-[a-z0-9]+$ = 336
^renesas,i2c-[a-z0-9]+$ = 517
^renesas,iic-[a-z0-9]+$ = 118
^renesas,intc-ex-[a-z0-9]+$ = 58
^renesas,intc-irqpin-[a-z0-9]+$ = 10
^renesas,ipmmu-[a-z0-9]+$ = 828
^renesas,irqc-[a-z0-9]+$ = 22
^renesas,jpu-[a-z0-9]+$ = 6
^renesas,mmcif-[a-z0-9]+$ = 29
^renesas,msiof-[a-z0-9]+$ = 290
^renesas,pci-[a-z0-9]+$ = 38
^renesas,pci-rcar-gen[0-9]$ = 36
^renesas,pcie-[a-z0-9]+$ = 105
^renesas,pcie-rcar-gen[0-9]$ = 105
^renesas,pfc-[a-z0-9]+$ = 84
^renesas,pwm-[a-z0-9]+$ = 984
^renesas,qspi-[a-z0-9]+$ = 21
^renesas,rcar_sound-[a-z0-9]+$ = 136
^renesas,riic-[a-z0-9]+$ = 64
^renesas,rspi-[a-z0-9]+$ = 48
^renesas,sata-[a-z0-9]+(-es1)?$ = 38
^renesas,scif-[a-z0-9]+$ = 506
^renesas,scifa-[a-z0-9]+$ = 108
^renesas,scifb-[a-z0-9]+$ = 57
^renesas,sdhi-[a-z0-9]+$ = 294
^renesas,thermal-[a-z0-9]+$ = 22
^renesas,tmu-[a-z0-9]+$ = 298
^renesas,tpu-[a-z0-9]+$ = 44
^renesas,usb-phy-[a-z0-9]+$ = 18
^renesas,usb2-phy-[a-z0-9]+$ = 118
^renesas,usbhs-[a-z0-9]+$ = 86
^renesas,vin-[a-z0-9]+$ = 523
^renesas,xhci-[a-z0-9]+$ = 59
renesas,bsc-r8a73a4 = 1
renesas,bsc-sh73a0 = 1
renesas,dbsc-r8a73a4 = 2
renesas,dbsc3-r8a7740 = 1
renesas,em-gio = 5
renesas,em-sti = 1
renesas,em-uart = 5
renesas,fsi2-r8a7740 = 1
renesas,fsi2-sh73a0 = 1
renesas,hspi-r8a7778 = 3
renesas,hspi-r8a7779 = 3
renesas,imr-lx4 = 36
renesas,mtu2-r7s72100 = 3
renesas,rmobile-iic = 116
renesas,sbsc-sh73a0 = 2
renesas,sdhi-mmc-r8a77470 = 1
renesas,shmobile-flctl-sh7372 = 0
renesas,sysc-r8a73a4 = 1
renesas,sysc-r8a7740 = 1
renesas,sysc-rmobile = 3
renesas,sysc-sh73a0 = 1
renesas,usb-dmac = 144

This do not include the examples in the bindings YAML files. So there is
on hit, renesas,shmobile-flctl-sh7372, that is not used in an upstream
DTS.
---
 .../bindings/soc/renesas/renesas-soc.yaml     | 126 ++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml
new file mode 100644
index 000000000000..4674c1f61c1e
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/renesas/renesas-soc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas SoC compatibles naming convention
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+  - Niklas Söderlund <niklas.soderlund@ragnatech.se>
+
+description: |
+  Guidelines for new compatibles for SoC blocks/components.
+  When adding new compatibles in new bindings, use the format::
+    renesas,SoC-IP
+
+  For example::
+   renesas,r8a77965-csi2
+
+  When adding new compatibles to existing bindings, use the format in the
+  existing binding, even if it contradicts the above.
+
+select:
+  properties:
+    compatible:
+      pattern: "^renesas,.*-.*$"
+  required:
+    - compatible
+
+properties:
+  compatible:
+    oneOf:
+      # Preferred naming style for compatibles of SoC components:
+      - pattern: "^renesas,emev2-[a-z0-9-]+$"
+      - pattern: "^renesas,r7s[0-9]+-[a-z0-9-]+$"
+      - pattern: "^renesas,r8a[a-z0-9]+-[a-z0-9-]+$"
+      - pattern: "^renesas,r9a[0-9]+g[a-z0-9]+-[a-z0-9-]+$"
+      - pattern: "^renesas,rcar-[a-z0-9-]+$"
+      - pattern: "^renesas,rz-[a-z0-9-]+$"
+      - pattern: "^renesas,rza-[a-z0-9-]+$"
+      - pattern: "^renesas,rza1-[a-z0-9-]+$"
+      - pattern: "^renesas,rza2-[a-z0-9-]+$"
+      - pattern: "^renesas,rzg2l-[a-z0-9-]+$"
+      - pattern: "^renesas,rzn1[a-z0-9]*-[a-z0-9-]+$"
+      - pattern: "^renesas,rzv2m-[a-z0-9-]+$"
+      - pattern: "^renesas,sh-[a-z0-9-]+$"
+      - pattern: "^renesas,sh7[a-z0-9]+-[a-z0-9-]+$"
+
+      # SoC agnostic compatibles - new compatibles are OK:
+      - enum:
+          - renesas,cpg-div6-clock
+          - renesas,cpg-mstp-clocks
+          - renesas,intc-irqpin
+          - renesas,smp-sram
+
+      # Legacy namings - variations of existing patterns/compatibles are OK,
+      # but do not add completely new entries to these:
+      - pattern: "^renesas,can-[a-z0-9]+$"
+      - pattern: "^renesas,dmac-[a-z0-9]+$"
+      - pattern: "^renesas,du-[a-z0-9]+$"
+      - pattern: "^renesas,ether-[a-z0-9]+$"
+      - pattern: "^renesas,etheravb-[a-z0-9]+$"
+      - pattern: "^renesas,etheravb-rcar-gen[0-9]$"
+      - pattern: "^renesas,gether-[a-z0-9]+$"
+      - pattern: "^renesas,gpio-[a-z0-9]+$"
+      - pattern: "^renesas,hscif-[a-z0-9]+$"
+      - pattern: "^renesas,i2c-[a-z0-9]+$"
+      - pattern: "^renesas,iic-[a-z0-9]+$"
+      - pattern: "^renesas,intc-ex-[a-z0-9]+$"
+      - pattern: "^renesas,intc-irqpin-[a-z0-9]+$"
+      - pattern: "^renesas,ipmmu-[a-z0-9]+$"
+      - pattern: "^renesas,irqc-[a-z0-9]+$"
+      - pattern: "^renesas,jpu-[a-z0-9]+$"
+      - pattern: "^renesas,mmcif-[a-z0-9]+$"
+      - pattern: "^renesas,msiof-[a-z0-9]+$"
+      - pattern: "^renesas,pci-[a-z0-9]+$"
+      - pattern: "^renesas,pci-rcar-gen[0-9]$"
+      - pattern: "^renesas,pcie-[a-z0-9]+$"
+      - pattern: "^renesas,pcie-rcar-gen[0-9]$"
+      - pattern: "^renesas,pfc-[a-z0-9]+$"
+      - pattern: "^renesas,pwm-[a-z0-9]+$"
+      - pattern: "^renesas,qspi-[a-z0-9]+$"
+      - pattern: "^renesas,rcar_sound-[a-z0-9]+$"
+      - pattern: "^renesas,riic-[a-z0-9]+$"
+      - pattern: "^renesas,rspi-[a-z0-9]+$"
+      - pattern: "^renesas,sata-[a-z0-9]+(-es1)?$"
+      - pattern: "^renesas,scif-[a-z0-9]+$"
+      - pattern: "^renesas,scifa-[a-z0-9]+$"
+      - pattern: "^renesas,scifb-[a-z0-9]+$"
+      - pattern: "^renesas,sdhi-[a-z0-9]+$"
+      - pattern: "^renesas,thermal-[a-z0-9]+$"
+      - pattern: "^renesas,tmu-[a-z0-9]+$"
+      - pattern: "^renesas,tpu-[a-z0-9]+$"
+      - pattern: "^renesas,usb-phy-[a-z0-9]+$"
+      - pattern: "^renesas,usb2-phy-[a-z0-9]+$"
+      - pattern: "^renesas,usbhs-[a-z0-9]+$"
+      - pattern: "^renesas,vin-[a-z0-9]+$"
+      - pattern: "^renesas,xhci-[a-z0-9]+$"
+
+      # Legacy compatibles - list cannot grow with new bindings:
+      - enum:
+          - renesas,bsc-r8a73a4
+          - renesas,bsc-sh73a0
+          - renesas,dbsc-r8a73a4
+          - renesas,dbsc3-r8a7740
+          - renesas,em-gio
+          - renesas,em-sti
+          - renesas,em-uart
+          - renesas,fsi2-r8a7740
+          - renesas,fsi2-sh73a0
+          - renesas,hspi-r8a7778
+          - renesas,hspi-r8a7779
+          - renesas,imr-lx4
+          - renesas,mtu2-r7s72100
+          - renesas,rmobile-iic
+          - renesas,sbsc-sh73a0
+          - renesas,sdhi-mmc-r8a77470
+          - renesas,shmobile-flctl-sh7372
+          - renesas,sysc-r8a73a4
+          - renesas,sysc-r8a7740
+          - renesas,sysc-rmobile
+          - renesas,sysc-sh73a0
+          - renesas,usb-dmac
+
+additionalProperties: true
-- 
2.42.1


