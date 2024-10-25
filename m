Return-Path: <linux-renesas-soc+bounces-10149-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E84049B0741
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 17:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A75842848C6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 15:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4FB21F4DD;
	Fri, 25 Oct 2024 15:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c20/G+vv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1082A21F4D7;
	Fri, 25 Oct 2024 15:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729868724; cv=none; b=aupY3IhwgFdOKnC9IBqP/u0WsxK3MSpbmyyh4oq47W7IDj+r0GOiX2BbX86X4+ihvdnB/h3ZwHBYjwqcoHXstbS4kTquHIYYB7liUZkqpns/NbMJ2Fe1L2nwnawvFPC05tQiofwRv3wvIpVfKPyyC/zmOdippGZa3oTfzKEhhso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729868724; c=relaxed/simple;
	bh=bfPrR0zwy73NWJ8fPJX9oUrz7Zb4M0HWAhJmV4sKJDM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YoLfshXbgBQmZH8QkChqRPFX09eZqO2jRODpgnDCZgIZIz2lkIGdgx/xVsGBHGzBnHzJZadXXkZDGs9J+p2Cx4P/aGRj+OhdPE4FLy33lBiNPgIUnuUIMQt6TMkApGirhBDIhUPnd+w8QCBc00wms+cD8ySlGyWb4RFGclazf5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c20/G+vv; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37ed3bd6114so1288198f8f.2;
        Fri, 25 Oct 2024 08:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729868720; x=1730473520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ntrH5sZXkLov6m6pn3kJJxwmprPBkU56JOUk30KmUnU=;
        b=c20/G+vvcVa/1hpBaTJkcNjwi5fODUW03++VGyK8ZBhzUd2xRlQUTK2Mf1K82Zf36r
         ggzoc1qBnYNsQ3CKNZWBr5ndDR7e4nrHTxYdOs400bNimVOcYptSuqbkZbFg7ulwN1ni
         jjj6nh8zTNGK0Gp6XM+/9i68f3AOzfTQzJaXorz8CHxqBc1XsjHCs2nOq4GKWaVPiZbe
         4p8wDbS7np0h7iDPMWKGoki5pfPzdb5CpzuycFxA1JPLbo6il1NcXTnbegtwNYo+nSjc
         L3KtxZVMuHMiPNYLoqJOK9N7LzkRxeOA//m6+woWC1uEkfeOpIz7DQhKMDxgBJbN1ici
         vaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868720; x=1730473520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ntrH5sZXkLov6m6pn3kJJxwmprPBkU56JOUk30KmUnU=;
        b=n2w36wtvANLEj1OwK5x1/kQAZRcuYsbBRsYjgY34U0UJf9zxqMG3hfbgPpiYFjSkyk
         DNATDAu3rIK1S+DnCJmpFsoifZzUz6l/YcypFEFE1vYzP8gpfRkc5PIHvRQPv5t6HfJQ
         7ulyCJxMAxfjuF/MgPiuHWmv/8CKSo7LdgqhFtitt8VygtAodyjefy4g/mUD0LLefLSb
         PJ1skFg0ekXdI3f7v+egsaAd7RJBI3Os9CLZGog4rTLYEAv1UIjd227v5ICdOXvTQ2aE
         91oqE2vyC5KtTGWnDOjfxVZYN9OKEhlA+qm/X1TyfexwP+goJ3tqU4mRkshcOoesiVOD
         IAOA==
X-Forwarded-Encrypted: i=1; AJvYcCWSK9/5nOk59ZlyT3cEZgsdXXabZU/Y8qHd51BXC+ZapNECpRHmr006lmipZLEkU2nStSL9qYK7sZrK+JA=@vger.kernel.org, AJvYcCXOlYSxaAAMutZ9jsO7TNimwxwzB391nldl7qenpXRbSNQuwKfdZI7ERqS3t1evTPp8L8gSJ27WbSzJ73RlOb9Xv4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEpWYStn+fZmJtwrhyDfncG9i+od6DhZF3gcCzFNSnwhSYYRHa
	mx+SS69q2+WANn1LOaOYWLX6xYMfbLVOUtT3v4Zi8dT+dig7dE7a4Mwq/w==
