Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDEF8338422
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Mar 2021 03:55:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231241AbhCLCyj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Mar 2021 21:54:39 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:12808 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231785AbhCLCyd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Mar 2021 21:54:33 -0500
X-IronPort-AV: E=Sophos;i="5.81,241,1610377200"; 
   d="scan'208";a="74673702"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 12 Mar 2021 11:54:32 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E0211418A01B;
        Fri, 12 Mar 2021 11:54:31 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, yusuke.goda.sx@renesas.com,
        devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/2] dt-bindings: net: can: rcar_can: Document r8a77961 support
Date:   Fri, 12 Mar 2021 11:54:19 +0900
Message-Id: <20210312025420.529339-2-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312025420.529339-1-yoshihiro.shimoda.uh@renesas.com>
References: <20210312025420.529339-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document SoC specific bindings for R-Car M3-W+ (r8a77961) SoC.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/net/can/rcar_can.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/can/rcar_can.txt b/Documentation/devicetree/bindings/net/can/rcar_can.txt
index 6a5956347816..75ef55aa361b 100644
--- a/Documentation/devicetree/bindings/net/can/rcar_can.txt
+++ b/Documentation/devicetree/bindings/net/can/rcar_can.txt
@@ -20,6 +20,7 @@ Required properties:
 	      "renesas,can-r8a7794" if CAN controller is a part of R8A7794 SoC.
 	      "renesas,can-r8a7795" if CAN controller is a part of R8A7795 SoC.
 	      "renesas,can-r8a7796" if CAN controller is a part of R8A7796 SoC.
+	      "renesas,can-r8a77961" if CAN controller is a part of R8A77961 SoC.
 	      "renesas,can-r8a77965" if CAN controller is a part of R8A77965 SoC.
 	      "renesas,can-r8a77990" if CAN controller is a part of R8A77990 SoC.
 	      "renesas,can-r8a77995" if CAN controller is a part of R8A77995 SoC.
-- 
2.25.1

