Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 778BB4E2B4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbfFUJL2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:11:28 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33354 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbfFUJL2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:11:28 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1287D25BE01;
        Fri, 21 Jun 2019 19:11:21 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 061D29408C4; Fri, 21 Jun 2019 11:11:18 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Marek Vasut <marek.vasut@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 5/9] dt-bindings: can: rcar_canfd: document r8a77965 support
Date:   Fri, 21 Jun 2019 11:11:12 +0200
Message-Id: <d04824b263480212771da4efbb34b49dc1a88d9f.1561107729.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1561107729.git.horms+renesas@verge.net.au>
References: <cover.1561107729.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marek Vasut <marek.vasut@gmail.com>

Document the support for rcar_canfd on R8A77965 SoC devices.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Acked-by: David S. Miller <davem@davemloft.net>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/net/can/rcar_canfd.txt | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/can/rcar_canfd.txt b/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
index ac71daa46195..4720e916fbdd 100644
--- a/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
+++ b/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
@@ -6,6 +6,7 @@ Required properties:
   - "renesas,rcar-gen3-canfd" for R-Car Gen3 compatible controller.
   - "renesas,r8a7795-canfd" for R8A7795 (R-Car H3) compatible controller.
   - "renesas,r8a7796-canfd" for R8A7796 (R-Car M3-W) compatible controller.
+  - "renesas,r8a77965-canfd" for R8A77965 (R-Car M3-N) compatible controller.
   - "renesas,r8a77970-canfd" for R8A77970 (R-Car V3M) compatible controller.
   - "renesas,r8a77980-canfd" for R8A77980 (R-Car V3H) compatible controller.
 
@@ -26,12 +27,12 @@ The name of the child nodes are "channel0" and "channel1" respectively. Each
 child node supports the "status" property only, which is used to
 enable/disable the respective channel.
 
-Required properties for "renesas,r8a7795-canfd" and "renesas,r8a7796-canfd"
-compatible:
-In R8A7795 and R8A7796 SoCs, canfd clock is a div6 clock and can be used by both
-CAN and CAN FD controller at the same time. It needs to be scaled to maximum
-frequency if any of these controllers use it. This is done using the below
-properties:
+Required properties for "renesas,r8a7795-canfd", "renesas,r8a7796-canfd" and
+"renesas,r8a77965-canfd" compatible:
+In R8A7795, R8A7796 and R8A77965 SoCs, canfd clock is a div6 clock and can
+be used by both CAN and CAN FD controller at the same time. It needs to be
+scaled to maximum frequency if any of these controllers use it. This is done
+using the below properties:
 
 - assigned-clocks: phandle of canfd clock.
 - assigned-clock-rates: maximum frequency of this clock.
-- 
2.11.0

