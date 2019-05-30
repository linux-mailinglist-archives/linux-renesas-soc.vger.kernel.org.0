Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0458F2FEDB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 May 2019 17:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbfE3PFe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 May 2019 11:05:34 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:11260 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725440AbfE3PFd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 May 2019 11:05:33 -0400
X-IronPort-AV: E=Sophos;i="5.60,531,1549897200"; 
   d="scan'208";a="17391775"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 31 May 2019 00:05:31 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 79E8A428A243;
        Fri, 31 May 2019 00:05:29 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>, xu_shunji@hoperun.com,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 2/3] arm64: dts: renesas: hihope-common: Add pincontrol support to scif2/scif clock
Date:   Thu, 30 May 2019 15:57:45 +0100
Message-Id: <1559228266-16724-3-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559228266-16724-1-git-send-email-biju.das@bp.renesas.com>
References: <1559228266-16724-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds pincontrol support to scif2/scif clock.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
---
 arch/arm64/boot/dts/renesas/hihope-common.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
index 5baf532..de206b7 100644
--- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
@@ -24,7 +24,25 @@
 	clock-frequency = <32768>;
 };
 
+&pfc {
+	pinctrl-0 = <&scif_clk_pins>;
+	pinctrl-names = "default";
+
+	scif2_pins: scif2 {
+		groups = "scif2_data_a";
+		function = "scif2";
+	};
+
+	scif_clk_pins: scif_clk {
+		groups = "scif_clk_a";
+		function = "scif_clk";
+	};
+};
+
 &scif2 {
+	pinctrl-0 = <&scif2_pins>;
+	pinctrl-names = "default";
+
 	status = "okay";
 };
 
-- 
2.7.4

