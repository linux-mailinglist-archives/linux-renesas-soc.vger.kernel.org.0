Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45716B74E2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Sep 2019 10:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731259AbfISIR2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Sep 2019 04:17:28 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:47282 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727273AbfISIR2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Sep 2019 04:17:28 -0400
X-IronPort-AV: E=Sophos;i="5.64,522,1559487600"; 
   d="scan'208";a="26979394"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 19 Sep 2019 17:17:26 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 72E3C41F812F;
        Thu, 19 Sep 2019 17:17:24 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/8] dt-bindings: power: rcar-sysc: Document r8a774b1 sysc
Date:   Thu, 19 Sep 2019 09:17:09 +0100
Message-Id: <1568881036-4404-2-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568881036-4404-1-git-send-email-biju.das@bp.renesas.com>
References: <1568881036-4404-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document bindings for the RZ/G2N (a.k.a. R8A774B1) system controller.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
V1-->V2
 * No change
---
 Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt b/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
index eae2a88..712caa5 100644
--- a/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
+++ b/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
@@ -12,6 +12,7 @@ Required properties:
       - "renesas,r8a7745-sysc" (RZ/G1E)
       - "renesas,r8a77470-sysc" (RZ/G1C)
       - "renesas,r8a774a1-sysc" (RZ/G2M)
+      - "renesas,r8a774b1-sysc" (RZ/G2N)
       - "renesas,r8a774c0-sysc" (RZ/G2E)
       - "renesas,r8a7779-sysc" (R-Car H1)
       - "renesas,r8a7790-sysc" (R-Car H2)
-- 
2.7.4

