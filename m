Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3757B39B8CE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jun 2021 14:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbhFDMNl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Jun 2021 08:13:41 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:27030 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230025AbhFDMNl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Jun 2021 08:13:41 -0400
X-IronPort-AV: E=Sophos;i="5.83,248,1616425200"; 
   d="scan'208";a="83423117"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 04 Jun 2021 21:11:52 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A70E1401CEB8;
        Fri,  4 Jun 2021 21:11:50 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] dt-bindings: interrupt-controller: arm,gic-v3: Describe GIV-v3 optional properties
Date:   Fri,  4 Jun 2021 13:11:23 +0100
Message-Id: <20210604121123.650-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe the optional GICv3 properties:
- clocks
- clock-names
- power-domains
- resets

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/interrupt-controller/arm,gic-v3.yaml   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
index 1ecd1831cf02..c84f9fe7f254 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
@@ -145,6 +145,19 @@ properties:
         required:
           - affinity
 
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: aclk
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
 dependencies:
   mbi-ranges: [ msi-controller ]
   msi-controller: [ mbi-ranges ]
-- 
2.17.1

