Return-Path: <linux-renesas-soc+bounces-10620-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5819D35FB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 09:54:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FB74B214F6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 08:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFEEE176FB6;
	Wed, 20 Nov 2024 08:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HPXwIyP+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7800172BA9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Nov 2024 08:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732092843; cv=none; b=SvcbAY1j2GhnMfSFoXOxPzbGMJZp8lVNN1zNJ3e5RuZ/rV9ekw41qMzeubjt+w1CU5jz3Zoo6KkaOeJ1jqWxIxHRGAxpKYuISd97I8ws6z1+ljoKj0hfc7l4W2fDqapseetuIQoGBODpdx1oBnu306X+BZuOCEQV6JbfP89CFWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732092843; c=relaxed/simple;
	bh=51UQGBmULonluEbQpgbhVHYS6EalistYtOLeMb1RpE8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TJulWs069VVIkCn2C7MnFcskn7OZWmSIK2ZvFV0hV2h3a6kkepaGnVSp8Cg8crPfCgRk+y2XbDZOHCUb4yBd4n5c042J50JeanoTXGCQBqF0IXB09FRSxq7jeR4VI6ezqptKOguIeJZ0iyRy7NVdtRVQwjUdRs38kkAyxJH/WT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HPXwIyP+; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=9bTMNp9DbYwBHM
	G/d5lcJpQICn9C3Vzzzug+gmRkH44=; b=HPXwIyP+XddsG160fafKfED5+lu8Hv
	PbPTLj7unW6wqsJZ7NLHSHudjz4c3bOKT6nP4h//ydazg1h+oYrIu2BAfuhfB+f4
	YoZl7f5+uIVeWOiBZA2ELuvG7oOftB3bBqDZZiAccExtACx7T1MUgVvIQzFGrG97
	ZUZQLUaL/v2A01yhj0bChkGFpbc2YVQuD6eBLhkCGQFg4rjknW5x4oY6F5OEt5Fl
	HISmOpvXHXKBVF9VGvakMHTW5jnAZ0F+jGWh4CkJgdKGJ4hm3knl86pzcubLsYO9
	8dbZiTJXZkhkgDjh3SihXI5t0ziTxM+tVzYtx5oQrmrm/TON5M+V2dpA==
Received: (qmail 838038 invoked from network); 20 Nov 2024 09:53:59 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2024 09:53:59 +0100
X-UD-Smtp-Session: l3s3148p1@RftrSlQnot4gAwDPXxznANR4Jedc6XSv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: rzg3s-smarc: Enable I2C1 and connected power monitor
Date: Wed, 20 Nov 2024 09:49:59 +0100
Message-ID: <20241120085345.24638-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable I2C1 for the carrier board and the connected power monitor
ISL28022. Limit the bus speed to the maximum the power monitor supports.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

i2c1 gets enabled in the current SoM-DTSI as well, but to be safe
regarding other SoM DTSIs to come, I opted for explicitly enabling it in
the carrier board as well.

I picked the 'average-samples' value using my gut feeling. If someone
has a reason to pick a better one, I am all for it.

 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 7945d44e6ee1..5e4bfaeafd20 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -73,6 +73,19 @@ &i2c0 {
 	clock-frequency = <1000000>;
 };
 
+&i2c1 {
+	status = "okay";
+
+	clock-frequency = <400000>;
+
+	power-monitor@44 {
+		compatible = "renesas,isl28022";
+		reg = <0x44>;
+		shunt-resistor-micro-ohms = <8000>;
+		renesas,average-samples = <32>;
+	};
+};
+
 &pinctrl {
 	key-1-gpio-hog {
 		gpio-hog;
-- 
2.45.2


