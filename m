Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A51774E330
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbfFUJRf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:17:35 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34780 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbfFUJRf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:17:35 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 914AF25BECB;
        Fri, 21 Jun 2019 19:16:43 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 1119D943086; Fri, 21 Jun 2019 11:16:34 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 25/53] arm64: dts: renesas: r8a77965: Add dynamic power coefficient
Date:   Fri, 21 Jun 2019 11:16:03 +0200
Message-Id: <eb2cd8c259d4593d6a75118f4671bcf9f5e11365.1561107232.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1561107232.git.horms+renesas@verge.net.au>
References: <cover.1561107232.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe the dynamic power coefficient of A57 and A53 CPUs.

Based on work by Gaku Inami <gaku.inami.xw@bp.renesas.com> and others.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index d4aefe2dee94..131f895ab778 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -112,6 +112,7 @@
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
 			#cooling-cells = <2>;
+			dynamic-power-coefficient = <854>;
 			clocks = <&cpg CPG_CORE R8A77965_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
 		};
-- 
2.11.0

