Return-Path: <linux-renesas-soc+bounces-10492-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF699C70E3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2024 14:38:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1580E1F21EDA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2024 13:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FE1F20402C;
	Wed, 13 Nov 2024 13:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TQNmhHAC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7CA202F80
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Nov 2024 13:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504965; cv=none; b=MhZg660JN51uN66F6JpShieeJfPV1acwCFb21Ced1tNc2pt2y2Lafy1sXhGVDNOfmGaD8pgQZG7pjerK2BIn/smH/prBnZfNcsFMB0pV5c7+djomuSORwXTiUfTw5td9vtsVZgcb3sFn7BTmIOcZF2cGRVfcKurOrwxKwyTG0l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504965; c=relaxed/simple;
	bh=/F4tAjXWBbEZnhKoW0PkXLQACERRTVgrP2LoplpSZfY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tOW0BunHG9crFb5npfatiHy5PqjBeEMVG7j+RKQzf7LM7fz2quXpoDTAigOcSQ1/C+G9tPC8cGuk5bcoeGAnBJ6Y0X6D4Q5oi8ZB3nyR3gS3mF+CRTNkX3anjfhbc9kbjMAEyiKmHrRiQ/RXyU6DpjHvleQyN2OImtY1nZZ+vUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TQNmhHAC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-432d866f70fso2374505e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Nov 2024 05:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731504962; x=1732109762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FycoWm9/X38NSEgrZsMhWo4rCq7Gq3VfkCCUdfLyYY=;
        b=TQNmhHACH4vAH1Me1V4CuGWACRWaW68hW49wy9qcrEp4rlUwaO8O2UQIiHoSHKJDz+
         2sc60LjO5cp2UiQPJth5IzuXUCYWOhg6YHJip4pq5vevF5HX5J1R4uM/sD+JC7tDDLvm
         c5bO7l0T6Cp+SuIdqjXByc2gYOUnSYtpbhzdBRPz1gSo1uAhV1aHh0SIhgEZSWoLUJ5t
         A/nSM7O5WNwGvTPyHlMRVJx+ijAcTd7jLNPth9NZDySGXRr3oBl3lAU8p2HuDcA/Jy7b
         fO45wyR2uYY/Rj5TeCWmGYzu3M4laM2n/SSWKQKGv//1cpoBQL74DBMwEP7Mt7OPtlue
         w94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504962; x=1732109762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1FycoWm9/X38NSEgrZsMhWo4rCq7Gq3VfkCCUdfLyYY=;
        b=U3M7Whz4Nph4wVi0erpG+xK/ByUxgYDmggWDL6ZJncBaHS+7ZxdYd1sYNQPk0sLddg
         PlcqHo4hJ05E9/JlM0L4XzsMiQBurMrt7l3iGv08Jn7VkJI9EY1F1PjU+yCYcUOUV/aP
         p4XntSL84Izcesv348HqoxVYC/fro5oTeVRSstH6bMsYYnJ4faMK57XfkSLsjej7S9Rv
         LXUFIderjBWw8Xl24T/U8TSM5WB4VogVAeWYVQl4OUqE8Ui1AsvqAHesF2OrF/fk/5uz
         Nlc8kkZjzdL+3tcij/HQujOnE6rlooEY6NHTzsNwx/MkAwwgu/RDAiskhXv8KVd+vuZ8
         vzuA==
X-Gm-Message-State: AOJu0Yzl8zq2kh3iorpImh0a4zRhjZ3X04tReqysOF1/SWiWplPTqVAa
	74miEuFVz9VG9G5eh92RwUo6s9r5rpbh7cxrZKAk3mWHCeXLcR99IREfNQ7r0oU=
X-Google-Smtp-Source: AGHT+IEv92yaQ+ofcsCPULdq5+LkFnXxgiZf2xmIfOkdQK30lk3F5kOjtytiBE0A/SgbrxV9z4uXIA==
X-Received: by 2002:a05:600c:1c12:b0:431:5d4f:73a3 with SMTP id 5b1f17b1804b1-432b750606cmr185260445e9.18.1731504961857;
        Wed, 13 Nov 2024 05:36:01 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54e2f2esm25664165e9.1.2024.11.13.05.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 05:36:01 -0800 (PST)
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
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 08/25] ASoC: renesas: rz-ssi: Fix typo on SSI_RATES macro comment
Date: Wed, 13 Nov 2024 15:35:23 +0200
Message-Id: <20241113133540.2005850-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The SSI_RATES macro covers 8KHz-48KHz audio frequencies. Update macro
comment to reflect it.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index b4439505929f..a4d65be17eb1 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -71,7 +71,7 @@
 #define PREALLOC_BUFFER		(SZ_32K)
 #define PREALLOC_BUFFER_MAX	(SZ_32K)
 
-#define SSI_RATES		SNDRV_PCM_RATE_8000_48000 /* 8k-44.1kHz */
+#define SSI_RATES		SNDRV_PCM_RATE_8000_48000 /* 8k-48kHz */
 #define SSI_FMTS		SNDRV_PCM_FMTBIT_S16_LE
 #define SSI_CHAN_MIN		2
 #define SSI_CHAN_MAX		2
-- 
2.39.2


