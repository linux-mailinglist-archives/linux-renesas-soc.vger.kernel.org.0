Return-Path: <linux-renesas-soc+bounces-24686-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 612E0C637B3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 11:19:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2CD6C4EE549
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 10:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D4D320A38;
	Mon, 17 Nov 2025 10:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="bSkbgMcZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC8826FA4E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 10:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763374372; cv=none; b=pPPSsMvIbTYXck7OMcgGxrlnWoOYQpDa8IgCx3p0QUiPjCvt438OjRfSEi+cKSLJs3SFFEKqeHkfoOzYzuCDuo+7qiUcKP5R+pAwKXIWRQ9JEBXli160X6IGzlbXrZsGxGev86JMNfgItMItVxccBnHNCeLk+mEPLLVvRKrsqrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763374372; c=relaxed/simple;
	bh=fsl4GdK0w4fbHXOEuakzruyemXNmcFNvBUEzXjpWhlU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YDk5uahTcoY2s3lAhmUGUYKlKqTSPbPUDqBYpZBcoh750rKlYePHM3rVe10kZQitxJbCCyy1wUELye4/Rh1t+vsNXYuxyo8MiUB18k017xOPWwQuUvOobUFnoSLJfaEHe9mVVuihJ1vHAZLQicQjriHkiiC1+YsXD9tL1CrQV/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=bSkbgMcZ; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42b3b0d76fcso2657070f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 02:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763374369; x=1763979169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ha7ZKgbJ8ApHbh7yZc3t28HL0IX/pZtGOjA6oG4SIOk=;
        b=bSkbgMcZiRrDvUdUEmx2PNxM9Z22IWZfI89ROpBxzN8A3zzLKVXlrnaoLX7P3qqGjP
         ndrm075N2BVOMP6jFxuoTHH2xyAi2hVisohOD9trAXOTiXcmLuK2DqKecZvupvE4wHKy
         VdEHZiHz5qTjZmAgUyQbyxhyTXqbsI0ZVWb0Q9rRiinCNcBzZqBmStN+HHt1E+dqP0X6
         U6/IfRRZ44fOqh3BQHNrGWI6K7m7sEcJ5SyJ4Xz2c1dl1cvg4xvoBu+XSDPDJOfFL2iO
         Ql6SpbrSmlk2iq8XiB6Hx7d2YtFFPKOiq1DbfeA1CTGQVxBSWYoB4QSJj1Dh8Q8AYF48
         romg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763374369; x=1763979169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ha7ZKgbJ8ApHbh7yZc3t28HL0IX/pZtGOjA6oG4SIOk=;
        b=od1z4IbRR1g7RdbxhbgSr9KzqDTYPb63TdFBkIaRgMAeyILHpagZO8QvIUEYw45AWB
         Tf673h/06Ru8+HYkuHFWDWWPk/Q6Uo9xLDqCvbex5gZoqGph+7SE1DIxyx/kOf/CG1t5
         FwoVsRJYBPnA7sosoXIgz57BJQ2uGbKN8PCJq/fx1SStpYSM//NiJvwqwJXLjpNpOEMt
         ma4tRkN9jqCae6wK01iKZt8sm2E8865vsA3nYFfljww6IxFRecNCZ57OcV5sAx1mp3i/
         hZtACV68A5fnfMMflTVu/YuBRcWjPSSph1wFPgvMbb9vyyU0tuoBHt77Fp+kfRNsarhe
         Xx0w==
X-Forwarded-Encrypted: i=1; AJvYcCVP6EGYpoMjCTCkEP+eXwWPiJ4rXzSvFg6Or0ZeT50Fmu7/ZT5uS6CrZiDR/p0EDUZzkgkgOWxrDfYchZZcazQLrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoVNEe3pPxEft8Yck+dSWcVyZ/VBWxXZmQ28YFSflv8iSfxp75
	ZhxAnRr8xre0sMTNvRPdYWAZI1VhiY8ZEa4Oi9IH9RhWezIIR8yG9upISFb59HL7aPo=
X-Gm-Gg: ASbGncuUuwBl6mFCOJfM/2YqKZg5fpgb+G4oPe6REL07A66/Sngy5mBRKLesuy6ChMY
	zsaBxdNitqSi73ISm97HvpmzyF7OI4cA4attJOL1v1SwahWE9M2gf8BjIl1rskqbpeciuahUeUd
	ezEA9G+QsEjEKQPGx0Yt1NTi62gpqdy4eM3tb1EBuhH9AuqbCAQfNwWsfdy4lX96Qgse4U/LWDm
	SVQRCeJictX/yxUO0iRr4EFomehlwdrWt/DqrNYg+y6CJ/DQgO2GGlS8cK0JwWtvg3E5HyZcNEN
	0TqOFupjq68KlgyPIx1MPTwim8fJvAsK6tVieVeR4UtH7+hYzzAiY1BSIf6M05LR6Qxh/d7tBOY
	mIlVPXtiyzEzSF1I4ACW4oE25D5Sb81UONy7F9tYaqpu//op/z5Y9gjEpOTsF1yCgqpuVqrJ/TN
	AvNX1V/LGHQoIP1WMyL0Cox0yCf2aec5NwOzi56hfY
X-Google-Smtp-Source: AGHT+IEVUbpzsci7hh2Q7hwO7mZPiaZww0u3tvUbVJ+jQOZMQH5YZIcfcfZVXJpCw60gHMbCsJOs7A==
X-Received: by 2002:a5d:5f47:0:b0:42b:3d9d:c5f8 with SMTP id ffacd0b85a97d-42b59328f50mr10500068f8f.6.1763374368734;
        Mon, 17 Nov 2025 02:12:48 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f203afsm25806958f8f.39.2025.11.17.02.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 02:12:48 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wsa+renesas@sang-engineering.com,
	ulf.hansson@linaro.org,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	geert@linux-m68k.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 0/3] mmc: renesas_sdhi: Handle resets
Date: Mon, 17 Nov 2025 12:12:39 +0200
Message-ID: <20251117101242.4018208-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds suspend/resume hooks for the Renesas SDHI driver. These
are necessary on RZ/G3{E, S}, that supports a power saving mode where
power to most of the SoC components (including SDHI) is turned off.
Resume from this suspend mode is done with the help of bootloader
and it may choose to disable the SDHI clocks, resets after it is
done with the SDHIs.

Reset signal was deasserted/asserted on probe/remove as well to
avoid relying on previous bootloaders. This is also useful for
unbind/bind operations.

Along with it, driver was converted to use
SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS() helpers.

Thank you,
Claudiu

Changes in v2:
- in patch 2/3 drop unnecessary code changes in tmio_mmc_core.c
- adjusted the patch description for patch 2/3
- collected tags

Claudiu Beznea (3):
  mmc: renesas_sdhi: Deassert the reset signal on probe
  mmc: renesas_sdhi: Switch to SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS()
    and pm_ptr()
  mmc: renesas_sdhi: Add suspend/resume hooks

 drivers/mmc/host/renesas_sdhi.h               |  3 ++
 drivers/mmc/host/renesas_sdhi_core.c          | 39 ++++++++++++++++++-
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 12 +++---
 drivers/mmc/host/tmio_mmc.h                   |  2 -
 4 files changed, 46 insertions(+), 10 deletions(-)

-- 
2.43.0


