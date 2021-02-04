Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3694730FAC7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Feb 2021 19:10:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238350AbhBDSIv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Feb 2021 13:08:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238825AbhBDSDE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Feb 2021 13:03:04 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10574C06178B
        for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Feb 2021 10:02:18 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id R62H2400W4C55Sk0162Hjs; Thu, 04 Feb 2021 19:02:17 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l7im7-003Fgj-8P; Thu, 04 Feb 2021 18:50:39 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l7eK2-006uUn-6M; Thu, 04 Feb 2021 14:05:22 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/5] ARM: dts: renesas: Group tuples in playback and capture properties
Date:   Thu,  4 Feb 2021 14:05:14 +0100
Message-Id: <20210204130517.1647073-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204130517.1647073-1-geert+renesas@glider.be>
References: <20210204130517.1647073-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To improve human readability and enable automatic validation, the tuples
in "playback" and "capture" properties in sound device nodes should be
grouped using angle brackets.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/iwg20d-q7-common.dtsi     | 4 ++--
 arch/arm/boot/dts/r8a7742-iwg21d-q7.dts     | 4 ++--
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts | 4 ++--
 arch/arm/boot/dts/r8a7790-lager.dts         | 4 ++--
 arch/arm/boot/dts/r8a7791-koelsch.dts       | 4 ++--
 arch/arm/boot/dts/r8a7793-gose.dts          | 4 ++--
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/iwg20d-q7-common.dtsi b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
index 63cafd220dba1d04..bc857676d19104a1 100644
--- a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
+++ b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
@@ -325,8 +325,8 @@ &rcar_sound {
 
 	rcar_sound,dai {
 		dai0 {
-			playback = <&ssi1 &src3 &dvc1>;
-			capture = <&ssi0 &src2 &dvc0>;
+			playback = <&ssi1>, <&src3>, <&dvc1>;
+			capture = <&ssi0>, <&src2>, <&dvc0>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
index 0063ef92f50e35f1..94bf8a116b5242a9 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
@@ -387,8 +387,8 @@ &rcar_sound {
 
 	rcar_sound,dai {
 		dai0 {
-			playback = <&ssi4 &src4 &dvc1>;
-			capture = <&ssi3 &src3 &dvc0>;
+			playback = <&ssi4>, <&src4>, <&dvc1>;
+			capture = <&ssi3>, <&src3>, <&dvc0>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
index 1c7b37a01f0ab923..73bd62d8a929e5da 100644
--- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
+++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
@@ -289,8 +289,8 @@ &rcar_sound {
 
 	rcar_sound,dai {
 		dai0 {
-			playback = <&ssi3 &src3 &dvc0>;
-			capture = <&ssi4 &src4 &dvc1>;
+			playback = <&ssi3>, <&src3>, <&dvc0>;
+			capture = <&ssi4>, <&src4>, <&dvc1>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index 09a152b9155754ac..58687f2af3c504a8 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -918,8 +918,8 @@ &rcar_sound {
 
 	rcar_sound,dai {
 		dai0 {
-			playback = <&ssi0 &src2 &dvc0>;
-			capture  = <&ssi1 &src3 &dvc1>;
+			playback = <&ssi0>, <&src2>, <&dvc0>;
+			capture  = <&ssi1>, <&src3>, <&dvc1>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
index f603cba5441fcb9e..7f58e56bcf13935e 100644
--- a/arch/arm/boot/dts/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
@@ -888,8 +888,8 @@ &rcar_sound {
 
 	rcar_sound,dai {
 		dai0 {
-			playback = <&ssi0 &src2 &dvc0>;
-			capture  = <&ssi1 &src3 &dvc1>;
+			playback = <&ssi0>, <&src2>, <&dvc0>;
+			capture  = <&ssi1>, <&src3>, <&dvc1>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/r8a7793-gose.dts b/arch/arm/boot/dts/r8a7793-gose.dts
index abf487e8fe0f366f..7516811f98e20ae7 100644
--- a/arch/arm/boot/dts/r8a7793-gose.dts
+++ b/arch/arm/boot/dts/r8a7793-gose.dts
@@ -761,8 +761,8 @@ &rcar_sound {
 
 	rcar_sound,dai {
 		dai0 {
-			playback = <&ssi0 &src2 &dvc0>;
-			capture  = <&ssi1 &src3 &dvc1>;
+			playback = <&ssi0>, <&src2>, <&dvc0>;
+			capture  = <&ssi1>, <&src3>, <&dvc1>;
 		};
 	};
 };
-- 
2.25.1