X-Google-Smtp-Source: AGHT+IGEUfjIbnltBQHGpvmo4xuG/UePskohtNrh6DLVMJTaxnSFIFmGdfxRTzmw57PFlBBGc+c40Q==
X-Received: by 2002:a5d:434e:0:b0:37d:4d3f:51e9 with SMTP id ffacd0b85a97d-37efcf7665amr6768174f8f.40.1729868719829;
        Fri, 25 Oct 2024 08:05:19 -0700 (PDT)
Received: from prasmi.Home ([2a06:5906:61b:2d00:1044:9cc9:b89d:54cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3b57bsm1764349f8f.26.2024.10.25.08.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:05:19 -0700 (PDT)
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
Subject: [PATCH v3 0/5] ASoC: Rename "sh" to "renesas"
Date: Fri, 25 Oct 2024 16:05:06 +0100
Message-ID: <20241025150511.722040-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series aims to rename "sh" to "renesas", along with this
the references to this path have been updated.

Note,
- This patch series applies on top of [0]
- This change was agrreed based on the discussion [1]

[0] https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
[1] https://lore.kernel.org/all/87v7xuqm84.wl-kuninori.morimoto.gx@renesas.com/

v2->v3
- Updated entries in MAINTAINERS file as requested by Morimoto-san
- Added new entry in MAINTAINERS file for RZ/ driver.

v1->v2
- Rebased changes on sound.git for-next
- Collected Acks from Morimoto-san for patches 1-3
- Added entry in MAINTAINERS file

Cheers,
Prabhakar

Lad Prabhakar (5):
  ASoC: Rename "sh" to "renesas"
  ASoC: renesas, rsnd: Update file path
  ASoC: audio-graph-card2: Update comment with renamed file path
  MAINTAINERS: Add entry for Renesas R-Car and FSI ASoC drivers
  MAINTAINERS: Add entry for Renesas RZ ASoC driver

 .../bindings/sound/renesas,rsnd.txt           |  2 +-
 MAINTAINERS                                   | 20 +++++++++++++++++++
 sound/soc/Kconfig                             |  2 +-
 sound/soc/Makefile                            |  2 +-
 sound/soc/generic/audio-graph-card2.c         |  2 +-
 sound/soc/{sh => renesas}/Kconfig             |  0
 sound/soc/{sh => renesas}/Makefile            |  0
 sound/soc/{sh => renesas}/dma-sh7760.c        |  0
 sound/soc/{sh => renesas}/fsi.c               |  0
 sound/soc/{sh => renesas}/hac.c               |  0
 sound/soc/{sh => renesas}/migor.c             |  0
 sound/soc/{sh => renesas}/rcar/Makefile       |  0
 sound/soc/{sh => renesas}/rcar/adg.c          |  0
 sound/soc/{sh => renesas}/rcar/cmd.c          |  0
 sound/soc/{sh => renesas}/rcar/core.c         |  0
 sound/soc/{sh => renesas}/rcar/ctu.c          |  0
 sound/soc/{sh => renesas}/rcar/debugfs.c      |  0
 sound/soc/{sh => renesas}/rcar/dma.c          |  0
 sound/soc/{sh => renesas}/rcar/dvc.c          |  0
 sound/soc/{sh => renesas}/rcar/gen.c          |  0
 sound/soc/{sh => renesas}/rcar/mix.c          |  0
 sound/soc/{sh => renesas}/rcar/rsnd.h         |  0
 sound/soc/{sh => renesas}/rcar/src.c          |  0
 sound/soc/{sh => renesas}/rcar/ssi.c          |  0
 sound/soc/{sh => renesas}/rcar/ssiu.c         |  0
 sound/soc/{sh => renesas}/rz-ssi.c            |  0
 sound/soc/{sh => renesas}/sh7760-ac97.c       |  0
 sound/soc/{sh => renesas}/siu.h               |  0
 sound/soc/{sh => renesas}/siu_dai.c           |  0
 sound/soc/{sh => renesas}/siu_pcm.c           |  0
 sound/soc/{sh => renesas}/ssi.c               |  0
 31 files changed, 24 insertions(+), 4 deletions(-)
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

-- 
2.43.0


