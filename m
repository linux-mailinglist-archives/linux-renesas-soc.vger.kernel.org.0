Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27E8378F96A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Sep 2023 09:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348562AbjIAH7w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Sep 2023 03:59:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347227AbjIAH7w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Sep 2023 03:59:52 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4735410DA;
        Fri,  1 Sep 2023 00:59:47 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,219,1688396400"; 
   d="scan'208";a="174709504"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Sep 2023 16:59:46 +0900
Received: from localhost.localdomain (unknown [10.226.92.203])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D070141B6D0B;
        Fri,  1 Sep 2023 16:59:43 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 2/3] arm64: dts: renesas: rzg2l-smarc-som: Enable 4-bit tx support
Date:   Fri,  1 Sep 2023 08:59:31 +0100
Message-Id: <20230901075932.105822-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230901075932.105822-1-biju.das.jz@bp.renesas.com>
References: <20230901075932.105822-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable 4-bit tx support for sbc node.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3:
 * Added Rb tag from Geert.
v2:
 * New patch
---
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
index 547859c388ce..4409c47239b9 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
@@ -312,6 +312,7 @@ flash@0 {
 		m25p,fast-read;
 		spi-max-frequency = <50000000>;
 		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
 
 		partitions {
 			compatible = "fixed-partitions";
-- 
2.25.1

