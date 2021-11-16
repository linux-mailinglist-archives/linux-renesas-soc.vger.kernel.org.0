Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 624B5452BFC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Nov 2021 08:44:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231324AbhKPHp7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Nov 2021 02:45:59 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:6142 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231274AbhKPHpq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Nov 2021 02:45:46 -0500
X-IronPort-AV: E=Sophos;i="5.87,238,1631545200"; 
   d="scan'208";a="100767142"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 16 Nov 2021 16:42:38 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1EB4A40083D3;
        Tue, 16 Nov 2021 16:42:38 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 08/16] dt-bindings: serial: renesas,scif: Document r8a779f0 bindings
Date:   Tue, 16 Nov 2021 16:41:22 +0900
Message-Id: <20211116074130.107554-9-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com>
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

R-Car S4-8 (R8A779F0) SoC has the R-Car Gen4 compatible SCIF ports,
so document the SoC specific bindings.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/serial/renesas,scif.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/renesas,scif.yaml b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
index 6b8731f7f2fb..14602b720cc0 100644
--- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
@@ -64,6 +64,12 @@ properties:
           - const: renesas,rcar-gen3-scif # R-Car Gen3 and RZ/G2
           - const: renesas,scif           # generic SCIF compatible UART
 
+      - items:
+          - enum:
+              - renesas,scif-r8a779f0     # R-Car S4-8
+          - const: renesas,rcar-gen4-scif # R-Car Gen4
+          - const: renesas,scif           # generic SCIF compatible UART
+
       - items:
           - enum:
               - renesas,scif-r9a07g044      # RZ/G2{L,LC}
-- 
2.25.1

