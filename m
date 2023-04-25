Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B55466EE507
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Apr 2023 17:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234582AbjDYPws (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Apr 2023 11:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234585AbjDYPws (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Apr 2023 11:52:48 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D685110EF;
        Tue, 25 Apr 2023 08:52:45 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,225,1677510000"; 
   d="scan'208";a="160702534"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 26 Apr 2023 00:52:45 +0900
Received: from localhost.localdomain (unknown [10.226.92.250])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 17443400EA6D;
        Wed, 26 Apr 2023 00:52:42 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH 1/2] arm64: dts: renesas: r9a07g044: Add gpu cooling device
Date:   Tue, 25 Apr 2023 16:52:36 +0100
Message-Id: <20230425155237.357592-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230425155237.357592-1-biju.das.jz@bp.renesas.com>
References: <20230425155237.357592-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add gpu cooling device for passive control.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 232910e07444..0859a6707df1 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -970,6 +970,7 @@ gpu: gpu@11840000 {
 				 <&cpg R9A07G044_GPU_ACE_RESETN>;
 			reset-names = "rst", "axi_rst", "ace_rst";
 			operating-points-v2 = <&gpu_opp_table>;
+			#cooling-cells = <2>;
 		};
 
 		gic: interrupt-controller@11900000 {
@@ -1245,6 +1246,11 @@ map0 {
 					cooling-device = <&cpu0 0 2>;
 					contribution = <1024>;
 				};
+
+				map1 {
+					trip = <&target>;
+					cooling-device = <&gpu 0 2>;
+				};
 			};
 
 			trips {
-- 
2.25.1

