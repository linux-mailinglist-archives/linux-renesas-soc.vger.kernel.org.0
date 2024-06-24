Return-Path: <linux-renesas-soc+bounces-6700-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E86791512A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 16:59:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF7711C23B07
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 14:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCABF148849;
	Mon, 24 Jun 2024 14:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pz94EVUx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3564B19AD81
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jun 2024 14:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719240979; cv=none; b=RKaWpPASdd9bgfW32tjEZ8c7PkxZuboGGJ0WyXx2nKv3TAIWl6WfQX6whVOawoQuEI+l7NWpJeuqzdUPBnmAozozIjXsZaussTL7vfj1OT+HscadOTIWhCa1bMIDphLamO5fW1c9I4Z7tFhle+v3s9g0XmHuNpJvNxPayFAuEeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719240979; c=relaxed/simple;
	bh=ZBQar48FYlhHIVt6aU4MGvLcuwBzjjSKj8HeP0rbQkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kEctVFIv5PaTuPa0VFdgT9pBL+z4BhNsmePYltckhsLIqeDpkRZk8XEnzdi8a9Rd0o99zGd7het9WEwuAhEMzFf+u3JDXgRNIho7EvL2ovpxaur+2epCAAHQde0s+D1godscF92MZ95+i7neQtkZFE1/Vjf4ao3K1eNgqX3ODig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pz94EVUx; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-63f7d53bd88so29575067b3.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jun 2024 07:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719240977; x=1719845777; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DVtwamYooPBNNQk9uWsNEvfA2DRpVaUFH92khkxMBaM=;
        b=Pz94EVUxwYNXIDWoZBemK9mzb9QpD8eGTieTsBWA0Br6tli+OYom9vX1MRVIjrnCY4
         IxrDl91/6tQdWTuYyqXlMWQfm0+atonkn4W99tyIH8+pF3fJGODfR482YiIX5H0a+niy
         nss/6ctn9pFJBT+0CooBasOb6dENknGMuJ4qLmuKarq8rajRQGbEDn84MA8pWzbn3HFH
         NZsuFdjqaCcYheAvA/SzP7WsrOBDX+NZ/PxKOpVYB8Xmhatoktzzqt/KkPuXYM3hb5bJ
         M4HlCb3f2SIvWX8bBqawYIKPsUrOT5cxin1egz6XD5JM/910omtR30oA63uVtvTvm6Er
         w2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719240977; x=1719845777;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DVtwamYooPBNNQk9uWsNEvfA2DRpVaUFH92khkxMBaM=;
        b=ZoeIgslgE0b7/1HBsw0Y0lo44x9cNHXKzkmQsgpRuolQNo2ERnS9BZFDfz/DIeUVyW
         Se3U6RM1TJUwdfVw0muPUY+COVNpdufctl2eAouvFHaU/FRW2kOhkg8wextNASPY01jt
         YmitX1VFJtGfOty+PYEf68rEfkdAQwzV1IUwcf2bteC9NgpGrnnfcL+x/VkSESOi43wX
         VU82vFxxp5EmWPI+P7x1gjWg+OLJ7QFQWB4Ss+L40/T7+CIjJrNW3p1PvCbs7/l6ku7g
         Z/0A9aL+jeGY5BnJhnSWhJR0j6Zy+vmYD/p1O49d+0VjYuhc5RmaZO+Dau2L1KxEuqjJ
         JSUg==
X-Forwarded-Encrypted: i=1; AJvYcCWAuWdiU1Rb1TrFCfGT8T2FvQlg3H/SI++5SchMfMGRtkPOlkHKVv1WbJsbuZjv8clyxLOTlqmNXYTlccjqXrMxoAvr/ggPebpC49LTGRCDqbs=
X-Gm-Message-State: AOJu0YykR5NlOla3bnBzrMbMOi5p8W8e0XJwn6/x1Ap6Uk0RfL2GNP45
	Ujw0oWO8BE0MiPU67GHVJdwwgX7Ibqq6A8oibcIGjo3BEHnfdCbGEERLcMGFFjj+rFFFhsByX4k
	O/Ny6VA4JN/Lx+3K32xxVIbTx7fOATokEPe2nXA==
X-Google-Smtp-Source: AGHT+IEbc5hc3/yxmZ3c7nr0SAMAXIEOiWKqkNHDXYZk/t2/ZjYEJo4kq6fQVQv1uhCgQ0NrpNYbn1L23nDXChNfGqQ=
X-Received: by 2002:a25:86c3:0:b0:e02:b594:51cf with SMTP id
 3f1490d57ef6-e0303f2b043mr4275615276.18.1719240977135; Mon, 24 Jun 2024
 07:56:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1718897545.git.geert+renesas@glider.be>
In-Reply-To: <cover.1718897545.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 24 Jun 2024 16:55:41 +0200
Message-ID: <CAPDyKFoJiXLaXGg8_ykgFsda-sNkGC8gTL67yyDb+Lnpb0n7sg@mail.gmail.com>
Subject: Re: [PATCH 0/2] mmc: tmio: Remove obsolete callbacks
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Lee Jones <lee@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-mmc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Jun 2024 at 17:39, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
>         Hi all,
>
> This patch series removes two unused callbacks from the tmio_mmc_data
> structure, and related infrastructure code.
>   - The first patch touches only the MFD subsystem.
>   - The second patch touches both the MMC and MFD subsystems, and has a
>     contextual dependency on the first patch.  If really needed, it can
>     be split in an MMC and MFD part, but the MFD part depends on the MMC
>     part anyway.
>
> Thanks for your comments!
>
> Geert Uytterhoeven (2):
>   mfd: tmio: Remove obsolete .set_clk_div() callback
>   mmc: tmio: Remove obsolete .set_pwr() callback()
>
>  drivers/mmc/host/tmio_mmc.h      | 3 ---
>  drivers/mmc/host/tmio_mmc_core.c | 8 --------
>  include/linux/mfd/tmio.h         | 2 --
>  3 files changed, 13 deletions(-)
>
> --

Applied for next, thanks!

Kind regards
Uffe

