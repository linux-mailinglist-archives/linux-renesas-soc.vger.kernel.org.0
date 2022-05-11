Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9739A523085
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 May 2022 12:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242051AbiEKKOd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 May 2022 06:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241657AbiEKKO1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 May 2022 06:14:27 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBF38222402
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 May 2022 03:14:12 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9c1:6ba7:bb0d:8433])
        by albert.telenet-ops.be with bizsmtp
        id VNEA2700h1sk9zo06NEAZw; Wed, 11 May 2022 12:14:11 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nojMA-003iep-DD; Wed, 11 May 2022 12:14:10 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nojM9-004e6O-Jy; Wed, 11 May 2022 12:14:09 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>, Adam Ford <aford173@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: beacon: Fix regulator node names
Date:   Wed, 11 May 2022 12:14:06 +0200
Message-Id: <a9ac82bdf108162487289d091c53a9b3de393f13.1652263918.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Currently there are two nodes named "regulator_camera".  This causes the
former to be overwritten by the latter.

Fix this by renaming them to unique names, using the preferred hyphen
instead of an underscore.

While at it, update the name of the audio regulator (which was added in
the same commit) to use a hyphen.

Fixes: a1d8a344f1ca0709 ("arm64: dts: renesas: Introduce r8a774a1-beacon-rzg2m-kit")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.20.

 arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index 142e7ffbd2bd4281..63e7a39e100e367c 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -146,7 +146,7 @@ rgb_panel: endpoint {
 		};
 	};
 
-	reg_audio: regulator_audio {
+	reg_audio: regulator-audio {
 		compatible = "regulator-fixed";
 		regulator-name = "audio-1.8V";
 		regulator-min-microvolt = <1800000>;
@@ -174,7 +174,7 @@ reg_lcd_reset: regulator-lcd-reset {
 		vin-supply = <&reg_lcd>;
 	};
 
-	reg_cam0: regulator_camera {
+	reg_cam0: regulator-cam0 {
 		compatible = "regulator-fixed";
 		regulator-name = "reg_cam0";
 		regulator-min-microvolt = <1800000>;
@@ -183,7 +183,7 @@ reg_cam0: regulator_camera {
 		enable-active-high;
 	};
 
-	reg_cam1: regulator_camera {
+	reg_cam1: regulator-cam1 {
 		compatible = "regulator-fixed";
 		regulator-name = "reg_cam1";
 		regulator-min-microvolt = <1800000>;
-- 
2.25.1

