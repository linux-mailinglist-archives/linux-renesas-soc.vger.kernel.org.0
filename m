Return-Path: <linux-renesas-soc+bounces-17473-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 279D5AC359A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 25 May 2025 18:04:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03EEB3AFDD6
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 25 May 2025 16:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3371E1F4C84;
	Sun, 25 May 2025 16:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="p6BaVQEw";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="HbsHrf31"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAB13FD4;
	Sun, 25 May 2025 16:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748189045; cv=none; b=pk4yqg8syBrzalaIvegMis58bSNjRufg9Apj3mH9PGhBYaHEihSIEL513NLPNnsSufMO19lxae0gNGM7v7AlchozKFvPrS2ecdhPmxYWE7AgqSrAzo1aAQ1ApW1hE3QqdlytimyAlmSDXvOcq0iE91ehGm4BpuZnT4AOwFXx6tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748189045; c=relaxed/simple;
	bh=AADqUTF9411YoPQ7UCsg6nn51cAS7OxZswZiIQf22Qs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D8u0E5YSRiVjaJB2/+TV4227cPDJW3ydf9fYXqd80Wf+qV5TfO7ArYHaZDgzrYXSdu3MzOo+6aGSgoG8MwFzibnlbsaV9/OBm2CaJTB9ald+3kv1IR9O36poQnKKGUEXzlHBTR5Pb6tWzEeNy85v0FcY0GfBIGFBRDu74ip4Fmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=p6BaVQEw; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=HbsHrf31; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4b53bt4NTqz9scd;
	Sun, 25 May 2025 18:03:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1748189034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Itmuf2YdiTbmwIMamc/71asQgOph9WVmB6xFeHxYhFU=;
	b=p6BaVQEwaVVx1c5Q1BlAYVHGhgdM237qKzEFBqmHgOB87lzeL38zX5wp85G4b876aOH5Um
	yBF9yvV0/CKp4cIErMZnJoKIUCAsuwQYK/fclRVBb0cgnmu6ZCZinvb9m2MO4chptxmnRe
	EytYQiWqtapY8ZLdVxVjxY4a/xPRwyjSNhTBxrdWD8ARWZ/mXUB9UVbllmNcbRbDnEstLZ
	0RTlBate4JPKOnbU7yM5LG3nPOfqlXPZQ0kRbLzXUGbilLPBIVv+x9sgRxFfOd6M2kjsm/
	Vu1Sm1JrbUVvYQYnTd+GhvlNJm1Wsh0aarudH9Zx4yzvRobq30whl3Hmw9yT/w==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1748189032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Itmuf2YdiTbmwIMamc/71asQgOph9WVmB6xFeHxYhFU=;
	b=HbsHrf31tDx773iC0C4d1OyiBZAqBk4ZNJ3NK/wnnCBQjQ2diDhAX8SUAxbGt5vXE2nNJ2
	D7otFtUlWwFAZnD4zqQi8exFtuj/dKPDZFnibv/Eivkr/AuklP5gK0bPQ6GdzDshQef330
	LV+xENyjigwPMHjGQr1z8gzk3unPlAcXsshSD4Rbv0QFlbW064Eq7H+23o+fA2JAfT+rLF
	Qitwb1qa5qlxI1Fn0JXQeYOh7bq84j/AFn7vDe8HsaTnu9kBxIcDb3OIM9qMXx9uavu1LP
	f1WHVCcqQk51dq9TMhijZ1hwjarKpDsvFcblADe8oxM0t8Cc24HDGJQr68qdZw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: r8a779g3: Sort DT on V4H Sparrow Hawk
Date: Sun, 25 May 2025 18:02:43 +0200
Message-ID: <20250525160336.82960-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: f8b1095690e590fc411
X-MBO-RS-META: ygbne5fdc6gxm7kdpujnnhwcszrw8iya
X-Rspamd-Queue-Id: 4b53bt4NTqz9scd

Sort DT alphabetically. Fix up the placement of &rcar_sound {} .
No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../dts/renesas/r8a779g3-sparrow-hawk.dts     | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index 6955eafd8d6ab..b8698e07add56 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -679,19 +679,6 @@ sound_clk_pins: sound-clk {
 	};
 };
 
-/* Page 30 / Audio_Codec */
-&rcar_sound {
-	pinctrl-0 = <&sound_clk_pins>;
-	pinctrl-names = "default";
-
-	/* It is used for ADG output as DA7212_MCLK */
-
-	/* audio_clkout */
-	clock-frequency = <12288000>; /* 48 kHz groups */
-
-	status = "okay";
-};
-
 /* Page 31 / FAN */
 &pwm0 {
 	pinctrl-0 = <&pwm0_pins>;
@@ -720,6 +707,19 @@ &pwm7 {
 	status = "okay";
 };
 
+/* Page 30 / Audio_Codec */
+&rcar_sound {
+	pinctrl-0 = <&sound_clk_pins>;
+	pinctrl-names = "default";
+
+	/* It is used for ADG output as DA7212_MCLK */
+
+	/* audio_clkout */
+	clock-frequency = <12288000>; /* 48 kHz groups */
+
+	status = "okay";
+};
+
 /* Page 16 / QSPI_FLASH */
 &rpc {
 	pinctrl-0 = <&qspi0_pins>;
-- 
2.47.2


