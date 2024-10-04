Return-Path: <linux-renesas-soc+bounces-9409-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5EE990427
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7087280DB1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 13:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB8B21F41F;
	Fri,  4 Oct 2024 13:22:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E85215F58
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Oct 2024 13:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728048167; cv=none; b=MUjgBVVtJHZOLUbLPb5eZinz60uNPct0SXRiFAdBhdy4XYMBTTdx/HHuQ92flRULG6UA49J6pS6IixO3aJHBxdH3CqoowoC8MTavSPeTgWJSzB+rZvBEtBWQMSznw8BNQt0ereKeBEEA3Gr+e0ED8dNok/PpDpZHEtCr3ldtX94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728048167; c=relaxed/simple;
	bh=nl1FTA/9+gkreNjHq/MSyhfLEzDguIxL1KeXS8JpMCw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GF5GnrssenO9gG6ODV8/8eVk1zvUbXqjzIMsXnWIs+C71qZRrxR/JPQChFOo6FOyIx9W2jTKkwwj/aZOxXNXvQ9R3vH4a6+bWtL2EIgLCzrVvoWPxyVbelXuELNLqQg107lJC3rVK1pvoUmp3qyy362ZVVMLGt8619IIbs1VgGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:5518:aeb:d9c0:fc7c])
	by andre.telenet-ops.be with cmsmtp
	id LDNc2D00F4NXpdT01DNcue; Fri, 04 Oct 2024 15:22:36 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swiGK-001Elb-6g;
	Fri, 04 Oct 2024 15:22:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swhnu-006yUa-IO;
	Fri, 04 Oct 2024 14:53:06 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 12/20] arm64: dts: renesas: Use interrupts-extended for Ethernet PHYs
Date: Fri,  4 Oct 2024 14:52:54 +0200
Message-Id: <e9db8758d275ec63b0d6ce086ac3d0ea62966865.1728045620.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728045620.git.geert+renesas@glider.be>
References: <cover.1728045620.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the more concise interrupts-extended property to fully describe the
interrupts.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi      | 3 +--
 arch/arm64/boot/dts/renesas/cat875.dtsi                  | 3 +--
 arch/arm64/boot/dts/renesas/condor-common.dtsi           | 3 +--
 arch/arm64/boot/dts/renesas/draak.dtsi                   | 3 +--
 arch/arm64/boot/dts/renesas/ebisu.dtsi                   | 3 +--
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi          | 3 +--
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts           | 3 +--
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts           | 3 +--
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts           | 3 +--
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts          | 3 +--
 .../arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi | 9 +++------
 arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts            | 6 ++----
 .../boot/dts/renesas/r8a779g2-white-hawk-single.dts      | 3 +--
 .../arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts | 3 +--
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi         | 6 ++----
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi        | 3 +--
 arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi        | 6 ++----
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi         | 6 ++----
 arch/arm64/boot/dts/renesas/salvator-common.dtsi         | 3 +--
 arch/arm64/boot/dts/renesas/ulcb.dtsi                    | 3 +--
 arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi   | 3 +--
 arch/arm64/boot/dts/renesas/white-hawk-ethernet.dtsi     | 6 ++----
 22 files changed, 29 insertions(+), 58 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
index 68b04e56ae56232e..5a15a956702a6be8 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
@@ -62,8 +62,7 @@ phy0: ethernet-phy@0 {
 		compatible = "ethernet-phy-id0022.1640",
 			     "ethernet-phy-ieee802.3-c22";
 		reg = <0>;
-		interrupt-parent = <&gpio2>;
-		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
 	};
 };
diff --git a/arch/arm64/boot/dts/renesas/cat875.dtsi b/arch/arm64/boot/dts/renesas/cat875.dtsi
index 8c9da8b4bd60bf32..191b051ecfd458ef 100644
--- a/arch/arm64/boot/dts/renesas/cat875.dtsi
+++ b/arch/arm64/boot/dts/renesas/cat875.dtsi
@@ -25,8 +25,7 @@ phy0: ethernet-phy@0 {
 		compatible = "ethernet-phy-id001c.c915",
 			     "ethernet-phy-ieee802.3-c22";
 		reg = <0>;
-		interrupt-parent = <&gpio2>;
-		interrupts = <21 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio2 21 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
 	};
 };
