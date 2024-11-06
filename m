Return-Path: <linux-renesas-soc+bounces-10317-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CB29BE04F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 09:20:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FB4A1F23CE8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 08:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC311D9337;
	Wed,  6 Nov 2024 08:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Cztf4RAV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7812F1D7E2F
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Nov 2024 08:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881168; cv=none; b=Yg+H65ZH4sjtKvN9eJquKEDoykX8ONkNePJj8VE/O0hzBpcKrxDcPmw9mqYZSkSni+BsJMQ07+CLybzb7dvHkvUWZpJ2O8wve4Fce7aFMEIgrfTNsg+jVGva9nxi2p7XAJ/4tE+LT8L2cEA5LjFSdTb3M6fcy3XU6Ia2RWFhs5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881168; c=relaxed/simple;
	bh=ezou/sUeO84m6Pbsno+iPPVK50t8DBnB/7+REwh8n3w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kiCSX2s9HegQ9vihm5RDcMkAZBVy1bnzKShcNslrrdzeonjR7JBrL5udAt5xgQwg3PIBCnxKaPDT3aTq3FVX87XEcLDnS/LelK6eAaAI/wMUSumZUbRwnoBAijCfvuC0N7h7Z9ZMnF0QKcmggrYoHzAkWHZVwbF/qesCMgmLQrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Cztf4RAV; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a93c1cc74fdso1006787866b.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Nov 2024 00:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881164; x=1731485964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8PJplAj6BtFAbLsdC8Eyhh6kOprA91oDhfaq2lH0Kk=;
        b=Cztf4RAVILDvlTIr3EvU5LSdii2HWznjYLJl9lfT710JNBCXCAPWf27LD1sQ/bLVdK
         CIyDlq95b9LTbGz/emnuTFdvqbtA8wAlGgKL6fBu0p2EUJ6CMBGfjFDJTTNcKZ/34AIn
         C+ubnmqDDG2Wy3/weYh/GiJi1rio8c/1GJuh6xtjfU47LcFfW8XGNFaCxmAX+nzOoIm9
         HRdvonzW7iTzH3077xrWyk9uBYkxVUwA+kqwy6v61SuSrYqxI7NY1W83+If/M9z+JgFp
         b/l/XGXgqO3qIxgoN+n5gzE7G7FQ2zBIVpkXMlyR2bITfcer3on39fCB5EjAGstQ4p/2
         g4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881164; x=1731485964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z8PJplAj6BtFAbLsdC8Eyhh6kOprA91oDhfaq2lH0Kk=;
        b=OzPZcD7o1UxJjBJhGNH9AQxZppCXHav5bM/RrrH1GkI/iEhgMC3dBy0G8aCJli2DOZ
         MWmuQ2VHvu3ALo57laSrV8MU5h6cJiAvaVLWXv9oOBrzoB5tYtAkKEfcbP1YBc/vwq8V
         2aC6/YopPFPrrO7WxjHLlhLsWJxieH87ZfEkwfDp0BEt5AabF1lE2ssa3LlX3mpEHmz+
         pqRIPGouLH851DGhG5O7Q3fvqA9gTEIhKOD5EaHAfOdP7F5kcNCW3DGLNiLBkedYuqX8
         nlvIv8Y6zKRYRp2fkH3MadYFeSGJ38F39Slo9/YR1cSSNAUgXRTepj+DREr6bOEf7c6+
         8GOA==
X-Gm-Message-State: AOJu0Yx9Lo9V3xHQ7zK4hn1DfCrE2F8yQILAiI11TWSXUnePnUKmg/sM
	D7FaSVBZYePS4XOWVCx9AbfXO1cHtzHycO/MKhbNHFs62L+1QEMwCkQnGdQ+Pz8=
X-Google-Smtp-Source: AGHT+IFB/yilN2A9rr9tyTuVx/XGzqUm+PgC7mEHMgDPVnIg+6PoAyGzKyboc/+QMnJh+sxtq1GkWA==
X-Received: by 2002:a17:907:2d0c:b0:a9a:714:4393 with SMTP id a640c23a62f3a-a9e6557deb8mr1859922566b.23.1730881164026;
        Wed, 06 Nov 2024 00:19:24 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:19:23 -0800 (PST)
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
Subject: [PATCH 04/31] clk: versaclock3: Add support for the 5L35023 variant
Date: Wed,  6 Nov 2024 10:17:59 +0200
Message-Id: <20241106081826.1211088-5-claudiu.beznea.uj@bp.renesas.com>
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

Add support for the 5L35023 variant of the Versa 3 clock generator.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/clk-versaclock3.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index 1398d16df5d0..9fe27dace111 100644
--- a/drivers/clk/clk-versaclock3.c
+++ b/drivers/clk/clk-versaclock3.c
@@ -1133,8 +1133,14 @@ static const struct vc3_hw_cfg vc3_5p = {
 	.se2_clk_sel_msk = BIT(6),
 };
 
+static const struct vc3_hw_cfg vc3_5l = {
+	.pll2_vco = { .min = 30000000UL, .max = 130000000UL },
+	.se2_clk_sel_msk = BIT(0),
+};
+
 static const struct of_device_id dev_ids[] = {
 	{ .compatible = "renesas,5p35023", .data = &vc3_5p },
+	{ .compatible = "renesas,5l35023", .data = &vc3_5l },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dev_ids);
-- 
2.39.2


