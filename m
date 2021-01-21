Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8BF2FE6E3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jan 2021 10:58:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728643AbhAUJ5G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Jan 2021 04:57:06 -0500
Received: from www.zeus03.de ([194.117.254.33]:44350 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728660AbhAUJzj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Jan 2021 04:55:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=S23/6IH6mMP1gG
        7Mi/iePoE9Y/66Unwh+87/OWIr8Do=; b=JjepgR1VmYKcwGhNw9U76a2lOokGzK
        fqa94h7Vd4Z1sp14EgAvPY91dlbj7/BDZrp4IqbM6y5P3Bj0yuGOuW4MhMrtANSt
        WNEeLAKGwLqF7Wc/CmGsd5ibS5wbDO2XGkSGT7F2XkZPQZCvuInvAZkzSuruJ2cv
        6tP3Iuw37oluU=
Received: (qmail 1784098 invoked from network); 21 Jan 2021 10:54:29 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jan 2021 10:54:29 +0100
X-UD-Smtp-Session: l3s3148p1@8Y/DDma5oL4gAwDPXyX1ACWcscxtZ2TX
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-clk@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH V2 3/4] arm64: dts: renesas: Add I2C0,1,6 support for falcon board
Date:   Thu, 21 Jan 2021 10:54:19 +0100
Message-Id: <20210121095420.5023-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121095420.5023-1-wsa+renesas@sang-engineering.com>
References: <20210121095420.5023-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v1:
* enabled busses 0,1,6 (the ones with devices attached)
* moved to falcon-cpu.dtsi

 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
index 4ba269a4cec8..90aa1395a49f 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
@@ -41,6 +41,47 @@ &extalr_clk {
 	clock-frequency = <32768>;
 };
 
+&i2c0 {
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <400000>;
+};
+
+&i2c1 {
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <400000>;
+};
+
+&i2c6 {
+	pinctrl-0 = <&i2c6_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <400000>;
+};
+
+&pfc {
+	i2c0_pins: i2c0 {
+		groups = "i2c0";
+		function = "i2c0";
+	};
+
+	i2c1_pins: i2c1 {
+		groups = "i2c1";
+		function = "i2c1";
+	};
+
+	i2c6_pins: i2c6 {
+		groups = "i2c6";
+		function = "i2c6";
+	};
+};
+
 &scif0 {
 	status = "okay";
 };
-- 
2.29.2

