Return-Path: <linux-renesas-soc+bounces-19790-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C231B164F1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jul 2025 18:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC70D188D08F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jul 2025 16:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65D342DCBFB;
	Wed, 30 Jul 2025 16:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2D9vebr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B587F2D838B;
	Wed, 30 Jul 2025 16:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753893985; cv=none; b=SrxLASrJPPEPR6HMuqeRUYWVis/PgXmLDREAUJDFoGn+Dws+YnPA3WH4KZLSiuPTODUZ7etl+afwtBN8Ep3jOQLxnmqohBhwgbxF+cIf+7qnroCVGS9Hxyjeg2bWQwBfA42CS8fOYHBwbqOS0ygD4OibQLJ/jw6DduYMe69hHWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753893985; c=relaxed/simple;
	bh=OnY92MEoPqZZpm7KokGL7H7lPXOE0wu4xlzLwfU2dl8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ip7vXaX0gdJvB94IQ2Gyb+c4mZWAcrqnGU0VD2cSXa+TCnI7KOy8JbcpoNLaXwSsgB7qGp+wIcCUDxej+0N5U6YYpXrx+TCEz8eq+R5SV4tPXB9kYgka6a7vvV6d2yEFbfSyv60VpI3r8Kd2ngaBT/FEEjHkCk091nJZEGPMUtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i2D9vebr; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b780bdda21so6636f8f.3;
        Wed, 30 Jul 2025 09:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753893981; x=1754498781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MWezttRTSHsSXwTxZUD3kGHn4YUTpECkUfWv7cRVO4g=;
        b=i2D9vebrDACkrf96p+sYZZybZIjAVsEATladOceIMYvS4Hoo5g8cM5EwBqCvo6jlac
         v0Eq+t31lKELqQbUdg2reqFopf7HY411OcKOW7dijc/WUp4BTxHeci57QBPJEAxB/B6O
         Krz0ZaWnjIsf9/H/56qTDFFb8QhakleLo/wzMVihH9LKDOKTOcj2r+Eipi5BTV8UAd3j
         JM7ChZemvvM5FKidmVKoamNelnQc0uAcnQ8zbxtNnwj0ZBHHyaTZBRMfgdpkAjJnr2fI
         9KYqLmzUsKi8QHwmCr2A0ENHIpvnHgJjXkQaXwpQpHYh+u6KS+aeqNwPn9yX0/dXq7BL
         nflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753893981; x=1754498781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MWezttRTSHsSXwTxZUD3kGHn4YUTpECkUfWv7cRVO4g=;
        b=gjYRYiu/FZkRebRz//V2GwhIND+SekFLESdLX2FUh9zXdrjvA4IAkWMWdK+4zWW6qQ
         +WCg4EJCpfLjCD1Y6KLCh2hhWypeATnBmXnjiwZNPoII1lWTGBZdHGch+DBfuIam4ds0
         Ot9PYvvoQ2xiNETEhnoIOnwlcbSiMuYgODoaMx6gadK71+sEJkdCCPojHiNvgLclpOLQ
         oqK3VoeAg6tCkOosy7I7p7lBiAg4d8l1AlGjOcbL1T6OV9/ubJYZB+uLCuLPRtxKvUgG
         Jm40bCgPJpMa40YOMKRXRVpdy02ZvgAQyS3DQo9CtyLjohS9kfFh6sAM51b5N68sPXtU
         Kmrw==
X-Forwarded-Encrypted: i=1; AJvYcCUQHQsJUJb4fwp0tcRCxpFV5wjokBhEaSey30YB3dz/BcwiaasB7yxSBR3o04BIxrvsTq310CEdvXb9fAOy6nys0rk=@vger.kernel.org, AJvYcCX7bMCidlnKQvhHnQFujI7AzhhI0JJIybBsjQykL4M2lFl+KETNfOWaTU7PNuFWT2IqcKF5lOCALwOaf1M=@vger.kernel.org, AJvYcCXyYrvWzW4Y1vXAhrUDMlLEglWnZlJWKdTIzRe8gpUkTGKY47GMxRukicBfJia5dIaIkROQ8MTRNa/n@vger.kernel.org
X-Gm-Message-State: AOJu0YxaN/gnmrdDOYiwiDnEXBm6EoegTJp18APED1wETULrJqAdA92V
	4f7JouYYs5dQR0AmQGKq+NH/pkc/0eEx7xfSwUMyUZyaVybyGF8933od
X-Gm-Gg: ASbGncsF2PAW+EuijZ66rTvjNXZjx24gcT/j1dy3AtH0VN2zu2nl9dwmbI6OPISs9hF
	YGFKVoeehmqTkOdArat/B8AqoGg8AFWyQiP/42ykFHe8UYP8rMMyS0FsQjLczr4R+z1RGk7bxmW
	kiyLxPemduqDUIoxl+g8c0xiZUtKwa2tjv7DHgaMA9AUgvyRFjaXzmY6iyErHKUYWnYOBG3PUHx
	pFZOjqm+ooqwzh04TlRG3JNVC1HqJLPkbpUogHWpR3zu7DCIVQy5LP0HNjwb2j8x0t5maOH9HGO
	ZgcsdtrHPrLkniINuwE+ECpBiFlN92ehAAc82g7M4n1Sl9vi9hGaCKYQgHXy7vKXztrR6sS25dk
	X10jh2s3GPmO7GtBtc5a4vhDEj5DWjbHwp7OE6km+2NVP6fI9zhHlEowJEIrKFQq+p+6i4QAi0A
	==
X-Google-Smtp-Source: AGHT+IFVsIGb0eedx2AeA28sRXmsZd8CBEfzgL8urUOjvZce60/4JQnL/vLNtGQpEo4blBrcNfyIsQ==
X-Received: by 2002:a05:6000:1881:b0:3b5:e084:283b with SMTP id ffacd0b85a97d-3b794fd5a50mr2755927f8f.17.1753893980834;
        Wed, 30 Jul 2025 09:46:20 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78ba267e3sm8564042f8f.59.2025.07.30.09.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 09:46:20 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 0/2] Enable 64-bit polling mode for R-Car Gen3 and RZ/G2+ family
Date: Wed, 30 Jul 2025 17:46:13 +0100
Message-ID: <20250730164618.233117-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

As per the RZ/{G2L,G3E} HW manual SD_BUF0 can be accessed by 16/32/64
bits. Most of the data transfer in SD/SDIO/eMMC mode is more than 8 bytes.
During testing it is found that, if the DMA buffer is not aligned to 128
bit it fallback to PIO mode. In such cases, 64-bit access is much more
efficient than the current 16-bit.

v2->v3:
 * Added header file linux/io.h
 * Replaced io{read,write}64_rep->{read,write}sq to fix the build error
   reported by the bot.
RFT->v2:
 * Collected tags
 * Fixed the build error reported by the bot.

Biju Das (2):
  mmc: tmio: Add 64-bit read/write support for SD_BUF0 in polling mode
  mmc: renesas_sdhi: Enable 64-bit polling mode

 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  3 +-
 drivers/mmc/host/tmio_mmc.h                   | 15 +++++++++
 drivers/mmc/host/tmio_mmc_core.c              | 33 +++++++++++++++++++
 include/linux/platform_data/tmio.h            |  3 ++
 4 files changed, 53 insertions(+), 1 deletion(-)

-- 
2.43.0


