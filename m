Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A08D3AE63B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 11:40:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbhFUJmU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 05:42:20 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:12185 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230292AbhFUJmT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 05:42:19 -0400
X-IronPort-AV: E=Sophos;i="5.83,289,1616425200"; 
   d="scan'208";a="84924677"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 Jun 2021 18:40:05 +0900
Received: from localhost.localdomain (unknown [10.226.92.241])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0FC3F400C4E6;
        Mon, 21 Jun 2021 18:40:02 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 05/11] dt-bindings: phy: renesas,usb2-phy: Document RZ/G2L phy bindings
Date:   Mon, 21 Jun 2021 10:39:37 +0100
Message-Id: <20210621093943.12143-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210621093943.12143-1-biju.das.jz@bp.renesas.com>
References: <20210621093943.12143-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document USB phy bindings for RZ/G2L SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/phy/renesas,usb2-phy.yaml        | 23 ++++++++++---------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index 0f358d5b84ef..eebba6c83aec 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -17,17 +17,18 @@ properties:
 
       - items:
           - enum:
-              - renesas,usb2-phy-r7s9210  # RZ/A2
-              - renesas,usb2-phy-r8a774a1 # RZ/G2M
-              - renesas,usb2-phy-r8a774b1 # RZ/G2N
-              - renesas,usb2-phy-r8a774c0 # RZ/G2E
-              - renesas,usb2-phy-r8a774e1 # RZ/G2H
-              - renesas,usb2-phy-r8a7795  # R-Car H3
-              - renesas,usb2-phy-r8a7796  # R-Car M3-W
-              - renesas,usb2-phy-r8a77961 # R-Car M3-W+
-              - renesas,usb2-phy-r8a77965 # R-Car M3-N
-              - renesas,usb2-phy-r8a77990 # R-Car E3
-              - renesas,usb2-phy-r8a77995 # R-Car D3
+              - renesas,usb2-phy-r7s9210   # RZ/A2
+              - renesas,usb2-phy-r8a774a1  # RZ/G2M
+              - renesas,usb2-phy-r8a774b1  # RZ/G2N
+              - renesas,usb2-phy-r8a774c0  # RZ/G2E
+              - renesas,usb2-phy-r8a774e1  # RZ/G2H
+              - renesas,usb2-phy-r8a7795   # R-Car H3
+              - renesas,usb2-phy-r8a7796   # R-Car M3-W
+              - renesas,usb2-phy-r8a77961  # R-Car M3-W+
+              - renesas,usb2-phy-r8a77965  # R-Car M3-N
+              - renesas,usb2-phy-r8a77990  # R-Car E3
+              - renesas,usb2-phy-r8a77995  # R-Car D3
+              - renesas,usb2-phy-r9a07g044 # RZ/G2{L,LC}
           - const: renesas,rcar-gen3-usb2-phy
 
   reg:
-- 
2.17.1

