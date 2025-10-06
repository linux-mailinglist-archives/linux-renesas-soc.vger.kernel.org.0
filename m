Return-Path: <linux-renesas-soc+bounces-22684-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0252CBBD572
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 10:29:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5BC71894A94
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 08:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EFFB253B73;
	Mon,  6 Oct 2025 08:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="J+4Phd6W"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC051A83F8
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Oct 2025 08:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759739349; cv=none; b=nnPZKZrRF5aaiqmCKZebgE3ZW1pAM/KzAvTccD0w6itne0N/ot+0SJXeHMX3Pn0HJ828qm8fLGVqI4nLKlqBq33KKh7miNhoqVqwiEANijh0B5FccWBOgeUFt5qhvANoixfRf0SPVff6+PsWUy1xRfYFEde044NpjUs5WBul1xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759739349; c=relaxed/simple;
	bh=abJqOc9GfnzVuw+uqEmUXc6fHK1DFxhracJkI5dRL9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=If8HwTyqDHfovgb5Bgb5eQ/MiM56FSupbsZCiN1prkeZDcXRqg/2H5KMJuignjHFFwS181P+8jY56AYIYTk1y/ZCp5nJjFuMdWoEQh7KnIFv2Bd3GQiL8FpcyetgvjPy5I3WW7EzrSw5LQGaqm4NHS5LjHTIq3olXnBraR3J5n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=J+4Phd6W; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=kj85Nsyv7GWGT3j77I3L3044JKkUb9fJSWu5YQprMX8=; b=J+4Phd
	6WihyZjJ+dbNPtZZZIm6vv4byBOkx3cLHdrU4dnHYb3oLpfW9eFhWgxZXyj+SeC6
	HLMyWDWU/ZDXKrcUbaGri8BccjnC92XrBFXLd6qhw4d4Pg+tAaf7c4bYoUNh0peK
	3oV4vmpfqJ43jtnEJA7efnZ2Tw9yAG+vi8tNPTyIl4LSJfJj0+SS8J7DkFnMzW+I
	ZTArkzYkSHI4uV2iltw+4vS8Ogiw8V8gfRwHI90zlh7FK4AwuRtjIqIOMZJz1y76
	85neZxwDMbw/pJLI0o0U7tmHWLYThowevHYJV/bd/PfZyv4tnUPw4YLznZSiJ5dx
	p/9JIemU1lRBhvEA==
Received: (qmail 1689845 invoked from network); 6 Oct 2025 10:29:04 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Oct 2025 10:29:04 +0200
X-UD-Smtp-Session: l3s3148p1@WJ+IPnlAduwgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 3/9] arm64: dts: renesas: r8a779f0: add SWDT node
Date: Mon,  6 Oct 2025 10:25:21 +0200
Message-ID: <20251006082520.10570-14-wsa+renesas@sang-engineering.com>
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
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index b496495c59a6..f5913444a391 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -315,6 +315,16 @@ rwdt: watchdog@e6020000 {
 			status = "disabled";
 		};
 
+		swdt: watchdog@e6030000 {
+			compatible = "renesas,r8a779f0-wdt", "renesas,rcar-gen4-wdt";
+			reg = <0 0xe6030000 0 0x0c>;
+			interrupts = <GIC_SPI 516 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R8A779F0_CLK_OSC>;
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 1128>;
+			status = "disabled";
+		};
+
 		pfc: pinctrl@e6050000 {
 			compatible = "renesas,pfc-r8a779f0";
 			reg = <0 0xe6050000 0 0x16c>, <0 0xe6050800 0 0x16c>,
-- 
2.47.2


