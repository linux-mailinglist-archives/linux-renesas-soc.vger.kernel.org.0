Return-Path: <linux-renesas-soc+bounces-21821-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 568F7B54DB0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 14:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B23A3B3E68
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 12:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B08830CDBF;
	Fri, 12 Sep 2025 12:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="aH87gXJF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F0630AD14
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Sep 2025 12:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757679902; cv=none; b=CzycJCDHqgNmZ+3x40aEmGZZQXvb+0R+rgYIihSJ2TlbIHpzCkz/+H4xCrO1RRyIyyN0vNk6HCqWbVeCtZh/SpvEkvfAZHlHU8tZIpHW99PbDKvT42DdNxp3pV3DjCfsVq78D47NgMmUYnIOJ1J2VC9Zw7eIYJ1+4mxOW1SwOXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757679902; c=relaxed/simple;
	bh=i6Ot3jDw1L8DR17nkHbO7WVOceauyHOBMPobzpRlxUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=upOJ/eHyuME3v++ocTHE06hwLYg/iKSoslUB4qYmLlusLYKq0XikklvleBeRpPoRpkldiv1TkGUh82BhxvSjLyJHsQD9Y4xKlrbTXyitgmKOszENG7/AW0LIOdR8fmel++O7ZRJkhj3iKBbh1FqFsh7ZYpP5bqwBh7yZwvAjLa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=aH87gXJF; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso1441500f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Sep 2025 05:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757679898; x=1758284698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avL90xLT3GgbgtC/IjtA6tdWsXd91EIgkF2HC8fxIi4=;
        b=aH87gXJFxVuF+DTvDTUuuO5xPw/841aAxVxi+MZFn7PpFnlIe8Y9LmBideL5hk9aSz
         Ij5Ot8GOXXj2yTmbi7lKZZX6W7ggoeA+GJyb2epH7WvP9fQspSQltau0d2ye2X9BCDaa
         f7i72BH7Mro2+d1M1wSkbbVGdXDRKvlapW629reyobEy/Xjvtl+TFX+sVUl0cySti3Br
         BKBqdlTiyjvvAUjOkJg1ZAh2kL2kqUVCZCOOP7sPbAoiUlznD5K/WMnZ5r/ruwylQSil
         ww9PrsdIX29iPOeuPWSVcI8Rp7NjEZufJNWyOsK8OyxEBW6g8FWmFIcd01uqXNlbZNfX
         t+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757679898; x=1758284698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=avL90xLT3GgbgtC/IjtA6tdWsXd91EIgkF2HC8fxIi4=;
        b=e0psxWnqIlvUI3ElwRHApCPY6AaXezaf7gZqnsOWzlTpYL11h2hz7U/kTAXc1+5gTi
         5sRZBQf/VxR+hthT3ShSgWZTyYq1F9g5HOhx6JwvMOfERTCN9wQxqdfzfvNPRLU1+ovJ
         fQcgZQkl7BhZ8TO4jEnZ1dgg7zuNv/zTT5Yyv/fPMiDbPT7MJ2xAKqcjC2wuFKztXyB8
         SuVnQxuVgJXBsE8Yu9OxisVQOkaNE0qRuu127r4q689CGA0/bpiCROAgM3/TnwW070Qa
         SGmn3qVFWBiHnh55sLxKTgPb3TMXKw94Lhu2xmOoIatqvfvjk64qTo0CXjBzQpFh3Zce
         wnpg==
X-Forwarded-Encrypted: i=1; AJvYcCXTLM7YYeZFbEjcgKrhWodxDGygNlllE43y/PTX909dR4CTXP6Ki7LbUuY3U+tvR3BJOCd7puLy8/7Lcp9sIgVdVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsZhsWdwyKjS/A3S7MaYl62MrLUBHF+inWEoNEFL5nNUSKG68g
	/W+8c7sP9ktvErjEs+JYnZtSMBW73V7XYS+hyUFhnkbRDpi8nWNV7YTXADFltKbCeDw=
X-Gm-Gg: ASbGncutbvhNhmrRlKcdXRZ8Md6bsL01Cx5YrSKMDMhqCTxrw/68dsd3Tsrf2RF1luC
	TXOCXHlqSWAjpCeBUWjnP4se9t0XmZ6LEnyKV03WBzZE9CUKhtCOW7qGhXkP7TPMgoWtBW0R3xn
	T+cMq2w2R36KcM2+iKqaAvFjvTmhidw2wZGF1MDyXR9vgiEGlKJz2CdmJ9WwHapIXV6sOUiqkYF
	ZJsWYctPDY8vyeVqm8fMv37rEoUqQv5ErQdsWKRyXqTUufHH/Hc7izO7qnbHwiVg2b/bgzH9T9G
	s1XyzIOG9BehxnDnuCOQ/9fa7j05UyN59rWW/WVCNMPicp4Ma+Wnm/ZPHEVFU/UP5ghDajSRUAw
	bFLb0v47INoDBfQBpzMo4s88TT7E4d/D+yKGlIpv1H1lF8MAcL6P4Hf8d4cNgSJ+kMSME72+bAA
	==
X-Google-Smtp-Source: AGHT+IFZ2HQn1VMUOUkCZ958fnWk75/NfdzSXgcuOqPzgMCFK5vrPSZLKhjqjU2vU8HEUNdayX/ynA==
X-Received: by 2002:a05:6000:186a:b0:3d1:721:31de with SMTP id ffacd0b85a97d-3e7658bc621mr2735063f8f.7.1757679897904;
        Fri, 12 Sep 2025 05:24:57 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607770c2sm6320091f8f.8.2025.09.12.05.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 05:24:57 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v4 5/6] arm64: dts: renesas: rzg3s-smarc: Enable PCIe
Date: Fri, 12 Sep 2025 15:24:43 +0300
Message-ID: <20250912122444.3870284-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912122444.3870284-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250912122444.3870284-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The RZ Smarc Carrier-II board has PCIe headers mounted on it. Enable PCIe
support.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- collected tags

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 5e044a4d0234..6e9e78aca0b0 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -132,6 +132,12 @@ power-monitor@44 {
 	};
 };
 
+&pcie {
+	pinctrl-0 = <&pcie_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &pinctrl {
 	audio_clock_pins: audio-clock {
 		pins = "AUDIO_CLK1", "AUDIO_CLK2";
@@ -159,6 +165,11 @@ key-3-gpio-hog {
 		line-name = "key-3-gpio-irq";
 	};
 
+	pcie_pins: pcie {
+		pinmux = <RZG2L_PORT_PINMUX(13, 2, 2)>, /* PCIE_RST_OUT_B */
+			 <RZG2L_PORT_PINMUX(13, 3, 2)>; /* PCIE_CLKREQ_B */
+	};
+
 	scif0_pins: scif0 {
 		pinmux = <RZG2L_PORT_PINMUX(6, 3, 1)>, /* RXD */
 			 <RZG2L_PORT_PINMUX(6, 4, 1)>; /* TXD */
-- 
2.43.0


