Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 398A8397261
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jun 2021 13:32:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233397AbhFALdu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Jun 2021 07:33:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232173AbhFALdq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Jun 2021 07:33:46 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7636AC061756
        for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Jun 2021 04:32:04 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b9f6:a814:dab1:1579])
        by laurent.telenet-ops.be with bizsmtp
        id BnY02501147zJAe01nY07s; Tue, 01 Jun 2021 13:32:01 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lo2cq-00Bq6J-DH; Tue, 01 Jun 2021 13:32:00 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lo2cp-00HRHP-UN; Tue, 01 Jun 2021 13:31:59 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: irqchip: renesas-irqc: Add R-Car M3-W+ support
Date:   Tue,  1 Jun 2021 13:31:55 +0200
Message-Id: <55d2c30cb14b2e10193a7fd4aa7670c70f360037.1622546880.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document support for the Interrupt Controller for External Devices
(INT-EC) in the Renesas R-Car M3-W+ (r8a77961) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
No Linux driver update needed.

 .../devicetree/bindings/interrupt-controller/renesas,irqc.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
index b67b8cbd33fcb1a0..abb22db3bb28be29 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
@@ -29,6 +29,7 @@ properties:
           - renesas,intc-ex-r8a774c0    # RZ/G2E
           - renesas,intc-ex-r8a7795     # R-Car H3
           - renesas,intc-ex-r8a7796     # R-Car M3-W
+          - renesas,intc-ex-r8a77961    # R-Car M3-W+
           - renesas,intc-ex-r8a77965    # R-Car M3-N
           - renesas,intc-ex-r8a77970    # R-Car V3M
           - renesas,intc-ex-r8a77980    # R-Car V3H
-- 
2.25.1

