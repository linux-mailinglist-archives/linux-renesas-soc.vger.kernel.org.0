Return-Path: <linux-renesas-soc+bounces-9951-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A57919A90B7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 22:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5EFA1C22D5E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 20:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCBA01FCF41;
	Mon, 21 Oct 2024 20:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7uA+5mt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB02C1C7B69;
	Mon, 21 Oct 2024 20:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729541642; cv=none; b=iX+gI7EkLb+4HaZ9BWKC4Zg7nBDJqsr2mEB7uBiVmn0StE6Q2nGGj2I2EE0hxb5HbYkFkUtG344ANPpajlvJTxTO06DiezOYeVCtfwy0WnllwVAQA1RlW1GDm3ijX0iDPrHe1HBWFA5cm5xmj4Bh/xsJ08m+EDDXKr6AHksesiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729541642; c=relaxed/simple;
	bh=dP4S4xfL/V3x9R/OA3Svt52tqyZP0bb+UxjdTXou80c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YHwoSYT2+sB6sPLUFvbEcGtInIa+15wPuDbXzKxbeLra84SVWvPtvryZLM2cLPUb0WWMiupZTbrCVjx1C9YXQbc4fMHhDRxMa7lHb4yBX/u6+x6SOPSZjE+tqgtPlXyksNEtV+68yl7gE5PE189+L71FerQAiAOo/yKV8j4/6Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7uA+5mt; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d6ff1cbe1so3785933f8f.3;
        Mon, 21 Oct 2024 13:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729541639; x=1730146439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQW1PY9OA9Q7MyvOYCIVgHMEH3QLp4kYGz2Gl5ajbj8=;
        b=Q7uA+5mt5nRV8o6PmILav2n8wrEIIYjdtTto7/6N0Sg31AWNEWNPJY9nUPfgWyNGN7
         avrT67nu14sO5KYWz2bNhQoW9U7xLVtvikPy/XTkQzEF+tXaa7Tok5pLgVe7yt02pjFt
         dZPnmS73KYOYD7ApV3+ZwQZ4yRzcuHGcziwDXe36vsRnBaOFukpJwqggGEr+xFI3EAdr
         T8q54xgLttj9PlBAaKNBgV8Ce2pcHOZ6SpVVf0GasXWiSgmibCZcgWc282N9DQ7Huv22
         5QDZ2pHpCpf/CUgI2YsKSLQm5FyUFV5AdPz0IHbwh9J+CptZJ7P+R+1DqrXJF8O3XTwC
         rK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729541639; x=1730146439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQW1PY9OA9Q7MyvOYCIVgHMEH3QLp4kYGz2Gl5ajbj8=;
        b=L/cmQfI9mLQyHJ5d2DeBSnP1MFpSDhfLbuOua10WY2hhl6dR2gxn96qauWkvWv5/pN
         YSkPpxctCdjJB91i5AWQIMByVDOqYY4lCnU8qcA0uPdf4oprA+LrAxATsU0QchqgHJsu
         jF02ERqrWoNCndmxvvojOAWRwJ9qPlhYgYP1eC3nPYemHrK73DMptVFRGSNAE7LF3l5O
         9o0XO8A6UAInfr0X4va47DxXzIemx4gfgn4rJL2Tvo1slUVPSXwlU3qpxNMdCnhfAzw6
         AfSTZln+toJY6rVtxvnCmJyezqviiQL84gw6p2UWpIGUL93j/8YShvKyrqvqFNYPtkLe
         vKAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvXwm/gVs1TkT3Y7Nm3uuJJ8tyE1n5YD4tvpOQXail0a5V7SMlLz0U8YRMxSPm8owBqppIG4H3kr7mHys=@vger.kernel.org, AJvYcCW3w2jX1mOVxRnr1OOxxM/f4r2FN5vQAtgMD5HWVYt0rx6xpcesFsc1KXFwqQgnUZ999WR+8EzbJCd5lRfG8GoqRGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/uWNHRGynfmHXhRw+uQTPD1v0sxqNGh6VDEaAZxWor+jYaD5v
	x2rdEmlZ9ECMOONT3BxOpL5fcPuZ1NugoI4WwpvGU1gm2LOgZqkX
