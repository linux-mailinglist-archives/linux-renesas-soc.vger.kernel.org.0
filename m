Return-Path: <linux-renesas-soc+bounces-22350-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAF5B9E6EB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 11:40:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F05653A7321
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 09:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91BA11BC9E2;
	Thu, 25 Sep 2025 09:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="VDmmk6I4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB58928468C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 09:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758793220; cv=none; b=qfGXcqcArJRc4e+RxSfQ7F41+RiX2PcPagnsnf5LbM1GNzy5MAcwG3Gfsp2nbTJ5fkm94femT+zAzwsz1BoOuZOelH4prqs0jMoX79uBvNdbGAm2hdhA8kka8tECC8SMqPZb7oXUBNMMsmuviayVDoF/7TlDvjt5bkVA9eXAubU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758793220; c=relaxed/simple;
	bh=adCNxgKFruXwiC9WhVVvWimxEkESUZD2mVICOOLgnMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CqorA+v/EnrAjpl0MT8ksfzzelwe11QzJriIFla9rslvELlLJA40HU2zdX22MRuPb5obAchOcQFIC61a88hxUkIR7OqXaGMWh0jmQ7mZGlZFaehFTtkZZ7mCyJc83nNIxZmpaurnMpOsPhPlEw1Y1r2QtlNKfCe/FgeoNjQ2NM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=VDmmk6I4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=4s70JkcfftvaCF9XrXy2cBd/Dwx356YlZSYmzXN5DTQ=; b=VDmmk6
	I4R/Dh6nNvjQNMdS8NHI9pmBvYGZl/M8jrmkJ7bVfOaLlaWLw96nJvmDuZA9Kjly
	9sGEbTXimk5dk2ybbXUqy1kWV+QqrpfqBSWMsY2rTlNKHjF1u43gFZ7wg9Uo5znR
	oGTIz4zYOn8yYhf1ZwCR64jG50BnJeCFKuqL6KPBaYp12WNcT/UuJtwBtQboYhLL
	tXxOdaRgblNt+9u1u12k7OACExer9Q7uiH8/T204ktao0K5rPfoZeux1BFqTzj1U
	q7zswz0hXW245tRehHo8zH3A+6HHEBLS0wzJBbJLaDT/fPn+EmSMhXzHM2yih7Lv
	c1hwBxL2NZxRmi+A==
Received: (qmail 1813184 invoked from network); 25 Sep 2025 11:40:15 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2025 11:40:15 +0200
X-UD-Smtp-Session: l3s3148p1@KZHY9Jw/sMQgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 02/12] arm64: dts: renesas: r8a77960: add SWDT node
Date: Thu, 25 Sep 2025 11:39:41 +0200
Message-ID: <20250925093941.8800-16-wsa+renesas@sang-engineering.com>
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
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index 6d039019905d..2fd08c002a47 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -330,6 +330,16 @@ rwdt: watchdog@e6020000 {
 			status = "disabled";
 		};
 
+		swdt: watchdog@e6030000 {
+			compatible = "renesas,r8a7796-wdt", "renesas,rcar-gen3-wdt";
+			reg = <0 0xe6030000 0 0x0c>;
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R8A7796_CLK_OSC>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			resets = <&cpg 401>;
+			status = "disabled";
+		};
+
 		gpio0: gpio@e6050000 {
 			compatible = "renesas,gpio-r8a7796",
 				     "renesas,rcar-gen3-gpio";
-- 
2.47.2


