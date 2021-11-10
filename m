Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB4B44C8D0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Nov 2021 20:16:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232912AbhKJTTU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Nov 2021 14:19:20 -0500
Received: from www.zeus03.de ([194.117.254.33]:55170 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232690AbhKJTTP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Nov 2021 14:19:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=HQ2iypZIxhUd15
        ApWsyV70eUctYifZ/5xcxHxQ/F190=; b=rr7booJNMsFZ/AXUdl1kZ16YbPTBXc
        6Stq7uVSg/K2Zdt54/hetdcvfpxOSxcTf0ehlPZKVEmWGPddMYvF/s0Rl0KskknH
        p9ugnbhEm59h4cpOaz6mei904D0jUeHGI4w5xmfMHqVTK79yQNI9ONrEtCzOTe7l
        P81ZQMHhuAT+E=
Received: (qmail 722717 invoked from network); 10 Nov 2021 20:16:24 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2021 20:16:24 +0100
X-UD-Smtp-Session: l3s3148p1@k+7YD3TQ6pogAwDPXwnKAAv7bcN/CGzA
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-mmc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH v2 14/21] arm64: dts: reneas: r8a77961: add SDnH clocks
Date:   Wed, 10 Nov 2021 20:16:03 +0100
Message-Id: <20211110191610.5664-15-wsa+renesas@sang-engineering.com>
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

 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 86d59e7e1a87..1c1da6d7be49 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -2312,7 +2312,8 @@ sdhi0: mmc@ee100000 {
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee100000 0 0x2000>;
 			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 314>;
+			clocks = <&cpg CPG_MOD 314>, <&cpg CPG_CORE R8A77961_CLK_SD0H>;
+			clock-names = "core", "clkh";
 			max-frequency = <200000000>;
 			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
 			resets = <&cpg 314>;
@@ -2325,7 +2326,8 @@ sdhi1: mmc@ee120000 {
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee120000 0 0x2000>;
 			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 313>;
+			clocks = <&cpg CPG_MOD 313>, <&cpg CPG_CORE R8A77961_CLK_SD1H>;
+			clock-names = "core", "clkh";
 			max-frequency = <200000000>;
 			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
 			resets = <&cpg 313>;
@@ -2338,7 +2340,8 @@ sdhi2: mmc@ee140000 {
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee140000 0 0x2000>;
 			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 312>;
+			clocks = <&cpg CPG_MOD 312>, <&cpg CPG_CORE R8A77961_CLK_SD2H>;
+			clock-names = "core", "clkh";
 			max-frequency = <200000000>;
 			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
 			resets = <&cpg 312>;
@@ -2351,7 +2354,8 @@ sdhi3: mmc@ee160000 {
 				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee160000 0 0x2000>;
 			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 311>;
+			clocks = <&cpg CPG_MOD 311>, <&cpg CPG_CORE R8A77961_CLK_SD3H>;
+			clock-names = "core", "clkh";
 			max-frequency = <200000000>;
 			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
 			resets = <&cpg 311>;
-- 
2.30.2

