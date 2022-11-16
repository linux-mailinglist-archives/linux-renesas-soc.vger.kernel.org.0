Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8CA462B7C9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Nov 2022 11:22:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236409AbiKPKWO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Nov 2022 05:22:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238117AbiKPKV5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Nov 2022 05:21:57 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E9E4C22BF7;
        Wed, 16 Nov 2022 02:21:55 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,167,1665414000"; 
   d="scan'208";a="140240162"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 16 Nov 2022 19:21:55 +0900
Received: from localhost.localdomain (unknown [10.226.92.242])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id EE74E40029A5;
        Wed, 16 Nov 2022 19:21:52 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v4 3/3] arm64: dts: renesas: r9a09g011: Add system controller node
Date:   Wed, 16 Nov 2022 10:21:40 +0000
Message-Id: <20221116102140.852889-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221116102140.852889-1-biju.das.jz@bp.renesas.com>
References: <20221116102140.852889-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add system controller node to RZ/V2M SoC dtsi.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3->v4:
 * Added Rb tag from Geert.
v2->v3:
 * Updated commit header and description 
 * Updated label and node-names
 * system-controller node is enabled by default as it do not need external
   resources from board.
v2:
 * New patch
---
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g011.dtsi b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
index ca9f022d6632..0373ec409d54 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
@@ -130,6 +130,11 @@ cpg: clock-controller@a3500000 {
 			#power-domain-cells = <0>;
 		};
 
+		sys: system-controller@a3f03000 {
+			compatible = "renesas,r9a09g011-sys";
+			reg = <0 0xa3f03000 0 0x400>;
+		};
+
 		i2c0: i2c@a4030000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.25.1

