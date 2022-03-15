Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B95DF4D9EC2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Mar 2022 16:33:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237750AbiCOPeR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Mar 2022 11:34:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236492AbiCOPeQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Mar 2022 11:34:16 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6DED71D0E1;
        Tue, 15 Mar 2022 08:33:03 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,184,1643641200"; 
   d="scan'208";a="113586775"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 16 Mar 2022 00:33:02 +0900
Received: from localhost.localdomain (unknown [10.226.92.209])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7AC8C400C308;
        Wed, 16 Mar 2022 00:33:00 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] dt-bindings: mmc: renesas,sdhi: Document RZ/G2UL SoC
Date:   Tue, 15 Mar 2022 15:32:58 +0000
Message-Id: <20220315153258.21097-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document RZ/G2UL SDHI bindings. RZ/G2UL SDHI is almost identical to one
found on the R-Car Gen3. No driver changes are required as generic
compatible string "renesas,rcar-gen3-sdhi" will be used as a fallback.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index 3b191fb89cf1..9ac4986988c5 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -57,6 +57,7 @@ properties:
               - renesas,sdhi-r8a77990  # R-Car E3
               - renesas,sdhi-r8a77995  # R-Car D3
               - renesas,sdhi-r8a779a0  # R-Car V3U
+              - renesas,sdhi-r9a07g043 # RZ/G2UL
               - renesas,sdhi-r9a07g044 # RZ/G2{L,LC}
               - renesas,sdhi-r9a07g054 # RZ/V2L
           - const: renesas,rcar-gen3-sdhi # R-Car Gen3 or RZ/G2
@@ -109,6 +110,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - renesas,sdhi-r9a07g043
               - renesas,sdhi-r9a07g044
               - renesas,sdhi-r9a07g054
     then:
-- 
2.17.1

