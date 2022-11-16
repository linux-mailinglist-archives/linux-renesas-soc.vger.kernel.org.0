Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5248D62B7BE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Nov 2022 11:22:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233161AbiKPKWM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Nov 2022 05:22:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233134AbiKPKVv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Nov 2022 05:21:51 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CC96721262;
        Wed, 16 Nov 2022 02:21:49 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,167,1665414000"; 
   d="scan'208";a="140240152"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 16 Nov 2022 19:21:49 +0900
Received: from localhost.localdomain (unknown [10.226.92.242])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 249A1400B9CF;
        Wed, 16 Nov 2022 19:21:45 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/3] dt-bindings: arm: renesas: Document Renesas RZ/V2M System Configuration
Date:   Wed, 16 Nov 2022 10:21:38 +0000
Message-Id: <20221116102140.852889-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221116102140.852889-1-biju.das.jz@bp.renesas.com>
References: <20221116102140.852889-1-biju.das.jz@bp.renesas.com>
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
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v3->v4:
 * Added Rb tags from Krzysztof and Geert
 * Fixed the example indentation from 3 spaces-> 2 spaces.
v2->v3:
 * Renamed the file based on the compatible
 * Dropped quotes from id and schema
 * Updated description
 * Renamed device node from system-configuration->system-controller
 * Renamed label name from sysc->sys
 * Fixed the indentation in example
v1->v2:
 * Moved the file from arm->soc/renesas
 * Updated the path for binding file
 * Updated the example
---
 .../soc/renesas/renesas,r9a09g011-sys.yaml    | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g011-sys.yaml

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g011-sys.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g011-sys.yaml
new file mode 100644
index 000000000000..1cac3cb5226c
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g011-sys.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/renesas/renesas,r9a09g011-sys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/V2M System Configuration (SYS)
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+description:
+  The RZ/V2M-alike SYS (System Configuration) controls the overall
+  configuration of the LSI and supports the following functions,
+  - Bank address settings for DMAC
+  - Bank address settings of the units for ICB
+  - ETHER AxCACHE[1] (C bit) control function
+  - RAMA initialization control
+  - MD[7:0] pin monitoring
+  - LSI version
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
+    sys: system-controller@a3f03000 {
+      compatible = "renesas,r9a09g011-sys";
+      reg = <0xa3f03000 0x400>;
+    };
-- 
2.25.1

