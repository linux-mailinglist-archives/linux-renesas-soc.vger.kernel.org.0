Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 032B56F5399
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 May 2023 10:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbjECIqi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 3 May 2023 04:46:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbjECIqi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 May 2023 04:46:38 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E2FE946AF;
        Wed,  3 May 2023 01:46:36 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,246,1677510000"; 
   d="scan'208";a="158019857"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 May 2023 17:46:36 +0900
Received: from localhost.localdomain (unknown [10.226.92.153])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 30C5441C691B;
        Wed,  3 May 2023 17:46:33 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH RFC 6/6] arm64: dts: renesas: rzg2l-smarc-som: Enable PMIC and built-in RTC
Date:   Wed,  3 May 2023 09:46:08 +0100
Message-Id: <20230503084608.14008-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230503084608.14008-1-biju.das.jz@bp.renesas.com>
References: <20230503084608.14008-1-biju.das.jz@bp.renesas.com>
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

Enable PMIC RAA215300 and the built-in RTC on the RZ/{G2L,V2L} SMARC
EVK.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
index fbbb4f03440b..c9805d76ebb0 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
@@ -351,3 +351,19 @@ &wdt1 {
 	status = "okay";
 	timeout-sec = <60>;
 };
+
+&i2c3 {
+	pmic: raa215300@12 {
+		compatible = "renesas,raa215300";
+		reg = <0x12>;
+
+		renesas,raa215300-rtc = <&rtc_raa215300>;
+	};
+
+	rtc_raa215300: rtc@6f {
+		compatible = "renesas,raa215300-isl1208";
+		reg = <0x6f>;
+
+		renesas,raa215300-pmic = <&pmic>;
+	};
+};
-- 
2.25.1

