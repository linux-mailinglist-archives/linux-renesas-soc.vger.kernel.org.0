Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8C574E303
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbfFUJQo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:16:44 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34780 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbfFUJQo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:16:44 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id ACC2325BE36;
        Fri, 21 Jun 2019 19:16:36 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id D621D940F24; Fri, 21 Jun 2019 11:16:32 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 09/53] arm64: dts: renesas: draak: Remove unnecessary index from vin4 port
Date:   Fri, 21 Jun 2019 11:15:47 +0200
Message-Id: <c7d4df305ca4ddd8747691f9133b9611579d0b4e.1561107232.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1561107232.git.horms+renesas@verge.net.au>
References: <cover.1561107232.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The ports node of vin4 only has one sub-node and thus does
not need #address-cells/#size-cells and the sub-node does
not need an exit.

This addresses the following warning:

 # make dtbs W=1
 ...
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts:492.8-503.4: Warning (graph_child_address): /soc/video@e6ef4000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

Fixes: 6a0942c20f5c ("arm64: dts: renesas: draak: Describe CVBS input")
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index a7dc11e36fd9..6189a55de999 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -511,12 +511,7 @@
 	status = "okay";
 
 	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@0 {
-			reg = <0>;
-
+		port {
 			vin4_in: endpoint {
 				remote-endpoint = <&adv7180_out>;
 			};
-- 
2.11.0

