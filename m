Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFAED50CAA4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 Apr 2022 15:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235452AbiDWNfC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 23 Apr 2022 09:35:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235780AbiDWNe7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 23 Apr 2022 09:34:59 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3457E1229E3;
        Sat, 23 Apr 2022 06:32:02 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,284,1643641200"; 
   d="scan'208";a="117760689"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 23 Apr 2022 22:32:01 +0900
Received: from localhost.localdomain (unknown [10.226.92.16])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B911B40062AB;
        Sat, 23 Apr 2022 22:31:57 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: renesas,rz-ssi: Document RZ/G2UL SoC
Date:   Sat, 23 Apr 2022 14:31:54 +0100
Message-Id: <20220423133154.141027-1-biju.das.jz@bp.renesas.com>
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

Document RZ/G2U2L SSI bindings. RZ/G2UL SSI is identical to one found
on the RZ/G2L SoC. No driver changes are required as generic compatible
string "renesas,rz-ssi" will be used as a fallback.

While at it add a '.' at the end of dmas description for the first cell.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
index 7e8d252f7bca..0d9840375132 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     items:
       - enum:
+          - renesas,r9a07g043-ssi  # RZ/G2UL
           - renesas,r9a07g044-ssi  # RZ/G2{L,LC}
           - renesas,r9a07g054-ssi  # RZ/V2L
       - const: renesas,rz-ssi
@@ -50,7 +51,7 @@ properties:
     minItems: 1
     maxItems: 2
     description:
-      The first cell represents a phandle to dmac
+      The first cell represents a phandle to dmac.
       The second cell specifies the encoded MID/RID values of the SSI port
       connected to the DMA client and the slave channel configuration
       parameters.
-- 
2.25.1

