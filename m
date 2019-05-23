Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE10E27F81
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 May 2019 16:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730790AbfEWO0B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 May 2019 10:26:01 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:36994 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730719AbfEWO0A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 May 2019 10:26:00 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 267E325BE0A;
        Fri, 24 May 2019 00:25:53 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 2687D940A98; Thu, 23 May 2019 16:25:49 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v4 6/8] arm64: dts: renesas: r8a77965: Add dynamic power coefficient
Date:   Thu, 23 May 2019 16:25:42 +0200
Message-Id: <20190523142544.1273-7-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190523142544.1273-1-horms+renesas@verge.net.au>
References: <20190523142544.1273-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe the dynamic power coefficient of A57 and A53 CPUs.

Based on work by Gaku Inami <gaku.inami.xw@bp.renesas.com> and others.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

---
v4 [Simon Horman]
* Broken out of a larger patch
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index f0fe4350a970..fa7be0e5e9e8 100644
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

