Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8935B4084FB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Sep 2021 08:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237429AbhIMGys (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Sep 2021 02:54:48 -0400
Received: from www.zeus03.de ([194.117.254.33]:37170 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237453AbhIMGyr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Sep 2021 02:54:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=50At/8EnGynmGF
        YBdD49IlpeMN6V6/y6fcrS+erfZKs=; b=TAn6NEbxYzRzCc/YK/SyXjQBUUyYTz
        8k03thGng5L+JuCUdz+Jn5MtXK9K5aoNLo0h+ldFFmpuaEKsUz2qwApuqZ46qz1b
        cudv8OaEfgVGPqqTCiT3G5NVyteptDpKW4hXBoFjmjZmokj0fmOMSHfkmkuPBdP2
        46SjioXwzf7UY=
Received: (qmail 2765655 invoked from network); 13 Sep 2021 08:53:31 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Sep 2021 08:53:31 +0200
X-UD-Smtp-Session: l3s3148p1@e25K7NrL5ssgAwDPXwnUAPbX7otZ63eo
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Duc Nguyen <duc.nguyen.ub@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 3/4] arm64: dts: renesas: r8a779a0: Add RPC node
Date:   Mon, 13 Sep 2021 08:53:16 +0200
Message-Id: <20210913065317.2297-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913065317.2297-1-wsa+renesas@sang-engineering.com>
References: <20210913065317.2297-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Duc Nguyen <duc.nguyen.ub@renesas.com>

Add device node for RPC on R8A779A0 SoC.

Signed-off-by: Duc Nguyen <duc.nguyen.ub@renesas.com>
[wsa: rebased]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 78ca75f619f6..7fcb0aec68ba 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -1093,6 +1093,23 @@ mmc0: mmc@ee140000 {
 			status = "disabled";
 		};
 
+		rpc: spi@ee200000 {
+			compatible = "renesas,r8a779a0-rpc-if",
+				     "renesas,rcar-gen3-rpc-if";
+			reg = <0 0xee200000 0 0x200>,
+			      <0 0x08000000 0 0x04000000>,
+			      <0 0xee208000 0 0x100>;
+			reg-names = "regs", "dirmap", "wbuf";
+			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 629>;
+			clock-names = "rpc";
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 629>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@f1000000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.30.2

