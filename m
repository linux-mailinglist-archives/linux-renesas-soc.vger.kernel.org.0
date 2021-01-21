Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 389622FE847
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jan 2021 12:03:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729083AbhAULCR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Jan 2021 06:02:17 -0500
Received: from www.zeus03.de ([194.117.254.33]:34632 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730065AbhAULBK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Jan 2021 06:01:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=YqOi36rxngmg9I
        7UHw0ysZAk6h7vPgYPUtwnt8rA7ZY=; b=OU9DvUqAAiJqEZZ7U+RlYxL2tuZ2qH
        SsMc7STcArjhzQmsKNXuLiyzh44WB8LhOo26x7Um57z0vdf1MF1y2uIaM/XI49C+
        Fhe1RC+ODAA25a73nngyy+p6HHvSjMnb05vVY0qgz0ArKL17UEZwxZfoUrEMF1pD
        RhK373mdKz3JI=
Received: (qmail 1815239 invoked from network); 21 Jan 2021 12:00:15 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jan 2021 12:00:15 +0100
X-UD-Smtp-Session: l3s3148p1@GNn5+Wa5HL8gAwDPXyX1ACWcscxtZ2TX
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 4/4] HACK: make hscif0 console
Date:   Thu, 21 Jan 2021 12:00:08 +0100
Message-Id: <20210121110008.15894-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121110008.15894-1-wsa+renesas@sang-engineering.com>
References: <20210121110008.15894-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Just for testing, not for upstream!

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Changes since v1:
* marked explicitly as HACK

 arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 12 ++++++++----
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts      |  2 +-
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
index 1a36239cdc5d..60cc460612ab 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
@@ -372,9 +372,9 @@ mmc_pins: mmc {
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
@@ -384,7 +384,11 @@ scif_clk_pins: scif_clk {
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
diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
index 5617b81dd7dc..9a129e6a78b6 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
@@ -14,7 +14,7 @@ / {
 
 	aliases {
 		ethernet0 = &avb0;
-		serial0 = &scif0;
+		serial0 = &hscif0;
 	};
 
 	chosen {
-- 
2.29.2

