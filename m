Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D56424BDD03
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Feb 2022 18:43:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379524AbiBUPtb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Feb 2022 10:49:31 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379480AbiBUPt3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Feb 2022 10:49:29 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A87A2240BF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Feb 2022 07:49:05 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:49dc:a1b5:3fe0:3d2b])
        by baptiste.telenet-ops.be with bizsmtp
        id xrp32600H3YJRAw01rp3Vj; Mon, 21 Feb 2022 16:49:03 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nMAvv-001TXJ-7w; Mon, 21 Feb 2022 16:49:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nMAvu-006Er9-Pj; Mon, 21 Feb 2022 16:49:02 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/2] arm64: dts: renesas: r8a779f0: Add pinctrl device node
Date:   Mon, 21 Feb 2022 16:48:53 +0100
Message-Id: <cf4d261ba1253879e117f1598b9f47798cbda635.1645458249.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645458249.git.geert+renesas@glider.be>
References: <cover.1645458249.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a device node for the Pin Function Controller on the Renesas R-Car
S4-8 (R8A779F0) SoC.

Note that the register block does not include registers for banks 4-7,
as they can only be accessed from the Control Domain.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Drop register banks 4-7, as they can only be accessed from the
    Control Domain.
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index 0ac8c345558efc17..f4e549867371184c 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -69,6 +69,12 @@ rwdt: watchdog@e6020000 {
 			status = "disabled";
 		};
 
+		pfc: pinctrl@e6050000 {
+			compatible = "renesas,pfc-r8a779f0";
+			reg = <0 0xe6050000 0 0x16c>, <0 0xe6050800 0 0x16c>,
+			      <0 0xe6051000 0 0x16c>, <0 0xe6051800 0 0x16c>;
+		};
+
 		cpg: clock-controller@e6150000 {
 			compatible = "renesas,r8a779f0-cpg-mssr";
 			reg = <0 0xe6150000 0 0x4000>;
-- 
2.25.1

