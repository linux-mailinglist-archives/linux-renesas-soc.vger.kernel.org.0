Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F8482E1FE4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Dec 2020 18:26:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727929AbgLWRZ5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Dec 2020 12:25:57 -0500
Received: from www.zeus03.de ([194.117.254.33]:42378 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727081AbgLWRZy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Dec 2020 12:25:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=lSUnbTnuG6v7lp
        mPTLqmkE++DDngZBiT+R/x6s0T9ZI=; b=QLsdOwunjT2fLIDHbi+wl6x6AFGR7E
        Vz0nRcnHuNG1nSnmnA8eyBWXDX7ghShzYWvW7uw70yslsk7vgyIvE4Cdllk+Z+8Z
        pde8TQAq0qRtzrGuQ2+xQ+4YO34AP7+Cn5CO/nlgArm2j6PmGEdJl9VChk2ufqeQ
        4ewb9BHiSD4oU=
Received: (qmail 544713 invoked from network); 23 Dec 2020 18:25:11 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Dec 2020 18:25:11 +0100
X-UD-Smtp-Session: l3s3148p1@GRg4+SS30OdUhszw
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] v3u: enable other I2C busses for testing
Date:   Wed, 23 Dec 2020 18:25:04 +0100
Message-Id: <20201223172505.34736-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201223172505.34736-1-wsa+renesas@sang-engineering.com>
References: <20201223172505.34736-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Not for upstream!

Not-Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../boot/dts/renesas/r8a779a0-falcon.dts      | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
index 7de3eed96ceb..f7f62fc40429 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
@@ -37,6 +37,46 @@ &i2c1 {
 	clock-frequency = <400000>;
 };
 
+&i2c2 {
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <100000>;
+};
+
+&i2c3 {
+	pinctrl-0 = <&i2c3_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <100000>;
+};
+
+&i2c4 {
+	pinctrl-0 = <&i2c4_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <100000>;
+};
+
+&i2c5 {
+	pinctrl-0 = <&i2c5_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <100000>;
+};
+
+&i2c6 {
+	pinctrl-0 = <&i2c6_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <100000>;
+};
+
 &pfc {
 	i2c0_pins: i2c0 {
 		groups = "i2c0";
@@ -47,6 +87,31 @@ i2c1_pins: i2c1 {
 		groups = "i2c1";
 		function = "i2c1";
 	};
+
+	i2c2_pins: i2c2 {
+		groups = "i2c2";
+		function = "i2c2";
+	};
+
+	i2c3_pins: i2c3 {
+		groups = "i2c3";
+		function = "i2c3";
+	};
+
+	i2c4_pins: i2c4 {
+		groups = "i2c4";
+		function = "i2c4";
+	};
+
+	i2c5_pins: i2c5 {
+		groups = "i2c5";
+		function = "i2c5";
+	};
+
+	i2c6_pins: i2c6 {
+		groups = "i2c6";
+		function = "i2c6";
+	};
 };
 
 &rwdt {
-- 
2.28.0

