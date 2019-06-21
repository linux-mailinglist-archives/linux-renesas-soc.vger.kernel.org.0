Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C77434E300
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbfFUJQl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:16:41 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34780 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbfFUJQl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:16:41 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 8726825BE01;
        Fri, 21 Jun 2019 19:16:34 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 81A6D9408C4; Fri, 21 Jun 2019 11:16:32 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 05/53] arm64: dts: renesas: r8a774a1: Tie Audio-DMAC to IPMMU-MP
Date:   Fri, 21 Jun 2019 11:15:43 +0200
Message-Id: <01712eaa0d969cc347a5146c6efd0a1ec67a6372.1561107232.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1561107232.git.horms+renesas@verge.net.au>
References: <cover.1561107232.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Biju Das <biju.das@bp.renesas.com>

Hook up r8a774a1 Audio-DMAC nodes to the IPMMU-MP.

Based on work for the r8a7795 by Magnus Damm.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index 92b5e92427af..99a3a76cf940 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -1653,6 +1653,14 @@
 			resets = <&cpg 502>;
 			#dma-cells = <1>;
 			dma-channels = <16>;
+			iommus = <&ipmmu_mp 0>, <&ipmmu_mp 1>,
+			       <&ipmmu_mp 2>, <&ipmmu_mp 3>,
+			       <&ipmmu_mp 4>, <&ipmmu_mp 5>,
+			       <&ipmmu_mp 6>, <&ipmmu_mp 7>,
+			       <&ipmmu_mp 8>, <&ipmmu_mp 9>,
+			       <&ipmmu_mp 10>, <&ipmmu_mp 11>,
+			       <&ipmmu_mp 12>, <&ipmmu_mp 13>,
+			       <&ipmmu_mp 14>, <&ipmmu_mp 15>;
 		};
 
 		audma1: dma-controller@ec720000 {
@@ -1687,6 +1695,14 @@
 			resets = <&cpg 501>;
 			#dma-cells = <1>;
 			dma-channels = <16>;
+			iommus = <&ipmmu_mp 16>, <&ipmmu_mp 17>,
+			       <&ipmmu_mp 18>, <&ipmmu_mp 19>,
+			       <&ipmmu_mp 20>, <&ipmmu_mp 21>,
+			       <&ipmmu_mp 22>, <&ipmmu_mp 23>,
+			       <&ipmmu_mp 24>, <&ipmmu_mp 25>,
+			       <&ipmmu_mp 26>, <&ipmmu_mp 27>,
+			       <&ipmmu_mp 28>, <&ipmmu_mp 29>,
+			       <&ipmmu_mp 30>, <&ipmmu_mp 31>;
 		};
 
 		xhci0: usb@ee000000 {
-- 
2.11.0

