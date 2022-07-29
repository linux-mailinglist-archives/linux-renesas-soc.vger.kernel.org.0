Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 235305853C0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Jul 2022 18:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238069AbiG2QpE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Jul 2022 12:45:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238037AbiG2QpC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Jul 2022 12:45:02 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA79582467
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Jul 2022 09:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=IS9PUvBIk2qXHV
        TNDbzjYWmqSv4xQ987pZj6W2XE0WE=; b=rXVFTXNlHOvMU7nJ2e7mtqrs291bu5
        nlxAFq595xn105+WvnV0F51ZtRbjuN7eHAdG3Z4euzBr6RZ3DZAaXiwvSnLv1ktu
        23YNTVPG6tLmTh88PyR8LEYxNPrxW4/evr0HuIfromrxlYsMZDUJHFMPdROanUME
        Phvf+9jr8txTI=
Received: (qmail 4012124 invoked from network); 29 Jul 2022 18:44:59 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jul 2022 18:44:59 +0200
X-UD-Smtp-Session: l3s3148p1@pkizXvTk45dScWOH
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 3/5] arm64: dts: renesas: r8a77980: put I2C aliases to board files
Date:   Fri, 29 Jul 2022 18:44:23 +0200
Message-Id: <20220729164425.11062-4-wsa+renesas@sang-engineering.com>
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
 arch/arm64/boot/dts/renesas/r8a77980-condor.dts | 6 ++++++
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts  | 6 ++++++
 arch/arm64/boot/dts/renesas/r8a77980.dtsi       | 9 ---------
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77980-condor.dts b/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
index 43ed033eb512..981cf4db0e54 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
@@ -15,6 +15,12 @@ / {
 	compatible = "renesas,condor", "renesas,r8a77980";
 
 	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
 		serial0 = &scif0;
 		ethernet0 = &gether;
 	};
diff --git a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
index 1d09d8867651..d168b0e7747d 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
@@ -15,6 +15,12 @@ / {
 	compatible = "renesas,v3hsk", "renesas,r8a77980";
 
 	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
 		serial0 = &scif0;
 		ethernet0 = &gether;
 	};
diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index 8594be72f221..a3af34191ca2 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -16,15 +16,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		i2c0 = &i2c0;
-		i2c1 = &i2c1;
-		i2c2 = &i2c2;
-		i2c3 = &i2c3;
-		i2c4 = &i2c4;
-		i2c5 = &i2c5;
-	};
-
 	/* External CAN clock - to be overridden by boards that provide it */
 	can_clk: can {
 		compatible = "fixed-clock";
-- 
2.35.1

