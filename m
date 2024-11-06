Return-Path: <linux-renesas-soc+bounces-10318-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D289BE051
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 09:20:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4CAB282B57
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 08:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13C31D95AB;
	Wed,  6 Nov 2024 08:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jmVh954j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC001D90C5
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Nov 2024 08:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881169; cv=none; b=jc8tvBW4ujTJ/HSyhzstHaSAH2+5tdeI4h/W39UPvCVciMVY9nP/5GmRQOXQtsnDutLKIqYd9LYdn1eCN/pQCfKhg7Nos7r2Tlw2MLHqofWDU2TFhAzmsnKfUwLfwaghio4m8MytDm7HXUI4Ot8tODNai3ckZVwdhSUm94hMP1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881169; c=relaxed/simple;
	bh=8UOlDm3vrSjRTc4vbWGP2PkIhWAkTQRY2So1hnpltTQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WSXWBjtEnSn8T261Gu78ZP9CkVydztQY9lnMs3hjOy2cEPWv4g9FZLz4VDpjuxvzmcHkWsr/v9SdoLqJel+UNmAbRWHUYApbDiWSryENNC7eeplixUt2oy6v/B2LZYeKxGbVfRvwszEmZflEkJMd0vNBPTVa1jFvsKI2BNr5u4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=jmVh954j; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a99ebb390a5so111764966b.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Nov 2024 00:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881166; x=1731485966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+ke7NRgTssg/IEZFWgLNPKBw8NmV+vA1artHipjKW4=;
        b=jmVh954jD7M2GVDspV46DP3n+eTyxONuvgCAET/J8yAWK/PVZnydCyq1UMULQkDPqY
         IHmkCCbeCxpYf/oAHBw+Hu9VwXNJEYeJkR6NmlLAaAPcl7LUS5jmFtVYKoLWU4ZU38Ra
         b7gRO9gK+l0xAehVCBPMxPf5VJUxVsSwbHc4qhke8WeK6iCoJC0CJr+w+WFpn/lLqmaB
         9NexTqSK1uo9W7a3tbC5WALhSTdxGmUldVmc9GrwRkA8q+derdXQhn4KjpI0gw8f+sL5
         fYg95f0Gvgq4NV8UtUX68El4bLi4WVZC4c2bxCTwZr479g334dRBwtQaRCbLQUJbCmpO
         iFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881166; x=1731485966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+ke7NRgTssg/IEZFWgLNPKBw8NmV+vA1artHipjKW4=;
        b=deL2AatD7P+ojNCTQCOOklvnkvTBr6t6oTnWq3ABdyBVVvXSjwaW0Q9HtBgqWMIzyO
         HObY2tzfgI/ktHAIaR9PQLMs7SURCyxababfYr5DBATyrCiwGDVlhjNKsqlDEYrOZclc
         /tWDjnejAvmZzhwO6xlt4XCTBTXig7eebLC36VUqG4Pb8cphuhuCH1f+OmkfVou9MW5D
         STLeZO06HtASggJURBCeaUcP1XdnKIbKbTm3JnrDVdOKsjW9RLn1f0l0CAK+2tkTAdop
         A9GyuYYqk5DwPIPgQh0ddbj2GscjEq8aMkE5qWegd7PVe0YeHNIEE60sVjsKSbiNW5GC
         FSfQ==
X-Gm-Message-State: AOJu0YwlijpFNcvVrZGzgpG6wEVNNYitmtnHzBvScLXX6mKoAPQ32NmU
	PFYUwmVv/AB0oms0m6f1qfGGtXa9VD2JGeLR+aESjb7BeHS8APIiMskwmhFIlOo=
X-Google-Smtp-Source: AGHT+IGsSrynXgwp9ybYH96pAnSvTf/jo28kUEGLKKl8GOZpqqi1T6VVn/a9MUUUoZoaN649GiICbA==
X-Received: by 2002:a17:907:e29f:b0:a9a:616c:459e with SMTP id a640c23a62f3a-a9ec667289fmr159795066b.27.1730881166124;
        Wed, 06 Nov 2024 00:19:26 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:19:25 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	support.opensource@diasemi.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	Adam.Thomson.Opensource@diasemi.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 05/31] pinctrl: renesas: rzg2l: Add audio clock pins
Date: Wed,  6 Nov 2024 10:18:00 +0200
Message-Id: <20241106081826.1211088-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add audio clock pins. These are used by audio IPs as input pins to feed
them with audio clocks.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 8ffb9430a134..1190ca4b1808 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -2086,6 +2086,8 @@ static const struct rzg2l_dedicated_configs rzg3s_dedicated_pins[] = {
 						      PIN_CFG_SOFT_PS)) },
 	{ "TDO", RZG2L_SINGLE_PIN_PACK(0x1, 1, (PIN_CFG_IOLH_A | PIN_CFG_SOFT_PS)) },
 	{ "WDTOVF_PERROUT#", RZG2L_SINGLE_PIN_PACK(0x6, 0, PIN_CFG_IOLH_A | PIN_CFG_SOFT_PS) },
+	{ "AUDIO_CLK1", RZG2L_SINGLE_PIN_PACK(0x2, 0, PIN_CFG_IEN) },
+	{ "AUDIO_CLK2", RZG2L_SINGLE_PIN_PACK(0x2, 1, PIN_CFG_IEN) },
 	{ "SD0_CLK", RZG2L_SINGLE_PIN_PACK(0x10, 0, (PIN_CFG_IOLH_B | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_CMD", RZG2L_SINGLE_PIN_PACK(0x10, 1, (PIN_CFG_IOLH_B | PIN_CFG_IEN |
 						     PIN_CFG_IO_VMC_SD0)) },
-- 
2.39.2


