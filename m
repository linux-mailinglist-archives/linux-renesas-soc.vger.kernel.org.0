Return-Path: <linux-renesas-soc+bounces-22107-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A8EB8C0FA
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 20 Sep 2025 08:44:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AB3E7E4AAB
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 20 Sep 2025 06:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B963F2D6611;
	Sat, 20 Sep 2025 06:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BiAneEiK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90A72D5C97
	for <linux-renesas-soc@vger.kernel.org>; Sat, 20 Sep 2025 06:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758350693; cv=none; b=NAl48NfCfdURg23OQEEA340RXfjZvKiA1PDLw8HndnofvSfH1o2PM7/lt+GI5ETY7xS7pjoYrQt+3cAdxz/FMZmRi5vObqy+eN4nLtkSIsJwM4BYtwPAT/WEeWdy0yvDUVgRU21R0jvZn9WWDyWUD45PV0vq530LWH3R3F8i0WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758350693; c=relaxed/simple;
	bh=HG4YPpLkRmb8dO/09/uStf/H8rpgRkf5QbSiBhwmH+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XWbyugNii5b+ruWL42bTJx0aV838FAr5aPXLyK7qjBJFAL740jDlp7IMIUwExE30jFs0xm+3iWcShjDDU6tS2l0KsnLuq5mVQvKMiRJW8bV578gltE1oQFcweC3kRNea79qXAcCDo2LMK1rYPPvtk4A/YmSL/Yjjfo7+tw6nGMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BiAneEiK; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=L83T0z76GCpkvFYkVvej4Iy1UjLMdmPYpykho6d/5AE=; b=BiAneE
	iKA5mN9yLvSmIqidwaufW0lyxqSeCrBTnLTqqDNR962docJ2RKSVFteSSK1rGyDl
	Y+r8Plyn5bphEUPThKOuixb72vZT1I6axEnH05y0oJ3bLqmFJwko7PqQRqCZh939
	PVFOhAjS0DyqXHiNnc4uvIcgZYDmX8NTWkkv0T+f5XaPAZFfdHUkjHQH2HlkbNiV
	zbogyaN7xPDbkJSa0fBZkgovEiJKv+63oDPbPl/3UXcKVyV9UyDQ/wr2uzNfh4q+
	og32xPzCiEuHIAogGQi8bTYIXQEX2nF1r8v++869OALnV/3OwH2rS4odBgRz/4Ki
	rV51PT6UTE7zaHDA==
Received: (qmail 4169302 invoked from network); 20 Sep 2025 08:44:43 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Sep 2025 08:44:43 +0200
X-UD-Smtp-Session: l3s3148p1@5qze6zU/aMkgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 3/6] arm64: dts: renesas: r8a77961: add SWDT node
Date: Sat, 20 Sep 2025 08:44:30 +0200
Message-ID: <20250920064428.5544-11-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250920064428.5544-8-wsa+renesas@sang-engineering.com>
References: <20250920064428.5544-8-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 1637b534fc68..bbfd72705db3 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -330,6 +330,16 @@ rwdt: watchdog@e6020000 {
 			status = "disabled";
 		};
 
+		swdt: watchdog@e6030000 {
+			compatible = "renesas,r8a77961-wdt", "renesas,rcar-gen3-wdt";
+			reg = <0 0xe6030000 0 0x0c>;
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R8A77961_CLK_OSC>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 401>;
+			status = "disabled";
+		};
+
 		gpio0: gpio@e6050000 {
 			compatible = "renesas,gpio-r8a77961",
 				     "renesas,rcar-gen3-gpio";
-- 
2.47.2


