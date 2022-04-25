Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF2C550E28D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 16:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233559AbiDYOF3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 10:05:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbiDYOF2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 10:05:28 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9E4628BF21;
        Mon, 25 Apr 2022 07:02:22 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,288,1643641200"; 
   d="scan'208";a="119094832"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 25 Apr 2022 23:02:21 +0900
Received: from localhost.localdomain (unknown [10.226.93.95])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E94684006DF7;
        Mon, 25 Apr 2022 23:02:17 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] dt-bindings: usb: renesas,usbhs: Document RZ/G2UL bindings
Date:   Mon, 25 Apr 2022 15:02:15 +0100
Message-Id: <20220425140215.186797-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document RZ/G2ULSoC bindings. USBHS block is identical to one
found on RZ/A2 SoC. No driver changes are required as generic compatible
string "renesas,rza2-usbhs" will be used as a fallback.

While at it, make the resets property required on RZ/{G2L,G2UL,V2L} SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
 * Updated Interrupts description for RZ/G2UL
 * make the resets property required on RZ/{G2L,G2UL,V2L} SoC.
 * Added Ack from Krzysztof Kozlowski
 * Added Rb tag from Geert
---
 Documentation/devicetree/bindings/usb/renesas,usbhs.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
index 0bb841b28003..bad55dfb2fa0 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
@@ -19,6 +19,7 @@ properties:
       - items:
           - enum:
               - renesas,usbhs-r7s9210   # RZ/A2
+              - renesas,usbhs-r9a07g043 # RZ/G2UL
               - renesas,usbhs-r9a07g044 # RZ/G2{L,LC}
               - renesas,usbhs-r9a07g054 # RZ/V2L
           - const: renesas,rza2-usbhs
@@ -118,6 +119,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - renesas,usbhs-r9a07g043
               - renesas,usbhs-r9a07g044
               - renesas,usbhs-r9a07g054
     then:
@@ -128,6 +130,8 @@ allOf:
             - description: U2P_INT_DMA[0]
             - description: U2P_INT_DMA[1]
             - description: U2P_INT_DMAERR
+      required:
+        - resets
     else:
       properties:
         interrupts:
-- 
2.25.1

