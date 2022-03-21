Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1AAA4E2C8C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Mar 2022 16:43:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350445AbiCUPop (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Mar 2022 11:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350493AbiCUPon (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Mar 2022 11:44:43 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E644A1277C;
        Mon, 21 Mar 2022 08:43:11 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,198,1643641200"; 
   d="scan'208";a="115215888"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 Mar 2022 00:43:10 +0900
Received: from vb.home (unknown [10.226.92.216])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id AD0334007539;
        Tue, 22 Mar 2022 00:43:08 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH 01/14] dt-bindings: arm: renesas: Document Renesas RZ/V2M SoC and EVK board
Date:   Mon, 21 Mar 2022 15:42:19 +0000
Message-Id: <20220321154232.56315-2-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220321154232.56315-1-phil.edworthy@renesas.com>
References: <20220321154232.56315-1-phil.edworthy@renesas.com>
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

Details of the SoC can be found here:
https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-cortex-a-mpus/rzv2m-dual-cortex-a53-lpddr4x32bit-ai-accelerator-isp-4k-video-codec-4k-camera-input-fhd-display-output

The RZ/V2M Evaluation Kit (V2MEVK) consists of the RZ/V2M Main Board,
RZ/V2M Base Board, and CIS IMX415 Board (CIS).

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 Documentation/devicetree/bindings/arm/renesas.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
index fa435d6fda77..9a9f16a58359 100644
--- a/Documentation/devicetree/bindings/arm/renesas.yaml
+++ b/Documentation/devicetree/bindings/arm/renesas.yaml
@@ -430,6 +430,12 @@ properties:
               - renesas,r9a07g054l2 # Dual Cortex-A55 RZ/V2L
           - const: renesas,r9a07g054
 
+      - description: RZ/V2M (R9A09G011)
+        items:
+          - enum:
+              - renesas,rzv2mevk2   # RZ/V2M Eval Board v2.0
+          - const: renesas,r9a09g011
+
 additionalProperties: true
 
 ...
-- 
2.32.0

