Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 790822403ED
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Aug 2020 11:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725846AbgHJJWO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Aug 2020 05:22:14 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:35017 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726029AbgHJJWO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Aug 2020 05:22:14 -0400
X-IronPort-AV: E=Sophos;i="5.75,457,1589209200"; 
   d="scan'208";a="54286662"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Aug 2020 18:22:13 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id F35E641EF621;
        Mon, 10 Aug 2020 18:22:11 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a774e1: Add FCPF and FCPV instances
Date:   Mon, 10 Aug 2020 10:22:07 +0100
Message-Id: <20200810092208.27320-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200810092208.27320-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200810092208.27320-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Add FCPF and FCPV instances to the r8a774e1 dtsi.

Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 64 +++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index d08a1385dc27..1954a07f3e85 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -2374,6 +2374,70 @@
 			status = "disabled";
 		};
 
+		fcpf0: fcp@fe950000 {
+			compatible = "renesas,fcpf";
+			reg = <0 0xfe950000 0 0x200>;
+			clocks = <&cpg CPG_MOD 615>;
+			power-domains = <&sysc R8A774E1_PD_A3VP>;
+			resets = <&cpg 615>;
+		};
+
+		fcpf1: fcp@fe951000 {
+			compatible = "renesas,fcpf";
+			reg = <0 0xfe951000 0 0x200>;
+			clocks = <&cpg CPG_MOD 614>;
+			power-domains = <&sysc R8A774E1_PD_A3VP>;
+			resets = <&cpg 614>;
+		};
+
+		fcpvb0: fcp@fe96f000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfe96f000 0 0x200>;
+			clocks = <&cpg CPG_MOD 607>;
+			power-domains = <&sysc R8A774E1_PD_A3VP>;
+			resets = <&cpg 607>;
+		};
+
+		fcpvb1: fcp@fe92f000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfe92f000 0 0x200>;
+			clocks = <&cpg CPG_MOD 606>;
+			power-domains = <&sysc R8A774E1_PD_A3VP>;
+			resets = <&cpg 606>;
+		};
+
+		fcpvi0: fcp@fe9af000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfe9af000 0 0x200>;
+			clocks = <&cpg CPG_MOD 611>;
+			power-domains = <&sysc R8A774E1_PD_A3VP>;
+			resets = <&cpg 611>;
+		};
+
+		fcpvi1: fcp@fe9bf000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfe9bf000 0 0x200>;
+			clocks = <&cpg CPG_MOD 610>;
+			power-domains = <&sysc R8A774E1_PD_A3VP>;
+			resets = <&cpg 610>;
+		};
+
+		fcpvd0: fcp@fea27000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfea27000 0 0x200>;
+			clocks = <&cpg CPG_MOD 603>;
+			power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
+			resets = <&cpg 603>;
+		};
+
+		fcpvd1: fcp@fea2f000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfea2f000 0 0x200>;
+			clocks = <&cpg CPG_MOD 602>;
+			power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
+			resets = <&cpg 602>;
+		};
+
 		csi20: csi2@fea80000 {
 			compatible = "renesas,r8a774e1-csi2";
 			reg = <0 0xfea80000 0 0x10000>;
-- 
2.17.1

