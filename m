Return-Path: <linux-renesas-soc+bounces-18527-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B21AE0359
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 13:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6CB018912D5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 11:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4927227BAA;
	Thu, 19 Jun 2025 11:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jBP3CyOq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0840F22A4E3
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jun 2025 11:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750332036; cv=none; b=QXljOMJen8CtYtZMPtbSe01ZZKJcOZArVfdTbqnbPrDRhgKZL3IAlQz6KVRJnFRaf47BpS6TGNU9yNeJcdW247oa8ub5+UNba5h8pUgj1Zrr1G0Ajui0gvOaPzjjwiPK58iFAlJJ3i8SzLw7U2DKTZqL6M0SwapbKXlubulUPLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750332036; c=relaxed/simple;
	bh=9pSahM0HmxhP6UtGl7AOfeIBaFsaVroRHY5Tv3KWLyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ivYz71p+r2OVZwEVd3jJnGK/NIrpvuEOcUOjyh/0Cp+t5vRtD4LSDisIb5Xjh/YKV9bp4YkAmsre7tFZRlsp3n1r/VETGlnZ8LiNE/j7lC2hXsgr19cyFXWW69ezmmSSM26WTv5noUAYSeAdE2bcjZksQ/kDmIPKzbLc0DLPRec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jBP3CyOq; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e81826d5b72so673253276.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jun 2025 04:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750332034; x=1750936834; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3xEvTLQHosr95aKQz8ls7/EAhineMRS0oHFEy/wGbTg=;
        b=jBP3CyOqwTdNRnoLLsQKhx96nHOa4tRYXlAUhQCD0vdQFQITa1qepl10XKw8G+bTyc
         lDBvQFt4eB984lr6rmKSvLKXEA1NIO4gSYMA2RQ5VjvJhhN89F7mvzs3/a6JQmNGqOoA
         0iAwqZW/c9YmOpjcs4oxrXbGaurq2ai5Rmndu0yvS1rZ16jKY09nTUYURio4WBjzsVAh
         JGlXkn4d96LJhKfUpP/u4D8lw403/l2WghGhcGKZI6Z0MzFfbZaHq62u5rRZkvPpdcEV
         jQZaLYqag4peRjbuOI8HWoqlQuDJEV3Xe+pOLoDeQj7RwYrEPKIqGpf8wHgB1GsCGYun
         /K3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750332034; x=1750936834;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3xEvTLQHosr95aKQz8ls7/EAhineMRS0oHFEy/wGbTg=;
        b=Kbeh7VQftkOztdNbROd/Azl4cff5PwMOoAltLjNoQ6lD1s1Zsefo6gxEtACujfNAm1
         8SLmBhOJ83Szb7GoMKB4g4ARmC3SL/etiM8m8zrWDPnX+/BISJdp/bsrdkQM0aMiIMdh
         uAp4i/JimcV9FLRzzEG8gMgGCTIdicOuI8SqAiB0OYYNRu5u7boxhcdV4VelUeXnvlEJ
         o1znNgaLFmGC1qrtA2P9IP19toe+9jyQlBAkgNdsgCjrznhRLhc07g5XpTIkQ3z8cd5m
         Z3LZSFDyTzvsi8VpjM6CWEJepNyJz551LGgfBQcegfgy8uH+50bS9ji2CNy0WAdYlAmW
         +Gzg==
X-Forwarded-Encrypted: i=1; AJvYcCUHXxMxANQpKk4sm5hj6l/wGwt5V3soR9HemZ1nyLhk0kWju/IjLcPL9la3ofZB7uF+zktEk5UOTVvR9vazp1McSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxI6JIAyAmsfmZgkL8PlVkHVMlNNWswaOYnQOndfGZOSJkzfWwQ
	JUu+0AtNafuxiN90RFrJusZA6Rr6daKjpFBMgJx24oW+5MYEaPezrYkO89MuTM+TS6VbEE0axXV
	Sz+d8bwi+t2+Nuzgjd4+1zGbCh/evP+Czlvk6momJBQ==
