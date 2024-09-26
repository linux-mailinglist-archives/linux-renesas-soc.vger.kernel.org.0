Return-Path: <linux-renesas-soc+bounces-9068-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7CA987128
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 12:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 943F21C22656
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 10:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74FE11ACDE1;
	Thu, 26 Sep 2024 10:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="V4byq2ca"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E181AB6F0
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Sep 2024 10:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727346022; cv=none; b=EWnq/H/yRszbdfX7YbI1EXA5FDFFXQwV4lX6cDcAeUDUBGj9N546Nob7nNpD1oE835wry+DIXJ8FTqNB7B23jx9ezaR5j6TBSr/AQQU/LLRNsp0KsihGEfBZWB3fpSfLcyJwUCWlk9U4XhEAyrnmL8zZeC3pwD6luiNiTFe41VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727346022; c=relaxed/simple;
	bh=u1Mao6Pt1hD/05TXRxjRStZ7jugPNQNY3310P1oBfYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iOrBH9iCQjgSUSZgCUWzK9lilWf+lVy1UZdTDE9SFgfsJcdcsH9AikT5e/jerkRKBGIweQSZNIiQwn/2z1Usvg7OOkxZqsHR4w8LXoOBl2L/1rjXvxSY6dsKosb8VB/1d298CVEDQ2GKQaDQLd6y50kas89HEReigJKARGq2RRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=V4byq2ca; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=8maR6u45YPSDoUaReOHVbKQEN6AYER8eFMxpt0e1MMs=; b=V4byq2
	cacVyYkUs17EHkxYjX3lzYrY0D/kMTU5sZ7YRdOXrhQaOZhdvhkIgSPPyhljVPhJ
	HAxWPbZa1tIR129o6F0Mz3KUCgsLNum+3i4Ks9v6gSG+6Kr9W/E0ZO6F4U6aruBr
	5i/gDNRY0FYPft5oN3+qc7Dx6kCjSWnMp6XBFR2sRAoCZc+UtEAFvlX2M11ZGESh
	eoBTG1B6YfKdaNYjb6z9EvQyO3mvssDiNbRW6haiZb5XD74n/rOgAag/ojX9WYCn
	55fWNQz6yzp2EFIH4Z0PyH/jgztfR2wv4Ny+PwM6oVIn6iT7rSairu23t3fv7hhA
	rwFcegd6rjUgDj9g==
Received: (qmail 946847 invoked from network); 26 Sep 2024 12:20:18 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2024 12:20:18 +0200
X-UD-Smtp-Session: l3s3148p1@xVjRFQMjrNQgAwDPXzRXADDuo30Z+IZ9
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/3] ARM: dts: renesas: genmai: enable SDHI0
Date: Thu, 26 Sep 2024 12:20:06 +0200
Message-ID: <20240926102005.15475-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240926102005.15475-5-wsa+renesas@sang-engineering.com>
References: <20240926102005.15475-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For this to work, User LEDs must be disabled because they share their
pins with SD data lines.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/renesas/r7s72100-genmai.dts | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
index 2d72daa4fac2..e93f444b2442 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
@@ -76,7 +76,8 @@ key-1 {
 	};
 
 	leds {
-		status = "okay";
+		/* Needs SDHI0 to be disabled */
+		status = "disabled";
 		compatible = "gpio-leds";
 
 		led1 {
@@ -227,6 +228,18 @@ scif2_pins: serial2 {
 		/* P3_0 as TxD2; P3_2 as RxD2 */
 		pinmux = <RZA1_PINMUX(3, 0, 6)>, <RZA1_PINMUX(3, 2, 4)>;
 	};
+
+	sdhi0_pins: sdhi0 {
+		/* SDHI0: P4_8 up to P4_15 */
+		pinmux = <RZA1_PINMUX(4, 8, 3)>,	/* SD_CD_0 */
+			 <RZA1_PINMUX(4, 9, 3)>,	/* SD_WP_0 */
+			 <RZA1_PINMUX(4, 10, 3)>,	/* SD_D1_0 */
+			 <RZA1_PINMUX(4, 11, 3)>,	/* SD_D0_0 */
+			 <RZA1_PINMUX(4, 12, 3)>,	/* SD_CLK_0 */
+			 <RZA1_PINMUX(4, 13, 3)>,	/* SD_CMD_0 */
+			 <RZA1_PINMUX(4, 14, 3)>,	/* SD_D3_0 */
+			 <RZA1_PINMUX(4, 15, 3)>;	/* SD_D2_0 */
+	};
 };
 
 &rtc_x1_clk {
@@ -244,6 +257,14 @@ &scif2 {
 	status = "okay";
 };
 
+&sdhi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdhi0_pins>;
+
+	bus-width = <4>;
+	status = "okay";
+};
+
 &spi4 {
 	status = "okay";
 
-- 
2.45.2


