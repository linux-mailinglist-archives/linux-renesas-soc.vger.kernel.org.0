Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCF0346E2F5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Dec 2021 08:08:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233510AbhLIHL7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Dec 2021 02:11:59 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:54429 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233539AbhLIHL6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Dec 2021 02:11:58 -0500
X-IronPort-AV: E=Sophos;i="5.88,191,1635174000"; 
   d="scan'208";a="102895991"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 09 Dec 2021 16:08:23 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 117A041F8463;
        Thu,  9 Dec 2021 16:08:23 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org, robh+dt@kernel.org
Cc:     geert+renesas@glider.be, linux-serial@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 1/2] dt-bindings: serial: renesas,scif: Document r8a779f0 bindings
Date:   Thu,  9 Dec 2021 16:08:16 +0900
Message-Id: <20211209070817.1223888-2-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211209070817.1223888-1-yoshihiro.shimoda.uh@renesas.com>
References: <20211209070817.1223888-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

R-Car S4-8 (R8A779F0) SoC has the R-Car Gen4 compatible SCIF ports,
so document the SoC specific bindings.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/serial/renesas,scif.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/renesas,scif.yaml b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
index 21fbfa880e29..df2172b7d509 100644
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
@@ -153,6 +159,7 @@ if:
         enum:
           - renesas,rcar-gen2-scif
           - renesas,rcar-gen3-scif
+          - renesas,rcar-gen4-scif
           - renesas,scif-r9a07g044
 then:
   required:
-- 
2.25.1

