Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF8D49B46F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jan 2022 14:00:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236854AbiAYM7V (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jan 2022 07:59:21 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:50363 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1348073AbiAYM4N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jan 2022 07:56:13 -0500
X-IronPort-AV: E=Sophos;i="5.88,314,1635174000"; 
   d="scan'208";a="108236321"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 25 Jan 2022 21:56:12 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E935C4002631;
        Tue, 25 Jan 2022 21:56:11 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org, will@kernel.org, robh+dt@kernel.org
Cc:     iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/2] dt-bindings: iommu: renesas,ipmmu-vmsa: add r8a779f0 support
Date:   Tue, 25 Jan 2022 21:56:01 +0900
Message-Id: <20220125125602.4144793-2-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125125602.4144793-1-yoshihiro.shimoda.uh@renesas.com>
References: <20220125125602.4144793-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the compatible values for the IPMMU-VMSA blocks in
the Renesas R-Car S4-8 (R8A779F0) SoC and R-Car Gen4.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 .../devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
index ce0c715205c6..5159a87f3fa7 100644
--- a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
+++ b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
@@ -44,6 +44,10 @@ properties:
               - renesas,ipmmu-r8a77990 # R-Car E3
               - renesas,ipmmu-r8a77995 # R-Car D3
               - renesas,ipmmu-r8a779a0 # R-Car V3U
+      - items:
+          - enum:
+              - renesas,ipmmu-r8a779f0 # R-Car S4-8
+          - const: renesas,rcar-gen4-ipmmu-vmsa  # R-Car Gen4
 
   reg:
     maxItems: 1
-- 
2.25.1

