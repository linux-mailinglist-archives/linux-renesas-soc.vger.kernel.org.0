Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD4642C3A3E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Nov 2020 08:42:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727527AbgKYHmP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Nov 2020 02:42:15 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:35730 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726595AbgKYHmO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Nov 2020 02:42:14 -0500
X-IronPort-AV: E=Sophos;i="5.78,368,1599490800"; 
   d="scan'208";a="63822508"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Nov 2020 16:37:11 +0900
Received: from localhost.localdomain (unknown [10.166.15.86])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E4A8E4004CE6;
        Wed, 25 Nov 2020 16:37:10 +0900 (JST)
From:   Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
To:     linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: pci: rcar-pci-ep: Document r8a7795
Date:   Wed, 25 Nov 2020 16:33:02 +0900
Message-Id: <20201125073303.19057-2-yuya.hamamachi.sx@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125073303.19057-1-yuya.hamamachi.sx@renesas.com>
References: <20201125073303.19057-1-yuya.hamamachi.sx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the support for R-Car PCIe EP on R8A7795 SoC device.

Signed-off-by: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
---
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

