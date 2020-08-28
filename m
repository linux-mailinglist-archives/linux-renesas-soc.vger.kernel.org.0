Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFC202555A2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Aug 2020 09:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgH1Hu2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Aug 2020 03:50:28 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:56242 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726571AbgH1Hu2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Aug 2020 03:50:28 -0400
X-IronPort-AV: E=Sophos;i="5.76,362,1592838000"; 
   d="scan'208";a="55774010"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 28 Aug 2020 16:50:27 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 05EEA400E8CC;
        Fri, 28 Aug 2020 16:50:24 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH v2] dt-bindings: usb: renesas,usb-xhci: Document r8a774e1 support
Date:   Fri, 28 Aug 2020 08:50:19 +0100
Message-Id: <20200828075019.541-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document r8a774e1 xhci support. The driver will use the fallback
compatible string "renesas,rcar-gen3-xhci", therefore no driver
change is needed.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Hi All,

This patch is part of series [1] (patch 08/20), rest of the patches
have been queued/acked.

[1] https://lkml.org/lkml/2020/7/16/890

Cheers,
Prabhakar

v1->v2
* Rebased the patch on 5.9-rc1 (Renesas devices were moved from usb-xhci.txt
  renesas,usb-xhci.yaml)
* Restored Ack's from Geert and Rob
---
 Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml b/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
index add9f7b66da0..0f078bd0a3e5 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
@@ -30,6 +30,7 @@ properties:
               - renesas,xhci-r8a774a1 # RZ/G2M
               - renesas,xhci-r8a774b1 # RZ/G2N
               - renesas,xhci-r8a774c0 # RZ/G2E
+              - renesas,xhci-r8a774e1 # RZ/G2H
               - renesas,xhci-r8a7795  # R-Car H3
               - renesas,xhci-r8a7796  # R-Car M3-W
               - renesas,xhci-r8a77961 # R-Car M3-W+
-- 
2.17.1

