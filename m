Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6198A2E3674
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Dec 2020 12:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727163AbgL1L2q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Dec 2020 06:28:46 -0500
Received: from www.zeus03.de ([194.117.254.33]:37764 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727035AbgL1L2k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Dec 2020 06:28:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=CLhOPFEJVR+TzA
        e+nHEahGEsCwUVk3be+Yt7VkTUhBc=; b=Np0/W1/xSiNUAnBvuXz7AB5RQpqO9K
        C3natCMXeQHAVJiT3pDPaJfzPIhV9S28kUVBP9QDlEFsBNM9tUfxfwyvEGbUkLoz
        tGCe/N56UVSMnlw+JjwPm6EdH5CO1pPvtrNDHsBFklY/LowHlILfi0Ay+ntWdLYR
        MdBpxjSQQC03w=
Received: (qmail 1739157 invoked from network); 28 Dec 2020 12:27:19 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Dec 2020 12:27:19 +0100
X-UD-Smtp-Session: l3s3148p1@YteUjoS30JQgAwDPXwIpAOUwDQytQs2L
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] WIP: arm64: dts: renesas: falcon: switch to from SCIF0 to HSCIF0
Date:   Mon, 28 Dec 2020 12:27:13 +0100
Message-Id: <20201228112715.14947-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228112715.14947-1-wsa+renesas@sang-engineering.com>
References: <20201228112715.14947-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Mainly for testing the HSCIF0 node. We could make this switch permanent,
but we never did for any other SoC. So, I think this is not to be
applied.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
index 54763c73dc74..e2bbaa7a72e3 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
@@ -14,7 +14,7 @@ / {
 	compatible = "renesas,falcon-breakout", "renesas,falcon-cpu", "renesas,r8a779a0";
 
 	aliases {
-		serial0 = &scif0;
+		serial0 = &hscif0;
 	};
 
 	chosen {
@@ -352,9 +352,9 @@ mmc_pins: mmc {
 		power-source = <1800>;
 	};
 
-	scif0_pins: scif0 {
-		groups = "scif0_data", "scif0_ctrl";
-		function = "scif0";
+	hscif0_pins: hscif0 {
+		groups = "hscif0_data", "hscif0_ctrl";
+		function = "hscif0";
 	};
 
 	scif_clk_pins: scif_clk {
@@ -369,7 +369,11 @@ &rwdt {
 };
 
 &scif0 {
-	pinctrl-0 = <&scif0_pins>;
+	status = "disabled";
+};
+
+&hscif0 {
+	pinctrl-0 = <&hscif0_pins>;
 	pinctrl-names = "default";
 
 	uart-has-rtscts;
-- 
2.29.2

