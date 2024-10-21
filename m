Return-Path: <linux-renesas-soc+bounces-9950-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 200689A90B5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 22:14:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9840B1F23056
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 20:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43D241FBCB6;
	Mon, 21 Oct 2024 20:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qwer1Oo2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCCE1FBC9A;
	Mon, 21 Oct 2024 20:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729541641; cv=none; b=qpprKHOcp/ryoiUJ/3CEOQRaoLoJ9sLBLq94HVJe7/cqwGxj5qEsaoYHgSLV+uSY61Y7XywB6Ak7mpeoxQGTNR5f6wVAQfyVB9L+vSb32J1NJePNyuXdh+DcTwJpgpPvBivwfBoJV/OwGdzThLgb7uawsG12CfupcUmu4wgAe+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729541641; c=relaxed/simple;
	bh=NcaNvwzSDV5Pzdwn7ceGn4PQvefEbLtEbGP5G7bCwp4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DtqWC/S1ND/DwxT9/zeoufeLSGwCwdA8Zo8O69HPYqTc5hlgiuAB3dCXHKX9xYRf58zF4YuH1iir6Nn9LeD0MLGl8m3q898bb6E+4+KscoUJ2sgDmwnxb86jMt9hSBXkD1rSFcqDkuOu82k5pJaBiWND/QGbKZDuvedDCiIheGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qwer1Oo2; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4314f38d274so67237655e9.1;
        Mon, 21 Oct 2024 13:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729541638; x=1730146438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wxr+0inihUua0vqx3LJibrXwUZQlVu6b1W/yl55C8EE=;
        b=Qwer1Oo2uQOfjFoIzwbXuzXuyHWBsycKAbJm0fLuCGRsL1f93kiuEtmTe28/9Z1AzB
         zQHcVQ+rV1+96P6z6EWWWKEwVuT3AlfU/X9lEcaF5Su1dQriWrYJZJfhm6Pa2ssw22ty
         UZ87lLNUxmrWhTa057CCyZL+jzAClo5UEO4NSAWkY4Cp5cNVLbcaPXRwCApbPOc3NR2B
         RaPaviO9aEHrue3exbezkJeP9NZ+gyQ9FrK6wnUyrrzcjmAHOsA/2gpHHLoWAXw8oIK6
         DVSLneQaG019r00fKhI5SILpIg6tug6dgPnlsDGRB3Iu69yg1l1YeWcmCPO0qcP46t8K
         A1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729541638; x=1730146438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wxr+0inihUua0vqx3LJibrXwUZQlVu6b1W/yl55C8EE=;
        b=RSfjhtSQAfHCVdplZaqcJ9UQnx34V+IxXvizNkyKYRVctok3bg7fgE9lxESe8ImUyl
         XryXQO++/LAyX2raRrD7O3+uHMspugLVn8ZFSzjcuEgf9FHheoxdFPR0ja1T1m/eydsM
         Z6YieMurNMgWiM/SjJ5v+ODPr028fund1JSsoUe8zscfB7c/bScAcNkgJ8wub4YS3tPi
         u1a6jYs9XEZ5OtSJWxdz0DWrUFlH/VddBl3U3QM38jGy4VIvp6/jUgYAejiLYi0ifmjF
         D+ayEUkMsDBUGCRHle6Vn9oPGM8ls6JJBQG0Ew3x+NnNn5bYMSuXKgGzgVpXoXfnPoJK
         kXyA==
X-Forwarded-Encrypted: i=1; AJvYcCUA0FIYonPHQsPlLYoTgDskV3EFXtheJwCpPh39fHGjphSdxx1wPj164cI0K5C3hTuS+DAG7bW71NAfhqWad/cAcjw=@vger.kernel.org, AJvYcCXMqlB5uM/76rEDLR1gewIinuj3RDxj9iaK6Elr/luuKWVJOezIZ79WctK7EaR2GWHedM7yRKvgARRHxpM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxNwNBOLit2HGiNdQBdA4JEWnQ7fxA/rSjXlwebQAcIYWqlV/J
	Mwk7YdM0aysawc3NorXf0ygIbQQmil4DcN7/Ln2aE/SBWuFtffBj
