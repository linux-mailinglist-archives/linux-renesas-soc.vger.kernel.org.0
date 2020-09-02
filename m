Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DBE425A87E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Sep 2020 11:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgIBJTi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Sep 2020 05:19:38 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:49234 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726210AbgIBJTi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Sep 2020 05:19:38 -0400
X-IronPort-AV: E=Sophos;i="5.76,381,1592838000"; 
   d="scan'208";a="55959941"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 02 Sep 2020 18:19:30 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9B48842786AE;
        Wed,  2 Sep 2020 18:19:28 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH v2] dt-bindings: timer: renesas,cmt: Document r8a7742 CMT support
Date:   Wed,  2 Sep 2020 10:19:27 +0100
Message-Id: <20200902091927.32211-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document SoC specific compatible strings for r8a7742. No driver change
is needed as the fallback strings will activate the right code.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2
* Reabsed the patch on top YAML conversion
* Restored the Acks
---
 Documentation/devicetree/bindings/timer/renesas,cmt.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.yaml b/Documentation/devicetree/bindings/timer/renesas,cmt.yaml
index 7e4dc5623da8..762b65094292 100644
--- a/Documentation/devicetree/bindings/timer/renesas,cmt.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,cmt.yaml
@@ -39,6 +39,7 @@ properties:
       - items:
           - enum:
               - renesas,r8a73a4-cmt0      # 32-bit CMT0 on R-Mobile APE6
+              - renesas,r8a7742-cmt0      # 32-bit CMT0 on RZ/G1H
               - renesas,r8a7743-cmt0      # 32-bit CMT0 on RZ/G1M
               - renesas,r8a7744-cmt0      # 32-bit CMT0 on RZ/G1N
               - renesas,r8a7745-cmt0      # 32-bit CMT0 on RZ/G1E
@@ -53,6 +54,7 @@ properties:
       - items:
           - enum:
               - renesas,r8a73a4-cmt1      # 48-bit CMT1 on R-Mobile APE6
+              - renesas,r8a7742-cmt1      # 48-bit CMT1 on RZ/G1H
               - renesas,r8a7743-cmt1      # 48-bit CMT1 on RZ/G1M
               - renesas,r8a7744-cmt1      # 48-bit CMT1 on RZ/G1N
               - renesas,r8a7745-cmt1      # 48-bit CMT1 on RZ/G1E
-- 
2.17.1

