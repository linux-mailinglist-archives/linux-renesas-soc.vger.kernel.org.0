Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F049701854
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 May 2023 18:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbjEMQxG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 13 May 2023 12:53:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230384AbjEMQxF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 13 May 2023 12:53:05 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A6EF130C7;
        Sat, 13 May 2023 09:53:00 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,272,1677510000"; 
   d="scan'208";a="162745891"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 14 May 2023 01:52:57 +0900
Received: from localhost.localdomain (unknown [10.226.92.8])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 327B140065DF;
        Sun, 14 May 2023 01:52:54 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v3 5/5] arm64: dts: renesas: rzg2l-smarc-som: Enable PMIC and built-in RTC
Date:   Sat, 13 May 2023 17:52:27 +0100
Message-Id: <20230513165227.13117-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230513165227.13117-1-biju.das.jz@bp.renesas.com>
References: <20230513165227.13117-1-biju.das.jz@bp.renesas.com>
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
v2->v3:
 * No change.
RFC->V2:
 * Updated pmic device node based on the bindings.
---
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
index fbbb4f03440b..ffe19d2f0e37 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
@@ -351,3 +351,13 @@ &wdt1 {
 	status = "okay";
 	timeout-sec = <60>;
 };
+
+&i2c3 {
+	raa215300: pmic@12 {
+		compatible = "renesas,raa215300";
+		reg = <0x12>, <0x6f>;
+		reg-names = "main", "rtc";
+
+		renesas,rtc-enabled;
+	};
+};
-- 
2.25.1

