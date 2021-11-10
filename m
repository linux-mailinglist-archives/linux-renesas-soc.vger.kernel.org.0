Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB5244C8DC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Nov 2021 20:16:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232838AbhKJTTX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Nov 2021 14:19:23 -0500
Received: from www.zeus03.de ([194.117.254.33]:55246 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232963AbhKJTTU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Nov 2021 14:19:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=H6TupbfjYT9gR1
        IYdLUV/bLW1MNe013qrV9bRIq2v0o=; b=x382USPGvLoUH330biZJHc8hwy1/bm
        3ExgUNi7fPFq6yKkOfZi+vBYiolbArg7WuCUFyPCZpRisXjD5y+pGnyjq5PTpcGR
        V+LUiuAOqHvZsiGct2iuql5vscrkJ1buyfCc50cwOHfy7phmmsjfAxGR8lXf7i5W
        B+8hIlBV0uNno=
Received: (qmail 722913 invoked from network); 10 Nov 2021 20:16:27 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2021 20:16:27 +0100
X-UD-Smtp-Session: l3s3148p1@o0cGEHTQ+JogAwDPXwnKAAv7bcN/CGzA
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-mmc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH v2 21/21] arm64: dts: reneas: r8a779a0: add SDnH clocks
Date:   Wed, 10 Nov 2021 20:16:10 +0100
Message-Id: <20211110191610.5664-22-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211110191610.5664-1-wsa+renesas@sang-engineering.com>
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

There is no dependency on patches 19 or 20. This patch is only last
because I noticed only a few seconds before sending out that I
overlooked this SoC.

Changes since RFC v1:
* new patch

 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index f9a882b34f82..e3d7ef02a371 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -1097,7 +1097,8 @@ mmc0: mmc@ee140000 {
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee140000 0 0x2000>;
 			interrupts = <GIC_SPI 236 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 706>;
+			clocks = <&cpg CPG_MOD 706>, <&cpg CPG_CORE R8A779A0_CLK_SD0H>;
+			clock-names = "core", "clkh";
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
 			resets = <&cpg 706>;
 			max-frequency = <200000000>;
-- 
2.30.2

