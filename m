Return-Path: <linux-renesas-soc+bounces-14475-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA54A64DD1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 13:04:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6AFE3A4315
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 12:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C229F1A5BB8;
	Mon, 17 Mar 2025 12:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hVvC6I28"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5427119CD19
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Mar 2025 12:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742213060; cv=none; b=g3YSTJDrOwqABhjvgPvbTsrwxj6+5vjBIZVWlO2ZHY3PBgWOvShm7JJ6TYkKD3RWgyTZwXZTzneTKvKVvyoUTqx2PYh5D8TvYpdsNI3GuQhtQmvw15neLkZx9W87ykQuyxy8vWfubvsoiNoi4zoKI7O+yOpZNQXJYMMbQKsFe6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742213060; c=relaxed/simple;
	bh=xD7c/TtPeI+1/i/izO1jiOyNgb8gXTF8nn2R3yoQ7Tw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iFl50C4TzqGlj2ozsDXI3tljKJrq4/jGz3JzH0M859D433HARGewK9TKXcmGs6gOupZ1sIjOIzgbOBVaqp58NMUtxmHWi6YvzKLQmcu+gLfvCJzaeg2Q2vpkSgw++19nexUhaOH/YztgQ6eJn+Igk6y7HQc9o416vao2fZ/qf3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hVvC6I28; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=5RA4whu2QwalP3
	Cp7VKBx+SEgwqNfU0qSSnD0YK90k8=; b=hVvC6I28mvO5UUmqrZab6RZBVSy9b2
	ZXTAlxO8egTvpsQLzwTKCqQn/Hnt7KyklQq7fdteBTiwK8/zw/WLjnYde2ACkLbJ
	TiaLTe5EZ6PA+LeK2NAKcG60cuLJeoHM8p1E/Y6P0aNkUeRIYSWuRnm6s/HoQ3AO
	7TNuOvmc4i+GZHGe5sNyHRJOcKe9MiFsXWGfjsd9C0Z92w/AVwnVXkkIJ4kwEvVn
	kV9SXZjbDvxvOUpy885bgtKIWgUMgk44SxJ6X1ahMZYDNhkQShZF66PMezh8NLSy
	35RMGyVJT34SbDN6mXHulF/LYRluRgTSn/2CDqqSAlmVYDaox3HbULtA==
Received: (qmail 3133469 invoked from network); 17 Mar 2025 13:04:08 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Mar 2025 13:04:08 +0100
X-UD-Smtp-Session: l3s3148p1@xfHglYgwnMUgAwDPXyTHAJp038nK7dx+
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: renesas: r9a06g032: use proper ordering for UART DMA channels
Date: Mon, 17 Mar 2025 13:03:55 +0100
Message-ID: <20250317120356.67609-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit ec956e2c6f4e ("dt-bindings: serial: snps-dw-apb-uart: Switch
dma-names order") enforces "tx", "rx" ordering of DMA channels. Adhere
to it to let the dtbs_check pass it. There is no ABI breakage because
the Linux driver never expected a certain ordering and no other usage is
known.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index 7548291c8d7e..87e03446fb4d 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -211,8 +211,8 @@ uart3: serial@50000000 {
 			reg-io-width = <4>;
 			clocks = <&sysctrl R9A06G032_CLK_UART3>, <&sysctrl R9A06G032_HCLK_UART3>;
 			clock-names = "baudclk", "apb_pclk";
-			dmas = <&dmamux 0 0 0 0 0 1>, <&dmamux 1 0 0 0 1 1>;
-			dma-names = "rx", "tx";
+			dmas = <&dmamux 1 0 0 0 1 1>, <&dmamux 0 0 0 0 0 1>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -224,8 +224,8 @@ uart4: serial@50001000 {
 			reg-io-width = <4>;
 			clocks = <&sysctrl R9A06G032_CLK_UART4>, <&sysctrl R9A06G032_HCLK_UART4>;
 			clock-names = "baudclk", "apb_pclk";
-			dmas = <&dmamux 2 0 0 0 2 1>, <&dmamux 3 0 0 0 3 1>;
-			dma-names = "rx", "tx";
+			dmas = <&dmamux 3 0 0 0 3 1>, <&dmamux 2 0 0 0 2 1>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -237,8 +237,8 @@ uart5: serial@50002000 {
 			reg-io-width = <4>;
 			clocks = <&sysctrl R9A06G032_CLK_UART5>, <&sysctrl R9A06G032_HCLK_UART5>;
 			clock-names = "baudclk", "apb_pclk";
-			dmas = <&dmamux 4 0 0 0 4 1>, <&dmamux 5 0 0 0 5 1>;
-			dma-names = "rx", "tx";
+			dmas = <&dmamux 5 0 0 0 5 1>, <&dmamux 4 0 0 0 4 1>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -250,8 +250,8 @@ uart6: serial@50003000 {
 			reg-io-width = <4>;
 			clocks = <&sysctrl R9A06G032_CLK_UART6>, <&sysctrl R9A06G032_HCLK_UART6>;
 			clock-names = "baudclk", "apb_pclk";
-			dmas = <&dmamux 6 0 0 0 6 1>, <&dmamux 7 0 0 0 7 1>;
-			dma-names = "rx", "tx";
+			dmas = <&dmamux 7 0 0 0 7 1>, <&dmamux 6 0 0 0 6 1>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -263,8 +263,8 @@ uart7: serial@50004000 {
 			reg-io-width = <4>;
 			clocks = <&sysctrl R9A06G032_CLK_UART7>, <&sysctrl R9A06G032_HCLK_UART7>;
 			clock-names = "baudclk", "apb_pclk";
-			dmas = <&dmamux 4 0 0 0 20 1>, <&dmamux 5 0 0 0 21 1>;
-			dma-names = "rx", "tx";
+			dmas = <&dmamux 5 0 0 0 21 1>, <&dmamux 4 0 0 0 20 1>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
-- 
2.47.2


