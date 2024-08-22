Return-Path: <linux-renesas-soc+bounces-8044-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD1995BA41
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 17:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAA301C23522
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 15:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D426F1CEADA;
	Thu, 22 Aug 2024 15:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="nbD3wSrD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236A41CEAAB
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 15:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724340515; cv=none; b=LWxMafqqVABLaEnKri8/5TRITh18/1B6Zal9tePNDdziYtUjm8RIppBFYdZaAw1WbI+EPkwLMKvYHVabzjKZ0UqKShF7oGDInna9tN6WV43TcIzS8jMuXBohLkXEKRDVEgSnaNQraHqWxJ1vjuHUtf+Z6dikyjrdMPOhxYoy0mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724340515; c=relaxed/simple;
	bh=hwOPs3VjSqv+5Z5VfJP9Z8BIWsDCu8awKAb11KLvGp0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kxTljN6gsOwJ3VQaSzLzRUyVtuoeVSG8EIHpI2zwLEFKszLItsI6K4QRXGoNmmgGL1RkDRBFBCSSpM47ITX+K87xCi/PckSe+opy0OXDzXSfjycBdBgZSOBYzpq09ehBDl9aKqHLy8qR2p2MDshDOw9q/eqduDG0aQ1T1E6oIiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=nbD3wSrD; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a83562f9be9so119116066b.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 08:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724340512; x=1724945312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkWgitHhldKdeisz33EiZdlfuv0bPsRGbcOFCT+k5gc=;
        b=nbD3wSrDmsDg6iwBHl98KBRcXrkXuv9bk0T33rtiyr0E+YQD+/Dp9bI2YgBrEj/GSJ
         AV7dasG/x9B1OPIdaiJ4WePATHqQ/xLQUN9kMrz4O3v+UqBJveYqR80uo9yagMYkmy+S
         dPXXDnCE4XtB9xr5Gr6FdHLDqwzoRzUC+/REiU88a+cpjHAxboR/L2sVMNwi3Pat+Zsa
         MfWyemeoLB3B6dN1RSV/dHonudhBsvFF+ICTyn68w2j12cTKuLh/e6soTnt4pN+ZN6Vf
         y1i7IE0tX4kwM1atst8ZfxkOYFpHb5DaeUltWiHA6BSXz9rl7HQ1QchHIj2hxcrHxkqf
         hryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724340512; x=1724945312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkWgitHhldKdeisz33EiZdlfuv0bPsRGbcOFCT+k5gc=;
        b=ZtOis+3wJfIVDGgldo+1DiKHATIKE9LOK0sUSmBeIlKqjcP/Ijzy+CmC3GWUECq09+
         YhOHSCY58TIBNPmE00Cm2qVZUMlAzRk3rwes817PYlSZqp2pDz31SyZ5DCo4DADHAV3/
         PDpRmMUzj27FDF/wNnvZX10tTzBoAVJrdz/Y0x3bMKjFqpxr/RRL3Bk3O9EWTvFYvIBl
         aQJUz0a6h54dznnB3M1MWArzACrSAzK1DqzOlxWwgcHdux24EqY8ZulU/QwoUj4Jx43O
         b6oGweUhpm0ksIcdQszekChnQ8Df55hOdhY2unhxUlg+2Jw74Qq8y0i+qPRsEA6pbZl8
         FSOA==
X-Forwarded-Encrypted: i=1; AJvYcCUddZq2sItMfzpIjmmTyFKxe76ts+U5TogahhDFwyOPnMzPhnosjOr5IVdZDPN2MpAv4EuMXA47OlKiCsxXAx5+8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbIUWUYVauCkctP8kuA2Elc+wN9py1POZyqHDuyG7LQJfXgU+G
	RG1jSqE+KqewZ1TKYw5RvzXuC1sd/vemc7uWtSdw6ZfT6hV9ZPP0afKsH/5qido=
X-Google-Smtp-Source: AGHT+IFEWPJ3HqQL/w0KWFEJhV07xF/eMg4mv7Lejm46+5JkTivmt8Z+5f8B5VhGhYYih3FlUFQvOQ==
X-Received: by 2002:a17:907:980e:b0:a86:9258:aeed with SMTP id a640c23a62f3a-a869258b023mr191608966b.61.1724340512413;
        Thu, 22 Aug 2024 08:28:32 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f484dc5sm134189166b.171.2024.08.22.08.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 08:28:32 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	gregkh@linuxfoundation.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	yoshihiro.shimoda.uh@renesas.com,
	biju.das.jz@bp.renesas.com,
	ulf.hansson@linaro.org
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 08/16] reset: rzg2l-usbphy-ctrl: Add support for RZ/G3S
Date: Thu, 22 Aug 2024 18:27:53 +0300
Message-Id: <20240822152801.602318-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add support for RZ/G3S SoC. It needs its own compatible as it uses 2
reset signals and it cannot work w/o both of them. To be able to
fully validate this on DT schema, too, the RZ/G3S uses it's own compatible
w/o a fallback (as if the fallback will be used the RZ/G3S will not work
anyway).

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 8b64c12f3bec..08b18d7de7ad 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -93,6 +93,7 @@ static int rzg2l_usbphy_ctrl_status(struct reset_controller_dev *rcdev,
 
 static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] = {
 	{ .compatible = "renesas,rzg2l-usbphy-ctrl" },
+	{ .compatible = "renesas,r9a08g045-usbphy-ctrl" },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_usbphy_ctrl_match_table);
-- 
2.39.2


