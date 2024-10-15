Return-Path: <linux-renesas-soc+bounces-9746-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E55999E61A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 13:38:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F07728677D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 11:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A3001E9073;
	Tue, 15 Oct 2024 11:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/ttrX8o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDC01D9A42;
	Tue, 15 Oct 2024 11:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728992297; cv=none; b=MPlPnjayQ3V+Oxgn/eEFn+E4EXp9UQsn42Roinb6wPDzyivbur26/YMqoAFrk+zhqaWBEapP607a8gDGQRrHtYUG+d81VK6Aplh8774gEuJBZHZejACuD/2yPZemDhApJa5P/4mNaQ63GE/im1mt384uvgGlyQO1ssaRnmTd5dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728992297; c=relaxed/simple;
	bh=t1CiDeZPaTUwBTcnjqx84g2SDSDNpTlAIxMAl4MCt58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uJzR2Jjiir45hCSNHb0G5LOKQHW8hEfF3EZGDzP4nz3qpPEfc0riFGXw8Bm3zIKZ4vheJu2q2BX/lj75h4VCwjCC4emqYh+derjbI5/E5pWzp5GsN/3FzsNQkivsY2ARw0xvtST0R83nUJ1aua2mpBfLLkW/ATJmdkn8x50Efug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/ttrX8o; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d5038c653so3282105f8f.2;
        Tue, 15 Oct 2024 04:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728992293; x=1729597093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jkghBEagzIe7ER7qBcl/u8dbeHV3xFBNv59IFmFuVg4=;
        b=R/ttrX8ofewv2gNxjJBUZctN+jRO8Z4LfofoQFzHSF1zq/sb46BMWIxMQKyOYQUIl4
         WfJ6UebfUZyISqyJzhNSeV9MTnHkA6uLCPRBSCtgA3Y767mr6rPBJIGseCuolAu269VO
         ymgN3V3b5bH/yD99t2sfQcu0aMomcR82zouxtggjQ6E+vuav2ahhcIDcvFx62mJqtDZV
         ahXtIClZHFlRz0vURv3/JoC7YZ9evk/lsrqyy++UIQWF0pNWqj1DCGQlHwMeLQ20v7W2
         AHOIQV3Xqpb+d+FSPsc5wF6HL8CZ3CFwUuc4Qms+Mdd1Qlwhg8KS/YmMRoCN6vEicyQ4
         2fLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728992293; x=1729597093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jkghBEagzIe7ER7qBcl/u8dbeHV3xFBNv59IFmFuVg4=;
        b=me+/wTxNzdJSktt8AeEVlqYLhXi36XnV52jclJDNJjnUh6muWSDe4HN4uQRw5e5H2V
         Du/+NqrhRlQAwdth3hHXFzw/98c4XU7Q3ABH2Y5zHhUHtYhP60l7/AbzRMjAA9uBWRWa
         vW5jV9UUkxWQvQQpzLMOm8/sn6zinlNDC5QsoPhrLId6YcwkdmxoDw/LqkMQ6tBrsQMD
         4htfLbLa/s6r7Ew2223efsCpPTiRH6tunDq9btUtsdjcnX0xVmZQFwKFlvB/pQlFtHzC
         w+DQyYNIwaXQIwzaC5pRCVAjIMp0ikDrfKVVnDggsSPyEFzP+wIhkLeIQZ5p+qx7f2r0
         Of0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWbrVPL6oaxkv5TeWq8yfbWwH1guSnu61KAZERw0IVQOIv3s+7h6pbJgIvfSTTTtgEr9GE4FcXUKbhesAscu6aEYGY=@vger.kernel.org, AJvYcCXInAqfFpZfhDjRoCWSZp2/bhwLn3q/yipAf1YZo9eviNcgkXeF/Pm9OJEEf8f1EYC+mUxMpxiUxQ+G0LY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjin2woF1l6fnm1KP/s0heF2LqBj+OZl6z3+aHD2nHLqUD7x4y
	hCcgmHNOGSLKdVW2lvtl15YTv7HEF7WgP3BhYB4HkcEirihWLBuK
X-Google-Smtp-Source: AGHT+IE2xq4YS33/hznsn0FVOd9GsUGuwRIlQW6/Ov5ptAePg7BAa5btvoSjYPS8d1tIFapITXfa1Q==
X-Received: by 2002:adf:a415:0:b0:37c:d1e3:ebd2 with SMTP id ffacd0b85a97d-37d551fc6c1mr9437890f8f.29.1728992292461;
        Tue, 15 Oct 2024 04:38:12 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:ab23:85df:144b:6ce6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa7a256sm1363943f8f.14.2024.10.15.04.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 04:38:12 -0700 (PDT)
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
Subject: [PATCH 1/3] ASoC: Rename "sh" to "renesas"
Date: Tue, 15 Oct 2024 12:37:55 +0100
Message-ID: <20241015113757.152548-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241015113757.152548-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241015113757.152548-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index e87bd15a8b43..9e7eb64778d7 100644
--- a/sound/soc/Kconfig
+++ b/sound/soc/Kconfig
@@ -106,9 +106,9 @@ source "sound/soc/meson/Kconfig"
 source "sound/soc/mxs/Kconfig"
 source "sound/soc/pxa/Kconfig"
 source "sound/soc/qcom/Kconfig"
+source "sound/soc/renesas/Kconfig"
 source "sound/soc/rockchip/Kconfig"
 source "sound/soc/samsung/Kconfig"
-source "sound/soc/sh/Kconfig"
 source "sound/soc/sof/Kconfig"
 source "sound/soc/spear/Kconfig"
 source "sound/soc/sprd/Kconfig"
diff --git a/sound/soc/Makefile b/sound/soc/Makefile
index 775bb38c2ed4..336328cfdd4d 100644
--- a/sound/soc/Makefile
+++ b/sound/soc/Makefile
@@ -59,9 +59,9 @@ obj-$(CONFIG_SND_SOC)	+= mxs/
 obj-$(CONFIG_SND_SOC)	+= kirkwood/
 obj-$(CONFIG_SND_SOC)	+= pxa/
 obj-$(CONFIG_SND_SOC)	+= qcom/
+obj-$(CONFIG_SND_SOC)	+= renesas/
 obj-$(CONFIG_SND_SOC)	+= rockchip/
 obj-$(CONFIG_SND_SOC)	+= samsung/
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


