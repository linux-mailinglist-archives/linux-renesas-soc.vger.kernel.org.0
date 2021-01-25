Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 720883022AD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Jan 2021 09:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbhAYIJM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Jan 2021 03:09:12 -0500
Received: from www.zeus03.de ([194.117.254.33]:50422 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727243AbhAYIAX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Jan 2021 03:00:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=9wPIw0rzjWZi/8
        ymCQjoYEb19bczxKoJx3Rd627F0w4=; b=nczvnkV2y40RC+T8V8aw3CNbqPFXz+
        zAr1/hlnBu63x7+Scwljrgl8yz5cKYntfKbt7BOg9CAgFHGEbTh+n5Qe2YT4mTCc
        FA1qIqa4mzTQhg2X7xP1Bs4RmjU2+pt+o6TUD5ydXCk21Fz1uCw+g1u9BbcnwZgS
        V1Gy1xWhtFWf4=
Received: (qmail 3246842 invoked from network); 25 Jan 2021 08:58:48 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jan 2021 08:58:48 +0100
X-UD-Smtp-Session: l3s3148p1@hZBk6LS5etJUhs5S
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 1/2] arm64: dts: renesas: r8a779a0: Add MMC node
Date:   Mon, 25 Jan 2021 08:58:44 +0100
Message-Id: <20210125075845.3864-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210125075845.3864-1-wsa+renesas@sang-engineering.com>
References: <20210125075845.3864-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Saito <takeshi.saito.xv@renesas.com>

Add a device node for MMC.

Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
[wsa: double checked & rebased]
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v2: added tags

 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 4671a5840ae1..45b4ea1965d4 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -816,6 +816,18 @@ dmac2: dma-controller@e7351000 {
 			dma-channels = <8>;
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

