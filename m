Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC9D770FF56
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 May 2023 22:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbjEXUfk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 May 2023 16:35:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjEXUfi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 May 2023 16:35:38 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1647B187
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 May 2023 13:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=9zUTPBIZ0+/hXfD6pdDuI9zs89C
        qNB+WTt9Ggdlcuz0=; b=Jhzh7A/9utEB7F1JlWgRGjpso6D0DuVa3PbemW3iJpE
        Q8Q3CeOMJDCqMGbeKd+Nu13x4fDlonVJqNqcNE71NpxLfoY8fDe1r+jwge+OCCDG
        92iHGo6JweFe6aMcG/TxGfOVdjPhcdsrF7or9V1x4tgFHbypL7fWPfFGKhbD2HV8
        =
Received: (qmail 3245492 invoked from network); 24 May 2023 22:35:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 May 2023 22:35:29 +0200
X-UD-Smtp-Session: l3s3148p1@JReYcXb84J8ujnsI
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] arm64: dts: renesas: ulcb-kf: add HSCIF1 node
Date:   Wed, 24 May 2023 22:35:20 +0200
Message-Id: <20230524203520.1354-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Exposed on CN4. Tested by connecting it to a Renesas Ebisu board. Also,
remove flow control for SCIF1. The schematics are misleading, the flow
control is for HSCIF1. SCIF1 (for GPS) does not use flow control.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I extracted the removal of SCIF1 flow control from the GPS patches
because I think that actually belongs here.

 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index ff3a9ab6e6b0..e62f5359f64b 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -10,6 +10,7 @@ / {
 	aliases {
 		serial1 = &hscif0;
 		serial2 = &scif1;
+		serial3 = &hscif1;
 		mmc2 = &sdhi3;
 	};
 
@@ -132,6 +133,14 @@ &hscif0 {
 	status = "okay";
 };
 
+&hscif1 {
+	pinctrl-0 = <&hscif1_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+
+	status = "okay";
+};
+
 &hsusb {
 	dr_mode = "otg";
 	status = "okay";
@@ -387,8 +396,13 @@ hscif0_pins: hscif0 {
 		function = "hscif0";
 	};
 
+	hscif1_pins: hscif1 {
+		groups = "hscif1_data_a", "hscif1_ctrl_a";
+		function = "hscif1";
+	};
+
 	scif1_pins: scif1 {
-		groups = "scif1_data_b", "scif1_ctrl";
+		groups = "scif1_data_b";
 		function = "scif1";
 	};
 
@@ -418,7 +432,6 @@ &sound_clk_pins
 &scif1 {
 	pinctrl-0 = <&scif1_pins>;
 	pinctrl-names = "default";
-	uart-has-rtscts;
 
 	status = "okay";
 };
-- 
2.30.2

