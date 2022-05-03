Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A578C5183B7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 May 2022 14:01:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234493AbiECMEd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 May 2022 08:04:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235042AbiECMEd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 May 2022 08:04:33 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 381C530F5A;
        Tue,  3 May 2022 05:01:00 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,195,1647270000"; 
   d="scan'208";a="118643083"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 May 2022 21:00:59 +0900
Received: from localhost.localdomain (unknown [10.226.92.6])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2F21142268E6;
        Tue,  3 May 2022 21:00:55 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 01/12] dt-bindings: serial: renesas,em-uart: Add RZ/V2M clock to access the registers
Date:   Tue,  3 May 2022 12:55:46 +0100
Message-Id: <20220503115557.53370-2-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220503115557.53370-1-phil.edworthy@renesas.com>
References: <20220503115557.53370-1-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The RZ/V2M SoC has an additional clock to access the registers. The HW
manual says this clock should not be touched as it is used by the
"ISP Firmware".

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
v3:
 - New patch added
---
 .../bindings/serial/renesas,em-uart.yaml      | 32 +++++++++++++++----
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml b/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml
index 332c385618e1..8d0e779d7d77 100644
--- a/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml
@@ -9,9 +9,6 @@ title: Renesas EMMA Mobile UART Interface
 maintainers:
   - Magnus Damm <magnus.damm@gmail.com>
 
-allOf:
-  - $ref: serial.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -29,11 +26,32 @@ properties:
   interrupts:
     maxItems: 1
 
-  clocks:
-    maxItems: 1
+allOf:
+  - $ref: serial.yaml#
 
-  clock-names:
-    const: sclk
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g011-uart
+    then:
+      properties:
+        clocks:
+          items:
+            - description: UART functional clock
+            - description: Optional internal clock to access the registers
+        clock-names:
+          items:
+            - const: sclk
+            - const: pclk
+    else:
+      properties:
+        clocks:
+          items:
+            - description: UART functional clock
+        clock-names:
+          items:
+            - const: sclk
 
 required:
   - compatible
-- 
2.32.0

