Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F18A2E366B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Dec 2020 12:28:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727224AbgL1L17 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Dec 2020 06:27:59 -0500
Received: from www.zeus03.de ([194.117.254.33]:37460 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727176AbgL1L17 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Dec 2020 06:27:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=W+pl0Zfqv8jJLl
        0q0jwg0xTR6yybbiXPZwQi3hWZffk=; b=yxbhuReixezQZYhggt6iM8A84/5JX3
        KXNZzmszC1fW4q5kH4YBcw3kaQixA7anxsShfcnEC1faq7xOwcWSTH9hNrUKOXX7
        InujHqmFpB0Dv+SjQXpM3T2Gk+r18lP0dRgFQH8ECAhohkC4JaDcf9GBkBGZNsvo
        1BzaYikNDz0no=
Received: (qmail 1739031 invoked from network); 28 Dec 2020 12:27:16 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Dec 2020 12:27:16 +0100
X-UD-Smtp-Session: l3s3148p1@uYxsjoS3yJQgAwDPXwIpAOUwDQytQs2L
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] arm64: dts: renesas: falcon: add SCIF0 nodes
Date:   Mon, 28 Dec 2020 12:27:09 +0100
Message-Id: <20201228112715.14947-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228112715.14947-1-wsa+renesas@sang-engineering.com>
References: <20201228112715.14947-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SCIF0 has been enabled by the firmware, so it worked already. Still, add
the proper nodes to make it work in any case.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../boot/dts/renesas/r8a779a0-falcon.dts      | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
index 0c44466d398f..54763c73dc74 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
@@ -205,6 +205,9 @@ &mmc0 {
 };
 
 &pfc {
+	pinctrl-0 = <&scif_clk_pins>;
+	pinctrl-names = "default";
+
 	avb0_pins: avb0 {
 		mux {
 			groups = "avb0_link", "avb0_mdio", "avb0_rgmii", "avb0_txcrefclk";
@@ -348,9 +351,31 @@ mmc_pins: mmc {
 		function = "mmc";
 		power-source = <1800>;
 	};
+
+	scif0_pins: scif0 {
+		groups = "scif0_data", "scif0_ctrl";
+		function = "scif0";
+	};
+
+	scif_clk_pins: scif_clk {
+		groups = "scif_clk";
+		function = "scif_clk";
+	};
 };
 
 &rwdt {
 	timeout-sec = <60>;
 	status = "okay";
 };
+
+&scif0 {
+	pinctrl-0 = <&scif0_pins>;
+	pinctrl-names = "default";
+
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&scif_clk {
+	clock-frequency = <24000000>;
+};
-- 
2.29.2

