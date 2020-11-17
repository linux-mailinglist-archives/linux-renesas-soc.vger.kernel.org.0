Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0B7F2B5EA3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Nov 2020 12:51:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728188AbgKQLuf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Nov 2020 06:50:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728187AbgKQLuf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Nov 2020 06:50:35 -0500
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A215C0617A6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2020 03:50:35 -0800 (PST)
Received: by mail-vs1-xe43.google.com with SMTP id x11so10851585vsx.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2020 03:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QLrapYaeVKD7e7jcCX65L6v/xQcPgUowbj9E6uj4YI4=;
        b=qUZ7ghKX98O5SqAdLJDkUf6IDHbgVE1zRki05c0fLFkjnttZ7B07cIDMIGTG4oyC58
         xDUECXle/2AqoSummZsJbE8aO5SQKAM4hrnzLqhpFSBbAqY9z7fafzik3GPMmG9f5T5h
         LDAjlzr2uNH6VtN9TcYGTXKmNWOdJ8jtm9NTsYAcFmESOKkypjrUd+KFZSCA7qAkJ4FQ
         6VCjMB78SA9f6CPHXcBiJPRTdxMiJ23JHEFjYUjpJFWxaOnd/wFbpCLhWYify/PbvMgu
         hJLOI03YkSIUhJl4SzLYBAgevatyyDGLoZog9xF/Wafl97jYgffJeYGK5wn74oHlS3da
         LnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QLrapYaeVKD7e7jcCX65L6v/xQcPgUowbj9E6uj4YI4=;
        b=YWrv3D5ye2iYIg34MdTQAE35FW1Ubs3HpPnic6C1ojPnp9Bjnnm9qmCcE6EzB8M9NS
         aFMV83TaL8gFpCXC41mJ7X3JhWk/rR7E2rVulfWj93NgLRb1TiMWZrW6Diyey6clHqY+
         rU6uX8b82b7ZnELVOMlwr5PspvQTEpfLBXayD2gyrgfSJ5j/lq/56mA7MHpxaAJMuEOh
         SsxYo36lz/6JpsWSA4Jrhw1foowNg/92VbSwDJ0zhshfe2fRBRQsjYnOnetCYP/dauwx
         C87l+uKJG7GQ9sTzu5R6xFYfHAhpL3i31vkV7ACaLvWBMmn+R+TPhCtGEPbl6iZTOoZF
         GS1A==
X-Gm-Message-State: AOAM530nRX+sszMp9PHgeC7a6UFvyVFaTtHw+47HweyXDVk027VAlDTA
        bAN/lYTBwspiT9pPI0Ya8EX8Y0iQOxaN9AVlhsYysQ==
X-Google-Smtp-Source: ABdhPJyXkyme8uRqKrcu79L8GpjXcMRN8Hh87RctWkvT0nyQn55FMoxa5lpREEQ9Nxg3NiPptif6Xb3OCkT4oJGVVS4=
X-Received: by 2002:a67:3256:: with SMTP id y83mr11595023vsy.48.1605613834514;
 Tue, 17 Nov 2020 03:50:34 -0800 (PST)
MIME-Version: 1.0
References: <20201110162151.37622-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201110162151.37622-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 17 Nov 2020 12:49:58 +0100
Message-ID: <CAPDyKFrHhnD8fkqC9e=h82eU1ksjxJL4DX9h7-se_A2VwNzcYg@mail.gmail.com>
Subject: Re: [PATCH 0/3] mmc: renesas_sdhi: refactor SCC reset
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 10 Nov 2020 at 17:22, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> So, after some preparations, we can take the next step and improve
> resetting the SCC. Patch #1 is a fix requested by the BSP team to be
> more robust in case the firmware did something unexpected before.
> Patches #2 and #3 are cleanups made possible after patch #1.
>
> Patches have been tested on a Renesas Salvator-XS (R-Car M3-N) and a
> Renesas Lager (R-Car H2) board.
>
> A note to Shimoda-san: I did not forget that the BSP team also suggested
> to use the SRCR3 register for a reset in probe(). However, it appears
> there is more to discuss there. This is why I decided to send out this
> series first because we want to have it anyhow. I'll send the SRCR3
> RFC-patch later this week.
>
> This series depends on the just sent out series "[RFC PATCH 0/4] mmc:
> renesas_sdhi: reset SCC only when available". A branch (with some more
> extras) can be found here:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/tap_en_v2
>
> All the best,
>
>    Wolfram
>
>
> Wolfram Sang (3):
>   mmc: renesas_sdhi: clear TAPEN when resetting, too
>   mmc: renesas_sdhi: merge the SCC reset functions
>   mmc: renesas_sdhi: remove superfluous SCLKEN
>
>  drivers/mmc/host/renesas_sdhi_core.c | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)
>
> --
> 2.28.0
>

Applied for next, thanks!

Kind regards
Uffe
