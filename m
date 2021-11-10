Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C61A44C8C6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Nov 2021 20:16:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232896AbhKJTTS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Nov 2021 14:19:18 -0500
Received: from www.zeus03.de ([194.117.254.33]:55096 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232838AbhKJTTM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Nov 2021 14:19:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=86vzeTOhO8TvXP
        queZTaibtj1+9DyANjAGdg4lC/5ZI=; b=UK+A4QSkZAoOam2dfaSsjeKlgPw3rc
        Mw964lLobqjYDn2xMqLS0RYYFktauj0bvYM7vLPTQU0ShYzj2KzBNhP9pLz8enZs
        sWCdEmMuPCcQQaxi14+fiE/INaLd7/ukZNIm6nRcycbUmJAUEcwDUjC1GoYN8cyL
        8egVen9H3jJt0=
Received: (qmail 722610 invoked from network); 10 Nov 2021 20:16:22 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2021 20:16:22 +0100
X-UD-Smtp-Session: l3s3148p1@jMXAD3TQ4pogAwDPXwnKAAv7bcN/CGzA
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-mmc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH v2 10/21] arm64: dts: reneas: r8a774c0: add SDnH clocks
Date:   Wed, 10 Nov 2021 20:15:59 +0100
Message-Id: <20211110191610.5664-11-wsa+renesas@sang-engineering.com>
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
Changes since RFC v1:
* new patch

 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index d597772c4c37..5e16f6b1771e 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -1626,7 +1626,8 @@ sdhi0: mmc@ee100000 {
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee100000 0 0x2000>;
 			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 314>;
+			clocks = <&cpg CPG_MOD 314>, <&cpg CPG_CORE R8A774C0_CLK_SD0H>;
+			clock-names = "core", "clkh";
 			max-frequency = <200000000>;
 			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
 			resets = <&cpg 314>;
@@ -1638,7 +1639,8 @@ sdhi1: mmc@ee120000 {
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee120000 0 0x2000>;
 			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 313>;
+			clocks = <&cpg CPG_MOD 313>, <&cpg CPG_CORE R8A774C0_CLK_SD1H>;
+			clock-names = "core", "clkh";
 			max-frequency = <200000000>;
 			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
 			resets = <&cpg 313>;
@@ -1650,7 +1652,8 @@ sdhi3: mmc@ee160000 {
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee160000 0 0x2000>;
 			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 311>;
+			clocks = <&cpg CPG_MOD 311>, <&cpg CPG_CORE R8A774C0_CLK_SD3H>;
+			clock-names = "core", "clkh";
 			max-frequency = <200000000>;
 			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
 			resets = <&cpg 311>;
-- 
2.30.2

