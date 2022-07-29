Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C624E5853C1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Jul 2022 18:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236390AbiG2QpN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Jul 2022 12:45:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237880AbiG2QpL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Jul 2022 12:45:11 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 581131AE
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Jul 2022 09:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=N3xwwUSvhUKFp6
        2amWEkDmHn6HzYLvNNtsdbVg3RoVE=; b=3wZhLgd95GzUjMEb49M4dCjxiXRedU
        oty1bL3oidob8yOgbRejcZGIuQk3iMX1GWTaMgRFHC4xhVOBuXHSoj/0RvB/DHpX
        NGWmIOZc4CWlHxENpRQOXU8kgmS1QPmU5zoMz/DTBKBVR8qahl6hcx+u6pOnZy4P
        QoDsamdcB1GN8=
Received: (qmail 4012188 invoked from network); 29 Jul 2022 18:45:04 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jul 2022 18:45:04 +0200
X-UD-Smtp-Session: l3s3148p1@xq0EX/TkSsJScWOH
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 4/5] arm64: dts: renesas: r8a77990: put I2C aliases to board files
Date:   Fri, 29 Jul 2022 18:44:24 +0200
Message-Id: <20220729164425.11062-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220729164425.11062-1-wsa+renesas@sang-engineering.com>
References: <20220729164425.11062-1-wsa+renesas@sang-engineering.com>
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

I2C aliases are not a property of a SoC. They belong to board files
where they are named accordingly in the schematics.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/ebisu.dtsi    |  8 ++++++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 11 -----------
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts/renesas/ebisu.dtsi
index 8fc03491a11c..bbc29452d1be 100644
--- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
+++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
@@ -13,6 +13,14 @@ / {
 	compatible = "renesas,ebisu";
 
 	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
+		i2c7 = &i2c7;
 		serial0 = &scif2;
 		ethernet0 = &avb;
 		mmc0 = &sdhi3;
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 565e9d85946e..3053b4b21497 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -14,17 +14,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		i2c0 = &i2c0;
-		i2c1 = &i2c1;
-		i2c2 = &i2c2;
-		i2c3 = &i2c3;
-		i2c4 = &i2c4;
-		i2c5 = &i2c5;
-		i2c6 = &i2c6;
-		i2c7 = &i2c7;
-	};
-
 	/*
 	 * The external audio clocks are configured as 0 Hz fixed frequency
 	 * clocks by default.
-- 
2.35.1

