Return-Path: <linux-renesas-soc+bounces-7066-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B7E927BE3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jul 2024 19:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7613B225AE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jul 2024 17:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2596B45945;
	Thu,  4 Jul 2024 17:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K1YZUIWt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD563C482;
	Thu,  4 Jul 2024 17:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113813; cv=none; b=TgeR/9b0njrdcWkKCKTBAO3BQcChX/STK0POAMt+dswABHFYanjYvW62ZiK8S8fb5aK531GDtE3wOROpUI6iKbGMxhlt+xo3wTp9KeeoJczGTcfUW2k9TjeInGDHeA5J7jVi9kIidcDpaapQrR7jz3o/wfU5shzn7gk394dZoog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113813; c=relaxed/simple;
	bh=U56saMjIfEuTsQ+HGnNS0wH0SrTxaY1/OZS4zOAPdKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pp1av9SqXwFoUa0kaYPk/emP7KvjdT1WLvPpEKIkGLIJEI13eSgMug9NW4xubSTEKC6n7CdTxwpy3BfKnM/TUP6WBTdGCqx6SWQaOMVTCK0LaQpKo9sst2TKPCN+b4vCFQavktflbSn9cbDl0iYHKjlyPmFBCS2LNKy/uhdDTmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K1YZUIWt; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-425624255f3so5735215e9.0;
        Thu, 04 Jul 2024 10:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113810; x=1720718610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lKi2JAqKWrjfu71x3mrudLF5NIxjHTPRhhtNA6MHl8U=;
        b=K1YZUIWt1+OP0AZFgCVnJq8P2ZHhagkqXhytifzIOaU82fUM7lOQ1xyVzSWdNmEeQ+
         etg4ctkvbUpCtDoMC2nshwvaj546gO809YgBfMgwOXCOgHmaGE95/6bezPFWpo7N3TDH
         vkv42gDVttDsiD5KgLkFbrKrSlObeN6FqGoI7QbUcskQAgukNkoVnm7HiV/dFfniBpnS
         u8xuIVlT32t0wPFrNZzRzIh4Fn3Hiws909gYIzXcXtOniIXySWMhzy72Id5asNXbEFJG
         /rmyweBvMTcUEz3d2mliDfEHjOAQX7Fd14zIZkMaxa4IMpFV8tdWr8sbhGSfGY5ZFpjP
         DAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113810; x=1720718610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lKi2JAqKWrjfu71x3mrudLF5NIxjHTPRhhtNA6MHl8U=;
        b=HC9j36TQurgFIUzgfmiXNsutqgiNF611qMFqkY972BtAz/nw0nqCX+9JZ/ZT2cJy/q
         B6WZC0Uy/rAmJ08Ny00OJuVCmkC/v2R5jB+LLtTkF3bH1OdZaQ3NWpLQyC4p9ohw08yt
         Q5SYwCBWZ+isl6BuVthsw3UK83YronDsqKtC//JEVWCLbuVqy2NXUjpXSoMWmoUXv1Vv
         cTx3maSfD9dqAGY/e4z3Zno6ovtmgJKoLlUhzqTmzaaGAuOXYF1FVXQoHJpmzPT3kk+K
         ptrf9RUDYmcuUobRJO1I+DYxzZXr0IY9UxhIm6CLo0HgKNEisvMCYz/KlEkCaAq4aLme
         vnHw==
X-Forwarded-Encrypted: i=1; AJvYcCWgbIg58Pg+Wy7AjzbDoLED8qOMoc+R882y8fOXgBf/xRywU/Tn5cj/JQDUl+rpm60zub6ghHtUEpW2xjZ2uZSpmyE9jvRVKJIZup+Kckg/tm/UaFDfcOn6Zbz9ncN7ULqEeXSw+wvQj/bfZPJY
X-Gm-Message-State: AOJu0Yx66P3q+sdC0jHiWIRsX4QDraK8JbMsFeoN4w8UXUGdHN0Vfih4
	Sfysmuhhoa0OkeWjA0D1ez1zYqUPQ8hQNv8oZ57vNhnuJAQyhDoL
X-Google-Smtp-Source: AGHT+IGNLrdFCeh7xzObKjO851xmp5K6J+smKfZMeNHhP9RTpyPgPRafmRlv+Xb191RAmYV2oYOAZQ==
X-Received: by 2002:a05:600c:33a9:b0:425:61cf:947a with SMTP id 5b1f17b1804b1-4264b132bf3mr19795315e9.12.1720113809846;
        Thu, 04 Jul 2024 10:23:29 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:29 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:12 +0200
Subject: [PATCH v2 02/24] mfd: fsl-imx25-tsadc: Constify struct
 regmap_config
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-2-0c8785b1331d@gmail.com>
References: <20240704-mfd-const-regmap_config-v2-0-0c8785b1331d@gmail.com>
In-Reply-To: <20240704-mfd-const-regmap_config-v2-0-0c8785b1331d@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, Xu Yilun <yilun.xu@intel.com>, 
 Tom Rix <trix@redhat.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Tim Harvey <tharvey@gateworks.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-omap@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=754;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=U56saMjIfEuTsQ+HGnNS0wH0SrTxaY1/OZS4zOAPdKk=;
 b=GICB47pBZbIZXIX8luZ2HJSfqqu1Qr3KPUXldLDV5bqbYrAei350hLaoTAiX3HfY6MN8QZPWz
 ASI5wULmcQfBdd0v5zKGpII4RxfM4cXCZOTKMKOe2UhA+6LMRR2Ik/J
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`mx25_tsadc_regmap_config` is not modified and can be declared as const
to move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/fsl-imx25-tsadc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/fsl-imx25-tsadc.c b/drivers/mfd/fsl-imx25-tsadc.c
index 74f38bf3778f..2e4ab2404154 100644
--- a/drivers/mfd/fsl-imx25-tsadc.c
+++ b/drivers/mfd/fsl-imx25-tsadc.c
@@ -16,7 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
-static struct regmap_config mx25_tsadc_regmap_config = {
+static const struct regmap_config mx25_tsadc_regmap_config = {
 	.fast_io = true,
 	.max_register = 8,
 	.reg_bits = 32,

-- 
2.40.1


