Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 332BB271BAB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Sep 2020 09:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbgIUHWP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Sep 2020 03:22:15 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:24357 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726244AbgIUHWP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Sep 2020 03:22:15 -0400
X-IronPort-AV: E=Sophos;i="5.77,285,1596466800"; 
   d="scan'208";a="57556396"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 21 Sep 2020 16:22:13 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C4BF741C23B7;
        Mon, 21 Sep 2020 16:22:11 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [RESEND PATCH] dt-bindings: ata: renesas,rcar-sata: Add r8a774e1 support
Date:   Mon, 21 Sep 2020 08:22:06 +0100
Message-Id: <20200921072206.15182-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch is part of series [1] (orignal patch [2]) where rest of the
patches have been picked up by the respective maintainers so just
resending this patch.

I have included the Acks' from the maintainers.

[1] https://patchwork.kernel.org/project/linux-renesas-soc/
    list/?series=319563
[2] https://patchwork.kernel.org/patch/11668061/

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

