Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AF075A0997
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Aug 2022 09:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237730AbiHYHLO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Aug 2022 03:11:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237747AbiHYHK6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Aug 2022 03:10:58 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3214F74E1C
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Aug 2022 00:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=J4zHykYAR78JGx
        YCS2xMavSad507qzvxWyYOpt7j7sA=; b=y1a0DcHofdCEuw6gtSkbEtFyNW4+53
        kl7VX8eoo57v3W4LhzZMVibdotW6p3SHLjOjFEE/YoM8xoOKfvc2ipE8/MY79otu
        DytHaM/WWcQ/9fqKjOZYXaaJhUuAO9MaOktVxswBIXhx4HvkeoG023/ZqVb7GfIe
        PrhBRF/92/Nxo=
Received: (qmail 2556372 invoked from network); 25 Aug 2022 09:10:32 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Aug 2022 09:10:32 +0200
X-UD-Smtp-Session: l3s3148p1@qJg2fgvnxn8ucrTo
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 1/6] arm64: dts: renesas: r8a779{51|60|65}: put I2C aliases to board files
Date:   Thu, 25 Aug 2022 09:10:17 +0200
Message-Id: <20220825071022.7864-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825071022.7864-1-wsa+renesas@sang-engineering.com>
References: <20220825071022.7864-1-wsa+renesas@sang-engineering.com>
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

I2C aliases are not a property of a SoC. They belong to board files
where they are named accordingly in the schematics.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a77951.dtsi        | 11 -----------
 arch/arm64/boot/dts/renesas/r8a77960.dtsi        | 11 -----------
 arch/arm64/boot/dts/renesas/r8a77965.dtsi        | 11 -----------
 arch/arm64/boot/dts/renesas/salvator-common.dtsi |  8 ++++++++
 arch/arm64/boot/dts/renesas/ulcb.dtsi            |  8 ++++++++
 5 files changed, 16 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index a297af22a195..07c8763c1e77 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -21,17 +21,6 @@ / {
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
-		i2c7 = &i2c_dvfs;
-	};
-
 	/*
 	 * The external audio clocks are configured as 0 Hz fixed frequency
 	 * clocks by default.
diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index 4159c23d3874..1424d4ad941f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -16,17 +16,6 @@ / {
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
-		i2c7 = &i2c_dvfs;
-	};
-
 	/*
 	 * The external audio clocks are configured as 0 Hz fixed frequency
 	 * clocks by default.
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 21a5e1cdd9f1..997f29521f66 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -21,17 +21,6 @@ / {
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
-		i2c7 = &i2c_dvfs;
-	};
-
 	/*
 	 * The external audio clocks are configured as 0 Hz fixed frequency
 	 * clocks by default.
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index b7c7911858b2..d97473401819 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -33,6 +33,14 @@
 
 / {
 	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
+		i2c7 = &i2c_dvfs;
 		serial0 = &scif2;
 		serial1 = &hscif1;
 		ethernet0 = &avb;
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index 0772dfe4adff..29cedf4dc1a9 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -21,6 +21,14 @@ / {
 	model = "Renesas R-Car Gen3 ULCB board";
 
 	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
+		i2c7 = &i2c_dvfs;
 		serial0 = &scif2;
 		ethernet0 = &avb;
 		mmc0 = &sdhi2;
-- 
2.35.1

