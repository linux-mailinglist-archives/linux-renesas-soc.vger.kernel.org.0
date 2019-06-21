Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DAF84E2B5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbfFUJL3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:11:29 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33354 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbfFUJL3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:11:29 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 20B9025BE02;
        Fri, 21 Jun 2019 19:11:21 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 1B2D7940B38; Fri, 21 Jun 2019 11:11:19 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Marek Vasut <marek.vasut@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 6/9] dt-bindings: can: rcar_canfd: document r8a77990 support
Date:   Fri, 21 Jun 2019 11:11:13 +0200
Message-Id: <485dccb48f7590939c6dee794e0a30512926c830.1561107729.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1561107729.git.horms+renesas@verge.net.au>
References: <cover.1561107729.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marek Vasut <marek.vasut@gmail.com>

Document the support for rcar_canfd on R8A77990 SoC devices.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Acked-by: David S. Miller <davem@davemloft.net>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/net/can/rcar_canfd.txt | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/can/rcar_canfd.txt b/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
index 4720e916fbdd..41049fed5872 100644
--- a/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
+++ b/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
@@ -9,6 +9,7 @@ Required properties:
   - "renesas,r8a77965-canfd" for R8A77965 (R-Car M3-N) compatible controller.
   - "renesas,r8a77970-canfd" for R8A77970 (R-Car V3M) compatible controller.
   - "renesas,r8a77980-canfd" for R8A77980 (R-Car V3H) compatible controller.
+  - "renesas,r8a77990-canfd" for R8A77990 (R-Car E3) compatible controller.
 
   When compatible with the generic version, nodes must list the
   SoC-specific version corresponding to the platform first, followed by the
@@ -27,12 +28,12 @@ The name of the child nodes are "channel0" and "channel1" respectively. Each
 child node supports the "status" property only, which is used to
 enable/disable the respective channel.
 
-Required properties for "renesas,r8a7795-canfd", "renesas,r8a7796-canfd" and
-"renesas,r8a77965-canfd" compatible:
-In R8A7795, R8A7796 and R8A77965 SoCs, canfd clock is a div6 clock and can
-be used by both CAN and CAN FD controller at the same time. It needs to be
-scaled to maximum frequency if any of these controllers use it. This is done
-using the below properties:
+Required properties for "renesas,r8a7795-canfd", "renesas,r8a7796-canfd",
+"renesas,r8a77965-canfd" and "renesas,r8a77990-canfd" compatible:
+In R8A7795, R8A7796, R8A77965 and R8A77990 SoCs, canfd clock is a div6 clock
+and can be used by both CAN and CAN FD controller at the same time. It needs
+to be scaled to maximum frequency if any of these controllers use it. This is
+done using the below properties:
 
 - assigned-clocks: phandle of canfd clock.
 - assigned-clock-rates: maximum frequency of this clock.
-- 
2.11.0

