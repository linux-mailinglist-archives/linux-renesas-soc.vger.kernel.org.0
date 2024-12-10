Return-Path: <linux-renesas-soc+bounces-11177-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1BB9EB821
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 18:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02DC718885F1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 17:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34772397A0;
	Tue, 10 Dec 2024 17:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="L2bV9tXv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBF1233D70
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 17:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850619; cv=none; b=i2JqBEnxq0o5qvS6nB0jzXHwtMueHetJyVlCPj0LhuEZt0fmG3lq11S9LwEQFAG5U/1Lqlo81wHInfM8jZ5LAtPgcxqVLMt5YlyBWTePDKu/DENye8gAnvSiTZp9nNZYgrJXrPanMIBke07T23Leyd9Gxg5sUeCUbPGFbnr7Bfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850619; c=relaxed/simple;
	bh=cYpvDeE6GTSqLQn4hyIC1LguXTCN6MR9BcYpMn3wlfA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t6KpYpKmjeDXxjO30Ih683a3o9qwgjUmMUFoceYQtghz6YQ1O5aHplUuxjHUwfC71fg52VaGibJSPt9tZtvYvR8ic6T/mAftrIORQTN7W/S2s75Mr1+boq1+95A6yG4Hf0Q8coJjLJSM2CK4JCrKvfPqrK9xcpCUa7BdueI6BA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=L2bV9tXv; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d3e829ff44so5543759a12.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 09:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850616; x=1734455416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRP6aXMQvXzM2V4VFmQeuWDqqgGNHEkIoJ0Wes8B7Jk=;
        b=L2bV9tXva4tdVQ/BevOqjIS9pdswIp8ld+5SLzEWysDscaLRaAJvjzGR5tDJiw1luy
         WMJounXTaSWsOcIJ5K2zcFMft8+FvV3SA2EBuI5eJaIW5XGT9OcigFvWXAnjGbw4Xm9v
         P84S9ue930Edv3/RJy5H+9c8BbyovRWJaF466n/rDo1qAQfaIIBdf5+8zSalq27ZfU4P
         /6SJfOA6fzbJpKjB6avY0NMM7+R9tCSdT7vWTHySTELllvYrRgKLRKSKNGjDzbei7dA8
         mEMFSIXv/hTjmCTxNXx5PYGHN5uOwWgLelIAOgEyEAJGN7BXIQ6rgjY3Vcd2HX+tR+ju
         4+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850616; x=1734455416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRP6aXMQvXzM2V4VFmQeuWDqqgGNHEkIoJ0Wes8B7Jk=;
        b=Oz4Q2eb7/fkEsWB+pBIGVd11a61kHphLw6KSf/1ca+P9oUXHS+hW/+H7BWZ0tQD+yN
         KETyYdZN4aPOESKHiONPgJNWBE/7y+aAVz1PXgAFDro7ENAc7WNLW0js+t1eJ02ARYSa
         E3ppKlNZYFrib/v7zHS8oeDZTqExUr3r/W3sBsgS2wl5XTPVwEzXsvFxmWG6Z9AZ2Rku
         hIUwjAZvuwdYxGd/W5w96iZBHTbCN36Zow7HrDGn9nGTJJN4BVXixdiSf3jikLYaCQ68
         E0+XoyW1yjOVCfEsDCnL3m4eCTmVg0xmMKTCey7HKGYusmZU7RDK+YwWMEJz+O5FCJ2g
         MdFw==
X-Forwarded-Encrypted: i=1; AJvYcCXVXzcFepFR/xTLN0vjLOrel/m9rotr1jYBRRsfkpqePeAVRfBy1TP0gEiQhfu4y1y0Ou+P/Qdc5/2G+ySdmvxqqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJYLkL+FvejXDeEgQayUsG0V7cMQqPs26PrwnF/osSYnyvzAkW
	3fwOsS1lkbogGYaVRfkiU9SZOqORpX8OuUrcpQjPAYvy71Ee4HsGkGJNf0MMl0o=
X-Gm-Gg: ASbGncuXvV4noViE9KevUJ+k4oAASonok4SNGrgf+rHzRRMJ/CFnnFkELppT00blXB7
	fLkd+ntzhHxYGO02dgiru48WKxtCdZs+3FacSm0WUrS1417++JBG4jZHZ1KPOXvZBfLxbEoIUar
	542o6AL/VizWGDodWGR3uffS/lkcGflzjXtFoP8ju+emxRJAyaZYt9RAWjhMdoYfl8OnYtczhEr
	G7NWC/Bi1BfR2ExczHrCWfin4QfIfzTIDQwFmQ/1T0ld9ERabCGrAuvF6NyaCou0kEvpkNq/NT2
	2t1UJwJJ
X-Google-Smtp-Source: AGHT+IHNyZ6Gmhi8CkHwki8iCp5hZVMJCqmLrVUuVJwgJ65+43JewzpqCE+zMexCnQ7438KBklSDKg==
X-Received: by 2002:a05:6402:510a:b0:5d0:d208:4cad with SMTP id 4fb4d7f45d1cf-5d41e16362amr4618611a12.2.1733850616337;
        Tue, 10 Dec 2024 09:10:16 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:15 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 05/24] ASoC: renesas: rz-ssi: Use only the proper amount of dividers
Date: Tue, 10 Dec 2024 19:09:34 +0200
Message-Id: <20241210170953.2936724-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

There is no need to populate the ckdv[] with invalid dividers as that
part will not be indexed anyway. The ssi->audio_mck/bclk_rate should
always be >= 0. While at it, change the ckdv type as u8, as the divider
128 was previously using the s8 sign bit.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- changed the ckdv type from s8 to u8 and updated patch description
  to reflect it

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 2d8721156099..178c915331e9 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -258,8 +258,7 @@ static void rz_ssi_stream_quit(struct rz_ssi_priv *ssi,
 static int rz_ssi_clk_setup(struct rz_ssi_priv *ssi, unsigned int rate,
 			    unsigned int channels)
 {
-	static s8 ckdv[16] = { 1,  2,  4,  8, 16, 32, 64, 128,
-			       6, 12, 24, 48, 96, -1, -1, -1 };
+	static u8 ckdv[] = { 1,  2,  4,  8, 16, 32, 64, 128, 6, 12, 24, 48, 96 };
 	unsigned int channel_bits = 32;	/* System Word Length */
 	unsigned long bclk_rate = rate * channels * channel_bits;
 	unsigned int div;
-- 
2.39.2


