Return-Path: <linux-renesas-soc+bounces-16758-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A551AAE0CC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 15:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 042027B48BF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 13:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92658528E;
	Wed,  7 May 2025 13:32:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E294B1E56
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 May 2025 13:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746624727; cv=none; b=aZxnHwQcLdUMf0o0cgnngmIjHuXBDIAJTBBgtvryHGAzx0Ljfgf13JLGr1vwSjA+UQGaGo3+EWUQKKRr7Ms30F/5IPN1mKHswTj9QsAj5S0bLG76AmbOjQIX0r0C42YR2Ya9HByzRzKG5kjA0BP4hHOXemVnb151VUbG0mSPRcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746624727; c=relaxed/simple;
	bh=kibD8atoXohbbRzBPFI3kaZzCHQgZqxjvDk5BP+5WWI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CaNvVkgCPBEtM4WZnL5Iy2BGRVvsnCBG1J1C9WEFckifGvhiVAwZCuHpBSD3evfUHnnO+9S9y6uBB2+CZje7N9F/qRYCsjFmKpGl9uWMqgjBJxUyhDqKvMnc5OxuLyb3fvsdxd2lOG95Jv4NGRFpC/64Y6l9HS/rEKnoOIkCNLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:41d7:97f1:5857:a075])
	by baptiste.telenet-ops.be with cmsmtp
	id mDXw2E00L4ooFen01DXwUq; Wed, 07 May 2025 15:31:57 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uCesI-00000000uvc-2sbn;
	Wed, 07 May 2025 15:31:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uCesO-00000001vi3-2sm3;
	Wed, 07 May 2025 15:31:56 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: white-hawk-single: Improve Ethernet TSN description
Date: Wed,  7 May 2025 15:31:55 +0200
Message-ID: <367f10a18aa196ff1c96734dd9bd5634b312c421.1746624368.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

  - Add the missing "ethernet3" alias for the Ethernet TSN port, so
    U-Boot will fill its local-mac-address property based on the
    "eth3addr" environment variable (if set), avoiding a random MAC
    address being assigned by the OS,
  - Rename the numerical Ethernet PHY label to "tsn0_phy", to avoid
    future conflicts, and for consistency with the "avbN_phy" labels.

Fixes: 3d8e475bd7a724a9 ("arm64: dts: renesas: white-hawk-single: Wire-up Ethernet TSN")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v-6.16.

 arch/arm64/boot/dts/renesas/white-hawk-single.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/white-hawk-single.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-single.dtsi
index 8b4d313ad173cd3b..4ddb70e525c0532e 100644
--- a/arch/arm64/boot/dts/renesas/white-hawk-single.dtsi
+++ b/arch/arm64/boot/dts/renesas/white-hawk-single.dtsi
@@ -11,6 +11,10 @@
 / {
 	model = "Renesas White Hawk Single board";
 	compatible = "renesas,white-hawk-single";
+
+	aliases {
+		ethernet3 = &tsn0;
+	};
 };
 
 &hscif0 {
@@ -53,7 +57,7 @@ &tsn0 {
 	pinctrl-0 = <&tsn0_pins>;
 	pinctrl-names = "default";
 	phy-mode = "rgmii";
-	phy-handle = <&phy3>;
+	phy-handle = <&tsn0_phy>;
 	status = "okay";
 
 	mdio {
@@ -63,7 +67,7 @@ mdio {
 		reset-gpios = <&gpio1 23 GPIO_ACTIVE_LOW>;
 		reset-post-delay-us = <4000>;
 
-		phy3: ethernet-phy@0 {
+		tsn0_phy: ethernet-phy@0 {
 			compatible = "ethernet-phy-id002b.0980",
 				     "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
-- 
2.43.0


