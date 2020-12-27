Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68A022E323E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Dec 2020 18:43:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbgL0RnA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 27 Dec 2020 12:43:00 -0500
Received: from www.zeus03.de ([194.117.254.33]:46844 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726391AbgL0Rm7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 27 Dec 2020 12:42:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=2Dhy5zPo9lBjN3
        eqY3HnEvfo/6Vkx/DX480dSimr12E=; b=ibEetUp+GkaETZjy8F0X69794nSy+z
        y9VGgdnNScTYFq+dYXCsiIqPEsiy06Gzs95Gp4hSTOA6Jfa3Tan7PNDhTqf6UjRJ
        biBAA82G89vLs3S1EhZk41u8Jj8i81GqBr0tOIm7e5RFqZzB2F+gpvGWLQlp5Rw9
        nC2Rp80+zFC1I=
Received: (qmail 1557148 invoked from network); 27 Dec 2020 18:42:16 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Dec 2020 18:42:16 +0100
X-UD-Smtp-Session: l3s3148p1@ZPSgrXW3WJ5UhsuJ
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] arm64: dts: renesas: r8a779a0: Add MMC node
Date:   Sun, 27 Dec 2020 18:41:59 +0100
Message-Id: <20201227174202.40834-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201227174202.40834-1-wsa+renesas@sang-engineering.com>
References: <20201227174202.40834-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Saito <takeshi.saito.xv@renesas.com>

Add a device node for MMC.

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
[wsa: double checked & rebased]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 324deeed9078..68aaa49c3540 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -667,6 +667,18 @@ dmac1: dma-controller@e7350000 {
 			/* placeholder */
 		};
 
+		mmc0: mmc@ee140000 {
+			compatible = "renesas,sdhi-r8a779a0",
+				     "renesas,rcar-gen3-sdhi";
+			reg = <0 0xee140000 0 0x2000>;
+			interrupts = <GIC_SPI 236 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 706>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 706>;
+			max-frequency = <200000000>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@f1000000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.28.0

