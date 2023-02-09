Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 981936911E3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Feb 2023 21:08:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbjBIUIx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Feb 2023 15:08:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjBIUIw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Feb 2023 15:08:52 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A89886B35E
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Feb 2023 12:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=/KPlUrmJ8FeUR+TrJOVzWbfa+P2
        6yl8/YrZ523BMWys=; b=W3DwNQ/1c5X+nuvbwmufEyuU1Tm+oFufVBfIbQ2WjQz
        FvCg+/S/X2AZXpCpU5hL22H2BXqQVrWlQt50Y671cDUPI8Grr0XOywor97BD/94t
        /HLUVrwWZtZItnPn83oQWEUmbZJ6yaJfcxe4VMZWfE9UpoUHGlfPUqVRdC7b5g8o
        =
Received: (qmail 1661693 invoked from network); 9 Feb 2023 21:07:41 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Feb 2023 21:07:41 +0100
X-UD-Smtp-Session: l3s3148p1@2BCx7kn0lpwujnuq
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] arm64: dts: renesas: r8a779f0: use proper labels for thermal zones
Date:   Thu,  9 Feb 2023 21:07:35 +0100
Message-Id: <20230209200735.3882-1-wsa+renesas@sang-engineering.com>
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

The documentation provides information about the placement of the zones,
so that can be used for more descriptive labels.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Inspired by Geert's thermal nodes for V4H. Thanks!

 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index f20b612b2b9a..e0f4ab20ae63 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -1119,7 +1119,7 @@ prr: chipid@fff00044 {
 	};
 
 	thermal-zones {
-		sensor_thermal1: sensor1-thermal {
+		sensor_thermal_rtcore: sensor1-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 			thermal-sensors = <&tsc 0>;
@@ -1133,7 +1133,7 @@ sensor1_crit: sensor1-crit {
 			};
 		};
 
-		sensor_thermal2: sensor2-thermal {
+		sensor_thermal_apcore0: sensor2-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 			thermal-sensors = <&tsc 1>;
@@ -1147,7 +1147,7 @@ sensor2_crit: sensor2-crit {
 			};
 		};
 
-		sensor_thermal3: sensor3-thermal {
+		sensor_thermal_apcore4: sensor3-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 			thermal-sensors = <&tsc 2>;
-- 
2.35.1

