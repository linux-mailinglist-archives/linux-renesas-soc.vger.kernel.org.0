Return-Path: <linux-renesas-soc+bounces-15000-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D20A74DE2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 16:33:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0C597A4263
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 15:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB681A0BF1;
	Fri, 28 Mar 2025 15:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dKV48Hcn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FC3185920
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Mar 2025 15:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743175992; cv=none; b=sm+AwRdyxZ/5MlWMN9yeZaRae9rtE5HNpUWBp8ELXoGDrdPou4ffwrUEkWa2NnlEa9yTG0j9JoHh8HLymK/DFQyDebbHjE0Khe7lU6xSGV5KPV5rz7NpSKRay3AcKq3xUSnNJTqK7tM2R/m54tJNskcDo6KjmyOJKp2aglwd/LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743175992; c=relaxed/simple;
	bh=txj0p9AOlMW/GD07JcHDECQ9iN7suXyi54aj8eqK5aU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P1QQlOThfrqr569aXc4VG5OmX83VHIYdO9AqeTvgc4Gn5BEuSDC0Xv/gBC5J6VkPsdRD7DAsdwaPf4p+PWOgDJuGHQk3Poklvhftqc69123lA7XcI8zrumPD3xSJ3q79rsAvMoDxpObsLEtk+9YGr8mavUY4W7ueTYL944cAb2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dKV48Hcn; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=6Xtktnminp1FRXV+Q9GFRCgQSDN9oUcIg0LS7BvR3MU=; b=dKV48H
	cnVoiMxpvp6o0pmMM2Ma1NGHgVpDb9vJ2kngH0z6STym6wwVl/rfOz6uD4d7TUXW
	cWjDnbCXb4RUbm1g8hiKz0h3XLkL9gRml5X9vFLMFz/k+CFVW9DlSMV3M+EXwog/
	9ljOZKEUeSiIa1Og9gZYeBbPRYq0MmYjMQqWN6MU6TVOfLh4TCFpdwWRYIDefSUi
	G6OdhAB/IkYNbd4Jc7dT3M5SA7UC3BOwYQ8xOlMflLSpoxzszKkojceEa2iHnDch
	Ct1Xb+MpDLJJlD3RtpowXOjH5bDl/K2qokQrIQwFKdKFA//pGmTmBwvr72N0J1sf
	VzDRmSk6Bfjgt9kQ==
Received: (qmail 298903 invoked from network); 28 Mar 2025 16:33:06 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Mar 2025 16:33:06 +0100
X-UD-Smtp-Session: l3s3148p1@GOZvyWgxBl1tKjE8
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/5] ARM: dts: renesas: r9a06g032: Describe I2C controllers
Date: Fri, 28 Mar 2025 16:31:34 +0100
Message-ID: <20250328153134.2881-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250328153134.2881-7-wsa+renesas@sang-engineering.com>
References: <20250328153134.2881-7-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To match the documentation and schematics, they are numbered from 1 and
not from 0.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index 87e03446fb4d..5889d391b653 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -268,6 +268,28 @@ uart7: serial@50004000 {
 			status = "disabled";
 		};
 
+		i2c1: i2c@40063000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,r9a06g032-i2c", "renesas,rzn1-i2c", "snps,designware-i2c";
+			reg = <0x40063000 0x100>;
+			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sysctrl R9A06G032_HCLK_I2C0>, <&sysctrl R9A06G032_CLK_I2C0>;
+			clock-names = "ref", "pclk";
+			status = "disabled";
+		};
+
+		i2c2: i2c@40064000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,r9a06g032-i2c", "renesas,rzn1-i2c", "snps,designware-i2c";
+			reg = <0x40064000 0x100>;
+			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sysctrl R9A06G032_HCLK_I2C1>, <&sysctrl R9A06G032_CLK_I2C1>;
+			clock-names = "ref", "pclk";
+			status = "disabled";
+		};
+
 		pinctrl: pinctrl@40067000 {
 			compatible = "renesas,r9a06g032-pinctrl", "renesas,rzn1-pinctrl";
 			reg = <0x40067000 0x1000>, <0x51000000 0x480>;
-- 
2.47.2


