Return-Path: <linux-renesas-soc+bounces-10535-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C54A49CE08B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Nov 2024 14:48:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71C511F23B81
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Nov 2024 13:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918A01D54EE;
	Fri, 15 Nov 2024 13:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="lubXZk1Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01161D5168
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Nov 2024 13:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731678263; cv=none; b=r0Gn5XjdvFKiltLPgNb2hLikY+5lPAoREeFrqsg/NDQWODSN7/p89eVmh8JfywG0Z3gm3GAWv56BdZn605DXL8kT8AZgpor8uMlLfuCWNHg1AB7nHAKLKFjjDGnUL5w1glqykXnmrKCkJEEAZQuqACE1RIdQuqVyCZowvD6DSl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731678263; c=relaxed/simple;
	bh=wtEJOHWb57zTAiri+QKgQmXTlVnXlZ7+4fhBUT3i/40=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZcI2DjoXJ2yB2lUroLVzRuDs8Tx7APh7gjryDg38oO5g1IHWPTzF4B76eEEJG7zhmgYaxc2IFvUmIXCdYz+eUyCBUelu9GJ2yIrNY+hm9D4qKS9p95rvHFp7QnCO0Kme+cdq8azs8E/7TAtSBSFXQqS8Qu38lqM1jZaFBDAim8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=lubXZk1Z; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3822429c615so807271f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Nov 2024 05:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731678260; x=1732283060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+YZBVsJh/VAUGpi27AVY3ok+hT+IMM3cBf29hG05qA=;
        b=lubXZk1Zw5kX3u1zKHF4nCSltamqcgiPkhXREvA89U2bxDFodJKhXEYbUYrgqwcrFu
         Od85TqB7HJpDw10X/LeLKGi/sdamDhe3xamaCz79D3ai4y0/F0go/PgiWO2MuZyV15V7
         Em2Oh55hRWb5rBD04ge0KzxINKMhIHi+JdIstshvhlf5NUGJl013BwJIsg76Z06hKc1Y
         V3fEbECo6MIyXm8KxgXjlwubw1lu2iR+c/4tPmfseQtDOeqIYo5V+0iUKfFC5r0UCXpb
         ybz/DocitE6UBKFZJQg5ItMXIPTzxtddWrYf2idLxIDsoBob/YCNJjkYWGC0O0TdCH9I
         /pOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731678260; x=1732283060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+YZBVsJh/VAUGpi27AVY3ok+hT+IMM3cBf29hG05qA=;
        b=cCSsl0PT0sMGAppwvCwfx9iM+hFmTAK+A8vtiJCPds7A8UwBTkbMQVdxKzilBG/B6U
         GH5+dYr/2O80sowF1LMf79AUIrewAxm8qHIfbKlbKyKiPR66rN4xCWQe0UYMirPi+tco
         f+IcZXtfidjcMOJBSWqb0MJfC0illgJbj0obtaJxRtna/1it6pG7qdfhnN/0TjddqIrj
         vRMK2l9n41uBtslOHf0lG7JpWvZ90ZLgMdxo+aRP49erTMIJ6NULelf6vZ/FyG3wWnT9
         eykjT6ttnf2A462K4hfDnZCq2b1Ljlah60OKJz/toaADDulDKbgXqOPVl2Fmw4WH2l2/
         Pwxg==
X-Gm-Message-State: AOJu0YyXUeaAPZW4XoxOntNgykCu46JuU6oFINU6xr3CENU5D6HLKFjG
	yrbpdvtSZvbvgeCg6akHI5jIokbgH07Wir/0puLO+XZQvNHLnDpCx023ly332Kk=
X-Google-Smtp-Source: AGHT+IG+ynyyYjZn6sC7e7CuEgzQ8b+B6wg20HRVZIxHAkl7FPzEzqPlVzLenjKMoEK/3eaNxUgqNA==
X-Received: by 2002:a05:6000:1ac7:b0:37d:5359:6753 with SMTP id ffacd0b85a97d-38225a41fb8mr2761194f8f.15.1731678260009;
        Fri, 15 Nov 2024 05:44:20 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821ada3fc9sm4378016f8f.20.2024.11.15.05.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 05:44:19 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	p.zabel@pengutronix.de,
	lethal@linux-sh.org,
	g.liakhovetski@gmx.de
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 5/8] arm64: dts: renesas: rzg3s-smarc: Fix the debug serial alias
Date: Fri, 15 Nov 2024 15:43:58 +0200
Message-Id: <20241115134401.3893008-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241115134401.3893008-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241115134401.3893008-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The debug serial of the RZ/G3S is SCIF0 which is routed on the Renesas
RZ SMARC Carrier II board on the SER3_UART. Use serial3 alias for it for
better hardware description. Along with it, the chosen properties were
moved to the device tree corresponding to the RZ SMARC Carrier II board.

Fixes: adb4f0c5699c ("arm64: dts: renesas: Add initial support for RZ/G3S SMARC SoM")
Fixes: d1ae4200bb26 ("arm64: dts: renesas: Add initial device tree for RZ SMARC Carrier-II Board")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 5 -----
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi     | 7 ++++++-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 2ed01d391554..55c72c8a0735 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -43,11 +43,6 @@ aliases {
 #endif
 	};
 
-	chosen {
-		bootargs = "ignore_loglevel";
-		stdout-path = "serial0:115200n8";
-	};
-
 	memory@48000000 {
 		device_type = "memory";
 		/* First 128MB is reserved for secure area. */
diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 4509151344c4..33b9873b225a 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -12,10 +12,15 @@
 / {
 	aliases {
 		i2c0 = &i2c0;
-		serial0 = &scif0;
+		serial3 = &scif0;
 		mmc1 = &sdhi1;
 	};
 
+	chosen {
+		bootargs = "ignore_loglevel";
+		stdout-path = "serial3:115200n8";
+	};
+
 	keys {
 		compatible = "gpio-keys";
 
-- 
2.39.2


