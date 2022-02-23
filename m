Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB594C192C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Feb 2022 17:58:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242823AbiBWQ6t (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Feb 2022 11:58:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240261AbiBWQ6t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Feb 2022 11:58:49 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9A9C922B3E;
        Wed, 23 Feb 2022 08:58:19 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.88,391,1635174000"; 
   d="scan'208";a="112142377"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 24 Feb 2022 01:58:18 +0900
Received: from localhost.localdomain (unknown [10.226.93.140])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id AE7D240A85C4;
        Thu, 24 Feb 2022 01:58:16 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: rzg2lc-smarc-som: Enable watchdog
Date:   Wed, 23 Feb 2022 16:58:13 +0000
Message-Id: <20220223165813.24833-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable watchdog{0, 1, 2} interfaces on RZ/G2LC SMARC EVK.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
index 90cb7ec45751..88a7938017aa 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
@@ -206,3 +206,17 @@
 };
 #endif
 
+&wdt0 {
+	status = "okay";
+	timeout-sec = <60>;
+};
+
+&wdt1 {
+	status = "okay";
+	timeout-sec = <60>;
+};
+
+&wdt2 {
+	status = "okay";
+	timeout-sec = <60>;
+};
-- 
2.17.1

