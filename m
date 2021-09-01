Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC783FD7A3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Sep 2021 12:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235055AbhIAK2R (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Sep 2021 06:28:17 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:46532 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232997AbhIAK2Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Sep 2021 06:28:16 -0400
X-IronPort-AV: E=Sophos;i="5.84,368,1620658800"; 
   d="scan'208";a="92598117"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 01 Sep 2021 19:27:19 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 166CF400517D;
        Wed,  1 Sep 2021 19:27:19 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org, will@kernel.org, robh+dt@kernel.org
Cc:     iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/2] dt-bindings: iommu: renesas,ipmmu-vmsa: add r8a779a0 support
Date:   Wed,  1 Sep 2021 19:27:04 +0900
Message-Id: <20210901102705.556093-2-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210901102705.556093-1-yoshihiro.shimoda.uh@renesas.com>
References: <20210901102705.556093-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for r8a779a0 (R-Car V3U).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
index 02c69a95c332..ce0c715205c6 100644
--- a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
+++ b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
@@ -43,6 +43,7 @@ properties:
               - renesas,ipmmu-r8a77980 # R-Car V3H
               - renesas,ipmmu-r8a77990 # R-Car E3
               - renesas,ipmmu-r8a77995 # R-Car D3
+              - renesas,ipmmu-r8a779a0 # R-Car V3U
 
   reg:
     maxItems: 1
-- 
2.25.1

