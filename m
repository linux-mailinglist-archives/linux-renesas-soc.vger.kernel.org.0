Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 272247CD732
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Oct 2023 10:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbjJRI5L (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Oct 2023 04:57:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjJRI5H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Oct 2023 04:57:07 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B87319D;
        Wed, 18 Oct 2023 01:57:04 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.03,234,1694703600"; 
   d="scan'208";a="183503689"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 18 Oct 2023 17:57:01 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 74DA340116A7;
        Wed, 18 Oct 2023 17:57:01 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
        bhelgaas@google.com, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, jingoohan1@gmail.com,
        gustavo.pimentel@synopsys.com, mani@kernel.org
Cc:     marek.vasut+renesas@gmail.com, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v25 09/15] dt-bindings: PCI: dwc: Update maxItems of reg and reg-names
Date:   Wed, 18 Oct 2023 17:56:25 +0900
Message-Id: <20231018085631.1121289-10-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231018085631.1121289-1-yoshihiro.shimoda.uh@renesas.com>
References: <20231018085631.1121289-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Update maxItems of reg and reg-names on both host and endpoint
for supporting Renesas R-Car Gen4 PCIe controllers later.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pci/snps,dw-pcie-common.yaml          | 4 ++--
 Documentation/devicetree/bindings/pci/snps,dw-pcie-ep.yaml    | 4 ++--
 Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml       | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
index d87e13496834..dc05761c5cf9 100644
--- a/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
+++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
@@ -33,11 +33,11 @@ properties:
       specific for each activated function, while the rest of the sub-spaces
       are common for all of them (if there are more than one).
     minItems: 2
-    maxItems: 6
+    maxItems: 7
 
   reg-names:
     minItems: 2
-    maxItems: 6
+    maxItems: 7
 
   interrupts:
     description:
diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie-ep.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie-ep.yaml
index 8fc2151691a4..bbdb01d22848 100644
--- a/Documentation/devicetree/bindings/pci/snps,dw-pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie-ep.yaml
@@ -33,11 +33,11 @@ properties:
       normal controller functioning. iATU memory IO region is also required
       if the space is unrolled (IP-core version >= 4.80a).
     minItems: 2
-    maxItems: 5
+    maxItems: 7
 
   reg-names:
     minItems: 2
-    maxItems: 5
+    maxItems: 7
     items:
       oneOf:
         - description:
diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
index 8bbdeb8821f8..022055edbf9e 100644
--- a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
@@ -42,11 +42,11 @@ properties:
       are required for the normal controller work. iATU memory IO region is
       also required if the space is unrolled (IP-core version >= 4.80a).
     minItems: 2
-    maxItems: 5
+    maxItems: 7
 
   reg-names:
     minItems: 2
-    maxItems: 5
+    maxItems: 7
     items:
       oneOf:
         - description:
-- 
2.25.1

