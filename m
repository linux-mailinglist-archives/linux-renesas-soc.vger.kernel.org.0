Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7C1C3EB335
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Aug 2021 11:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239298AbhHMJMn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Aug 2021 05:12:43 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:27282 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S238739AbhHMJMj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Aug 2021 05:12:39 -0400
X-IronPort-AV: E=Sophos;i="5.84,318,1620658800"; 
   d="scan'208";a="90541571"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 13 Aug 2021 18:12:12 +0900
Received: from localhost.localdomain (unknown [10.226.92.30])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 877124228B65;
        Fri, 13 Aug 2021 18:12:09 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 2/3] ASoC: dt-bindings: renesas,rz-ssi: Update slave dma channel configuration parameter
Date:   Fri, 13 Aug 2021 10:11:55 +0100
Message-Id: <20210813091156.10700-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210813091156.10700-1-biju.das.jz@bp.renesas.com>
References: <20210813091156.10700-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The DMAC on RZ/G2L has specific slave channel configuration
parameters for SSI.
This patch updates the dmas description and example node to include
the encoded slave channel configuration.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Note:-
 This patch is based on [1]
 [1]:- https://patchwork.kernel.org/project/linux-renesas-soc/patch/20210806095322.2326-2-biju.das.jz@bp.renesas.com/
v4->v5:
 * Updated dmas description and removed fixes as it is an enhancement
   now.
v3->v4:
 * Updated bindings as the DMAC driver on RZ/G2L expects the
   slave channel configuration to be passed in dmas property.
v2->v3:
 * Merged the binding patch with dmas added
 * Updated dt binding example with encoded #dma-cells value.
v1->v2:
 * Rebased on 5.14-rc2.
---
 .../bindings/sound/renesas,rz-ssi.yaml        | 22 +++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
index 471937cb8d05..414ff8035a4e 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
@@ -48,6 +48,24 @@ properties:
   dmas:
     minItems: 1
     maxItems: 2
+    description:
+      The first cell represents a phandle to dmac
+      The second cell specifies the encoded MID/RID values of the SSI port
+      connected to the DMA client and the slave channel configuration
+      parameters.
+      bits[0:9]   - Specifies MID/RID value of a SSI channel as below
+                    MID/RID value of SSI rx0 = 0x256
+                    MID/RID value of SSI tx0 = 0x255
+                    MID/RID value of SSI rx1 = 0x25a
+                    MID/RID value of SSI tx1 = 0x259
+                    MID/RID value of SSI rt2 = 0x25f
+                    MID/RID value of SSI rx3 = 0x262
+                    MID/RID value of SSI tx3 = 0x261
+      bit[10]     - HIEN = 1, Detects a request in response to the rising edge
+                    of the signal
+      bit[11]     - LVL = 0, Detects based on the edge
+      bits[12:14] - AM = 2, Bus cycle mode
+      bit[15]     - TM = 0, Single transfer mode
 
   dma-names:
     oneOf:
@@ -93,8 +111,8 @@ examples:
             clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
             power-domains = <&cpg>;
             resets = <&cpg R9A07G044_SSI0_RST_M2_REG>;
-            dmas = <&dmac 0x255>,
-                   <&dmac 0x256>;
+            dmas = <&dmac 0x2655>,
+                   <&dmac 0x2656>;
             dma-names = "tx", "rx";
             #sound-dai-cells = <0>;
     };
-- 
2.17.1

