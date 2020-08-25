Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A77E251D39
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Aug 2020 18:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgHYQ2c (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Aug 2020 12:28:32 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:56907 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726222AbgHYQ2b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Aug 2020 12:28:31 -0400
X-IronPort-AV: E=Sophos;i="5.76,353,1592838000"; 
   d="scan'208";a="55277828"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 26 Aug 2020 01:28:28 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id F16E340175FB;
        Wed, 26 Aug 2020 01:28:26 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH 1/4] ARM: dts: r8a7742-iwg21d-q7: Enable PCIe Controller
Date:   Tue, 25 Aug 2020 17:27:15 +0100
Message-Id: <20200825162718.5838-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200825162718.5838-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200825162718.5838-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable PCIe Controller and set PCIe bus clock frequency.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
---
 arch/arm/boot/dts/r8a7742-iwg21d-q7.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
index 9bf4fbd9c736..73300ab46ea6 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
@@ -238,6 +238,18 @@
 	/* status = "okay"; */
 };
 
+&pcie_bus_clk {
+	clock-frequency = <100000000>;
+};
+
+&pciec {
+	/* SW2[6] determines which connector is activated
+	 * ON = PCIe X4 (connector-J7)
+	 * OFF = mini-PCIe (connector-J26)
+	 */
+	status = "okay";
+};
+
 &pfc {
 	avb_pins: avb {
 		groups = "avb_mdio", "avb_gmii";
-- 
2.17.1

