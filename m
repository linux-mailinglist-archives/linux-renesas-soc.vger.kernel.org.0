Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C9BE372C42
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 May 2021 16:41:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231448AbhEDOmY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 May 2021 10:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230307AbhEDOmX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 May 2021 10:42:23 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1209C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 May 2021 07:41:28 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:1ca1:e52f:3ec5:3ac5])
        by albert.telenet-ops.be with bizsmtp
        id 0ehT2500B3aEpPb06ehT2W; Tue, 04 May 2021 16:41:27 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldwEo-002nqk-TE; Tue, 04 May 2021 16:41:26 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldwEo-00HQGe-DL; Tue, 04 May 2021 16:41:26 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 1/2] ARM: dts: r8a7778: Correct internal delay for i2c[123]
Date:   Tue,  4 May 2021 16:41:24 +0200
Message-Id: <1eac63f15a776e492ff8a2d8447c5e1019982dd1.1620138979.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620138979.git.geert+renesas@glider.be>
References: <cover.1620138979.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

According to the R-Car M1A Hardware User's Manual Rev. 1.00, the LSI
internal delay for I2C instances 1 to 3 is 5 ns (typ.), which differs
from the default 50 ns as specified for instance 0.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
i2c[123] are not used in upstream DTS files.
---
 arch/arm/boot/dts/r8a7778.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7778.dtsi b/arch/arm/boot/dts/r8a7778.dtsi
index c9f8735860bf824c..95efbafb0b7077a2 100644
--- a/arch/arm/boot/dts/r8a7778.dtsi
+++ b/arch/arm/boot/dts/r8a7778.dtsi
@@ -166,6 +166,7 @@ i2c1: i2c@ffc71000 {
 		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp0_clks R8A7778_CLK_I2C1>;
 		power-domains = <&cpg_clocks>;
+		i2c-scl-internal-delay-ns = <5>;
 		status = "disabled";
 	};
 
@@ -177,6 +178,7 @@ i2c2: i2c@ffc72000 {
 		interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp0_clks R8A7778_CLK_I2C2>;
 		power-domains = <&cpg_clocks>;
+		i2c-scl-internal-delay-ns = <5>;
 		status = "disabled";
 	};
 
@@ -188,6 +190,7 @@ i2c3: i2c@ffc73000 {
 		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp0_clks R8A7778_CLK_I2C3>;
 		power-domains = <&cpg_clocks>;
+		i2c-scl-internal-delay-ns = <5>;
 		status = "disabled";
 	};
 
-- 
2.25.1

