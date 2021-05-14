Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52E293810C1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 May 2021 21:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231590AbhENT3i (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 May 2021 15:29:38 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:37322 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229524AbhENT3h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 May 2021 15:29:37 -0400
X-IronPort-AV: E=Sophos;i="5.82,300,1613401200"; 
   d="scan'208";a="81147952"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 15 May 2021 04:23:19 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 24DB04010906;
        Sat, 15 May 2021 04:23:15 +0900 (JST)
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
Subject: [PATCH 03/16] dt-bindings: arm: renesas: Document SMARC EVK
Date:   Fri, 14 May 2021 20:22:05 +0100
Message-Id: <20210514192218.13022-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document Renesas SMARC EVK boards which are based on RZ/G2L (R9A07G044L)
SoC. The SMARC EVK consists of RZ/G2L SoM module and SMARC carrier board,
the SoM module sits on top of carrier board.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
---
 Documentation/devicetree/bindings/arm/renesas.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
index 626757d6617e..74dee6a0d2af 100644
--- a/Documentation/devicetree/bindings/arm/renesas.yaml
+++ b/Documentation/devicetree/bindings/arm/renesas.yaml
@@ -310,6 +310,9 @@ properties:
 
       - description: RZ/G2{L,LC} (R9A07G044)
         items:
+          - enum:
+              - renesas,smarc-r9a07g044l1 # SMARC EVK with single Cortex-A55
+              - renesas,smarc-r9a07g044l2 # SMARC EVK with dual Cortex-A55
           - enum:
               - renesas,r9a07g044c1 # Single Cortex-A55 RZ/G2LC
               - renesas,r9a07g044c2 # Dual Cortex-A55 RZ/G2LC
-- 
2.17.1