X-Google-Smtp-Source: AGHT+IHkO4xNm//q8aDqWkN+IBFgVFpZqUcSbI6Tg+GZLPzB+mVL0XrJat41aZ5J11P9jA/2YV7jXQ==
X-Received: by 2002:a5d:4ccf:0:b0:37d:4fe9:b6a7 with SMTP id ffacd0b85a97d-37ef21ac6bcmr231568f8f.36.1729541638916;
        Mon, 21 Oct 2024 13:13:58 -0700 (PDT)
Received: from prasmi.Home ([2a06:5906:61b:2d00:8a20:67a1:e60f:941e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a584f7sm5042935f8f.53.2024.10.21.13.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 13:13:58 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/4] ASoC: Rename "sh" to "renesas"
Date: Mon, 21 Oct 2024 21:13:46 +0100
Message-ID: <20241021201349.395022-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241021201349.395022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241021201349.395022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Rename the "sh" folder to "renesas" to better reflect the Renesas-specific
drivers.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/Kconfig                        | 2 +-
 sound/soc/Makefile                       | 2 +-
 sound/soc/{sh => renesas}/Kconfig        | 0
 sound/soc/{sh => renesas}/Makefile       | 0
 sound/soc/{sh => renesas}/dma-sh7760.c   | 0
 sound/soc/{sh => renesas}/fsi.c          | 0
 sound/soc/{sh => renesas}/hac.c          | 0
 sound/soc/{sh => renesas}/migor.c        | 0
 sound/soc/{sh => renesas}/rcar/Makefile  | 0
 sound/soc/{sh => renesas}/rcar/adg.c     | 0
 sound/soc/{sh => renesas}/rcar/cmd.c     | 0
 sound/soc/{sh => renesas}/rcar/core.c    | 0
 sound/soc/{sh => renesas}/rcar/ctu.c     | 0
 sound/soc/{sh => renesas}/rcar/debugfs.c | 0
 sound/soc/{sh => renesas}/rcar/dma.c     | 0
 sound/soc/{sh => renesas}/rcar/dvc.c     | 0
 sound/soc/{sh => renesas}/rcar/gen.c     | 0
 sound/soc/{sh => renesas}/rcar/mix.c     | 0
 sound/soc/{sh => renesas}/rcar/rsnd.h    | 0
 sound/soc/{sh => renesas}/rcar/src.c     | 0
 sound/soc/{sh => renesas}/rcar/ssi.c     | 0
 sound/soc/{sh => renesas}/rcar/ssiu.c    | 0
 sound/soc/{sh => renesas}/rz-ssi.c       | 0
 sound/soc/{sh => renesas}/sh7760-ac97.c  | 0
 sound/soc/{sh => renesas}/siu.h          | 0
 sound/soc/{sh => renesas}/siu_dai.c      | 0
 sound/soc/{sh => renesas}/siu_pcm.c      | 0
 sound/soc/{sh => renesas}/ssi.c          | 0
 28 files changed, 2 insertions(+), 2 deletions(-)
 rename sound/soc/{sh => renesas}/Kconfig (100%)
 rename sound/soc/{sh => renesas}/Makefile (100%)
 rename sound/soc/{sh => renesas}/dma-sh7760.c (100%)
 rename sound/soc/{sh => renesas}/fsi.c (100%)
 rename sound/soc/{sh => renesas}/hac.c (100%)
 rename sound/soc/{sh => renesas}/migor.c (100%)
 rename sound/soc/{sh => renesas}/rcar/Makefile (100%)
 rename sound/soc/{sh => renesas}/rcar/adg.c (100%)
 rename sound/soc/{sh => renesas}/rcar/cmd.c (100%)
 rename sound/soc/{sh => renesas}/rcar/core.c (100%)
 rename sound/soc/{sh => renesas}/rcar/ctu.c (100%)
 rename sound/soc/{sh => renesas}/rcar/debugfs.c (100%)
 rename sound/soc/{sh => renesas}/rcar/dma.c (100%)
 rename sound/soc/{sh => renesas}/rcar/dvc.c (100%)
 rename sound/soc/{sh => renesas}/rcar/gen.c (100%)
 rename sound/soc/{sh => renesas}/rcar/mix.c (100%)
 rename sound/soc/{sh => renesas}/rcar/rsnd.h (100%)
 rename sound/soc/{sh => renesas}/rcar/src.c (100%)
 rename sound/soc/{sh => renesas}/rcar/ssi.c (100%)
 rename sound/soc/{sh => renesas}/rcar/ssiu.c (100%)
 rename sound/soc/{sh => renesas}/rz-ssi.c (100%)
 rename sound/soc/{sh => renesas}/sh7760-ac97.c (100%)
 rename sound/soc/{sh => renesas}/siu.h (100%)
 rename sound/soc/{sh => renesas}/siu_dai.c (100%)
 rename sound/soc/{sh => renesas}/siu_pcm.c (100%)
 rename sound/soc/{sh => renesas}/ssi.c (100%)

diff --git a/sound/soc/Kconfig b/sound/soc/Kconfig
index 8e01b421fe8d..5efba76abb31 100644
--- a/sound/soc/Kconfig
+++ b/sound/soc/Kconfig
@@ -106,10 +106,10 @@ source "sound/soc/meson/Kconfig"
 source "sound/soc/mxs/Kconfig"
 source "sound/soc/pxa/Kconfig"
 source "sound/soc/qcom/Kconfig"
+source "sound/soc/renesas/Kconfig"
 source "sound/soc/rockchip/Kconfig"
 source "sound/soc/samsung/Kconfig"
 source "sound/soc/sdca/Kconfig"
-source "sound/soc/sh/Kconfig"
 source "sound/soc/sof/Kconfig"
 source "sound/soc/spear/Kconfig"
 source "sound/soc/sprd/Kconfig"
diff --git a/sound/soc/Makefile b/sound/soc/Makefile
index 5307b0b62a93..08baaa11d813 100644
--- a/sound/soc/Makefile
+++ b/sound/soc/Makefile
@@ -59,10 +59,10 @@ obj-$(CONFIG_SND_SOC)	+= mxs/
 obj-$(CONFIG_SND_SOC)	+= kirkwood/
 obj-$(CONFIG_SND_SOC)	+= pxa/
 obj-$(CONFIG_SND_SOC)	+= qcom/
+obj-$(CONFIG_SND_SOC)	+= renesas/
 obj-$(CONFIG_SND_SOC)	+= rockchip/
 obj-$(CONFIG_SND_SOC)	+= samsung/
 obj-$(CONFIG_SND_SOC)	+= sdca/
-obj-$(CONFIG_SND_SOC)	+= sh/
 obj-$(CONFIG_SND_SOC)	+= sof/
 obj-$(CONFIG_SND_SOC)	+= spear/
 obj-$(CONFIG_SND_SOC)	+= sprd/
diff --git a/sound/soc/sh/Kconfig b/sound/soc/renesas/Kconfig
similarity index 100%
rename from sound/soc/sh/Kconfig
rename to sound/soc/renesas/Kconfig
diff --git a/sound/soc/sh/Makefile b/sound/soc/renesas/Makefile
similarity index 100%
rename from sound/soc/sh/Makefile
rename to sound/soc/renesas/Makefile
diff --git a/sound/soc/sh/dma-sh7760.c b/sound/soc/renesas/dma-sh7760.c
similarity index 100%
rename from sound/soc/sh/dma-sh7760.c
rename to sound/soc/renesas/dma-sh7760.c
diff --git a/sound/soc/sh/fsi.c b/sound/soc/renesas/fsi.c
similarity index 100%
rename from sound/soc/sh/fsi.c
rename to sound/soc/renesas/fsi.c
diff --git a/sound/soc/sh/hac.c b/sound/soc/renesas/hac.c
similarity index 100%
rename from sound/soc/sh/hac.c
rename to sound/soc/renesas/hac.c
diff --git a/sound/soc/sh/migor.c b/sound/soc/renesas/migor.c
similarity index 100%
rename from sound/soc/sh/migor.c
rename to sound/soc/renesas/migor.c
diff --git a/sound/soc/sh/rcar/Makefile b/sound/soc/renesas/rcar/Makefile
similarity index 100%
rename from sound/soc/sh/rcar/Makefile
rename to sound/soc/renesas/rcar/Makefile
diff --git a/sound/soc/sh/rcar/adg.c b/sound/soc/renesas/rcar/adg.c
similarity index 100%
rename from sound/soc/sh/rcar/adg.c
rename to sound/soc/renesas/rcar/adg.c
diff --git a/sound/soc/sh/rcar/cmd.c b/sound/soc/renesas/rcar/cmd.c
similarity index 100%
rename from sound/soc/sh/rcar/cmd.c
rename to sound/soc/renesas/rcar/cmd.c
diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/renesas/rcar/core.c
similarity index 100%
rename from sound/soc/sh/rcar/core.c
rename to sound/soc/renesas/rcar/core.c
diff --git a/sound/soc/sh/rcar/ctu.c b/sound/soc/renesas/rcar/ctu.c
similarity index 100%
rename from sound/soc/sh/rcar/ctu.c
rename to sound/soc/renesas/rcar/ctu.c
diff --git a/sound/soc/sh/rcar/debugfs.c b/sound/soc/renesas/rcar/debugfs.c
similarity index 100%
rename from sound/soc/sh/rcar/debugfs.c
rename to sound/soc/renesas/rcar/debugfs.c
diff --git a/sound/soc/sh/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
similarity index 100%
rename from sound/soc/sh/rcar/dma.c
rename to sound/soc/renesas/rcar/dma.c
diff --git a/sound/soc/sh/rcar/dvc.c b/sound/soc/renesas/rcar/dvc.c
similarity index 100%
rename from sound/soc/sh/rcar/dvc.c
rename to sound/soc/renesas/rcar/dvc.c
diff --git a/sound/soc/sh/rcar/gen.c b/sound/soc/renesas/rcar/gen.c
similarity index 100%
rename from sound/soc/sh/rcar/gen.c
rename to sound/soc/renesas/rcar/gen.c
diff --git a/sound/soc/sh/rcar/mix.c b/sound/soc/renesas/rcar/mix.c
similarity index 100%
rename from sound/soc/sh/rcar/mix.c
rename to sound/soc/renesas/rcar/mix.c
diff --git a/sound/soc/sh/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
similarity index 100%
rename from sound/soc/sh/rcar/rsnd.h
rename to sound/soc/renesas/rcar/rsnd.h
diff --git a/sound/soc/sh/rcar/src.c b/sound/soc/renesas/rcar/src.c
similarity index 100%
rename from sound/soc/sh/rcar/src.c
rename to sound/soc/renesas/rcar/src.c
diff --git a/sound/soc/sh/rcar/ssi.c b/sound/soc/renesas/rcar/ssi.c
similarity index 100%
rename from sound/soc/sh/rcar/ssi.c
rename to sound/soc/renesas/rcar/ssi.c
diff --git a/sound/soc/sh/rcar/ssiu.c b/sound/soc/renesas/rcar/ssiu.c
similarity index 100%
rename from sound/soc/sh/rcar/ssiu.c
rename to sound/soc/renesas/rcar/ssiu.c
diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
similarity index 100%
rename from sound/soc/sh/rz-ssi.c
rename to sound/soc/renesas/rz-ssi.c
diff --git a/sound/soc/sh/sh7760-ac97.c b/sound/soc/renesas/sh7760-ac97.c
similarity index 100%
rename from sound/soc/sh/sh7760-ac97.c
rename to sound/soc/renesas/sh7760-ac97.c
diff --git a/sound/soc/sh/siu.h b/sound/soc/renesas/siu.h
similarity index 100%
rename from sound/soc/sh/siu.h
rename to sound/soc/renesas/siu.h
diff --git a/sound/soc/sh/siu_dai.c b/sound/soc/renesas/siu_dai.c
similarity index 100%
rename from sound/soc/sh/siu_dai.c
rename to sound/soc/renesas/siu_dai.c
diff --git a/sound/soc/sh/siu_pcm.c b/sound/soc/renesas/siu_pcm.c
similarity index 100%
rename from sound/soc/sh/siu_pcm.c
rename to sound/soc/renesas/siu_pcm.c
diff --git a/sound/soc/sh/ssi.c b/sound/soc/renesas/ssi.c
similarity index 100%
rename from sound/soc/sh/ssi.c
rename to sound/soc/renesas/ssi.c
-- 
2.43.0


