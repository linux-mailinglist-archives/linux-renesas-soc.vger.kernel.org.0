Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9547E30FA4C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Feb 2021 18:54:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238448AbhBDRxi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Feb 2021 12:53:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238710AbhBDRxG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Feb 2021 12:53:06 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C3D1C061797
        for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Feb 2021 09:50:43 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id R5qf240094C55Sk065qfPV; Thu, 04 Feb 2021 18:50:41 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l7im7-003Fgj-3T; Thu, 04 Feb 2021 18:50:39 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l7eK2-006uUx-8Y; Thu, 04 Feb 2021 14:05:22 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/5] arm64: dts: renesas: Group tuples in playback and capture properties
Date:   Thu,  4 Feb 2021 14:05:16 +0100
Message-Id: <20210204130517.1647073-5-geert+renesas@glider.be>
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
 arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts           | 2 +-
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts            | 4 ++--
 arch/arm64/boot/dts/renesas/salvator-common.dtsi          | 4 ++--
 arch/arm64/boot/dts/renesas/ulcb.dtsi                     | 4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index 30c169b08536a59d..c88229990d422d4d 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -639,7 +639,7 @@ rsnd_endpoint0: endpoint {
 				bitclock-master = <&rsnd_endpoint0>;
 				frame-master = <&rsnd_endpoint0>;
 
-				playback = <&ssi1 &dvc1 &src1>;
+				playback = <&ssi1>, <&dvc1>, <&src1>;
 				capture = <&ssi0>;
 			};
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index ea87cb5a459c89b3..07fbbc4f4572016f 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -365,7 +365,7 @@ &rcar_sound {
 
 	rcar_sound,dai {
 		dai0 {
-			playback = <&ssi0 &src0 &dvc0>;
+			playback = <&ssi0>, <&src0>, <&dvc0>;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index f74f8b9993f1d79c..0992fff676e3dab3 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -653,8 +653,8 @@ &rcar_sound {
 
 	rcar_sound,dai {
 		dai0 {
-			playback = <&ssi0 &src0 &dvc0>;
-			capture  = <&ssi1 &src1 &dvc1>;
+			playback = <&ssi0>, <&src0>, <&dvc0>;
+			capture  = <&ssi1>, <&src1>, <&dvc1>;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 00a005776b5e7492..9a0ee01df51327f0 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -779,8 +779,8 @@ rsnd_endpoint0: endpoint {
 				bitclock-master = <&rsnd_endpoint0>;
 				frame-master = <&rsnd_endpoint0>;
 
-				playback = <&ssi0 &src0 &dvc0>;
-				capture  = <&ssi1 &src1 &dvc1>;
+				playback = <&ssi0>, <&src0>, <&dvc0>;
+				capture  = <&ssi1>, <&src1>, <&dvc1>;
 			};
 		};
 	};
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index a04eae55dd6c42dc..97e9ed93cf15cd18 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -408,8 +408,8 @@ rsnd_for_ak4613: endpoint {
 				bitclock-master = <&rsnd_for_ak4613>;
 				frame-master = <&rsnd_for_ak4613>;
 
-				playback = <&ssi0 &src0 &dvc0>;
-				capture  = <&ssi1 &src1 &dvc1>;
+				playback = <&ssi0>, <&src0>, <&dvc0>;
+				capture  = <&ssi1>, <&src1>, <&dvc1>;
 			};
 		};
 		rsnd_port1: port@1 {
-- 
2.25.1

