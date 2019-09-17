Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C08DB4E28
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2019 14:42:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727927AbfIQMmp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Sep 2019 08:42:45 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:6640 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727782AbfIQMmp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Sep 2019 08:42:45 -0400
X-IronPort-AV: E=Sophos;i="5.64,516,1559487600"; 
   d="scan'208";a="26574475"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 Sep 2019 21:42:43 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0FFB3423501E;
        Tue, 17 Sep 2019 21:42:40 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 5/8] dt-bindings: clock: renesas: cpg-mssr: Document r8a774b1 binding
Date:   Tue, 17 Sep 2019 13:35:33 +0100
Message-Id: <1568723736-14714-6-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568723736-14714-1-git-send-email-biju.das@bp.renesas.com>
References: <1568723736-14714-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add binding documentation for the RZ/G2N (R8A774b1) Clock Pulse
Generator driver.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
index 916a601..b5edebe 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
@@ -19,6 +19,7 @@ Required Properties:
       - "renesas,r8a7745-cpg-mssr" for the r8a7745 SoC (RZ/G1E)
       - "renesas,r8a77470-cpg-mssr" for the r8a77470 SoC (RZ/G1C)
       - "renesas,r8a774a1-cpg-mssr" for the r8a774a1 SoC (RZ/G2M)
+      - "renesas,r8a774b1-cpg-mssr" for the r8a774a1 SoC (RZ/G2N)
       - "renesas,r8a774c0-cpg-mssr" for the r8a774c0 SoC (RZ/G2E)
       - "renesas,r8a7790-cpg-mssr" for the r8a7790 SoC (R-Car H2)
       - "renesas,r8a7791-cpg-mssr" for the r8a7791 SoC (R-Car M2-W)
@@ -40,10 +41,11 @@ Required Properties:
     clock-names
   - clock-names: List of external parent clock names. Valid names are:
       - "extal" (r7s9210, r8a7743, r8a7744, r8a7745, r8a77470, r8a774a1,
-		 r8a774c0, r8a7790, r8a7791, r8a7792, r8a7793, r8a7794,
-		 r8a7795, r8a7796, r8a77965, r8a77970, r8a77980, r8a77990,
-		 r8a77995)
-      - "extalr" (r8a774a1, r8a7795, r8a7796, r8a77965, r8a77970, r8a77980)
+		 r8a774b1, r8a774c0, r8a7790, r8a7791, r8a7792, r8a7793,
+		 r8a7794, r8a7795, r8a7796, r8a77965, r8a77970, r8a77980,
+		 r8a77990, r8a77995)
+      - "extalr" (r8a774a1, r8a774b1, r8a7795, r8a7796, r8a77965, r8a77970,
+		  r8a77980)
       - "usb_extal" (r8a7743, r8a7744, r8a7745, r8a77470, r8a7790, r8a7791,
 		     r8a7793, r8a7794)
 
-- 
2.7.4