diff --git a/arch/arm64/boot/dts/renesas/condor-common.dtsi b/arch/arm64/boot/dts/renesas/condor-common.dtsi
index 8b7c0c34eadce5cb..b2d99dfaa0cdf19d 100644
--- a/arch/arm64/boot/dts/renesas/condor-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/condor-common.dtsi
@@ -166,8 +166,7 @@ phy0: ethernet-phy@0 {
 			     "ethernet-phy-ieee802.3-c22";
 		rxc-skew-ps = <1500>;
 		reg = <0>;
-		interrupt-parent = <&gpio4>;
-		interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio4 23 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
 	};
 };
diff --git a/arch/arm64/boot/dts/renesas/draak.dtsi b/arch/arm64/boot/dts/renesas/draak.dtsi
index 6f133f54ded54efb..402112a37d75a8c5 100644
--- a/arch/arm64/boot/dts/renesas/draak.dtsi
+++ b/arch/arm64/boot/dts/renesas/draak.dtsi
@@ -247,8 +247,7 @@ phy0: ethernet-phy@0 {
 			     "ethernet-phy-ieee802.3-c22";
 		rxc-skew-ps = <1500>;
 		reg = <0>;
-		interrupt-parent = <&gpio5>;
-		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio5 19 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio5 18 GPIO_ACTIVE_LOW>;
 		/*
 		 * TX clock internal delay mode is required for reliable
diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts/renesas/ebisu.dtsi
index cba2fde9dd3688b3..1aedd093fb41bf44 100644
--- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
+++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
@@ -314,8 +314,7 @@ phy0: ethernet-phy@0 {
 			     "ethernet-phy-ieee802.3-c22";
 		rxc-skew-ps = <1500>;
 		reg = <0>;
-		interrupt-parent = <&gpio2>;
-		interrupts = <21 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio2 21 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
 		/*
 		 * TX clock internal delay mode is required for reliable
diff --git a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
index ad898c6db4e62df6..4113710d55226d6d 100644
--- a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
@@ -27,8 +27,7 @@ phy0: ethernet-phy@0 {
 		compatible = "ethernet-phy-id001c.c915",
 			     "ethernet-phy-ieee802.3-c22";
 		reg = <0>;
-		interrupt-parent = <&gpio2>;
-		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
 	};
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
index 0608dce92e405935..7dd9e13cf0074442 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -111,8 +111,7 @@ phy0: ethernet-phy@0 {
 			     "ethernet-phy-ieee802.3-c22";
 		rxc-skew-ps = <1500>;
 		reg = <0>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio1 17 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio1 16 GPIO_ACTIVE_LOW>;
 	};
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
index e36999e91af53326..0a103f93b14d71ad 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
@@ -117,8 +117,7 @@ phy0: ethernet-phy@0 {
 			     "ethernet-phy-ieee802.3-c22";
 		rxc-skew-ps = <1500>;
 		reg = <0>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio1 17 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio1 16 GPIO_ACTIVE_LOW>;
 	};
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
index 77d22df25fffac6d..a8a20c748ffcd1ed 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
@@ -124,8 +124,7 @@ phy0: ethernet-phy@0 {
 			     "ethernet-phy-ieee802.3-c22";
 		rxc-skew-ps = <1500>;
 		reg = <0>;
-		interrupt-parent = <&gpio4>;
-		interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio4 23 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
 	};
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
index 63db822e5f4662b6..6bd580737f25d3cc 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
@@ -31,8 +31,7 @@ phy0: ethernet-phy@0 {
 			     "ethernet-phy-ieee802.3-c22";
 		rxc-skew-ps = <1500>;
 		reg = <0>;
-		interrupt-parent = <&gpio4>;
-		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio4 16 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio4 15 GPIO_ACTIVE_LOW>;
 	};
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
index 33c1015e9ab38e97..5d38669ed1ec3440 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
@@ -60,8 +60,7 @@ mdio {
 				u101: ethernet-phy@1 {
 					reg = <1>;
 					compatible = "ethernet-phy-ieee802.3-c45";
-					interrupt-parent = <&gpio3>;
-					interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+					interrupts-extended = <&gpio3 10 IRQ_TYPE_LEVEL_LOW>;
 				};
 			};
 		};
@@ -78,8 +77,7 @@ mdio {
 				u201: ethernet-phy@2 {
 					reg = <2>;
 					compatible = "ethernet-phy-ieee802.3-c45";
-					interrupt-parent = <&gpio3>;
-					interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+					interrupts-extended = <&gpio3 11 IRQ_TYPE_LEVEL_LOW>;
 				};
 			};
 		};
@@ -96,8 +94,7 @@ mdio {
 				u301: ethernet-phy@3 {
 					reg = <3>;
 					compatible = "ethernet-phy-ieee802.3-c45";
-					interrupt-parent = <&gpio3>;
-					interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
+					interrupts-extended = <&gpio3 9 IRQ_TYPE_LEVEL_LOW>;
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts b/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
index fa910b85859e99df..5d71d52f9c654783 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
@@ -197,8 +197,7 @@ mdio {
 				ic99: ethernet-phy@1 {
 					reg = <1>;
 					compatible = "ethernet-phy-ieee802.3-c45";
-					interrupt-parent = <&gpio3>;
-					interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+					interrupts-extended = <&gpio3 10 IRQ_TYPE_LEVEL_LOW>;
 				};
 			};
 		};
@@ -216,8 +215,7 @@ mdio {
 				ic102: ethernet-phy@2 {
 					reg = <2>;
 					compatible = "ethernet-phy-ieee802.3-c45";
-					interrupt-parent = <&gpio3>;
-					interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+					interrupts-extended = <&gpio3 11 IRQ_TYPE_LEVEL_LOW>;
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts
index 50a428572d9bd933..0062362b0ba06885 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts
@@ -70,8 +70,7 @@ phy3: ethernet-phy@0 {
 			compatible = "ethernet-phy-id002b.0980",
 				     "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
-			interrupt-parent = <&gpio4>;
-			interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+			interrupts-extended = <&gpio4 3 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
index 72e1ffe98585447f..b1d035ca4d97a51a 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
@@ -181,8 +181,7 @@ phy0: ethernet-phy@0 {
 			     "ethernet-phy-ieee802.3-c22";
 		rxc-skew-ps = <1500>;
 		reg = <0>;
-		interrupt-parent = <&gpio7>;
-		interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio7 5 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio7 10 GPIO_ACTIVE_LOW>;
 	};
 };
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
index 83f5642d0d35c244..502d9f17bf16d017 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
@@ -102,8 +102,7 @@ phy0: ethernet-phy@7 {
 		compatible = "ethernet-phy-id0022.1640",
 			     "ethernet-phy-ieee802.3-c22";
 		reg = <7>;
-		interrupt-parent = <&irqc>;
-		interrupts = <RZG2L_IRQ2 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&irqc RZG2L_IRQ2 IRQ_TYPE_LEVEL_LOW>;
 		rxc-skew-psec = <2400>;
 		txc-skew-psec = <2400>;
 		rxdv-skew-psec = <0>;
@@ -130,8 +129,7 @@ phy1: ethernet-phy@7 {
 		compatible = "ethernet-phy-id0022.1640",
 			     "ethernet-phy-ieee802.3-c22";
 		reg = <7>;
-		interrupt-parent = <&irqc>;
-		interrupts = <RZG2L_IRQ3 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&irqc RZG2L_IRQ3 IRQ_TYPE_LEVEL_LOW>;
 		rxc-skew-psec = <2400>;
 		txc-skew-psec = <2400>;
 		rxdv-skew-psec = <0>;
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
index b4ef5ea8a9e3457a..de39311a77dc2a5a 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
@@ -82,8 +82,7 @@ phy0: ethernet-phy@7 {
 		compatible = "ethernet-phy-id0022.1640",
 			     "ethernet-phy-ieee802.3-c22";
 		reg = <7>;
-		interrupt-parent = <&irqc>;
-		interrupts = <RZG2L_IRQ0 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&irqc RZG2L_IRQ0 IRQ_TYPE_LEVEL_LOW>;
 		rxc-skew-psec = <2400>;
 		txc-skew-psec = <2400>;
 		rxdv-skew-psec = <0>;
diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
index 79443fb3f5810304..1a6fd58bd3682a56 100644
--- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
@@ -78,8 +78,7 @@ phy0: ethernet-phy@7 {
 		compatible = "ethernet-phy-id0022.1640",
 			     "ethernet-phy-ieee802.3-c22";
 		reg = <7>;
-		interrupt-parent = <&irqc>;
-		interrupts = <RZG2L_IRQ2 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&irqc RZG2L_IRQ2 IRQ_TYPE_LEVEL_LOW>;
 		rxc-skew-psec = <2400>;
 		txc-skew-psec = <2400>;
 		rxdv-skew-psec = <0>;
@@ -107,8 +106,7 @@ phy1: ethernet-phy@7 {
 		compatible = "ethernet-phy-id0022.1640",
 			     "ethernet-phy-ieee802.3-c22";
 		reg = <7>;
-		interrupt-parent = <&irqc>;
-		interrupts = <RZG2L_IRQ7 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&irqc RZG2L_IRQ7 IRQ_TYPE_LEVEL_LOW>;
 		rxc-skew-psec = <2400>;
 		txc-skew-psec = <2400>;
 		rxdv-skew-psec = <0>;
diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 21bfa4e03972ffe2..71424e69939ee56b 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -103,8 +103,7 @@ &eth0 {
 
 	phy0: ethernet-phy@7 {
 		reg = <7>;
-		interrupt-parent = <&pinctrl>;
-		interrupts = <RZG2L_GPIO(12, 0) IRQ_TYPE_EDGE_FALLING>;
+		interrupts-extended = <&pinctrl RZG2L_GPIO(12, 0) IRQ_TYPE_EDGE_FALLING>;
 		rxc-skew-psec = <0>;
 		txc-skew-psec = <0>;
 		rxdv-skew-psec = <0>;
@@ -129,8 +128,7 @@ &eth1 {
 
 	phy1: ethernet-phy@7 {
 		reg = <7>;
-		interrupt-parent = <&pinctrl>;
-		interrupts = <RZG2L_GPIO(12, 1) IRQ_TYPE_EDGE_FALLING>;
+		interrupts-extended = <&pinctrl RZG2L_GPIO(12, 1) IRQ_TYPE_EDGE_FALLING>;
 		rxc-skew-psec = <0>;
 		txc-skew-psec = <0>;
 		rxdv-skew-psec = <0>;
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 3f8ce62488213bbe..ca0b5c070ae57dce 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -367,8 +367,7 @@ phy0: ethernet-phy@0 {
 			     "ethernet-phy-ieee802.3-c22";
 		rxc-skew-ps = <1500>;
 		reg = <0>;
-		interrupt-parent = <&gpio2>;
-		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
 	};
 };
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index a2f66f916048496e..4cf141a701c0625a 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -150,8 +150,7 @@ phy0: ethernet-phy@0 {
 			     "ethernet-phy-ieee802.3-c22";
 		rxc-skew-ps = <1500>;
 		reg = <0>;
-		interrupt-parent = <&gpio2>;
-		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
 	};
 };
diff --git a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
index 36f5deb7f24afc2e..209cba75adec6d6c 100644
--- a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
@@ -167,8 +167,7 @@ avb0_phy: ethernet-phy@0 {
 				     "ethernet-phy-ieee802.3-c22";
 			rxc-skew-ps = <1500>;
 			reg = <0>;
-			interrupt-parent = <&gpio7>;
-			interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+			interrupts-extended = <&gpio7 5 IRQ_TYPE_LEVEL_LOW>;
 			reset-gpios = <&gpio7 10 GPIO_ACTIVE_LOW>;
 		};
 	};
diff --git a/arch/arm64/boot/dts/renesas/white-hawk-ethernet.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-ethernet.dtsi
index 595ec4ff4cdd0190..ad94bf3f5e6c426f 100644
--- a/arch/arm64/boot/dts/renesas/white-hawk-ethernet.dtsi
+++ b/arch/arm64/boot/dts/renesas/white-hawk-ethernet.dtsi
@@ -29,8 +29,7 @@ mdio {
 		avb1_phy: ethernet-phy@0 {
 			compatible = "ethernet-phy-ieee802.3-c45";
 			reg = <0>;
-			interrupt-parent = <&gpio6>;
-			interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+			interrupts-extended = <&gpio6 3 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
@@ -51,8 +50,7 @@ mdio {
 		avb2_phy: ethernet-phy@0 {
 			compatible = "ethernet-phy-ieee802.3-c45";
 			reg = <0>;
-			interrupt-parent = <&gpio5>;
-			interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
+			interrupts-extended = <&gpio5 4 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
-- 
2.34.1


