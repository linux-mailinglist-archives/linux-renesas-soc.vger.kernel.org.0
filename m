Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF7824D07A1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Mar 2022 20:24:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237009AbiCGTZk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Mar 2022 14:25:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232064AbiCGTZk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 14:25:40 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C0E4D47054;
        Mon,  7 Mar 2022 11:24:45 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.90,163,1643641200"; 
   d="scan'208";a="113628964"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 08 Mar 2022 04:24:45 +0900
Received: from localhost.localdomain (unknown [10.226.92.211])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9702940DB5B4;
        Tue,  8 Mar 2022 04:24:43 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/4] arm64: dts: renesas: rzg2lc-smarc-som: Enable OSTM
Date:   Mon,  7 Mar 2022 19:24:34 +0000
Message-Id: <20220307192436.13237-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220307192436.13237-1-biju.das.jz@bp.renesas.com>
References: <20220307192436.13237-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable OSTM{1, 2} interfaces on RZ/G2LC SMARC EVK.
OSTM0 is reserved for TF-A.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
index 80c9a1146cb7..05b117ac414c 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
@@ -84,6 +84,14 @@
 	clock-frequency = <24000000>;
 };
 
+&ostm1 {
+	status = "okay";
+};
+
+&ostm2 {
+	status = "okay";
+};
+
 &pinctrl {
 	eth0_pins: eth0 {
 		pinmux = <RZG2L_PORT_PINMUX(28, 1, 1)>, /* ET0_LINKSTA */
-- 
2.17.1

