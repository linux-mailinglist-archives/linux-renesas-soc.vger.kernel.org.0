Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3804C59F7E4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Aug 2022 12:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235665AbiHXKfh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Aug 2022 06:35:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234401AbiHXKf0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Aug 2022 06:35:26 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1054F79ECB
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2022 03:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=RHR26u4fRC/NX/
        7Z8Zgm3lMBweVcr9knTqi3LFCnimc=; b=YmHjVl2FBAlt8kuO7ntbcNTl2aNQVO
        bMP46uZcMBdM4OjirOVaHcBQDltlaK6iVuOWQepR3MLkwE0LW9S1VvKtuspu77vk
        So///GWkrGNPCADZTL1KNCxgPGoIvvQX/qPQG6bzM/wYN1Wc6DL4mDUzUS5wm76s
        yqGIUhzhxkW/w=
Received: (qmail 2180882 invoked from network); 24 Aug 2022 12:35:23 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Aug 2022 12:35:23 +0200
X-UD-Smtp-Session: l3s3148p1@WJz7PPrmiLMgAwDPXxw3AFlguiwjsjwa
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 3/4] arm64: dts: renesas: spider-cpu: Add MSIOF node
Date:   Wed, 24 Aug 2022 12:35:14 +0200
Message-Id: <20220824103515.54931-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220824103515.54931-1-wsa+renesas@sang-engineering.com>
References: <20220824103515.54931-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
index 8075959cccee..f4428a35a548 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
@@ -101,6 +101,12 @@ &mmc0 {
 	status = "okay";
 };
 
+&msiof0 {
+	pinctrl-0 = <&msiof0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &pfc {
 	pinctrl-0 = <&scif_clk_pins>;
 	pinctrl-names = "default";
@@ -116,6 +122,12 @@ mmc_pins: mmc {
 		power-source = <1800>;
 	};
 
+	msiof0_pins: msiof0 {
+		groups = "msiof0_clk", "msiof0_sync", "msiof0_rxd",
+			 "msiof0_txd", "msiof0_ss1", "msiof0_ss2";
+		function = "msiof0";
+	};
+
 	scif0_pins: scif0 {
 		groups = "scif0_data", "scif0_ctrl";
 		function = "scif0";
-- 
2.35.1

