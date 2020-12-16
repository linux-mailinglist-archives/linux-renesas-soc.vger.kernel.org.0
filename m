Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 984B82DC4ED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 18:02:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbgLPRBu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Dec 2020 12:01:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726825AbgLPRBu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Dec 2020 12:01:50 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77EE3C06179C;
        Wed, 16 Dec 2020 09:01:10 -0800 (PST)
Received: from localhost.localdomain (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E4B00AD5;
        Wed, 16 Dec 2020 18:00:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608138028;
        bh=wHiC2BQsgXvFl8Kn5VbTYR3ObteXkcEGLXwMiuGoBPk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rOXiw269jakil8LnZIcQGYHMJux08T7bAOO/2LQy48zMBoCfmpmo06i449HYld2b1
         XxioT7oQfcfRIW62Ta6Iybkvu3VZCFDtH4PIM7kiRmK2Vv5UkeMwIQGw29La2SqXz9
         Owy/qXxKlZfId2ITzvbfewIW6r7RDQ9NWBgXVpVk=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 3/3] arm64: dts: renesas: r8a779a0: Add VSPX support
Date:   Wed, 16 Dec 2020 17:00:18 +0000
Message-Id: <20201216170018.861710-4-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201216170018.861710-1-kieran.bingham+renesas@ideasonboard.com>
References: <20201216170018.861710-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Provide VSP-X support on the V3U.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
The FCPvX is not yet connected here, as the clock domains are unclear
for that.

The register mapping space is kept at 0x8000 for now as this is a bit of
an unknown entity (with the IIF) so playing it safe and keeping the same
value as the BSP (0x8000) - however with no CLU on these nodes, I expect
the register space to be suitable to be mapped at length 0x4000.

 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 36 +++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index a23b4ce2e5f4..4fb28df5cd6b 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -155,6 +155,42 @@ vspd1: vsp@fea28000 {
 			renesas,fcp = <&fcpvd1>;
 		};
 
+		vspx0: vsp@fedd0000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfedd0000 0 0x8000>;
+			interrupts = <GIC_SPI 600 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 1028>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 1028>;
+		};
+
+		vspx1: vsp@fedd8000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfedd8000 0 0x8000>;
+			interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 1029>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 1029>;
+		};
+
+		vspx2: vsp@fede0000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfede0000 0 0x8000>;
+			interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 1030>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 1030>;
+		};
+
+		vspx3: vsp@fede8000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfede8000 0 0x8000>;
+			interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 1031>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 1031>;
+		};
+
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
-- 
2.25.1

