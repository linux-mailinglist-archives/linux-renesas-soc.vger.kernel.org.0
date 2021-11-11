Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE23C44D661
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Nov 2021 13:11:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233128AbhKKMOr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Nov 2021 07:14:47 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:44547 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232855AbhKKMOq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Nov 2021 07:14:46 -0500
X-IronPort-AV: E=Sophos;i="5.87,226,1631545200"; 
   d="scan'208";a="100233917"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Nov 2021 21:11:57 +0900
Received: from localhost.localdomain (unknown [10.226.93.91])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1F7914017D75;
        Thu, 11 Nov 2021 21:11:54 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/4] arm64: dts: renesas: r9a07g044: Sort psci node
Date:   Thu, 11 Nov 2021 12:11:43 +0000
Message-Id: <20211111121144.11131-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211111121144.11131-1-biju.das.jz@bp.renesas.com>
References: <20211111121144.11131-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Sort psci node alphabetically.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 485ef5f0fea1..43a5d359519a 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -42,11 +42,6 @@
 		clock-frequency = <0>;
 	};
 
-	psci {
-		compatible = "arm,psci-1.0", "arm,psci-0.2";
-		method = "smc";
-	};
-
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -85,6 +80,11 @@
 		};
 	};
 
+	psci {
+		compatible = "arm,psci-1.0", "arm,psci-0.2";
+		method = "smc";
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
-- 
2.17.1

