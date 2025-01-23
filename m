Return-Path: <linux-renesas-soc+bounces-12408-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD68A1A7F5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 17:37:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6DBD16638B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 16:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42161386DA;
	Thu, 23 Jan 2025 16:37:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2854820F96D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jan 2025 16:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737650244; cv=none; b=cm+rgiDlrwPMkoXrAPboQ6axkMB0v/cdC4rMn/QKPb6oDHxTjze/6An6H/ZxJEfz+NqxjRVaGc7UKsFcRsN/hZ3iP0IbQihkeVBXsQCjE2aBiXs33w3PrlV1n4up/6YFqPxJYKohBMkQieF2cY97uSRgtbrwKsGKHE2KorI/MJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737650244; c=relaxed/simple;
	bh=oovoM9/NfpO+tA/KvHQz6ixKY4kGN3JA9GPNgic5Chw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UXiYBd7polDiKIj9czj5s98OFEhzJBjr1Q2q03YIkFpGOmdqv1h1kfZKGxJO24RAWF52/JSBAbd5/H4bMDUMR0F0uHVznO7GvgYjjZ4iGfL31chd9+HuuAKfHXskoscWPQb8dRAQduWOM01ZpixdgXzRdp9fqV9Amx0pAoC0qS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:4563:f165:f885:ebc1])
	by albert.telenet-ops.be with cmsmtp
	id 4gdB2E00F5PrELR06gdBEk; Thu, 23 Jan 2025 17:37:13 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tb0CU-0000000EEZY-3aR7;
	Thu, 23 Jan 2025 17:37:11 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tb0Cd-00000000mL3-24G3;
	Thu, 23 Jan 2025 17:37:11 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a779f0: Disable rswitch ports by default
Date: Thu, 23 Jan 2025 17:37:10 +0100
Message-ID: <c4688de8e3289ad82c2cd85f0893eac660ac8890.1737649969.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Renesas Ethernet Switch has three independent ports.  Each port can
act as a separate interface, and can be enabled or disabled
independently.  Currently all ports are enabled by default, hence board
DTS files that enable the switch must disable all unused ports
explicitly.

Disable all ports by default, and explicitly enable ports that are used,
next to their configuration.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This is similar to how Ethernet switch ports are handled on RZ/N1D, and
CAN-FD channels on R-Car Gen3/4.

If accepted, I'm wondering if I should move it forward, before "[PATCH
3/5] arm64: dts: renesas: s4sk: Access rswitch ports via phandles"[1],
which would become slightly simpler.

[1] https://lore.kernel.org/all/20250118111344.361617-3-marek.vasut+renesas@mailbox.org
---
 arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi | 3 +++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi                 | 3 +++
 arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts             | 6 ++----
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
index 892729786d00b36e..ad2b0398d35431a1 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
@@ -57,6 +57,7 @@ &rswitch_port0 {
 	phy-handle = <&u101>;
 	phy-mode = "sgmii";
 	phys = <&eth_serdes 0>;
+	status = "okay";
 
 	mdio {
 		#address-cells = <1>;
@@ -75,6 +76,7 @@ &rswitch_port1 {
 	phy-handle = <&u201>;
 	phy-mode = "sgmii";
 	phys = <&eth_serdes 1>;
+	status = "okay";
 
 	mdio {
 		#address-cells = <1>;
@@ -93,6 +95,7 @@ &rswitch_port2 {
 	phy-handle = <&u301>;
 	phy-mode = "sgmii";
 	phys = <&eth_serdes 2>;
+	status = "okay";
 
 	mdio {
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index 840ba73c03f1b6f4..06be9f7720d64179 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -989,14 +989,17 @@ ethernet-ports {
 				rswitch_port0: port@0 {
 					reg = <0>;
 					phys = <&eth_serdes 0>;
+					status = "disabled";
 				};
 				rswitch_port1: port@1 {
 					reg = <1>;
 					phys = <&eth_serdes 1>;
+					status = "disabled";
 				};
 				rswitch_port2: port@2 {
 					reg = <2>;
 					phys = <&eth_serdes 2>;
+					status = "disabled";
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts b/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
index 24ecdf6e8476a945..df652e7b85c95ebe 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
@@ -187,6 +187,7 @@ &rswitch_port0 {
 	phy-handle = <&ic99>;
 	phy-mode = "sgmii";
 	phys = <&eth_serdes 0>;
+	status = "okay";
 
 	mdio {
 		#address-cells = <1>;
@@ -205,6 +206,7 @@ &rswitch_port1 {
 	phy-handle = <&ic102>;
 	phy-mode = "sgmii";
 	phys = <&eth_serdes 1>;
+	status = "okay";
 
 	mdio {
 		#address-cells = <1>;
@@ -218,10 +220,6 @@ ic102: ethernet-phy@2 {
 	};
 };
 
-&rswitch_port2 {
-	status = "disabled";
-};
-
 &rwdt {
 	timeout-sec = <60>;
 	status = "okay";
-- 
2.43.0


