Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C862E245953
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Aug 2020 21:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729788AbgHPTdf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 16 Aug 2020 15:33:35 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:50188 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729688AbgHPTde (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Aug 2020 15:33:34 -0400
X-IronPort-AV: E=Sophos;i="5.76,321,1592838000"; 
   d="scan'208";a="54478726"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 Aug 2020 04:33:32 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 073AB40D5476;
        Mon, 17 Aug 2020 04:33:30 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH 1/3] ARM: dts: r8a7742-iwg21m: Sort the nodes alphabetically
Date:   Sun, 16 Aug 2020 20:33:14 +0100
Message-Id: <20200816193316.7641-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200816193316.7641-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200816193316.7641-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Sort the DT nodes alphabetically so that its easier to maintain.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
---
 arch/arm/boot/dts/r8a7742-iwg21m.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7742-iwg21m.dtsi b/arch/arm/boot/dts/r8a7742-iwg21m.dtsi
index 85aff429d408..6e8df79bea94 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21m.dtsi
+++ b/arch/arm/boot/dts/r8a7742-iwg21m.dtsi
@@ -35,13 +35,6 @@
 	clock-frequency = <20000000>;
 };
 
-&pfc {
-	mmc1_pins: mmc1 {
-		groups = "mmc1_data4", "mmc1_ctrl";
-		function = "mmc1";
-	};
-};
-
 &mmcif1 {
 	pinctrl-0 = <&mmc1_pins>;
 	pinctrl-names = "default";
@@ -51,3 +44,10 @@
 	non-removable;
 	status = "okay";
 };
+
+&pfc {
+	mmc1_pins: mmc1 {
+		groups = "mmc1_data4", "mmc1_ctrl";
+		function = "mmc1";
+	};
+};
-- 
2.17.1

