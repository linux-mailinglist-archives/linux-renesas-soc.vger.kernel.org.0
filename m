Return-Path: <linux-renesas-soc+bounces-11014-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A37479E6D1A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 12:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CE872829FB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 11:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB983206F2E;
	Fri,  6 Dec 2024 11:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="IGUkLjZj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E00206F10
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Dec 2024 11:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733483664; cv=none; b=BjysIiTl23r/wxkqOjpxSLpWTmbtR6pzieyT/Fwc1QP16W/y8+ixz1ZFJEsUxX7ZoKiMgO+z9dEenSnjnzkOhlCSQw9F8vYphIhM0QRssXfM+LQ5ZdfwEg3j41wEvhDelBFkW47E5YjzhwDJ4vuVF5YjUgsEHC1pb6EA2U/yyY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733483664; c=relaxed/simple;
	bh=a4/gsQVtR7MVHM1KJuAuPMWGtk0F3Gae6xSRbB+vIWo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OVzWq6l7ornpRYyBvPrX0W4GVxWRLOtUlH+XxtOlbBlEyN/CAIqy/HuejoVHab9ivpj6yjpm7pJagcTC7jVAmpwDiAgxK55OvDCjDON2l9IwESs1bcbsjQ3zrHTMCcxCVSiHpEY9mZk1Byl3IpcXsSt8A+/8O7iV8Wi6ARQwn/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=IGUkLjZj; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d3ab136821so1425380a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Dec 2024 03:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733483661; x=1734088461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r9Dnr8lBPRV9hwY5+L6VmdONZwzLphVT7+zA8FZuSvc=;
        b=IGUkLjZjdXavSltmBn7WJKCt7ZmfqpeDzq+c8eJyOQNUX4pmJzPPgbOzPqDCz+QuVr
         0Ee0ApCmiF9L5o970PXWXaFksLDbsPONJoXANY1yjBKK15S8LoRwv4yaI96oTxeBqJo2
         Yr+gjDZ2FhW1Kh/GXVTV7lOFJ5gypIS301DAgBcVqqqsEkmOy52N31+BTOmEd/w4lLyV
         bSuerh/gR7UOtBdU5HxbeKm1lP8vXbSByk1US73myzpL1FAp+lFZ5EzLpOngyAbGRIu/
         VC2PirSXVrkC6aPm57d0vKHq/bjE+wVAIULPleREHmFcG5WpkgNHfVv27jaeWKhyDKH2
         hA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733483661; x=1734088461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r9Dnr8lBPRV9hwY5+L6VmdONZwzLphVT7+zA8FZuSvc=;
        b=DXkrLhP9tPKT+62imii2Z6BL0qHSXPNQwJW3b1QGL6yIH+TPIgzvhDpEoSV13K86Bi
         Hf4OQEzkEVmMDAknxN7hrQ5mP8joMIGNiWQ9bfHY706wFrLkB2rzoMUT+BOH8nejaBTM
         kz/bedeffzOJiK19PM+2MCBMCV+jm3eZwf6JG0AcfF9lF6RRiV7PmjUH+ywaOHt1sQDj
         31+FpNy0+yj0hPl0PbV80iB0nuaWjOZyB1cF9q/E22IntQf40IbMJomxDI1oYTcfnyCW
         8PSDtjKL3rEBUnY1LuMim8VZMuUt7pDHheyMBcX9ehOFL/a0tEaTmijHfAVr/n19BebS
         FDRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXazulSS4t9tOdtVMpzpxe4ui1PzFnqh1G9pexw3jCmz06C1bCk7CoprlEAVa2SUu+uzG3BQMoCc12RSLxnVKZRWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YykXBXK7MRMlXZtXI8F6QeCpeQFvAAh2hUyZWKuwrshar7tzHn1
	GQw4lTZmJQffBdbtJrjEy0GPnjLwKjDXq/ZA95S33ob5WjdwouHz3t2pY81R2YU=
X-Gm-Gg: ASbGncvmxocdVjKzi++9kpe8KbIkjjtl8sQ+CqhQVVVfESWcLN0SuhbgYSvagljBw0s
	gDrcNPUKCTH0SYj44/avj8k+mcKT3FfiEr3Ii32o0R/ZOp4rfw/p6ehvEjp9jn5gVpIh7un/Dl1
	bGGl8QBcagIXsfja4CGQZcty3OV1aCPV/ARpG4MWAAxjHTMLHH4c1J5vNfQ8K62/eHNeb0J4vmB
	y2UXz50NQ1XKF/t+wjS/J/FAxCr1T49aW1+TvzwFnBxO67r1mteGfMigXqlT3XgiCn8fmhDU7bC
	0nVn
X-Google-Smtp-Source: AGHT+IG7gJqc4CGdANniAawsf3QrNvInv7nJ0Q0Fqm3FfT2wXTQhceZu1E4SlHPGcY841V3MyHiZiw==
X-Received: by 2002:a17:906:4d2:b0:aa6:2e07:5cf2 with SMTP id a640c23a62f3a-aa63a2086e0mr165912666b.38.1733483661317;
        Fri, 06 Dec 2024 03:14:21 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eee2a6sm226877866b.90.2024.12.06.03.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 03:14:20 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: prabhakar.mahadev-lad.rj@bp.renesas.com,
	jic23@kernel.org,
	lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 15/15] arm64: dts: renesas: rzg3s-smarc-som: Enable ADC
Date: Fri,  6 Dec 2024 13:13:37 +0200
Message-Id: <20241206111337.726244-16-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241206111337.726244-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241206111337.726244-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable ADC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 2ed01d391554..57ebdfc858eb 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -94,6 +94,10 @@ vcc_sdhi2: regulator2 {
 	};
 };
 
+&adc {
+	status = "okay";
+};
+
 #if SW_CONFIG3 == SW_ON
 &eth0 {
 	pinctrl-0 = <&eth0_pins>;
-- 
2.39.2


