Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7598338936
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Mar 2021 10:51:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232952AbhCLJuj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Mar 2021 04:50:39 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:27116 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233167AbhCLJuh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Mar 2021 04:50:37 -0500
X-IronPort-AV: E=Sophos;i="5.81,243,1610377200"; 
   d="scan'208";a="74722972"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 12 Mar 2021 18:50:36 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 160C540BF9CC;
        Fri, 12 Mar 2021 18:50:36 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, yusuke.goda.sx@renesas.com,
        devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 1/2] dt-bindings: net: can: rcar_can: Document r8a77961 support
Date:   Fri, 12 Mar 2021 18:50:29 +0900
Message-Id: <20210312095030.534957-2-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312095030.534957-1-yoshihiro.shimoda.uh@renesas.com>
References: <20210312095030.534957-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document SoC specific bindings for R-Car M3-W+ (r8a77961) SoC.

Also as R8A7796 is now called R8A77960 so that update those
references.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/net/can/rcar_can.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/can/rcar_can.txt b/Documentation/devicetree/bindings/net/can/rcar_can.txt
index 6a5956347816..90ac4fef23f5 100644
--- a/Documentation/devicetree/bindings/net/can/rcar_can.txt
+++ b/Documentation/devicetree/bindings/net/can/rcar_can.txt
@@ -19,7 +19,8 @@ Required properties:
 	      "renesas,can-r8a7793" if CAN controller is a part of R8A7793 SoC.
 	      "renesas,can-r8a7794" if CAN controller is a part of R8A7794 SoC.
 	      "renesas,can-r8a7795" if CAN controller is a part of R8A7795 SoC.
-	      "renesas,can-r8a7796" if CAN controller is a part of R8A7796 SoC.
+	      "renesas,can-r8a7796" if CAN controller is a part of R8A77960 SoC.
+	      "renesas,can-r8a77961" if CAN controller is a part of R8A77961 SoC.
 	      "renesas,can-r8a77965" if CAN controller is a part of R8A77965 SoC.
 	      "renesas,can-r8a77990" if CAN controller is a part of R8A77990 SoC.
 	      "renesas,can-r8a77995" if CAN controller is a part of R8A77995 SoC.
@@ -40,7 +41,7 @@ Required properties:
 - pinctrl-names: must be "default".
 
 Required properties for R8A774A1, R8A774B1, R8A774C0, R8A774E1, R8A7795,
-R8A7796, R8A77965, R8A77990, and R8A77995:
+R8A77960, R8A77961, R8A77965, R8A77990, and R8A77995:
 For the denoted SoCs, "clkp2" can be CANFD clock. This is a div6 clock and can
 be used by both CAN and CAN FD controller at the same time. It needs to be
 scaled to maximum frequency if any of these controllers use it. This is done
-- 
2.25.1

