Return-Path: <linux-renesas-soc+bounces-22354-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F38B9E72D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 11:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F7E41651B7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 09:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B3BF2E9EBE;
	Thu, 25 Sep 2025 09:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="LTKQKFlf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7316127A123
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 09:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758793224; cv=none; b=c4hyAozYNqHEAw4X+o3LnAEt5bMxomzlmWdIEgFw81G7dJbHbYUZjZqrrumaWBudrV2yrKuSClNeFHIDdWuqpzXeB68KK8cRIvNB0KR192Sp8wmaGLDJnf3l44nnD8a2Ne4gY1qFt7A+cYB/ui4FKEsMeKQfm5xRuG+Haqw4HH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758793224; c=relaxed/simple;
	bh=wl0fnt3abRNUGrYJFkB2YYTAdyz8LuISSKunpUBoYyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WEmiuTsEjE5wiLlNWNn6Ut9eh1VcFwTFins0FwbajV25h9PVBQN/kJIiWUb3uMRKHjsJny+xF+9l1wj4tJL1JrE4mHcNRXho1M3FvUqfJILW7mwQED9xG34qMttmRRakN+PxFTamGyHhRc9on5/9wxGAxko/Pxnr30W8X20i8Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=LTKQKFlf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=HLkk2qiU/3c7u3l1dC2ibDa04BrDGSbeYzes5V0fB4U=; b=LTKQKF
	lfTDaKH0amB2hBI0jIUGHlZTZyXVQWPSgp0zy95KUZs65FnR2X+74KI79hI3LjAk
	G5skoT9+KeWwGi66UP7w8mYeIJAKToP2oDIpyz7Kh1UCWvgSc2Pg1et9GIlYId+k
	ApxNdIz6Ewb0+Y3ufX+EkJqIhdXnIl41qMgrh7Z6l3KyRNs+Qls/7HVbRB4iH7dw
	d7q6QuQ7ODAn9CEhzi1bvQ9OLNwbsJmM30RcnLfAiwGbDHDNG61yv+N8LbIRL9cu
	/AMmMCi2Yxdo6UB0YcjrlA5BomD4XaE/10GzdFqF+CevgHy+U0JCHkkJEjltW/IC
	btdl67pB1aaafF5g==
Received: (qmail 1813260 invoked from network); 25 Sep 2025 11:40:17 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2025 11:40:17 +0200
X-UD-Smtp-Session: l3s3148p1@Ombx9Jw/tsQgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 04/12] arm64: dts: renesas: r8a77965: add SWDT node
Date: Thu, 25 Sep 2025 11:39:43 +0200
Message-ID: <20250925093941.8800-18-wsa+renesas@sang-engineering.com>
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
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 353a77187089..2c414179f53c 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -201,6 +201,16 @@ rwdt: watchdog@e6020000 {
 			status = "disabled";
 		};
 
+		swdt: watchdog@e6030000 {
+			compatible = "renesas,r8a77965-wdt", "renesas,rcar-gen3-wdt";
+			reg = <0 0xe6030000 0 0x0c>;
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R8A77965_CLK_OSC>;
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			resets = <&cpg 401>;
+			status = "disabled";
+		};
+
 		gpio0: gpio@e6050000 {
 			compatible = "renesas,gpio-r8a77965",
 				     "renesas,rcar-gen3-gpio";
-- 
2.47.2


