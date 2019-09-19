Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A42E5B74E9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Sep 2019 10:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731678AbfISIRi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Sep 2019 04:17:38 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:30251 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731373AbfISIRh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Sep 2019 04:17:37 -0400
X-IronPort-AV: E=Sophos;i="5.64,522,1559487600"; 
   d="scan'208";a="26979428"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 19 Sep 2019 17:17:36 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7B7CD41F812C;
        Thu, 19 Sep 2019 17:17:33 +0900 (JST)
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
Subject: [PATCH v2 5/8] dt-bindings: clock: renesas: cpg-mssr: Document r8a774b1 binding
Date:   Thu, 19 Sep 2019 09:17:13 +0100
Message-Id: <1568881036-4404-6-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568881036-4404-1-git-send-email-biju.das@bp.renesas.com>
References: <1568881036-4404-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add binding documentation for the RZ/G2N (R8A774b1) Clock Pulse
Generator driver.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
V1-->V2
 * No Change
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

