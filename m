Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D3AF54CAD5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jun 2022 16:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245344AbiFOOEk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jun 2022 10:04:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344965AbiFOOEj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jun 2022 10:04:39 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 050286414
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jun 2022 07:04:37 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:5439:2bcc:4a70:48e8])
        by xavier.telenet-ops.be with bizsmtp
        id jS4a270074lJ8fu01S4asJ; Wed, 15 Jun 2022 16:04:35 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1o1TdJ-0044rH-J1; Wed, 15 Jun 2022 16:04:33 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1o1TdJ-006xwg-0w; Wed, 15 Jun 2022 16:04:33 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Dien Pham <dien.pham.ry@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: Fix thermal-sensors on single-zone sensors
Date:   Wed, 15 Jun 2022 16:04:26 +0200
Message-Id: <28b812fdd1fc3698311fac984ab8b91d3d655c1c.1655301684.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

"make dtbs_check":

    arch/arm64/boot/dts/renesas/r8a774c0-cat874.dtb: thermal-zones: cpu-thermal:thermal-sensors: [[74], [0]] is too long
    arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: thermal-zones: cpu-thermal:thermal-sensors: [[79], [0]] is too long
    arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb: thermal-zones: cpu-thermal:thermal-sensors: [[82], [0]] is too long
    arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb: thermal-zones: cpu-thermal:thermal-sensors: [[87], [0]] is too long
    arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: thermal-zones: cpu-thermal:thermal-sensors: [[105], [0]] is too long
	    From schema: Documentation/devicetree/bindings/thermal/thermal-zones.yaml

Indeed, the thermal sensors on R-Car E3 and RZ/G2E support only a single
zone, hence #thermal-sensor-cells = <0>.

Fix this by dropping the bogus zero cell from the thermal sensor
specifiers.

Fixes: 8fa7d18f9ee2dc20 ("arm64: dts: renesas: r8a77990: Create thermal zone to support IPA")
Fixes: 8438bfda9d768157 ("arm64: dts: renesas: r8a774c0: Create thermal zone to support IPA")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.20.

 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index 90588bbff7e0b8e8..c563d26a7a71cc33 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -1952,7 +1952,7 @@ thermal-zones {
 		cpu-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <0>;
-			thermal-sensors = <&thermal 0>;
+			thermal-sensors = <&thermal>;
 			sustainable-power = <717>;
 
 			cooling-maps {
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 4c7c7feed7026778..565e9d85946e6f7f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -2129,7 +2129,7 @@ thermal-zones {
 		cpu-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <0>;
-			thermal-sensors = <&thermal 0>;
+			thermal-sensors = <&thermal>;
 			sustainable-power = <717>;
 
 			cooling-maps {
-- 
2.25.1

