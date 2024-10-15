Return-Path: <linux-renesas-soc+bounces-9790-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5F599FBAF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2024 00:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0952B21276
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 22:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E19D1B6D07;
	Tue, 15 Oct 2024 22:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="IvMKWL0a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2754E1C75F9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Oct 2024 22:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729032505; cv=none; b=Acut7MDYNuwdU9ngHwe+4zGf++JXks7kqEdJl0AjNsaudAS1E8SSMxptnN+jJ6qhq4X/I+yPslI2KKdUqVnNjF9hkm1evtEfPdqUxi2cSS85vRJJZx3IqIbEKoDXr4VRcY1ldXU24c2Rm8kUEzLxkS48N5t06k5Ppkf8iUoj0hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729032505; c=relaxed/simple;
	bh=IYeFdHGq7UAgvdz935F3N18dCTBfJ1d06OlXs20blCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JI63MupsHxm5T65x4Kh/eErQnH2edj4Cca5WPNIlpv0TJ3KYGBY2Lj89fdxtecicpqCLGvgthqxSTyW3BnUnHfi+muarZE0GWrAKDciW2cCyk0E+RUpmkd5X/fz8VcP690fGHjx1sVZuDEsKK9pVh016Evun17Jh1EAtoD9Zkd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IvMKWL0a; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=t8e73g0ZwOkpJ7ice19ovIlI3gus9d/Y5WjZUeume8c=; b=IvMKWL
	0a1TO3Ekz7XKjvwkvvabl7iw5fRsl+9sQDdu6jiyU0zEneO6xK1qp9Lf5ABd8K+Z
	38knRxpefLr1xHn0kKjT1uAQehUZAgC5OBn4t9IHAJ/UnoI2yybQLYLpepqmi9pT
	lKtlRM4G8kZIvh9zbKU4PFZIOuhLQotqJ7CKckoxfRjyX322U/+lsxhBywpy+Dzs
	6VVZDQJwSgPqto/4td5l2YEVqCN3sWaqY9K8oo/jGaqefoPnJVIOMRUP68ePFGlH
	rPfy1LxDlO5m6HEqMnGfDw8r8UFCDnljp3MPGVqytOG2Ofdr9uepHb88fZN4v32r
	xr/bsAVeXrcWsA0w==
Received: (qmail 2861195 invoked from network); 16 Oct 2024 00:48:19 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Oct 2024 00:48:19 +0200
X-UD-Smtp-Session: l3s3148p1@Zn3lv4skvLIujnvF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: renesas: r7s72100: add dma entries for MMCIF
Date: Wed, 16 Oct 2024 00:48:03 +0200
Message-ID: <20241015224801.2535-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241015224801.2535-4-wsa+renesas@sang-engineering.com>
References: <20241015224801.2535-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/renesas/r7s72100.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r7s72100.dtsi b/arch/arm/boot/dts/renesas/r7s72100.dtsi
index 02ca28b521df..b831bbc431ef 100644
--- a/arch/arm/boot/dts/renesas/r7s72100.dtsi
+++ b/arch/arm/boot/dts/renesas/r7s72100.dtsi
@@ -332,6 +332,8 @@ mmcif: mmc@e804c800 {
 				     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&mstp8_clks R7S72100_CLK_MMCIF>;
+			dmas = <&dmac 0x2cc9>, <&dmac 0x2cca>;
+			dma-names = "tx", "rx";
 			power-domains = <&cpg_clocks>;
 			status = "disabled";
 		};
-- 
2.45.2


