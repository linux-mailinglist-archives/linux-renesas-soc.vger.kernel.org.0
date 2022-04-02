Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E175F4EFF67
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Apr 2022 09:32:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348393AbiDBHeb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 2 Apr 2022 03:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348987AbiDBHea (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 2 Apr 2022 03:34:30 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 820B9174EBA;
        Sat,  2 Apr 2022 00:32:39 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,229,1643641200"; 
   d="scan'208";a="115483369"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 02 Apr 2022 16:32:38 +0900
Received: from localhost.localdomain (unknown [10.226.92.166])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0C0BE40071E8;
        Sat,  2 Apr 2022 16:32:36 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 1/5] dt-bindings: arm: renesas: Document Renesas RZ/G2UL SMARC EVK
Date:   Sat,  2 Apr 2022 08:32:34 +0100
Message-Id: <20220402073234.24625-1-biju.das.jz@bp.renesas.com>
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

Document the Renesas SMARC EVK board which is based on the Renesas
RZ/G2UL Type-1 (R9A07G043U11) SoC.  The SMARC EVK consists of an
RZ/G2UL Type-1 SoM module and a SMARC carrier board.  The SoM module
sits on top of the carrier board.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
V4:
* new patch
---
 Documentation/devicetree/bindings/arm/renesas.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
index fa435d6fda77..f61807103867 100644
--- a/Documentation/devicetree/bindings/arm/renesas.yaml
+++ b/Documentation/devicetree/bindings/arm/renesas.yaml
@@ -405,6 +405,8 @@ properties:
 
       - description: RZ/G2UL (R9A07G043)
         items:
+          - enum:
+              - renesas,smarc-evk # SMARC EVK
           - enum:
               - renesas,r9a07g043u11 # RZ/G2UL Type-1
               - renesas,r9a07g043u12 # RZ/G2UL Type-2
-- 
2.17.1