X-Google-Smtp-Source: AGHT+IHKLNovMEQPK9DKaecEN4ZgmOqdnCnbA8wJusNzft7mwvvffEmifWU9vsShu0AuUZxuN0sb1Q==
X-Received: by 2002:a05:600c:45cb:b0:428:d31:ef25 with SMTP id 5b1f17b1804b1-43161633cd0mr127222965e9.12.1729541637286;
        Mon, 21 Oct 2024 13:13:57 -0700 (PDT)
Received: from prasmi.Home ([2a06:5906:61b:2d00:8a20:67a1:e60f:941e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a584f7sm5042935f8f.53.2024.10.21.13.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 13:13:56 -0700 (PDT)
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
Subject: [PATCH v2 0/4] ASoC: Rename "sh" to "renesas"
Date: Mon, 21 Oct 2024 21:13:45 +0100
Message-ID: <20241021201349.395022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
- This patch series applies on top of [0] + [1]
- This change was agrreed based on the discussion [2]

[0] https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
[1] https://lore.kernel.org/all/0a189e2c4090a1b308e18005d2552e335bac354f.1729511337.git.geert+renesas@glider.be/
[2] https://lore.kernel.org/all/87v7xuqm84.wl-kuninori.morimoto.gx@renesas.com/

v1->v2
- Rebased changes on sound.git for-next
- Collected Acks from Morimoto-san for patches 1-3
- Added entry in MAINTAINERS file

Cheers,
Prabhakar

Lad Prabhakar (4):
  ASoC: Rename "sh" to "renesas"
  ASoC: renesas, rsnd: Update file path
  ASoC: audio-graph-card2: Update comment with renamed file path
  MAINTAINERS: Add entry for Renesas ASoC drivers

 Documentation/devicetree/bindings/sound/renesas,rsnd.txt | 2 +-
 MAINTAINERS                                              | 9 +++++++++
 sound/soc/Kconfig                                        | 2 +-
 sound/soc/Makefile                                       | 2 +-
 sound/soc/generic/audio-graph-card2.c                    | 2 +-
 sound/soc/{sh => renesas}/Kconfig                        | 0
 sound/soc/{sh => renesas}/Makefile                       | 0
 sound/soc/{sh => renesas}/dma-sh7760.c                   | 0
 sound/soc/{sh => renesas}/fsi.c                          | 0
 sound/soc/{sh => renesas}/hac.c                          | 0
 sound/soc/{sh => renesas}/migor.c                        | 0
 sound/soc/{sh => renesas}/rcar/Makefile                  | 0
 sound/soc/{sh => renesas}/rcar/adg.c                     | 0
 sound/soc/{sh => renesas}/rcar/cmd.c                     | 0
 sound/soc/{sh => renesas}/rcar/core.c                    | 0
 sound/soc/{sh => renesas}/rcar/ctu.c                     | 0
 sound/soc/{sh => renesas}/rcar/debugfs.c                 | 0
 sound/soc/{sh => renesas}/rcar/dma.c                     | 0
 sound/soc/{sh => renesas}/rcar/dvc.c                     | 0
 sound/soc/{sh => renesas}/rcar/gen.c                     | 0
 sound/soc/{sh => renesas}/rcar/mix.c                     | 0
 sound/soc/{sh => renesas}/rcar/rsnd.h                    | 0
 sound/soc/{sh => renesas}/rcar/src.c                     | 0
 sound/soc/{sh => renesas}/rcar/ssi.c                     | 0
 sound/soc/{sh => renesas}/rcar/ssiu.c                    | 0
 sound/soc/{sh => renesas}/rz-ssi.c                       | 0
 sound/soc/{sh => renesas}/sh7760-ac97.c                  | 0
 sound/soc/{sh => renesas}/siu.h                          | 0
 sound/soc/{sh => renesas}/siu_dai.c                      | 0
 sound/soc/{sh => renesas}/siu_pcm.c                      | 0
 sound/soc/{sh => renesas}/ssi.c                          | 0
 31 files changed, 13 insertions(+), 4 deletions(-)
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


