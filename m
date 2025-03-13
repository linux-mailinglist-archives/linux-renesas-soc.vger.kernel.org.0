Return-Path: <linux-renesas-soc+bounces-14336-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFA1A5F0C9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Mar 2025 11:26:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7EAC189D71C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Mar 2025 10:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7107D265CC0;
	Thu, 13 Mar 2025 10:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="C1Wyb51g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7107B265CAB
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Mar 2025 10:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741861558; cv=none; b=bnyEHv8zZqGgagfvW2wM6o6jeWPYlZbxEGsh4OUvepYZRxe74fimNBHF0Ck3cG5dI1UbvFikbtCtaojp8H4+gI4JQTJ/kogzFJxynLihhWmM+GcpKCpQecZDJD52jlTuy8ytvjsOOIN1paWrTvZvD9eMulL8avFOmCpmN3U89P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741861558; c=relaxed/simple;
	bh=mYE2kT0XkHd2rmDsncyMeiZ81XSx4xAhlMJSHn7Vzlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UDefxBnsGwrAYtLM95KCPATU35GkTNn0h+jYmhnvTZqgOXGze65ww6PfaHum46LwUa2ahYDc12Ux76gPs2feyka0Z22NySUvmrSty7lmjTPI+8RLnJ276AwY0NOHE9x4HvIPK6ULNhJnOTTEdNXD7Kc7s8T/QJLrisIbrPvUPx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=C1Wyb51g; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=xAzBmntGcUXn8ZbzzMjoYJF/sw7Y4CRXS0NjslYSCvE=; b=C1Wyb5
	1gM8JPvgzE57REU5bz8PwgB+lAZxNjyi1jJms8LE2DjlHtpOIevWK3tFYyGYGj+u
	WtogRwq2YvalClgq+IYOV33exORek++rcK/dEQ2p7ACB6ZetjLGfjjt/r7s2Rvzg
	JyvL994qXSYeS0Ozm6uU1NvH0NfW2pwC3puEBFBYBIRYIxSc1zyUBJvm2vixmEXP
	rwfxZvliN/qphHQHTZskWxS1VZNRYLJFaQELDGDSIKTLMKyuscKNqopLBnIqKyvm
	nhWAdDnjc5b+r9mPtQPdDZ3aPm9YFzxVFrAQTg/I1ycHBAD3KlUrLNRSy+F7cmfi
	tHngaNC2KvBjvNdg==
Received: (qmail 1574747 invoked from network); 13 Mar 2025 11:25:53 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Mar 2025 11:25:53 +0100
X-UD-Smtp-Session: l3s3148p1@ZaUevzYwNr0gAwDPXyTHAJp038nK7dx+
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 2/4] ARM: dts: renesas: r9a06g032: add second clock input to RTC
Date: Thu, 13 Mar 2025 11:25:43 +0100
Message-ID: <20250313102546.27335-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250313102546.27335-1-wsa+renesas@sang-engineering.com>
References: <20250313102546.27335-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The external rtc clock is populated on the RZ/N1D module, so describe it
and add a reference to the RTC node.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

For the non-RFC series, it makes probably sense to split this patch into
two.

 arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts | 4 ++++
 arch/arm/boot/dts/renesas/r9a06g032.dtsi            | 4 ++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
index 31cdca3e623c..c2311f761381 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
@@ -47,6 +47,10 @@ &eth_miic {
 	renesas,miic-switch-portin = <MIIC_GMAC2_PORT>;
 };
 
+&ext_rtc_clk {
+	clock-frequency = <32768>;
+};
+
 &gmac2 {
 	status = "okay";
 	phy-mode = "gmii";
diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index 7548291c8d7e..458dab9d3b7f 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -73,8 +73,8 @@ rtc0: rtc@40006000 {
 				     <GIC_SPI 67 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "alarm", "timer", "pps";
-			clocks = <&sysctrl R9A06G032_HCLK_RTC>;
-			clock-names = "hclk";
+			clocks = <&sysctrl R9A06G032_HCLK_RTC>, <&ext_rtc_clk>;
+			clock-names = "hclk", "xtal";
 			power-domains = <&sysctrl>;
 			status = "disabled";
 		};
-- 
2.47.2


