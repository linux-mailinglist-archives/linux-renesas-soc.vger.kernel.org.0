Return-Path: <linux-renesas-soc+bounces-9412-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD2099042C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:27:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D38741C20CFB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 13:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4036321F425;
	Fri,  4 Oct 2024 13:22:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8545215F4F
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Oct 2024 13:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728048169; cv=none; b=f2pa/WE4k5cIEzKxEHFtiJkYMmEdmwLaGGGrDUorKMT3xGjkD2GGa5vXgIuV/zCttaAoxPw4abg5isXqphf4bBJrm0Dr4ib1Qy+jMQBdNG2hoX4vmo8lqQTARGyKVG/4RNJcij31I4OtZYdvYyFWUV6OmDTAPxigq0o4fl0389Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728048169; c=relaxed/simple;
	bh=JGqeVPHispg4Q2MBdzGCb0XEQ6IIAnxQFi+rVbt4WKA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W7gv45CnGYpOw7aIKVwusRdNN0DPUDVUt7Fil933Nz1G21vijnGIqpImYn3SHnT0GYtNZ5KlBFO9kkx/S0XCecKVdJGkM9e33MfbZACDtgjrJbj4DOSzj6XKKkTMbWTKMvUvTSoQv7OgnxqWqGGF9ffbBXxpIm6r5CMORMIViQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:5518:aeb:d9c0:fc7c])
	by michel.telenet-ops.be with cmsmtp
	id LDNc2D0034NXpdT06DNcdz; Fri, 04 Oct 2024 15:22:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swiGJ-001ElI-NU;
	Fri, 04 Oct 2024 15:22:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swhnu-006yUz-Pp;
	Fri, 04 Oct 2024 14:53:06 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 17/20] arm64: dts: renesas: Use interrupts-extended for video decoders
Date: Fri,  4 Oct 2024 14:52:59 +0200
Message-Id: <4ee2e3e1e0e174782bd4d2af44bb6150d24af551.1728045620.git.geert+renesas@glider.be>
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
 arch/arm64/boot/dts/renesas/ebisu.dtsi                     | 5 ++---
 .../dts/renesas/r8a77970-eagle-function-expansion.dtso     | 7 +++----
 arch/arm64/boot/dts/renesas/salvator-common.dtsi           | 5 ++---
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts/renesas/ebisu.dtsi
index b4e0347d3617a83e..ab8283656660059a 100644
--- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
+++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
@@ -434,10 +434,9 @@ video-receiver@70 {
 		compatible = "adi,adv7482";
 		reg = <0x70>;
 
-		interrupt-parent = <&gpio0>;
+		interrupts-extended = <&gpio0 7 IRQ_TYPE_LEVEL_LOW>,
+				      <&gpio0 17 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "intrq1", "intrq2";
-		interrupts = <7 IRQ_TYPE_LEVEL_LOW>,
-			     <17 IRQ_TYPE_LEVEL_LOW>;
 
 		ports {
 			#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtso b/arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtso
index 3aa243c5f04c8022..9450d8ac94cbe977 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtso
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtso
@@ -82,8 +82,7 @@ hdmi-decoder@4c {
 		compatible = "adi,adv7612";
 		reg = <0x4c>, <0x50>, <0x52>, <0x54>, <0x56>, <0x58>;
 		reg-names = "main", "afe", "rep", "edid", "hdmi", "cp";
-		interrupt-parent = <&gpio3>;
-		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio3 2 IRQ_TYPE_LEVEL_LOW>;
 		default-input = <0>;
 
 		ports {
@@ -114,8 +113,8 @@ video-receiver@70 {
 		       0x60 0x61 0x62 0x63 0x64 0x65>;
 		reg-names = "main", "dpll", "cp", "hdmi", "edid", "repeater",
 			    "infoframe", "cbus", "cec", "sdp", "txa", "txb" ;
-		interrupt-parent = <&gpio3>;
-		interrupts = <03 IRQ_TYPE_LEVEL_LOW>, <04 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio3 3 IRQ_TYPE_LEVEL_LOW>,
+				      <&gpio3 4 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "intrq1", "intrq2";
 
 		ports {
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 08f4e35c414ebbcf..269cda6fae21de70 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -544,10 +544,9 @@ video-receiver@70 {
 		reg-names = "main", "dpll", "cp", "hdmi", "edid", "repeater",
 			    "infoframe", "cbus", "cec", "sdp", "txa", "txb" ;
 
-		interrupt-parent = <&gpio6>;
+		interrupts-extended = <&gpio6 30 IRQ_TYPE_LEVEL_LOW>,
+				      <&gpio6 31 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "intrq1", "intrq2";
-		interrupts = <30 IRQ_TYPE_LEVEL_LOW>,
-			     <31 IRQ_TYPE_LEVEL_LOW>;
 
 		ports {
 			#address-cells = <1>;
-- 
2.34.1


