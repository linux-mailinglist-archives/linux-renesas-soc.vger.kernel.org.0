Return-Path: <linux-renesas-soc+bounces-9073-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCA6987195
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 12:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23D1DB21F6F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 10:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FDB11AD40D;
	Thu, 26 Sep 2024 10:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FT9DKXc6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE631ACDF3
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Sep 2024 10:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727346838; cv=none; b=TNsMs7OwaAUSEsUtkkXT4KEZ0w36oQmxnazBQwC+4U5UCoPlH2ScKkacjcXCKAWtw16WQTU66LeVYZgMo9PrFyEBEz/DjFBDqdEWfS648hwhqTH04//3xvcsXeW1/RO5gKnXAqx39OYmzKr6qZiby74Sye6B0MAcfsVvt+5qQ5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727346838; c=relaxed/simple;
	bh=67twMRwDvSq/Cv9XIu9hydFL0HjlX4MnEN/9pcCi4t0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pa2i4/J+LdzFpMKYt+5MROtbpDox0el7tnUz5XxEDgu/nB2ra6rtWVPQ5aTo1z7QgpPRb2F9cIwhJxN8laPzlOXRSeDLjRxRoTkJpmh2E+frGVpzwGwtMN9eIbnelG1crlEFga2mWeEj6TzqGW66JkDYguko/l9k+IghX+4VAMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FT9DKXc6; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=n1U/20zhum8W4Gqgi5IaVepnxTWQ+HVg84Qj5oN1JDw=; b=FT9DKX
	c6ssmMGynjjyxVb05fipgJrMv4y9o8/UeTr26eslvR7ldu4Iq9MM8atqXtIXZsrA
	T3YYysI0fbOtxRsseeqvU9EzrO2YGehVYn3nYhpRk/gleXIKLUbtt3pIt9z+KIfY
	KHE1qVHwpLtlm0KAwjKW2ICAcxp7NLOMRS7jWCMCDXkb7sOdfrcL1RVDPV/usmBj
	Kwc4C9XRuheisAbGHkGWDadPa6otQnyGPKfh1Bo8tvLYzL7m/Fvf3cHr1+MuxVSz
	3Eb8Wrqg20IOfxUMW53Tw3lHbj+dVbr/ijvWmI5yEeAk72nhOVmUz5EqkYBbBdsJ
	tbjQ+DADor52861w==
Received: (qmail 951223 invoked from network); 26 Sep 2024 12:33:53 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2024 12:33:53 +0200
X-UD-Smtp-Session: l3s3148p1@FxZrRgMj8KwgAwDPXzRXADDuo30Z+IZ9
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] ARM: dts: renesas: add proper node names to (L)BSC devices
Date: Thu, 26 Sep 2024 12:33:41 +0200
Message-ID: <20240926103340.16909-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240926103340.16909-4-wsa+renesas@sang-engineering.com>
References: <20240926103340.16909-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

(L)BSC must have a "bus" node name [1] and no unit-address because
there is no reg-property. Fix these entries.

[1] lbsc: $nodename:0: 'lbsc' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/renesas/r7s72100.dtsi | 2 +-
 arch/arm/boot/dts/renesas/r8a7778.dtsi  | 2 +-
 arch/arm/boot/dts/renesas/r8a7779.dtsi  | 2 +-
 arch/arm/boot/dts/renesas/r8a7792.dtsi  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r7s72100.dtsi b/arch/arm/boot/dts/renesas/r7s72100.dtsi
index 07ffd9ec96cc..fa26e4a39fd7 100644
--- a/arch/arm/boot/dts/renesas/r7s72100.dtsi
+++ b/arch/arm/boot/dts/renesas/r7s72100.dtsi
@@ -36,7 +36,7 @@ b_clk: b {
 		clock-div = <3>;
 	};
 
-	bsc: bsc {
+	bsc: bus {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm/boot/dts/renesas/r8a7778.dtsi b/arch/arm/boot/dts/renesas/r8a7778.dtsi
index b80e832c9277..ab3e42bded8c 100644
--- a/arch/arm/boot/dts/renesas/r8a7778.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7778.dtsi
@@ -40,7 +40,7 @@ aliases {
 		spi2 = &hspi2;
 	};
 
-	bsc: bus@1c000000 {
+	bsc: bus {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm/boot/dts/renesas/r8a7779.dtsi b/arch/arm/boot/dts/renesas/r8a7779.dtsi
index 1944703cba4f..e437c22f452d 100644
--- a/arch/arm/boot/dts/renesas/r8a7779.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7779.dtsi
@@ -704,7 +704,7 @@ R8A7779_CLK_MMC1 R8A7779_CLK_MMC0
 		};
 	};
 
-	lbsc: lbsc {
+	lbsc: bus {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm/boot/dts/renesas/r8a7792.dtsi b/arch/arm/boot/dts/renesas/r8a7792.dtsi
index dd3bc32668b7..08cbe6c13cee 100644
--- a/arch/arm/boot/dts/renesas/r8a7792.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7792.dtsi
@@ -84,7 +84,7 @@ extal_clk: extal {
 		clock-frequency = <0>;
 	};
 
-	lbsc: lbsc {
+	lbsc: bus {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.45.2


