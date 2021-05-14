Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B68E3810C6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 May 2021 21:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232031AbhENT3t (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 May 2021 15:29:49 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:59886 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231703AbhENT3s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 May 2021 15:29:48 -0400
X-IronPort-AV: E=Sophos;i="5.82,300,1613401200"; 
   d="scan'208";a="81147963"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 15 May 2021 04:23:32 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 53FD74010906;
        Sat, 15 May 2021 04:23:28 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH 06/16] dt-bindings: arm: renesas,prr: Add new compatible string for RZ/G{L,LC,UL}
Date:   Fri, 14 May 2021 20:22:08 +0100
Message-Id: <20210514192218.13022-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RZ/G2{L,LC,UL} SoC's have LSI_DEVID register to retrieve SoC product and
revision information.

RZ/G{L,LC,UL} SoC's have 28-bit product-id compared to other R-Car and
RZ/G2{E,H,M,N} SoC's hence a new compatible string "renesas,devid" is
added.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 Documentation/devicetree/bindings/arm/renesas,prr.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/renesas,prr.yaml b/Documentation/devicetree/bindings/arm/renesas,prr.yaml
index 1f80767da38b..94afeccba29f 100644
--- a/Documentation/devicetree/bindings/arm/renesas,prr.yaml
+++ b/Documentation/devicetree/bindings/arm/renesas,prr.yaml
@@ -12,14 +12,16 @@ maintainers:
 
 description: |
   Most Renesas ARM SoCs have a Product Register or Boundary Scan ID
-  Register that allows to retrieve SoC product and revision information.
-  If present, a device node for this register should be added.
+  Register or LSI Device ID Register that allows to retrieve SoC product
+  and revision information. If present, a device node for this register
+  should be added.
 
 properties:
   compatible:
     enum:
       - renesas,prr
       - renesas,bsid
+      - renesas,devid
   reg:
     maxItems: 1
 
-- 
2.17.1

