Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16A107E5C51
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Nov 2023 18:22:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232272AbjKHRWt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Nov 2023 12:22:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232501AbjKHRWs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Nov 2023 12:22:48 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 62268E8;
        Wed,  8 Nov 2023 09:22:46 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.03,286,1694703600"; 
   d="scan'208";a="186045096"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 09 Nov 2023 02:22:45 +0900
Received: from localhost.localdomain (unknown [10.226.92.247])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4B0E1400294E;
        Thu,  9 Nov 2023 02:22:42 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 2/2] arm64: dts: renesas: rzg2lc-smarc-som: Enable 4-bit tx support
Date:   Wed,  8 Nov 2023 17:22:32 +0000
Message-Id: <20231108172232.259301-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231108172232.259301-1-biju.das.jz@bp.renesas.com>
References: <20231108172232.259301-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable 4-bit tx support for sbc node.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3->v4:
 * Rebased and tested with latest renesas-devel.
v2->v3:
 * Added Rb tag from Geert.
v2:
 * New patch
---
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
index 56ff92453976..5e4209d6fb42 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
@@ -241,6 +241,7 @@ flash@0 {
 		m25p,fast-read;
 		spi-max-frequency = <50000000>;
 		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
 
 		partitions {
 			compatible = "fixed-partitions";
-- 
2.25.1

