Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8782ABB6B3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Sep 2019 16:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439869AbfIWO2l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Sep 2019 10:28:41 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:21291 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2439850AbfIWO2l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Sep 2019 10:28:41 -0400
X-IronPort-AV: E=Sophos;i="5.64,540,1559487600"; 
   d="scan'208";a="27040314"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 23 Sep 2019 23:28:39 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 54F8142121CD;
        Mon, 23 Sep 2019 23:28:37 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] dt-bindings: timer: renesas, cmt: Document r8a774b1 CMT support
Date:   Mon, 23 Sep 2019 15:28:27 +0100
Message-Id: <1569248907-62107-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document SoC specific bindings for RZ/G2N (r8a774b1) SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 Documentation/devicetree/bindings/timer/renesas,cmt.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.txt b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
index c5220bc..7b1f454 100644
--- a/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
@@ -32,6 +32,8 @@ Required Properties:
     - "renesas,r8a77470-cmt1" for the 48-bit CMT1 device included in r8a77470.
     - "renesas,r8a774a1-cmt0" for the 32-bit CMT0 device included in r8a774a1.
     - "renesas,r8a774a1-cmt1" for the 48-bit CMT1 device included in r8a774a1.
+    - "renesas,r8a774b1-cmt0" for the 32-bit CMT0 device included in r8a774b1.
+    - "renesas,r8a774b1-cmt1" for the 48-bit CMT1 device included in r8a774b1.
     - "renesas,r8a774c0-cmt0" for the 32-bit CMT0 device included in r8a774c0.
     - "renesas,r8a774c0-cmt1" for the 48-bit CMT1 device included in r8a774c0.
     - "renesas,r8a7790-cmt0" for the 32-bit CMT0 device included in r8a7790.
-- 
2.7.4

