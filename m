Return-Path: <linux-renesas-soc+bounces-22776-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FC3BC34AB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Oct 2025 06:25:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CAE119E0477
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Oct 2025 04:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC852BEC5E;
	Wed,  8 Oct 2025 04:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Rl0ibyTA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91177218AB9
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Oct 2025 04:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759897537; cv=none; b=l3v6q2XeuVIZdMueCkA4GY4P4zrlywUDZ+rjYkeGY0/VZjSF7LxwgTm5kQ2Z61Aejd8oSP21e5iof9vJha4KWZT3R3RAg3tLmN55dzu6RwgWzOFxNvz1iKxsDAE3zg4nYLtvRLLs8Cvo7QWDMRp4HaInSbInK36rWyXmpULg+T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759897537; c=relaxed/simple;
	bh=uvo8MURSa2p9gInQUNH+tPgQ6tPqUppd1Zm8dQDK3qM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gRKdqAY6DeIIWzy1/lJ29YHu9d4WtZnK393Xu4z0HiodQtInQpRZb9NgFVCA7K6Vcoreb462RsrndY7232fofMeuC8+k5HFU4vkV/hojB18iiEcKodHzEE6znNcdG0atXVbwGodhBzNjbPm6Vfzy19OqkXfApFzS/y6O2mbcXh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Rl0ibyTA; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-637e9f9f9fbso11390677a12.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Oct 2025 21:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1759897533; x=1760502333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KqPeHNCg3y5qhc7WNVFKhuuhnp6HCa8NSFOoHqEFOX8=;
        b=Rl0ibyTAu29VfN48rdeSWiWt6GE43HU3Itur6UBAOWuf7zz8houvqiiKqXJeVUSfOh
         LQs6KWzJuQVOYZFChaQXrrU+WLfWYU66waRa1Fdf526G6R4c0qbm+uP9tYzioo0R7KgH
         IWuKmhAkvQ9aEH+cM8TUybHUkbHxGjETFwNKkgODJlVJn0OVUbv3RIbXpWMDZ3ZppB7l
         SDdORnGu0VwuJI5xfOm3nK+yd+R4Hrk+JOTyKQLV8bYK3REN1O0QJFPK2b0Wm83iAdEv
         xJT/4olJHGN+/7o8Oi4Eea5Xi6EMQx5kk5QMNMkNGeH/sYBlsl2kduWdNugMMcHF/9Na
         8PCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759897533; x=1760502333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KqPeHNCg3y5qhc7WNVFKhuuhnp6HCa8NSFOoHqEFOX8=;
        b=MTq20Foj9Jmv8kG5X8BUpjkvZY7kF644AZQkz+asBsqkkKUwP9DlKRg78mwt5qiMh4
         hrDhAFv75f4/liaKukRZoyRIWGn/PAbBQJbAKUlXCx9UaPdgGxgbEFB0JD84Pmt3pgHO
         2IgFJW9akL6CplVhq85300QgDpyUNn+yw8IoYy9plzkJG8R1zdJa0TOGEtzcZTCaCfU0
         +oUL8j5o859iRbqCS0ryIbyyQyz+x5R4gI0Ny3DHzYNjx9aYvlxGNeTaTOkLt908sFm5
         QSdVMk86LqTrrZvDwziGBdcXmBu1o68MFyvy+rmGA5tsAygnB1EAjdSwVFCSXS8/Frci
         uwwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR6kLEDpGyraS8XsHeOa5s2OvXpbs+u8ZQvxGOMpPz4z9vpwO1lk4Of1u+dEQ42ySJBsCOZ09t7FA85W9Wl5OnmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZSXot7wZ06yKG6O/oJ3WaV53ebyQNyxm6t0BxFB5SQC9oQzSJ
	mfMvMpltLvLqt4jYyMiIwh4FINTXnam60MTxI/TZ1OZYiMb9c9wBDF/ITu79T9Ci0iE=
X-Gm-Gg: ASbGncuZaZW1/HFUjpEOtGtYav91sO+GE8X2dTgXsPn5pN6LHslZmi6MMrGKyXL7ABw
	2Lq5THY5lnIDtZqeS5/k8t0evk+yDFFu+6nkhSuzeRt8/S1si3RG6d134SIf4UDf5XxxGx8QaM8
	XL1toYV3A6KQyefEEzc7QOsMeYxyCwTR5d55C8FCv0Sfx6/rwSMUi1AYAKudcJTw+b7E7p3t1tS
	nwPO0TcnBjf+PDjbk70emdEXUHcMJB8JT08JbEkZhxguV/vMsc5mM4awyqRKGyifLQszD/VdJdT
	ZaJEv3Q9xSKDBQXbLe9VfSgrMU/cQ33Ak8JdQ3nT6xateQiTGVBrv4VHE35aTu28uWjyFp9hZ7G
	bAK4etH3W2wxwToSw7v/g+32TipdVNvOzgCA73Mrejq+vG1imW3spB6o8jEr6earL/gdYmgSbTP
	U=
X-Google-Smtp-Source: AGHT+IHmej4QzXHOIpsaT/87uRiiQOGLrQ5yJC8DCvqwr///MfonEbf7G0dLYffpxIMlynHEt0syPg==
X-Received: by 2002:a17:907:9407:b0:b2b:3481:93c8 with SMTP id a640c23a62f3a-b50aa3921e2mr218794166b.19.1759897532884;
        Tue, 07 Oct 2025 21:25:32 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.59])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865e77427sm1583124466b.36.2025.10.07.21.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 21:25:31 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wsa+renesas@sang-engineering.com,
	ulf.hansson@linaro.org,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 0/3] mmc: renesas_sdhi: Handle resets
Date: Wed,  8 Oct 2025 07:25:22 +0300
Message-ID: <20251008042526.3312597-1-claudiu.beznea.uj@bp.renesas.com>
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

Claudiu Beznea (3):
  mmc: renesas_sdhi: Deassert the reset signal on probe
  mmc: renesas_sdhi: Switch to SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS()
    and pm_ptr()
  mmc: renesas_sdhi: Add suspend/resume hooks

 drivers/mmc/host/renesas_sdhi.h               |  3 ++
 drivers/mmc/host/renesas_sdhi_core.c          | 39 ++++++++++++++++++-
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 12 +++---
 drivers/mmc/host/tmio_mmc.h                   |  2 -
 drivers/mmc/host/tmio_mmc_core.c              |  2 -
 5 files changed, 46 insertions(+), 12 deletions(-)

-- 
2.43.0


