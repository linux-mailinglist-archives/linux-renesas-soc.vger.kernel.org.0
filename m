Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D6E84AC1D5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Feb 2022 15:49:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1441891AbiBGOqY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Feb 2022 09:46:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1391786AbiBGOWY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Feb 2022 09:22:24 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 90778C0401C7;
        Mon,  7 Feb 2022 06:22:21 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.88,349,1635174000"; 
   d="scan'208";a="109792071"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 07 Feb 2022 23:22:21 +0900
Received: from localhost.localdomain (unknown [10.226.92.17])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E31D643487D2;
        Mon,  7 Feb 2022 23:22:18 +0900 (JST)
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
Subject: [PATCH v2 2/3] dt-bindings: serial: renesas,scif: Document RZ/G2UL SoC
Date:   Mon,  7 Feb 2022 14:22:12 +0000
Message-Id: <20220207142213.19552-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220207142213.19552-1-biju.das.jz@bp.renesas.com>
References: <20220207142213.19552-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add SCIF binding documentation for Renesas RZ/G2UL SoC. SCIF block on
RZ/G2UL is identical to one found on the RZ/G2L SoC. No driver changes
are required as RZ/G2L compatible string "renesas,scif-r9a07g044" will
be used as a fallback.

Whilst dropped the comments after RZ/G2{L,LC} fallback as to
avoid updating the comment over and over again when a new IP
is added

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
 * Dropped the comments RZ/G2{L,LC} fallback
 * Added Rb tag from Geert.
---
 Documentation/devicetree/bindings/serial/renesas,scif.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,scif.yaml b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
index 461392091579..5d37f8f189fb 100644
--- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
@@ -76,8 +76,9 @@ properties:
 
       - items:
           - enum:
+              - renesas,scif-r9a07g043      # RZ/G2UL
               - renesas,scif-r9a07g054      # RZ/V2L
-          - const: renesas,scif-r9a07g044   # RZ/G2{L,LC} fallback for RZ/V2L
+          - const: renesas,scif-r9a07g044   # RZ/G2{L,LC} fallback
 
   reg:
     maxItems: 1
-- 
2.17.1

