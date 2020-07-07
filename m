Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 493F6216C66
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2020 13:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgGGL7I (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Jul 2020 07:59:08 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:13305 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727044AbgGGL7I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jul 2020 07:59:08 -0400
X-IronPort-AV: E=Sophos;i="5.75,323,1589209200"; 
   d="scan'208";a="51527859"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 07 Jul 2020 20:59:06 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5B2A642325ED;
        Tue,  7 Jul 2020 20:59:06 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, robh+dt@kernel.org
Cc:     linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v5 1/2] dt-bindings: mmc: Add full-pwr-cycle-in-suspend property
Date:   Tue,  7 Jul 2020 20:58:41 +0900
Message-Id: <1594123122-13156-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594123122-13156-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1594123122-13156-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The commit 5a36d6bcdf23 ("mmc: core: Add DT-bindings for
MMC_CAP2_FULL_PWR_CYCLE") added the "full-pwr-cycle" property which
is possible to perform a full power cycle of the card at any time.

However, some environment (like r8a77951-salvator-xs) is possible
to perform a full power cycle of the card in suspend via firmware
(PSCI on arm-trusted-firmware). So, add a new property for such
environment.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/mmc/mmc-controller.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
index 4931fab..b96da0c 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
@@ -169,6 +169,11 @@ properties:
     description:
       Full power cycle of the card is supported.
 
+  full-pwr-cycle-in-suspend:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Full power cycle of the card in suspend is supported.
+
   mmc-ddr-1_2v:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
-- 
2.7.4

