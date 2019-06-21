Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD4834E2B7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbfFUJLb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:11:31 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33354 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbfFUJLb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:11:31 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1D76C25BE36;
        Fri, 21 Jun 2019 19:11:23 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 2B0D4940C81; Fri, 21 Jun 2019 11:11:19 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 7/9] dt-bindings: can: rcar_canfd: document r8a774c0 support
Date:   Fri, 21 Jun 2019 11:11:14 +0200
Message-Id: <c908fd08692b8b4d87524762218652df6922386d.1561107729.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1561107729.git.horms+renesas@verge.net.au>
References: <cover.1561107729.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Document the support for rcar_canfd on R8A774C0 SoC devices.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/net/can/rcar_canfd.txt | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/can/rcar_canfd.txt b/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
index 41049fed5872..32f051f6d338 100644
--- a/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
+++ b/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
@@ -3,7 +3,8 @@ Renesas R-Car CAN FD controller Device Tree Bindings
 
 Required properties:
 - compatible: Must contain one or more of the following:
-  - "renesas,rcar-gen3-canfd" for R-Car Gen3 compatible controller.
+  - "renesas,rcar-gen3-canfd" for R-Car Gen3 and RZ/G2 compatible controllers.
+  - "renesas,r8a774c0-canfd" for R8A774C0 (RZ/G2E) compatible controller.
   - "renesas,r8a7795-canfd" for R8A7795 (R-Car H3) compatible controller.
   - "renesas,r8a7796-canfd" for R8A7796 (R-Car M3-W) compatible controller.
   - "renesas,r8a77965-canfd" for R8A77965 (R-Car M3-N) compatible controller.
@@ -28,12 +29,13 @@ The name of the child nodes are "channel0" and "channel1" respectively. Each
 child node supports the "status" property only, which is used to
 enable/disable the respective channel.
 
-Required properties for "renesas,r8a7795-canfd", "renesas,r8a7796-canfd",
-"renesas,r8a77965-canfd" and "renesas,r8a77990-canfd" compatible:
-In R8A7795, R8A7796, R8A77965 and R8A77990 SoCs, canfd clock is a div6 clock
-and can be used by both CAN and CAN FD controller at the same time. It needs
-to be scaled to maximum frequency if any of these controllers use it. This is
-done using the below properties:
+Required properties for "renesas,r8a774c0-canfd", "renesas,r8a7795-canfd",
+"renesas,r8a7796-canfd", "renesas,r8a77965-canfd", and "renesas,r8a77990-canfd"
+compatible:
+In R8A774C0, R8A7795, R8A7796, R8A77965, and R8A77990 SoCs, canfd clock is a
+div6 clock and can be used by both CAN and CAN FD controller at the same time.
+It needs to be scaled to maximum frequency if any of these controllers use it.
+This is done using the below properties:
 
 - assigned-clocks: phandle of canfd clock.
 - assigned-clock-rates: maximum frequency of this clock.
-- 
2.11.0

