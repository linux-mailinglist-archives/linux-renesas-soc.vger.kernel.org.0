Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0E586246C6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Nov 2022 17:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231221AbiKJQVi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Nov 2022 11:21:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbiKJQVg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 11:21:36 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 68BCC13F64;
        Thu, 10 Nov 2022 08:21:35 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,154,1665414000"; 
   d="scan'208";a="142191635"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Nov 2022 01:21:35 +0900
Received: from localhost.localdomain (unknown [10.226.92.14])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2BC4A400C447;
        Fri, 11 Nov 2022 01:21:31 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: renesas: Document Renesas RZ/V2M System Configuration
Date:   Thu, 10 Nov 2022 16:21:24 +0000
Message-Id: <20221110162126.103437-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110162126.103437-1-biju.das.jz@bp.renesas.com>
References: <20221110162126.103437-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Phil Edworthy <phil.edworthy@renesas.com>

Add DT binding documentation for System Configuration (SYS) found on
RZ/V2M SoC's.

SYS block contains the SYS_VERSION register which can be used to retrieve
SoC version information.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
[biju: Updated the example ]
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Moved the file from arm->soc/renesas
 * Updated the path for binding file
 * Updated the example
---
 .../soc/renesas/renesas,rzv2m-sys.yaml        | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,rzv2m-sys.yaml

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas,rzv2m-sys.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas,rzv2m-sys.yaml
new file mode 100644
index 000000000000..cc41747798e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas,rzv2m-sys.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/renesas/renesas,rzv2m-sys.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Renesas RZ/V2M System Configuration (SYS)
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+description:
+  The RZ/V2M System Configuration (SYS) performs system control of the LSI
+  and supports the following functions,
+  - LSI version
+  - 34-bit address space access function
+  - PCIe related settings
+  - WDT stop control
+  - Temperature sensor (TSU) monitor
+
+properties:
+  compatible:
+    const: renesas,r9a09g011-sys
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    sysc: system-configuration@a3f03000 {
+            compatible = "renesas,r9a09g011-sys";
+            reg = <0xa3f03000 0x400>;
+    };
-- 
2.25.1

