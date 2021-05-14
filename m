Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6228938106D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 May 2021 21:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233511AbhENTY1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 May 2021 15:24:27 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:8618 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232299AbhENTYZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 May 2021 15:24:25 -0400
X-IronPort-AV: E=Sophos;i="5.82,300,1613401200"; 
   d="scan'208";a="81343848"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 15 May 2021 04:23:11 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id F04F64010906;
        Sat, 15 May 2021 04:23:07 +0900 (JST)
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
Subject: [PATCH 01/16] dt-bindings: arm: renesas: Document Renesas RZ/G2UL SoC
Date:   Fri, 14 May 2021 20:22:03 +0100
Message-Id: <20210514192218.13022-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device tree bindings documentation for Renesas RZ/G2UL SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
---
 Documentation/devicetree/bindings/arm/renesas.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
index 5fd0696a9f91..51e550f4569d 100644
--- a/Documentation/devicetree/bindings/arm/renesas.yaml
+++ b/Documentation/devicetree/bindings/arm/renesas.yaml
@@ -302,6 +302,12 @@ properties:
               - renesas,rzn1d400-db # RZN1D-DB (RZ/N1D Demo Board for the RZ/N1D 400 pins package)
           - const: renesas,r9a06g032
 
+      - description: RZ/G2UL (R9A07G043)
+        items:
+          - enum:
+              - renesas,r9a07g043u11 # Single Cortex-A55 RZ/G2UL
+          - const: renesas,r9a07g043
+
 additionalProperties: true
 
 ...
-- 
2.17.1

