Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5C6285F9E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Oct 2020 14:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728360AbgJGM7N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Oct 2020 08:59:13 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:34482 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728356AbgJGM7N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Oct 2020 08:59:13 -0400
X-IronPort-AV: E=Sophos;i="5.77,346,1596466800"; 
   d="scan'208";a="59159729"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Oct 2020 21:59:12 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D3E8A4007F30;
        Wed,  7 Oct 2020 21:59:11 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2] dt-bindings: serial: renesas,scif: Document r8a779a0 bindings
Date:   Wed,  7 Oct 2020 21:58:55 +0900
Message-Id: <1602075535-18802-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

R-Car V3U (R8A779A0) SoC also has the R-Car Gen3 compatible
SCIF ports, so document the SoC specific bindings.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring <robh@kernel.org>
---
 Changes from v1:
 - Add Reviewed-by Geert.
 - Add Acked-by Rob.
 https://patchwork.kernel.org/patch/11760273/

 Documentation/devicetree/bindings/serial/renesas,scif.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/renesas,scif.yaml b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
index f589ac7..ae29183 100644
--- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
@@ -60,6 +60,7 @@ properties:
               - renesas,scif-r8a77980     # R-Car V3H
               - renesas,scif-r8a77990     # R-Car E3
               - renesas,scif-r8a77995     # R-Car D3
+              - renesas,scif-r8a779a0     # R-Car V3U
           - const: renesas,rcar-gen3-scif # R-Car Gen3 and RZ/G2
           - const: renesas,scif           # generic SCIF compatible UART
 
-- 
2.7.4

