Return-Path: <linux-renesas-soc+bounces-10151-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FAE9B0744
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 17:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 95D0FB2655D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 15:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8367E21621A;
	Fri, 25 Oct 2024 15:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dh3AWnpi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BCC21F4D8;
	Fri, 25 Oct 2024 15:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729868726; cv=none; b=fZieVvRTITOyTX9F9SDRzvnVxl/fXgnunmv4TXOE3ufJnqfikua82OLgaNBQZBpDE7aKiLU7bYZY/ro2LPEI81b4IOAOKVVSIxXdfSwT3lFxUOVJq63cSpYh0ihioLwAHeMdqGJ2bhKgvCXYDXCIEkvIbb8Zmbg6PJZoDY4qWsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729868726; c=relaxed/simple;
	bh=dP4S4xfL/V3x9R/OA3Svt52tqyZP0bb+UxjdTXou80c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K3+Mtg5dIGZe9znjHj6xsH6vhizUVMW0ZK6Yy7dl5Qnf6oSZVw+DChIKYdbwm2uX3UzNHbOCAHkddDvIkHXuiXZNvwYQyWdN2U8Bwxq4HlgfDqXTzfFrQU++Rw/Y2OrKa7VCQla+aKu6wprUP1OlzrtnFn5j0/IsOSrEtrqkwfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dh3AWnpi; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37f52925fc8so1465406f8f.1;
        Fri, 25 Oct 2024 08:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729868721; x=1730473521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQW1PY9OA9Q7MyvOYCIVgHMEH3QLp4kYGz2Gl5ajbj8=;
        b=dh3AWnpiHT+p8ud6SDi9i6JXZTk4Fkr4gxwwj/jzxJZ742wdOx/6Nv2sGexUN2Gp4H
         poDAuG63KtWOdzfukHoDndpb2h5jQ3o9IENse0ZktERHDGG5nRffJLtdXr1jqcf38StK
         /yPe0qRRXQffr4GnT9+ObZneFKRutPetQYe1HdxvqA6WpspQBGd1R9sjC5Ra1aEfS2/m
         w7Uzr++WW2yMpB/MNA5r3njJh6cnS8uKThI4vj9UgqcAs3ab+pkXbeYa4tnyJYIScMaF
         ClW6Nch8JFbjKO1dVBSYLeuQpI7La0hyafJDf2PFYDJUEwOamTiLshvDOJmVY6lCHAiP
         K7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868721; x=1730473521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQW1PY9OA9Q7MyvOYCIVgHMEH3QLp4kYGz2Gl5ajbj8=;
        b=wnaOgUPqH7+BhDqJ9YTiABIj8VW0Et0woP/5PQL2V+fIQYaK4GEpCzQ1CwCqaMck5S
         rBHI/j0sM+2kTiP+m5RFwdWC+S7oyhdM4JlbN7a7ykdx7sIyG8IOpnwfX01KUHCbj54i
         0maJxSjkwbIbigBV1qpMiYDtAUH14VrFRf4oQkh7XxRv7LmQ5ssCIW9vUjI9Z7/bYM6Y
         O5WKD50mQLCP8yh06ByxPvOpUJDLJgmicdzxSlEltUy4iwgmTlwvQwwtfHDHrjo00dv+
         mvojtr5+JbaxIs5a1UZzMWkOR90jpBp2b84ZdZTJWHbI8UoYh6goWsGaborRpBIphwvO
         C8Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVyV9OzOmB+2vxg/CzPPXe3oxk7E7Rz1kDAKDG1K/qI6zxBFS9QE26xj5REunBEs+hFY27rZDWyt4TVbeWomrHVRlw=@vger.kernel.org, AJvYcCWoL3+koMOJ/hCC7HugrZ7DEIpRQpcFLqGmfDL9LXrut+n7K9eaWg0fJTG0++gsWCPZRj1/aNRNZ//sqyM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC54FDpU8mU1KMqYJm7UNwiO0tihwUtpQWgj0jICjjS8nS2mP7
	Mv1Tt1V3tH07T2jdrUhnlHwk9VWhCbIEJjC6Rv9+YVBm74tP7YXb
X-Google-Smtp-Source: AGHT+IFj7ceCGtaKmutH0xrTdjEgY61S5vKu/oYjZtKts+/UK171z/C56AwO3Zd7vRwu9bRDmzszFg==
X-Received: by 2002:adf:f8d2:0:b0:37d:4ebe:1646 with SMTP id ffacd0b85a97d-37efcf8e433mr6162835f8f.48.1729868720746;
        Fri, 25 Oct 2024 08:05:20 -0700 (PDT)
Received: from prasmi.Home ([2a06:5906:61b:2d00:1044:9cc9:b89d:54cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3b57bsm1764349f8f.26.2024.10.25.08.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:05:20 -0700 (PDT)
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
Subject: [PATCH v3 1/5] ASoC: Rename "sh" to "renesas"
Date: Fri, 25 Oct 2024 16:05:07 +0100
Message-ID: <20241025150511.722040-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025150511.722040-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241025150511.722040-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


