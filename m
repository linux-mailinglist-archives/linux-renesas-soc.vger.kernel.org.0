Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16FDD65204D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Dec 2022 13:20:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232561AbiLTMUN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Dec 2022 07:20:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbiLTMUM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Dec 2022 07:20:12 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F49BD6B
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Dec 2022 04:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=7I/fbB6eEjsrfu4Vt9pvVF6hB7l
        L+rBV6oSDWowtwMw=; b=UB6jhmIeUNwKeSVAP9O/BSB701eoDBb5HYVxbdX8ZAg
        v7lherKp5hA1tffN2/XJ0QrNHCm4/AEBhGUETIm3ZV73S1RiM3gv/qh5GWb9Dao9
        h5VjsR3x8VqW4jztoHYPnbkKp7unLZ4nCvjpLhJOEx7sgaz4O0baMKcmztkCEM+M
        =
Received: (qmail 376199 invoked from network); 20 Dec 2022 13:20:07 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2022 13:20:07 +0100
X-UD-Smtp-Session: l3s3148p1@hNfPdEHwJNsujnuM
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] arm64: dts: renesas: spider-cpu: add i2c0 bus
Date:   Tue, 20 Dec 2022 13:19:59 +0100
Message-Id: <20221220121959.45779-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the bus and the GPIO expander connected to it. Based on BSP patches
by LUU HOAI and Phong Hoang.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
index 045d70535519..48a8f80d5962 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
@@ -67,6 +67,21 @@ &hscif0 {
 	status = "okay";
 };
 
+&i2c0 {
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <400000>;
+
+	gpio@20 {
+		compatible = "ti,tca9554";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
 &i2c4 {
 	pinctrl-0 = <&i2c4_pins>;
 	pinctrl-names = "default";
@@ -112,6 +127,11 @@ hscif0_pins: hscif0 {
 		function = "hscif0";
 	};
 
+	i2c0_pins: i2c0 {
+		groups = "i2c0";
+		function = "i2c0";
+	};
+
 	i2c4_pins: i2c4 {
 		groups = "i2c4";
 		function = "i2c4";
-- 
2.35.1

