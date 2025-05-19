Return-Path: <linux-renesas-soc+bounces-17197-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E499ABBD7F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 14:15:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE88B7A3AC1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 12:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7DE2777FB;
	Mon, 19 May 2025 12:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="l8of7nHf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1281C27586A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 May 2025 12:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747656936; cv=none; b=Z3d0Nki1Z3ChAgtpJEq9BAi/IghpEl0EtcEfmYmwX/5+98RRymfo6VdORPvhfCEyttrVEQIVpC9fB+nMvcLW0w2M6JIFHRyotmKJtRLMMUJmsZKGSAsRL+o6u+zVVt0sGgK/hVbEq6mOoZ8sd1+cxkajaSvGdIJegIhgJp8UTtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747656936; c=relaxed/simple;
	bh=Oy70mJNGM9H500zL05oh7Gy2RqF0SFVS4i3OoDdeSgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nzQzfaO1sREjxC7R9PrHrW7CV6jEAjNHJFA6E3LapCmv7qotW1B5s+MhkW8KF3YE78O7vrWXKzduBkBDchdEn6P+cKb4i/IoP0x+hMv8aV2m3HtWyrfUbgeexbm8JV9UmX4d6DukTJxBPUCXjtX1lwzRvFhWHpDnoqAmDp17BXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=l8of7nHf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=gijxyCyytDbmc4M5XdFf1uYXgh59hs4F48lFszGnbNA=; b=l8of7n
	HfV+gYyTLUwtnsByOuEYpsvO6xIu+iKDrwLAr/DKGutFPE6XNvp+f9Ba6L/JATIS
	iyZhOSNv94F2fK/9x9pj9zhv6FNi47h53VZAPJjUbUm28ASiEE0XCqv9nyzh4Afx
	lu1A8XaLBE8wj9PMICNA5/Jgb0sE8tfMUpv3I/CJ5CK041XTLv1GwW6h8rIkQtJz
	iyPb8PvfVhrKTuyV1YkjcFyRvq86JttVi7fqvEe1RSfXayHzvO9zTJLkqZyMwd2o
	pDBV7whFi9qkqNrS4qJtFG0ykgPHijwSXh8nF7QXjas6GHukYEC1yIJKxq6LaS5i
	ZtwRvwVU7HBr6p0g==
Received: (qmail 2475329 invoked from network); 19 May 2025 14:15:32 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 14:15:32 +0200
X-UD-Smtp-Session: l3s3148p1@GdCdFnw1NLBZz6+V
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	devicetree@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH 6/7] LoongArch: dts: use proper node names for GPIO based I2C busses
Date: Mon, 19 May 2025 14:15:06 +0200
Message-ID: <20250519121512.5657-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There shall not be a '-' before the number.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/loongarch/boot/dts/loongson-2k1000.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/boot/dts/loongson-2k1000.dtsi b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
index 1da3beb00f0e..ddf63801eef0 100644
--- a/arch/loongarch/boot/dts/loongson-2k1000.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
@@ -46,7 +46,7 @@ cpuintc: interrupt-controller {
 	};
 
 	/* i2c of the dvi eeprom edid */
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		compatible = "i2c-gpio";
 		scl-gpios = <&gpio0 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		sda-gpios = <&gpio0 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -57,7 +57,7 @@ i2c-gpio-0 {
 	};
 
 	/* i2c of the eeprom edid */
-	i2c-gpio-1 {
+	i2c-gpio1 {
 		compatible = "i2c-gpio";
 		scl-gpios = <&gpio0 33 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		sda-gpios = <&gpio0 32 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
-- 
2.47.2


