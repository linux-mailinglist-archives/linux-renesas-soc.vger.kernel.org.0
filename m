Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A43E423FFD1
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Aug 2020 21:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgHITUG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 9 Aug 2020 15:20:06 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:29611 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726289AbgHITUG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 9 Aug 2020 15:20:06 -0400
X-IronPort-AV: E=Sophos;i="5.75,454,1589209200"; 
   d="scan'208";a="54243689"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Aug 2020 04:20:04 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 50A0D40D82E8;
        Mon, 10 Aug 2020 04:20:02 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2] dt-bindings: mmc: renesas,sdhi: Add r8a774e1 support
Date:   Sun,  9 Aug 2020 20:20:01 +0100
Message-Id: <20200809192001.19156-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document SDHI controller for RZ/G2H (R8A774E1) SoC, which is compatible
with R-Car Gen3 SoC family.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring <robh@kernel.org>
---
v1->v2
* Rebased the patch on YAML binding conversion changes (this patch
  is part of series [1], reset of the patches have been picked up).
* I have restored the Ack's from v1
  [1] https://lkml.org/lkml/2020/7/8/1211
---
 Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index e5dbc20456e5..04eb0d3c5fa4 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -50,6 +50,7 @@ properties:
               - renesas,sdhi-r8a774a1 # RZ/G2M
               - renesas,sdhi-r8a774b1 # RZ/G2N
               - renesas,sdhi-r8a774c0 # RZ/G2E
+              - renesas,sdhi-r8a774e1 # RZ/G2H
               - renesas,sdhi-r8a7795  # R-Car H3
               - renesas,sdhi-r8a7796  # R-Car M3-W
               - renesas,sdhi-r8a77961 # R-Car M3-W+
-- 
2.17.1