X-Gm-Gg: ASbGncsomstSVjBy+nZ9oSPKY1icJpMrX72xVkNnN2TJ+KpJhNAjaft6Yzda2pE3R17
	8FgnIFzni657OnASWQRJabyF9lqsn27LUapbLxIGEq6zKKOFTcoAhvj3H0+jfpcLG5cTicuQrga
	7QGtfsQDTdJdtxzpougNxmTk2fwrLiUDWzxZCTE6v/BgrT
X-Google-Smtp-Source: AGHT+IHReMbe4e7CYUTrFlvHqEy2OoF755pDBH2zwKUZpS8zGhtltmAJpMWBYtkk36UX+5cBHvHG54lCGBmFTund9GE=
X-Received: by 2002:a05:6902:2611:b0:e81:45ca:7918 with SMTP id
 3f1490d57ef6-e822ac9a9c6mr27837692276.40.1750332034050; Thu, 19 Jun 2025
 04:20:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610072545.2001435-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20250610072545.2001435-1-yoshihiro.shimoda.uh@renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 19 Jun 2025 13:19:58 +0200
X-Gm-Features: AX0GCFshKpw4sVOE43rS78CtziFk1gnCfgajseqdc-k80l16iBEUigL_cuZ1Hr0
Message-ID: <CAPDyKFqncNemZXZtNBL6EvPuK5HtK29Z19_G2n6z52J3CL5JyQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] mmc: host: renesas_sdhi: Fix incorrect auto retuning
 for an SDIO card
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: wsa+renesas@sang-engineering.com, linux-mmc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Jun 2025 at 09:25, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>
> This host controller is possible to change incorrect tap if an SDIO
> card is used because DAT1 is used for interrupt signal on SDIO standard
> but the contoller doesn't take care of it. So, in the worst case,
> this behavior causes a CRC error.
>
> To resolve the issue, add some new ops into the tmio core and
> add fixed code into the renesas_sdhi driver.
>
> This patch set tested on RZ/G2M (r8a774a1-hihope-rzg2m-ex.dtb) with
> EmbeddedArtists 1ZM module.
>
> Before I don't apply this patch set, the RVSCNTL value was changed
> unexpectidly like below.
>
> [  687.103589] renesas_sdhi_internal_dmac ee100000.mmc: renesas_sdhi_auto_correction: rvscntl = 00000701
> ...
> [  768.490979] renesas_sdhi_internal_dmac ee100000.mmc: renesas_sdhi_auto_correction: rvscntl = 00000501
> [  768.500307] renesas_sdhi_internal_dmac ee100000.mmc: renesas_sdhi_auto_correction: rvscntl = 00000401
> [  768.509640] renesas_sdhi_internal_dmac ee100000.mmc: renesas_sdhi_auto_correction: rvscntl = 00000501
> [  768.518947] renesas_sdhi_internal_dmac ee100000.mmc: renesas_sdhi_auto_correction: rvscntl = 00000501
> [  768.528217] renesas_sdhi_internal_dmac ee100000.mmc: renesas_sdhi_auto_correction: rvscntl = 00000501
> [  768.537494] renesas_sdhi_internal_dmac ee100000.mmc: renesas_sdhi_auto_correction: rvscntl = 00000601
>
> Yoshihiro Shimoda (2):
>   mmc: host: tmio: Add .sdio_irq()
>   mmc: host: renesas_sdhi: Fix incorrect auto retuning for an SDIO card
>
>  drivers/mmc/host/renesas_sdhi.h      |  1 +
>  drivers/mmc/host/renesas_sdhi_core.c | 48 ++++++++++++++++++++++++----
>  drivers/mmc/host/tmio_mmc.h          |  1 +
>  drivers/mmc/host/tmio_mmc_core.c     |  5 ++-
>  4 files changed, 47 insertions(+), 8 deletions(-)
>

The series applied for next, thanks!

Kind regards
Uffe

