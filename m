Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60AB7B74E6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Sep 2019 10:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731572AbfISIRc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Sep 2019 04:17:32 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:30251 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731373AbfISIRc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Sep 2019 04:17:32 -0400
X-IronPort-AV: E=Sophos;i="5.64,522,1559487600"; 
   d="scan'208";a="26979413"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 19 Sep 2019 17:17:31 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id DB41B41F812C;
        Thu, 19 Sep 2019 17:17:28 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 3/8] dt-bindings: reset: rcar-rst: Document r8a774b1 reset module
Date:   Thu, 19 Sep 2019 09:17:11 +0100
Message-Id: <1568881036-4404-4-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568881036-4404-1-git-send-email-biju.das@bp.renesas.com>
References: <1568881036-4404-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document bindings for the RZ/G2N (R8A774B1) reset module.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
V1-->V2
* No change
---
 Documentation/devicetree/bindings/reset/renesas,rst.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rst.txt b/Documentation/devicetree/bindings/reset/renesas,rst.txt
index b03c48a..d6d6769 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rst.txt
+++ b/Documentation/devicetree/bindings/reset/renesas,rst.txt
@@ -20,6 +20,7 @@ Required properties:
 		  - "renesas,r8a7745-rst" (RZ/G1E)
 		  - "renesas,r8a77470-rst" (RZ/G1C)
 		  - "renesas,r8a774a1-rst" (RZ/G2M)
+		  - "renesas,r8a774b1-rst" (RZ/G2N)
 		  - "renesas,r8a774c0-rst" (RZ/G2E)
 		  - "renesas,r8a7778-reset-wdt" (R-Car M1A)
 		  - "renesas,r8a7779-reset-wdt" (R-Car H1)
-- 
2.7.4

