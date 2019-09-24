Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FE24BC1FB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Sep 2019 08:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394352AbfIXGrL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Sep 2019 02:47:11 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:58004 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2390247AbfIXGrL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Sep 2019 02:47:11 -0400
X-IronPort-AV: E=Sophos;i="5.64,543,1559487600"; 
   d="scan'208";a="27111712"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 24 Sep 2019 15:47:09 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9D49C40078A7;
        Tue, 24 Sep 2019 15:47:06 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] dt-bindings: mmc: renesas_sdhi: Add r8a774b1 support
Date:   Tue, 24 Sep 2019 07:46:55 +0100
Message-Id: <1569307615-38914-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document RZ/G2N (R8A774B1) SoC bindings.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 Documentation/devicetree/bindings/mmc/renesas,sdhi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.txt b/Documentation/devicetree/bindings/mmc/renesas,sdhi.txt
index dd08d03..bc08fc4 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.txt
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.txt
@@ -11,6 +11,7 @@ Required properties:
 		"renesas,sdhi-r8a7744" - SDHI IP on R8A7744 SoC
 		"renesas,sdhi-r8a7745" - SDHI IP on R8A7745 SoC
 		"renesas,sdhi-r8a774a1" - SDHI IP on R8A774A1 SoC
+		"renesas,sdhi-r8a774b1" - SDHI IP on R8A774B1 SoC
 		"renesas,sdhi-r8a774c0" - SDHI IP on R8A774C0 SoC
 		"renesas,sdhi-r8a77470" - SDHI IP on R8A77470 SoC
 		"renesas,sdhi-mmc-r8a77470" - SDHI/MMC IP on R8A77470 SoC
-- 
2.7.4

