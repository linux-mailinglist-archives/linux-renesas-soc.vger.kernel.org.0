Return-Path: <linux-renesas-soc+bounces-22356-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FE3B9E700
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 11:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 513B51897D55
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 09:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913162E9EC8;
	Thu, 25 Sep 2025 09:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TNvo22CC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5AF2E9EA3
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 09:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758793225; cv=none; b=k+KY8cO5wEK6XBXW6RU+wUfM64eeSY1XAJ7hkkkZ7VKaM/41mMN3GNnki2WkQpfz5+UJzf9uozb/70pA7QAEGB68ID7PemdzZnW3Ew6Z7EXGxhkhrppxs766/gt+H0fIgYX5WoA3AAi0/EZuRCr/Z8DBCTqgSiktG0aj+yyQwMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758793225; c=relaxed/simple;
	bh=LdC59B8vCcdQShpHMnlIQt/kijbNLkffN4b+5+SpG+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IiTkbHNSMuX5PyPD20EG1Poz68lsvHxScugVL4I1nQQLbManAKm+Yo85t4CQk83uJz3uEIigzQdxDqH2/Zr2szs606BjCUMMdyhV0PjsAoISzz/RY/HS4W2v9z23o+RvsZSq6lbkH/bogTAOYsQikJOBdNo4NynsQeCN7QLfBPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TNvo22CC; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=azjdS/31xiXDvKzUSYUSHrGQgfEqh9AOoCan+yQpTwQ=; b=TNvo22
	CCkgBJlndZY0JiiPHGXKoda44Youk+ko/lac8N+VuaQgXlR7EyXLGubOLYKBoZyh
	8cVjXz7E7RO6WQOmlXb8Y0McA/gFUTJwE5PlbEP8DEbvNETVdQW72wum1Bofg7qG
	/IKjlXELK6OLwNved4IoYfj2e9FakUkbwKfWghvvm+KX4zllBiBFMepCD6R3g1FR
	mDV9z4efbYozPA9qJ3+Hm5KlXEvKGI+ybuWqGOgV9MdPD22WGd5+JF2KGmV8VgS8
	lG4OvL/r11qsegkcy10ZGfdI/5V85mDWXVCsWYGXOEq2AhxsdC7F7779OHmbPuVL
	EcmJjr784ySgMTqg==
Received: (qmail 1813296 invoked from network); 25 Sep 2025 11:40:19 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2025 11:40:19 +0200
X-UD-Smtp-Session: l3s3148p1@WTIJ9Zw/xMQgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 06/12] arm64: dts: renesas: r8a77990: add SWDT node
Date: Thu, 25 Sep 2025 11:39:45 +0200
Message-ID: <20250925093941.8800-20-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250925093941.8800-14-wsa+renesas@sang-engineering.com>
References: <20250925093941.8800-14-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index e16ede6eb379..a7a692dc5d62 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -171,6 +171,16 @@ rwdt: watchdog@e6020000 {
 			status = "disabled";
 		};
 
+		swdt: watchdog@e6030000 {
+			compatible = "renesas,r8a77990-wdt", "renesas,rcar-gen3-wdt";
+			reg = <0 0xe6030000 0 0x0c>;
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R8A77990_CLK_OSC>;
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			resets = <&cpg 401>;
+			status = "disabled";
+		};
+
 		gpio0: gpio@e6050000 {
 			compatible = "renesas,gpio-r8a77990",
 				     "renesas,rcar-gen3-gpio";
-- 
2.47.2


