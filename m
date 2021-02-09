Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61C2E3149C8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Feb 2021 08:56:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbhBIHzl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Feb 2021 02:55:41 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:47049 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229544AbhBIHzl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Feb 2021 02:55:41 -0500
X-IronPort-AV: E=Sophos;i="5.81,164,1610377200"; 
   d="scan'208";a="71566334"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 09 Feb 2021 16:49:36 +0900
Received: from localhost.localdomain (unknown [10.166.15.86])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D291041E9EEB;
        Tue,  9 Feb 2021 16:49:36 +0900 (JST)
From:   Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
To:     linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        marek.vasut+renesas@gmail.com, yoshihiro.shimoda.uh@renesas.com,
        bhelgaas@google.com, robh+dt@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com
Subject: [RESEND PATCH v2] dt-bindings: pci: rcar-pci-ep: Document r8a7795
Date:   Tue,  9 Feb 2021 16:48:40 +0900
Message-Id: <20210209074840.21254-1-yuya.hamamachi.sx@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the support for R-Car PCIe EP on R8A7795 SoC device.

Signed-off-by: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes from v1:
- Add Geert-san's Reviewed-by.
- https://patchwork.kernel.org/project/linux-renesas-soc/patch/20201125073303.19057-2-yuya.hamamachi.sx@renesas.com/

 Documentation/devicetree/bindings/pci/rcar-pci-ep.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/rcar-pci-ep.yaml b/Documentation/devicetree/bindings/pci/rcar-pci-ep.yaml
index 84eeb7fe6e01..fb97f4ea0e63 100644
--- a/Documentation/devicetree/bindings/pci/rcar-pci-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/rcar-pci-ep.yaml
@@ -19,6 +19,7 @@ properties:
           - renesas,r8a774b1-pcie-ep     # RZ/G2N
           - renesas,r8a774c0-pcie-ep     # RZ/G2E
           - renesas,r8a774e1-pcie-ep     # RZ/G2H
+          - renesas,r8a7795-pcie-ep      # R-Car H3
       - const: renesas,rcar-gen3-pcie-ep # R-Car Gen3 and RZ/G2
 
   reg:
-- 
2.25.1

