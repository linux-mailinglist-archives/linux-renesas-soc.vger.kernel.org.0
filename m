Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6328D458C6D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Nov 2021 11:39:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239289AbhKVKmf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Nov 2021 05:42:35 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:40635 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235098AbhKVKmf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Nov 2021 05:42:35 -0500
X-IronPort-AV: E=Sophos;i="5.87,254,1631545200"; 
   d="scan'208";a="101414932"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 Nov 2021 19:39:28 +0900
Received: from localhost.localdomain (unknown [10.226.92.178])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8CD6C4004199;
        Mon, 22 Nov 2021 19:39:25 +0900 (JST)
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
Subject: [PATCH 1/2] dt-bindings: mmc: renesas,sdhi: Rename RZ/G2L clocks
Date:   Mon, 22 Nov 2021 10:39:04 +0000
Message-Id: <20211122103905.14439-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211122103905.14439-1-biju.das.jz@bp.renesas.com>
References: <20211122103905.14439-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Rename the below RZ/G2L clocks to match with the clock names used in
R-Car Gen2 and later generations.

 imclk->core
 clk_hs->clkh
 imclk2->cd

This changes will avoid using fallback for RZ/G2L high speed clock,
if "clkh" is not used in device tree and also the code changes in
driver related to this clocks.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Note:
 This patch series based on renesas-devel and depend upon [1]

 [1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/commit/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml?id=e051025efac3929ca7e3e2f2c8860d3447366ebc
---
 .../devicetree/bindings/mmc/renesas,sdhi.yaml          | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index f5107a641790..9ce6e06c19db 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -113,17 +113,17 @@ allOf:
         clocks:
           items:
             - description: IMCLK, SDHI channel main clock1.
+            - description: CLK_HS, SDHI channel High speed clock which operates
+                           4 times that of SDHI channel main clock1.
             - description: IMCLK2, SDHI channel main clock2. When this clock is
                            turned off, external SD card detection cannot be
                            detected.
-            - description: CLK_HS, SDHI channel High speed clock which operates
-                           4 times that of SDHI channel main clock1.
             - description: ACLK, SDHI channel bus clock.
         clock-names:
           items:
-            - const: imclk
-            - const: imclk2
-            - const: clk_hs
+            - const: core
+            - const: clkh
+            - const: cd
             - const: aclk
       required:
         - clock-names
-- 
2.17.1

