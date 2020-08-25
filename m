Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0F0C251AAC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Aug 2020 16:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbgHYOTH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Aug 2020 10:19:07 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:1778 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726095AbgHYOTH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Aug 2020 10:19:07 -0400
X-IronPort-AV: E=Sophos;i="5.76,352,1592838000"; 
   d="scan'208";a="55488784"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Aug 2020 23:19:05 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A58324005E3F;
        Tue, 25 Aug 2020 23:19:03 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH 1/2] dt-bindings: iommu: renesas,ipmmu-vmsa: Add r8a7742 support
Date:   Tue, 25 Aug 2020 15:18:04 +0100
Message-Id: <20200825141805.27105-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200825141805.27105-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200825141805.27105-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document RZ/G1H (R8A7742) SoC bindings.

No driver change is needed due to the fallback compatible value
"renesas,ipmmu-vmsa".

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
---
 Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
index 6bfa090fd73a..a79b172b75cb 100644
--- a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
+++ b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
@@ -20,6 +20,7 @@ properties:
       - items:
           - enum:
               - renesas,ipmmu-r8a73a4  # R-Mobile APE6
+              - renesas,ipmmu-r8a7742  # RZ/G1H
               - renesas,ipmmu-r8a7743  # RZ/G1M
               - renesas,ipmmu-r8a7744  # RZ/G1N
               - renesas,ipmmu-r8a7745  # RZ/G1E
-- 
2.17.1

