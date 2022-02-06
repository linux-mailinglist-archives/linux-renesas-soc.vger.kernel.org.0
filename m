Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 956D24AB166
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  6 Feb 2022 19:53:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347056AbiBFSxD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 6 Feb 2022 13:53:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236866AbiBFSxC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 6 Feb 2022 13:53:02 -0500
X-Greylist: delayed 303 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 06 Feb 2022 10:52:59 PST
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B1647C043185;
        Sun,  6 Feb 2022 10:52:59 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.88,348,1635174000"; 
   d="scan'208";a="110316695"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 07 Feb 2022 03:47:55 +0900
Received: from localhost.localdomain (unknown [10.226.92.17])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id ED84C40061AA;
        Mon,  7 Feb 2022 03:47:52 +0900 (JST)
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
Subject: [PATCH 1/3] dt-bindings: serial: renesas,scif: Remove redundant renesas,scif-r9a07g054
Date:   Sun,  6 Feb 2022 18:47:47 +0000
Message-Id: <20220206184749.11532-1-biju.das.jz@bp.renesas.com>
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

This patch removes redundant "renesas,scif-r9a07g054" from binding
documentation as it uses renesas,scif-r9a07g044 fallback.

Whilst remove the additional renesas,scif-r9a07g054 from Items.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 Documentation/devicetree/bindings/serial/renesas,scif.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,scif.yaml b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
index ba5d3e0acc63..461392091579 100644
--- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
@@ -73,7 +73,6 @@ properties:
       - items:
           - enum:
               - renesas,scif-r9a07g044      # RZ/G2{L,LC}
-              - renesas,scif-r9a07g054      # RZ/V2L
 
       - items:
           - enum:
@@ -167,7 +166,6 @@ if:
           - renesas,rcar-gen3-scif
           - renesas,rcar-gen4-scif
           - renesas,scif-r9a07g044
-          - renesas,scif-r9a07g054
 then:
   required:
     - resets
-- 
2.17.1

