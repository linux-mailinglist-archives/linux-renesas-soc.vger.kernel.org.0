Return-Path: <linux-renesas-soc+bounces-9403-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5460C99041B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 845271C20CFB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 13:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF3112141D7;
	Fri,  4 Oct 2024 13:22:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91593215F51
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Oct 2024 13:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728048165; cv=none; b=s8iwDXQgPGSVweY7kTunF7IUEU1YxJmdkHuME37v3Cb2iYgDAjQH3EFt7/96sOiGbnM1YmqksH8aVoEmEFei2LMwjMFSmy9UB28+MlZ6zHl4EW1HkCbehtFoRfMOFumYaEmmFhBX+Ymlduwlk51uPQs9owSgaMyGo6vrtvDvGoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728048165; c=relaxed/simple;
	bh=h09OpuANCKDdKFb9UgmL4y7AP3WCwT1Vu5+jvdAJByM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XGJOJlUdHDjIiQ3zAV8BaPaNCFpJBOqvcjTmxj4ThUm61j5sBxvJo72pP1il3hjTjdTobwb5wDPvLtOvNLw1ZM4zSauQ3w6wnwVF3eTP39b0GMeqFZJa/fCHENynjRUA3HJlDovmOewlsy/FGk+nf/ooh5afav4/0vCb/TZgpX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:5518:aeb:d9c0:fc7c])
	by xavier.telenet-ops.be with cmsmtp
	id LDNb2D00J4NXpdT01DNcGy; Fri, 04 Oct 2024 15:22:36 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swiGJ-001ElF-KV;
	Fri, 04 Oct 2024 15:22:35 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swhnu-006yV4-R7;
	Fri, 04 Oct 2024 14:53:06 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 18/20] arm64: dts: renesas: Use interrupts-extended for WLAN
Date: Fri,  4 Oct 2024 14:53:00 +0200
Message-Id: <0866811fd11b683cacfd5dc3ea75d4c0ca161acb.1728045620.git.geert+renesas@glider.be>
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
 arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi | 3 +--
 arch/arm64/boot/dts/renesas/hihope-common.dtsi      | 3 +--
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts     | 3 +--
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi            | 3 +--
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
index 4a9d20249eaa9bc0..b543739390a5d94c 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
@@ -300,8 +300,7 @@ &sdhi2 {
 	brcmf: bcrmf@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
-		interrupt-parent = <&gpio1>;
-		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio1 27 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "host-wake";
 	};
 };
diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
index 83104af2813eb4a0..2aa9f528ace16e7b 100644
--- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
@@ -325,8 +325,7 @@ &sdhi2 {
 	wlcore: wlcore@2 {
 		compatible = "ti,wl1837";
 		reg = <2>;
-		interrupt-parent = <&gpio2>;
-		interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts-extended = <&gpio2 5 IRQ_TYPE_LEVEL_HIGH>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index 94d85273064e9bc8..c861f75b1f1b70cd 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -411,8 +411,7 @@ &sdhi3 {
 	wlcore: wlcore@2 {
 		compatible = "ti,wl1837";
 		reg = <2>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts-extended = <&gpio1 0 IRQ_TYPE_LEVEL_HIGH>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index f7330b2262b8af0c..5c211ed83049d5a4 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -444,8 +444,7 @@ &sdhi3 {
 	wlcore: wlcore@2 {
 		compatible = "ti,wl1837";
 		reg = <2>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
+		interrupts-extended = <&gpio1 25 IRQ_TYPE_EDGE_FALLING>;
 	};
 };
 
-- 
2.34.1


