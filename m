Return-Path: <linux-renesas-soc+bounces-17833-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB13ACDA2D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 10:44:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 068F27AA977
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 08:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED0128C2DF;
	Wed,  4 Jun 2025 08:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FO2GpQMs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6CE231833
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Jun 2025 08:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749026555; cv=none; b=e91U2hJNalm2JYichXAZlRRz0uMh+rJdXYIzYhvN6PcRKQ5BcPkBz5ZV2SUDh5cb+vyJkPyCP+nzllQkV3t3L+nLxtMBe443syGCah7ouM+8w+fV4I4/3fHFyfkmZnc8l9hQGcOp+KPXNJWruzdC+O+aEugXd5K0bN6RRC/Lsdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749026555; c=relaxed/simple;
	bh=3KXZ36bjgvwRNYbPcmB8g6fofPogiE4xXUfm3MPpVJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J5aTsYnL+2YZqf689e1W5n0nwDgkUWdO4Zrsse9dW03kqd2b0nzGRXt3QWz8Q/sltAwZun3HCtVODljk3VtHXIRmAMizU+fssjH47Kli66GAQ2OIBEbr6fvqwOezmmshU6vZHvDavrBDdpQ7beBoWqrkHa6XS9T8SOL0TKcSOTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FO2GpQMs; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=fQRuu5rJsvX8dr
	rFhp+JLn+JPuN/g7wQEM7sqG7g1Rc=; b=FO2GpQMsTXzn9HrG4db5AGAHcTkLGE
	a5r7xtKE/AlHWg5uu9GTLt1VoimOr6PLoOv1vQhz23SFCVIx6Qf4yb5Fi2cMmY+p
	nBlAdzDhZR8VJ/ByFErEKgI4sQpCKtuxfTXUM9Hy44U2Bb4Ga89YnORhNiFLu26B
	J6DcBNMpAdHX5WDYav5qPTuHTAvdv8nCgQ+InleuvTEW1G6fBmBqZoQFYiaWHcDe
	aBzg0ugcqFaputjNyF4MeC/injyQWg0Dnt8R5NNwbc49auzHf+eTbhmP4Zw9k2Q4
	6+QHAtP67/jyVK3PWOVoSLYXBg8Kcf3a3oEOWZ+OMUM4Z47M1c6YRKhQ==
Received: (qmail 596258 invoked from network); 4 Jun 2025 10:42:26 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jun 2025 10:42:26 +0200
X-UD-Smtp-Session: l3s3148p1@w/cB+ro2XrMgAwDPXx36AJSQ3b6GkO36
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: renesas: r9a06g032: add second clock input to RTC
Date: Wed,  4 Jun 2025 10:40:11 +0200
Message-ID: <20250604084211.28090-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
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

The dependencies are now in -next, so we can update the DT, too.
Discussion leading to this result is here:

https://lore.kernel.org/r/20250319110305.19687-2-wsa+renesas@sang-engineering.com

 arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts | 4 ++++
 arch/arm/boot/dts/renesas/r9a06g032.dtsi            | 4 ++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
index d734a432b3ec..3258b2e27434 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
@@ -171,6 +171,10 @@ &eth_miic {
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
index 80ad1fdc77a0..13a60656b044 100644
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


