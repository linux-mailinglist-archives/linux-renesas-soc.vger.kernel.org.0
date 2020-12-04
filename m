Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76EB22CEE08
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Dec 2020 13:25:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729570AbgLDMYm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Dec 2020 07:24:42 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:46337 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728720AbgLDMYl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Dec 2020 07:24:41 -0500
X-IronPort-AV: E=Sophos;i="5.78,392,1599490800"; 
   d="scan'208";a="64877060"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Dec 2020 21:23:49 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id CF83242FD08F;
        Fri,  4 Dec 2020 21:23:47 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Jens Axboe <axboe@kernel.dk>, Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RESEND TAKE 2 PATCH] dt-bindings: ata: renesas,rcar-sata: Add r8a774e1 support
Date:   Fri,  4 Dec 2020 12:23:38 +0000
Message-Id: <20201204122338.29243-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document SATA support for the RZ/G2H, no driver change required.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Hi All,

This patch is part of series [1] (original patch [2]) where rest of the
patches have been picked up by the respective maintainers.

I haven't received any response for the RESEND patch [3] so resending
again.

[1] https://patchwork.kernel.org/project/linux-renesas-soc/
    list/?series=319563
[2] https://patchwork.kernel.org/patch/11668061/
[3] https://patchwork.kernel.org/project/linux-renesas-soc/
    patch/20200921072206.15182-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar
---
 Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml b/Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml
index d06096a7ba4b..2ad2444f1042 100644
--- a/Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml
+++ b/Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - renesas,sata-r8a774b1     # RZ/G2N
+              - renesas,sata-r8a774e1     # RZ/G2H
               - renesas,sata-r8a7795      # R-Car H3
               - renesas,sata-r8a77965     # R-Car M3-N
           - const: renesas,rcar-gen3-sata # generic R-Car Gen3 or RZ/G2
-- 
2.17.1

