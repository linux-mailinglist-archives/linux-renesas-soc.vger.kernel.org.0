Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97B9B4CB9B7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Mar 2022 09:59:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231222AbiCCJA3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Mar 2022 04:00:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbiCCJA2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Mar 2022 04:00:28 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 533151688C0;
        Thu,  3 Mar 2022 00:59:43 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.90,151,1643641200"; 
   d="scan'208";a="112200457"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Mar 2022 17:59:42 +0900
Received: from localhost.localdomain (unknown [10.226.93.124])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 37ED8423C3A5;
        Thu,  3 Mar 2022 17:59:40 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: serial: renesas,sci: Update compatible string for RZ/G2UL SoC
Date:   Thu,  3 Mar 2022 08:59:34 +0000
Message-Id: <20220303085934.29792-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303085934.29792-1-biju.das.jz@bp.renesas.com>
References: <20220303085934.29792-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Both RZ/G2UL and RZ/Five SoC's have SoC ID starting with R9A07G043.
To distinguish between them update the compatible string to
"renesas,r9a07g043u-sci" for RZ/G2UL SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/serial/renesas,sci.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,sci.yaml b/Documentation/devicetree/bindings/serial/renesas,sci.yaml
index bf7708a7a2c0..49a8285ad604 100644
--- a/Documentation/devicetree/bindings/serial/renesas,sci.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,sci.yaml
@@ -17,7 +17,7 @@ properties:
     oneOf:
       - items:
           - enum:
-              - renesas,r9a07g043-sci     # RZ/G2UL
+              - renesas,r9a07g043u-sci    # RZ/G2UL
               - renesas,r9a07g044-sci     # RZ/G2{L,LC}
               - renesas,r9a07g054-sci     # RZ/V2L
           - const: renesas,sci            # generic SCI compatible UART
-- 
2.17.1

