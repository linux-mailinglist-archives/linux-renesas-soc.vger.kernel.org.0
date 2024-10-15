Return-Path: <linux-renesas-soc+bounces-9744-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3FA99E617
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 13:38:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB836286576
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 11:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0E41E766C;
	Tue, 15 Oct 2024 11:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpC4n7YC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA281E6DEE;
	Tue, 15 Oct 2024 11:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728992295; cv=none; b=ooROSLgyEkFVBke8gdhfJrit23zcRlmKZOKe4NMNXhSkmnwwJ5U9AfTKcFijKnLbyrtRmeOPmvADyD6sf+L0gKkS1juNsgNrf7wa1QxFtiAs+Wu7ErsWqzkF1iih7pX69a+rdgRHtHLyF+oqcjggZzmQUGHzKkKMrSyzbNTmJLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728992295; c=relaxed/simple;
	bh=jEzSDFOcqMJqSyCQuVq12fE5j1VYUNc6WqXX3ARiZh0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p3Lx1Ayf31+uSzArEUDOUDw+2sf+8p8t9Ld3K70nRhvFh1jiyzxSOSw1Adt79/16ecbufg0I9BdAGlUBU6lH1uEPazymWzdSe+wK00ZLuJbBnjqI7UAq2rklrklqKRV8nQQKJZbkIzEoAnZrGcW/t/69hISGMtAne8uQj76Kec4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpC4n7YC; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-430576ff251so45923665e9.0;
        Tue, 15 Oct 2024 04:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728992292; x=1729597092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ov3+DycOreL6Dx3RTEEPA6KfpT4tTecahwHHLWf3dMA=;
        b=FpC4n7YCWpTyiFy3W9ZJW9fsSlCYbfFYCUbJqYLAWBKfC6gDQ84ytfswBCgQhjmQs8
         1/wbsPGAC2A6ZEKz3jZS1j9hquSrdtEs8d6sFA2c0diwoCsB3h09qlf1xEsIfdxBOZ4W
         45b0jBto0Ic/wCRQYzSYpDy+98+6zrZh4URU7l/WbVaIx8alQK2MgyKMaFCQBAvUY5gC
         9HzdxFOrWCzwrqr7o2IfGD+h7eGn7n2YtzX4zExRzbJOQXrg6/BDCO4Xm3e/ZFy5RNhZ
         5zwjZCl2dLBmaJdR0UHcdjD7MnVqpHX6HZoA0Jp4J0g9B5XM0PF6uTb9eO1iwSno0ztJ
         kOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728992292; x=1729597092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ov3+DycOreL6Dx3RTEEPA6KfpT4tTecahwHHLWf3dMA=;
        b=SFF8d/JYLyNUKHGkUvddo/OAjloNI5knzHjROZ5oikcCjSZMrP7E+VEBScr3J7xcof
         1bTMCKZabMApLi0KEcwqRdCAMgshVqoc3hyl74On93EA12fmXBk5YHQbfwUSk6JfyWjq
         Q70uJmYnmMsKItoZYLU0yBK0QVbBJNl1GcC5Oq9cdpTjNEdRW7NL46tlUB+BpUEbUzKM
         jF03EpOD5AABX0HpPpJnj/enhDKeYClQyb22fA+YXxHCxZycpmemCtH4MrVwgnlSOxaK
         +wSkdfsTIZGfZ7aKb/5HU3pY0ZfbEKR4e57Eiev1+L7kr3/q+BgBwxYOuvR7zfes3ntO
         kMug==
X-Forwarded-Encrypted: i=1; AJvYcCUACo60lmJX3rMFt1K7+uKid2bUPGsMwvsu7UU8UfVmUzhvQ6feUfIpmjCGDYz0GnA+f6Cde/oreC2C3ZYT2BFupC8=@vger.kernel.org, AJvYcCWq9Zo4kCLOU0l9f/0IFttrh05sZT+ucVJ6Sc8ohMy5j5oMco3q94pwM45jguIQS4tmQGCAy+q81B35LQE=@vger.kernel.org
X-Gm-Message-State: AOJu0YybgcD1pMcDqL28A3MsOY+lP6DMBLdI5Kru2BWT6UBAhSzbkaZe
	G2Yhyey0b5IkjDfOH5GAlfAI4KfoKAD3FJHbNs4ETt6Je77LItxp
X-Google-Smtp-Source: AGHT+IGNDTeEH+Qno4h75erjhDCtg/Klu5unnqPBkcppVcZzG3zCnun5QzL3cVGcyU8aMFLHyx94CQ==
X-Received: by 2002:a5d:5587:0:b0:37c:ce58:5a1b with SMTP id ffacd0b85a97d-37d5529f017mr9161580f8f.51.1728992291585;
        Tue, 15 Oct 2024 04:38:11 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:ab23:85df:144b:6ce6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa7a256sm1363943f8f.14.2024.10.15.04.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 04:38:11 -0700 (PDT)
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
Subject: [PATCH 0/3] ASoC: Rename "sh" to "renesas"
Date: Tue, 15 Oct 2024 12:37:54 +0100
Message-ID: <20241015113757.152548-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
[1] https://lore.kernel.org/all/20241011175346.1093649-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
[2] https://lore.kernel.org/all/87v7xuqm84.wl-kuninori.morimoto.gx@renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (3):
  ASoC: Rename "sh" to "renesas"
  ASoC: renesas, rsnd: Update file path
  ASoC: audio-graph-card2: Update comment with renamed file path

 Documentation/devicetree/bindings/sound/renesas,rsnd.txt | 2 +-
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
 30 files changed, 4 insertions(+), 4 deletions(-)
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


base-commit: 4197e5638cfd2d73e67ba89d97ec7ae8383b3b38
prerequisite-patch-id: 63dc578627303bb0b33654043bd1037fa03063a1
-- 
2.43.0


