Return-Path: <linux-renesas-soc+bounces-20608-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC94B29FC4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 12:57:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38BC31964B2A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 10:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CBDA315793;
	Mon, 18 Aug 2025 10:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c6w5U/dM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA6230F7F4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Aug 2025 10:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755514546; cv=none; b=E1m+Jp9Yxz6/fXyyDMzRBagU/gB72/I+VVLNj4M5UXarktqvh4Z5bt9V3SJtf4jRyqI44Vu+K32HKLC8t+j6xSUTc6Lj6BG0NC4Vbq88HAeXwIFjAOiIDAblA7gyuUfzd7RvmdbBHIIDDI4lTDdc0s+scqQqDlvAkPJzwaW4HoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755514546; c=relaxed/simple;
	bh=ppnDq69zMI7mDQ33wGt7XulquHNwOWW1uIV3gpereYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SIKMmlfKsfECLE6HwaF2kaKK6CW1oyBLz9WrdpqIXE2yKkqrEU/SH1bSp67IeMd6PH6KyUt+7ilNY5DNY8KfY/hKVBwNLao+BpyE8IAMNThw4VdxWUA81CmG2OTknlX0ub8qOYMXz1d7DdsaxWpOhffyxhD/vWOerwxWkWi3234=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c6w5U/dM; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-71d603b60cbso31016637b3.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Aug 2025 03:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755514542; x=1756119342; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UhCrBwM9JcxpOSa/4xq9lZhOpZ+tVZm/Xuce59lSt+g=;
        b=c6w5U/dMOwp6eUQ+RYuMtYGnW95iDI1UktF87AiPkdIHw/N17mkDUiSHIbbomDMetM
         h+aBCdOI29A9b8udTj+UQMboUrkuHeTPvdLabV5fHPAnfTqeXNqFUGrK0cA3+F/1WAp8
         zOQGgvBfpwAxswTsDm9i1XgZhjlceoVJmsynDAwQ5FzmnF6W0bCSdbB0EmG/tyc2VVgd
         8VZb1nHy8hgZ1Jq0YY2cfbGRU5VWpiiOzUuZagYPzPnnz562tci7UALNLfPCAJxTfONU
         t8w1SAt7014E2irmleJHww6kfD4bhohVnOV8myDucEWD+4zDm5g5HL+tTMe2ygOf9JnL
         Zcmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755514542; x=1756119342;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UhCrBwM9JcxpOSa/4xq9lZhOpZ+tVZm/Xuce59lSt+g=;
        b=GzKgIeEXebIM37h/PAbTq2q47O/a+QNyy29TE/cKx290Vn/DdhHMJ60/XicfgqXOMo
         sX2SnId2mkl6+E+d8PN2ZTHGY2RHVbUekwre1pGgUBNcXHW4XGwAPp1WZZAze2pG/5X7
         c6TpSVExZyaKsBPSzuOhKQsffaoU9bEmeiE6ypNS92c6wwdxzJlVB6z0ts1+0w43P3fK
         GU/x6ZzMpaZIOTWTXz8hquE+N0mERy1M8VQShMxcBm882iWHkl/fcdz+Au+Wy9YIHm3x
         Q9Bn4q82/tDIRbKLHu7HBXBVjsd8BeqYlqBswP6QeWMWddeNVWAylQ2rYC8zU32yOxlj
         PUfw==
X-Forwarded-Encrypted: i=1; AJvYcCV/nxeL3ItcfMS9iGaTJ35iUJHbhCkwB66p5zp80EyHNty9LHABD5KJakbaPkTnaMteTjQ+uREyBXTJc5D9AQXLKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZXcQFk4lHwckdGJanYuRVYwdYGsMwLZWGuypV7QaZrA9cFVGK
	JX7rIzOSaRrFOQn85J/vykru0k2qSiIPERjIFIV3WdZKpArm0A9mf5CTE13QHZB/uJ6GWsXotPg
	b54eb1T4Gme0POgIqbBYec9oePVtmHqoEXG8RxWBYRg==
X-Gm-Gg: ASbGnct4YAJ7upVc/SbCrKlyUUpy67QyDthfepMLhW0SRCtbmi28wLc/3Ps/fECshM+
	lPdgFrkR04VXIqnvxlJCZ0WGENefNlXJuUX6PJbe64+De5yiem0OHHv8zfO8Sy52zwWYDrTXpcR
	kO1ykIGHMerXgLnJwckzBp946r0dXYlpn73WYiKTEkZp4nj5ZLsx8HgZ4y3Dx3XBdhWv2Gzj4le
	CrJ7D/r
X-Google-Smtp-Source: AGHT+IGcvIj9TS8Vl2BODrUjbR0NXELcK/e2QeiUPAqKdd0mRCJPGizzZIo7+kpzZ5YZatld9/+/FIYtIUALm0/XKNQ=
X-Received: by 2002:a05:690c:74c8:b0:71b:f500:70c0 with SMTP id
 00721157ae682-71e6d9f2fe0mr141448187b3.6.1755514542321; Mon, 18 Aug 2025
 03:55:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250730164618.233117-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250730164618.233117-1-biju.das.jz@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 18 Aug 2025 12:55:06 +0200
X-Gm-Features: Ac12FXwUVZVP7DONXSC3nSG_-caOjBeAMUiQ2J8yKD5tdq7x2qJhlD5k1yH482I
Message-ID: <CAPDyKFp4HDMqPd3ie3R61EFWGGhLUE+f6mKHdZa5surfrd3jbQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Enable 64-bit polling mode for R-Car Gen3 and
 RZ/G2+ family
To: Biju <biju.das.au@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Jul 2025 at 18:46, Biju <biju.das.au@gmail.com> wrote:
>
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> As per the RZ/{G2L,G3E} HW manual SD_BUF0 can be accessed by 16/32/64
> bits. Most of the data transfer in SD/SDIO/eMMC mode is more than 8 bytes.
> During testing it is found that, if the DMA buffer is not aligned to 128
> bit it fallback to PIO mode. In such cases, 64-bit access is much more
> efficient than the current 16-bit.
>
> v2->v3:
>  * Added header file linux/io.h
>  * Replaced io{read,write}64_rep->{read,write}sq to fix the build error
>    reported by the bot.
> RFT->v2:
>  * Collected tags
>  * Fixed the build error reported by the bot.
>
> Biju Das (2):
>   mmc: tmio: Add 64-bit read/write support for SD_BUF0 in polling mode
>   mmc: renesas_sdhi: Enable 64-bit polling mode
>
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c |  3 +-
>  drivers/mmc/host/tmio_mmc.h                   | 15 +++++++++
>  drivers/mmc/host/tmio_mmc_core.c              | 33 +++++++++++++++++++
>  include/linux/platform_data/tmio.h            |  3 ++
>  4 files changed, 53 insertions(+), 1 deletion(-)
>

The series applied for next, thanks!

Kind regards
Uffe

