Return-Path: <linux-renesas-soc+bounces-9414-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE49F99042F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:27:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D2921F218C6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 13:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ADC6216A34;
	Fri,  4 Oct 2024 13:22:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D10216A12
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Oct 2024 13:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728048169; cv=none; b=AE/kgaEV91SUKr63x6j9dBaZux84hmw7YCcMO9RVW54AMJy04kwzppQK3bzYhUI5zoJK2nvwgKh/R7jMFfmqaNI8RJRZrStNMyG7uAxfoQ/F9HOmXzLZIHSvBnwnp0VhR2BbcMJnNcfVsJtosMF1a0qEn+qvhU4RKn9+BHisDQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728048169; c=relaxed/simple;
	bh=iSuOCfYraD+Fda/NPdn068wqfdVMc6SfcvPQIQs9hRc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O4d7FjHeOsbLWcoy9ps1/ypA2K/0OvItC1xeHih6oWo2vj6bkk3FgJ3YL9Sk6uDkZFBiR4xs/1UiXDXayip3LvrFl5/RePKJWTk3HJcFjhIDnHxp1X5HgHzyKpLG2RHwO+U3ymXiyiZEHlr1xvpsb9AE0xgD+2OHyVt+S2PTS38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:5518:aeb:d9c0:fc7c])
	by laurent.telenet-ops.be with cmsmtp
	id LDNc2D00F4NXpdT01DNcUQ; Fri, 04 Oct 2024 15:22:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swiGK-001Eli-ET;
	Fri, 04 Oct 2024 15:22:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swhnu-006yUQ-G7;
	Fri, 04 Oct 2024 14:53:06 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 10/20] ARM: dts: renesas: kzm9g: Use interrupts-extended for sensors
Date: Fri,  4 Oct 2024 14:52:52 +0200
Message-Id: <e04fff0e6d7d9ffebf5e3d3fe7682f0d411b60d9.1728045620.git.geert+renesas@glider.be>
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
 arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts b/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
index ae7e68a44f493e1b..1ce07d0878dc635a 100644
--- a/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
+++ b/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
@@ -195,8 +195,7 @@ &i2c0 {
 	compass@c {
 		compatible = "asahi-kasei,ak8975";
 		reg = <0x0c>;
-		interrupt-parent = <&irqpin3>;
-		interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
+		interrupts-extended = <&irqpin3 4 IRQ_TYPE_EDGE_FALLING>;
 	};
 
 	ak4648: codec@12 {
@@ -208,9 +207,8 @@ ak4648: codec@12 {
 	accelerometer@1d {
 		compatible = "adi,adxl345";
 		reg = <0x1d>;
-		interrupt-parent = <&irqpin3>;
-		interrupts = <2 IRQ_TYPE_LEVEL_HIGH>,
-			     <3 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts-extended = <&irqpin3 2 IRQ_TYPE_LEVEL_HIGH>,
+				      <&irqpin3 3 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
 	rtc@32 {
-- 
2.34.1


