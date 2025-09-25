Return-Path: <linux-renesas-soc+bounces-22352-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E0AB9E721
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 11:40:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82D60162C73
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 09:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58BD7219E8;
	Thu, 25 Sep 2025 09:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="L771q2wW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A752773CA
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 09:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758793221; cv=none; b=A4CQ7KIB/A4S8rLiifjkIIWr9rIwP+i3LMDyag7G64mGpoPAFk8VMw8ZLzdgi5A8LaZohaZMf9I+wo4OKD/StzHRcE3pxM4Mr67Tg8JayECBGY80vqtktgCd0agh6a6uJOGafUiHvqlfPM62I112UzUU7Bp9joS1p6U5Icw/7CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758793221; c=relaxed/simple;
	bh=vWZrEYsYkuX6mUArduhpirnfzBtwp8yyYJ4zdu+2hvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UoqX4S5yVdftS5nWKVUXyiMrpnYgCZDzGDnA8m+CyleVnCDFmO6wEcFgQGij0ZFjkFH++DKc3rJ7G0eTwd5Rzb5yBqQl7u3DYyPTlUuIYUaN6ihhbG1TIOe8tlgIiDeYUrceAsPdmplJ/3uw9iJG0ltXzwFKd9LlxX3xS1xZbIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=L771q2wW; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=tk1I62tLI0Vb8/eRDzu0H/ZdlVw1gol0e2AqPUX9ebo=; b=L771q2
	wW2BrjlVL+yr5StGjHzdjnAvxInIUiqb3x2QUHWl7FpTdH/yCZi57mccneFgevy7
	kS+WOuebWeZrwya4Oet2Lr6MHTfpCQlyVNT9M3esVs47437hLkAeS/2vhgnuAhoy
	HvMS2aF++s6ZUMQdsC/butgMIOXP2rkHXe/iERhObCjyTlfGM2/l16dcoFoYbLYS
	QpZtJLvh8Qx2lkde9L4T2gmffSg6cLfC9ZHHEvO+vkD/Cw2emv8wlDSPPucSrQc/
	5KC3b9HTxKfN0aM8e7qJ69X/NfZFT7EkiAhh2ZQ6bdiX0qUmaEutpEUeFXuPswOS
	+iWgYuD/009rcUqQ==
Received: (qmail 1813144 invoked from network); 25 Sep 2025 11:40:15 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2025 11:40:15 +0200
X-UD-Smtp-Session: l3s3148p1@dcDM9Jw/osQgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 01/12] arm64: dts: renesas: r8a77951: add SWDT node
Date: Thu, 25 Sep 2025 11:39:40 +0200
Message-ID: <20250925093941.8800-15-wsa+renesas@sang-engineering.com>
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
 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index c389ebc7e6ce..b3e935e5a2b1 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -365,6 +365,16 @@ rwdt: watchdog@e6020000 {
 			status = "disabled";
 		};
 
+		swdt: watchdog@e6030000 {
+			compatible = "renesas,r8a7795-wdt", "renesas,rcar-gen3-wdt";
+			reg = <0 0xe6030000 0 0x0c>;
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R8A7795_CLK_OSC>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			resets = <&cpg 401>;
+			status = "disabled";
+		};
+
 		gpio0: gpio@e6050000 {
 			compatible = "renesas,gpio-r8a7795",
 				     "renesas,rcar-gen3-gpio";
-- 
2.47.2


