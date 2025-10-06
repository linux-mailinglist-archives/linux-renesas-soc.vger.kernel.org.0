Return-Path: <linux-renesas-soc+bounces-22687-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF8EBBD581
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 10:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB8C83B672C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 08:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7646B261393;
	Mon,  6 Oct 2025 08:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="IdnUQzTt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA93260585
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Oct 2025 08:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759739352; cv=none; b=p40pVZM1GZhm8srLkwgP85RsGeNPJlqoHVhaY+VfFuz9mM2De2Tct5HgjUDT8dKejZqjsLvsJuvdUvQ1fEr4BKGbaVw4MPAnLvBafs6KOtXbGHiYpgyiaIKtHx65RQpvHD9yQoECJPgBEmptkNCsdw9zHmH8oSna3Ks5+YHILHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759739352; c=relaxed/simple;
	bh=ZLAoQ4Vfv/mK+hci51749JYZhdYKKs7NjBZI+r6MHMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X1RScquDnAt/BbZmQhD/JSTFvFQY0GBDItIKnUo5ksOcPeBwmbgovGbVVAZWeca/5w4mRDaZo7jFRbU1GCLI+m0d75HwGze5TUWpRt+6fBdTVHOFc4oaMnaNSH74vynnzYZAVrscJ2QjE9OrdDb8ZU2seo2Afh6hUJ5EIKTPC+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IdnUQzTt; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=181K9/jG7v8vBA6RLIijrckDfmUJZPl0kWQnmgoIOGw=; b=IdnUQz
	TtkxzNYkWjJqcFEz5kvGg2A4C69svGF82aGqhR73Zfgpaj14xI5eW5cc1a2Mk0zY
	tr8SbGuBS+kfZ2kuLUYaIkFKXbYl5+1r/mEbyBJj89K53diip8fQGht3fIteZ+rG
	ZWif0P1wvjyeFX27NyrAMmlOtxz7W02sDH9PD5vIlSJmPjcAEkbysVG11gFt92G2
	twcGGJEDz0UnOdwVqC1q4Wd1cifeIxWbAC+Ihl5xcAdCg8fLsEJkHlaItrc4iBjz
	MRe9y+CEN0r3NqjPDOVgvXfAuthEBZQfTMu1RJJubzxuzWOtPlbd7Zo/4+Ai3ngb
	E+OTd9MqdcPkqpxQ==
Received: (qmail 1689906 invoked from network); 6 Oct 2025 10:29:06 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Oct 2025 10:29:06 +0200
X-UD-Smtp-Session: l3s3148p1@wjajPnlAguwgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 5/9] arm64: dts: renesas: r8a779g0: add SWDT node
Date: Mon,  6 Oct 2025 10:25:23 +0200
Message-ID: <20251006082520.10570-16-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251006082520.10570-11-wsa+renesas@sang-engineering.com>
References: <20251006082520.10570-11-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 2dbf07211f6b..b8648921781c 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -234,6 +234,16 @@ rwdt: watchdog@e6020000 {
 			status = "disabled";
 		};
 
+		swdt: watchdog@e6030000 {
+			compatible = "renesas,r8a779g0-wdt", "renesas,rcar-gen4-wdt";
+			reg = <0 0xe6030000 0 0x0c>;
+			interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R8A779G0_CLK_OSC>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 1128>;
+			status = "disabled";
+		};
+
 		pfc: pinctrl@e6050000 {
 			compatible = "renesas,pfc-r8a779g0";
 			reg = <0 0xe6050000 0 0x16c>, <0 0xe6050800 0 0x16c>,
-- 
2.47.2


