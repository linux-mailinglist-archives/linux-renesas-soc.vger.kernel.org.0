Return-Path: <linux-renesas-soc+bounces-24735-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A496EC6A553
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 16:34:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 48AF53540A4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 15:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 413EA31B81D;
	Tue, 18 Nov 2025 15:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oh/5kBxQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9068A322520
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 15:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763479938; cv=none; b=KUSu4JZlUk6TkkFcNjhPdpYPle3thziyaBoFHbPbRULgMq8hnIzwgGX0SXzD4VD9FwntGgGSC69Rf2uGCFB+HsMayycSmYO91zBiDsHCELpPo3IaLeFM36oECpFxBXSVkidAhb/e+u33I9EI7Nbi6JjhxQCnJRWsxzL7jIchtXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763479938; c=relaxed/simple;
	bh=m/PzBecmFoSB0WgB6AP0+aomsbeHKXLtWMavxIFy2Ws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bDNjIlwyk07VelrrfM5OMuOUGY32YS4nzGOkKsgQmzxHU1+k5TEwNSOKYAsRC6MBpLa0KmVNeGs9QLxGz+iQUrRzMeWmFBx0WT+YhOCPZc/iLnkLh6qOdvSMtECvAsBgqlUTkGwGmR3hhYNvR9D5xefqBEFMdhjz8gMnYJEw9BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oh/5kBxQ; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6420dc2e5feso1772456d50.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 07:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763479935; x=1764084735; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1HqjvHot2zaXCz+6WohQjpFioHBD8Y4L+8neqBCkVvM=;
        b=oh/5kBxQM6BVH2XtujqeC2WTrYVithiK0eqEEvMlRP4m7z0evZ5T8Zp/r7bKx9n+as
         qwTbPT3wyE4+f03oEQwrRCiB4HkuOJdTyOK0vvqc9hbqFIA+MTtWhIFk67qGMRec9RjB
         2aImZRQdcFdiLr/kCQDlL6fuXDyHxNq2E4DnIXNWW5U+or5ysmuWIa+SW9e6yqPLBIqw
         yEvjjtBjW4/XfQVTr8wL5MrIZcVe+GwP+pBCqHO77Sk2A5sHCqM5oEohg7wJs4WVQdjb
         T2ObgcH01CI6STpMGM8tesw4IBHdwsI41Dqb8TyQtVUAICcfQDpFavSvOetMqXLklras
         HHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763479935; x=1764084735;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1HqjvHot2zaXCz+6WohQjpFioHBD8Y4L+8neqBCkVvM=;
        b=A/Q17tAPkDNLjDJNb4szH6SutcFUb5B/mIZYTkieVJS9t8iMZqURaJyYQ069eSibWI
         /8WlbNuYRdSkU3CokhN0F1hxg0bSNNT4PkwKBnjXT40cGJVwMNztTYIXcX7W6XG5ubol
         h6DnqBE7SW4H12U8odF9m374QZ5usenrWkEb3YZwxvDcLdiPeHlIqE3LRgjCFPL8d7FL
         FKBTqwX1WjAEamgPF2sDL+4w7TauNQUbUEv9WU81DcetUABoZaOLOtoC15bsiBIpWezL
         3qP+zfG0duSD1XNkiBEl6LUbAwn0mzs2S//cwNGpdCv8W5t8QlrOln9KhFrV60BuX/gh
         Awzg==
X-Forwarded-Encrypted: i=1; AJvYcCWFCQDZ69/v5hMhX9RNJwu/55ljjJb9tftRU+Miuq2nF7KbQ8gFlWKrCYDYK4grKdNSZ1y0cvsNPPnrL6dA5J7Ljw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUtmwCt9XIVCj21phQeSLzjrdxW5D9ivw/jyvawFRleHEZC8x+
	Cqjdiu+67fTdI7OdVNzpXXxvwsWsT1fqDnM/XrLJcG4bMKbr4qD0dU2s7Bzq6tg7MtQ5iSl2UW1
	k9JIhtRDD9zBaBWOxQzC29TMIgPa99vHomOodwlymZQ==
X-Gm-Gg: ASbGnctDCBrHc5R3wMhuZkZhsMMkFTZAb7E2bCdoHV/ptGB/sC5Wu3xmjiv/qX0qTEl
	uZQNoxJHrlTkAR1/YsQzmxRSGtysy73iz7YD/lDJaRyfvcSh3P5GLSWHyshSMD3mkrinHIj26K2
	TzWAGmwROXLAardwQCKtRARMrAjWZGbvOcFlGpdIFHj9PmTJ6ph5utkDvafukhp5bfl0fzGc5oZ
	EMPZJgLD56vBrdadkgxEtw0xFlXS+mQkR8/pUMDJENPGW43LHRbqqOh0It9RqZAHm20Wln4NNPO
	UGXUOks=
X-Google-Smtp-Source: AGHT+IEPW0w7kRpHWU8HC+IJ0wheQZbZJvzoml3Vpr6Ev05Se8Sg/tgilmB7FWyYAPRCFhb7oGxKDgM3CdT9NhooaW0=
X-Received: by 2002:a05:690e:248c:b0:63f:b434:a08e with SMTP id
 956f58d0204a3-641e7650a85mr10677589d50.45.1763479935441; Tue, 18 Nov 2025
 07:32:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117101242.4018208-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20251117101242.4018208-1-claudiu.beznea.uj@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 18 Nov 2025 16:31:39 +0100
X-Gm-Features: AWmQ_blohfnlmMvUuRM6S6OaffAT860CwMwae3tO0RRJnX7dRQTNPcTcl56LX90
Message-ID: <CAPDyKFrKzvmkXb9rbjJHKaFA0ffWoH7p2_Z4_+AY26w+9Nin3A@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] mmc: renesas_sdhi: Handle resets
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: wsa+renesas@sang-engineering.com, p.zabel@pengutronix.de, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, geert@linux-m68k.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Nov 2025 at 11:12, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Hi,
>
> Series adds suspend/resume hooks for the Renesas SDHI driver. These
> are necessary on RZ/G3{E, S}, that supports a power saving mode where
> power to most of the SoC components (including SDHI) is turned off.
> Resume from this suspend mode is done with the help of bootloader
> and it may choose to disable the SDHI clocks, resets after it is
> done with the SDHIs.
>
> Reset signal was deasserted/asserted on probe/remove as well to
> avoid relying on previous bootloaders. This is also useful for
> unbind/bind operations.
>
> Along with it, driver was converted to use
> SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS() helpers.
>
> Thank you,
> Claudiu
>
> Changes in v2:
> - in patch 2/3 drop unnecessary code changes in tmio_mmc_core.c
> - adjusted the patch description for patch 2/3
> - collected tags
>
> Claudiu Beznea (3):
>   mmc: renesas_sdhi: Deassert the reset signal on probe
>   mmc: renesas_sdhi: Switch to SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS()
>     and pm_ptr()
>   mmc: renesas_sdhi: Add suspend/resume hooks
>
>  drivers/mmc/host/renesas_sdhi.h               |  3 ++
>  drivers/mmc/host/renesas_sdhi_core.c          | 39 ++++++++++++++++++-
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 12 +++---
>  drivers/mmc/host/tmio_mmc.h                   |  2 -
>  4 files changed, 46 insertions(+), 10 deletions(-)
>
> --
> 2.43.0
>

The series applied for next, thanks!

Kind regards
Uffe

