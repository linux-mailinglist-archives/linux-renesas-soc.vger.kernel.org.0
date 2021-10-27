Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46BCA43C994
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Oct 2021 14:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233909AbhJ0M1i (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Oct 2021 08:27:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237312AbhJ0M1i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Oct 2021 08:27:38 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2795C061767
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Oct 2021 05:25:12 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:441:6c1a:bc30:46e])
        by michel.telenet-ops.be with bizsmtp
        id B0RA2600K2hfXWm060RAQi; Wed, 27 Oct 2021 14:25:10 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mfhzS-008Tkp-FN; Wed, 27 Oct 2021 14:25:10 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mfhzR-00Ds5z-Vo; Wed, 27 Oct 2021 14:25:10 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: irqchip: renesas-irqc: Document r8a774e1 bindings
Date:   Wed, 27 Oct 2021 14:25:09 +0200
Message-Id: <53317ce1bdd1d5e517122eb5c8ea0ccaa69eba3b.1635337428.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Document SoC specific bindings for RZ/G2H (r8a774e1) SoC.

Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/interrupt-controller/renesas,irqc.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
index abb22db3bb28be29..79d0358e2f612f24 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
@@ -27,6 +27,7 @@ properties:
           - renesas,intc-ex-r8a774a1    # RZ/G2M
           - renesas,intc-ex-r8a774b1    # RZ/G2N
           - renesas,intc-ex-r8a774c0    # RZ/G2E
+          - renesas,intc-ex-r8a774e1    # RZ/G2H
           - renesas,intc-ex-r8a7795     # R-Car H3
           - renesas,intc-ex-r8a7796     # R-Car M3-W
           - renesas,intc-ex-r8a77961    # R-Car M3-W+
-- 
2.25.1

