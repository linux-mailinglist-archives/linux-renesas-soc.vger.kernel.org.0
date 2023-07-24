Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ABFB75EEF8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jul 2023 11:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232236AbjGXJTw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Jul 2023 05:19:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231136AbjGXJTv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jul 2023 05:19:51 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0E3FB12A;
        Mon, 24 Jul 2023 02:19:49 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,228,1684767600"; 
   d="scan'208";a="174273217"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 24 Jul 2023 18:19:49 +0900
Received: from localhost.localdomain (unknown [10.226.92.186])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5FC484199711;
        Mon, 24 Jul 2023 18:19:45 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 3/6] dt-bindings: timer: renesas,rz-mtu3: Document RZ/G2UL SoC
Date:   Mon, 24 Jul 2023 10:19:24 +0100
Message-Id: <20230724091927.123847-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230724091927.123847-1-biju.das.jz@bp.renesas.com>
References: <20230724091927.123847-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add MTU3a binding documentation for Renesas RZ/G2UL SoC.

MTU3a block is identical to one found on RZ/G2L, so no driver changes are
required. The fallback compatible string "renesas,rz-mtu3" will be used
on RZ/G2UL.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v1->v2:
 * Added ack from Conor Dooley.
---
 Documentation/devicetree/bindings/timer/renesas,rz-mtu3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,rz-mtu3.yaml b/Documentation/devicetree/bindings/timer/renesas,rz-mtu3.yaml
index 670a2ebaacdb..2269e0bf8818 100644
--- a/Documentation/devicetree/bindings/timer/renesas,rz-mtu3.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,rz-mtu3.yaml
@@ -109,6 +109,7 @@ properties:
   compatible:
     items:
       - enum:
+          - renesas,r9a07g043-mtu3  # RZ/G2UL
           - renesas,r9a07g044-mtu3  # RZ/G2{L,LC}
           - renesas,r9a07g054-mtu3  # RZ/V2L
       - const: renesas,rz-mtu3
-- 
2.25.1

