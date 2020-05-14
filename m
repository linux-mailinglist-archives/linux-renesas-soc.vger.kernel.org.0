Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AEA61D2C93
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2020 12:24:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725974AbgENKX5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 May 2020 06:23:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726614AbgENKXv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 May 2020 06:23:51 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E49F6C061A0E
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 May 2020 03:23:50 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id 62so1648958vsi.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 May 2020 03:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XxbOGht0ye1sBhbrPpYfKMbU4OenacQ3DVBFGFBOWNg=;
        b=YerK+7uAGjzbxEDFGas94+8RT+RnBHxvH0m0CCnPIH20UBUcG6Q/8RNS+ltZ8pts0+
         Wgaz4bdQjtXQIss/SBLsYEjuP9SSKzxlSdBHxDTuDO4ZB/pfe3rlZtS5pWFrRl2KAd1C
         UeZB7oSdEJD/dWKHLP0NhcRPcGdPmiJKw96P//cLlTtoEDPshJfEXMMKnhQAvPlmRqf6
         v1tGdxJyTrhtsAMFxBxh5q+CQQRWhKm8mi/XZs2HSI0U7cvUOorDXC6VwzpWkXarr9oo
         VgrsaucyRlaRYVJBzQ2/iiEvfwhLw1qPcrqwFAb1VhvHKDZqqvPqyQw/lSyG8M+fTH+E
         SeyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XxbOGht0ye1sBhbrPpYfKMbU4OenacQ3DVBFGFBOWNg=;
        b=RARKLkFwUibwhOIkwqvLIax93JCivoY80GbyXJ0xilFUDErfppAAWSfg08uazNk3jl
         Z6WdvoScrvRWDKyKF8o3mEXY559/r45CF5vVQR9O+14y7YMuIV1Kg6/K25Q8eEDvVuTx
         6xUm5eozZIu+B43y2wdnwEtMkjnSZ5KySHzT/l5ywIhvwOy5SDvAvaD8BOY5RQ1VeIdS
         oTEsuNX5nxZplrLBEWmWQwjFw0FWQCZa9BWWwez5hQ4XfivZFliLzrImx9gd7yiC+beN
         oZ2fcC8qNrOwMlWRMIZS8QwMjbktNyzHcFp+ehSrXcD/hTPgEkTIurvseZVQlI3riys8
         qtDA==
X-Gm-Message-State: AOAM532FnkiWwkxqrnQtRGEUtWu+yi4vTdxae8DYLYvQCHDkB7whb91v
        fo2FrjHgtJYPD+XyPG8hs3sg5bJ1at8xhoYd0C/fXw==
X-Google-Smtp-Source: ABdhPJx9SsaDNYVhRKAhbE4YI3L0urHBK6RzWpOcLD+Bxst8lM9k6Fc8LRYApFv0pPBVyWo8KWsr/QuwaI8ffs8/R5M=
X-Received: by 2002:a67:d71a:: with SMTP id p26mr2823673vsj.34.1589451828803;
 Thu, 14 May 2020 03:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200513171206.6600-1-wsa@kernel.org>
In-Reply-To: <20200513171206.6600-1-wsa@kernel.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 14 May 2020 12:23:12 +0200
Message-ID: <CAPDyKFrgsZ7z=tvfpg6q0ofurneTQMo3Y5CnXRZXX4fmDQ=YOA@mail.gmail.com>
Subject: Re: [RFC PATCH] mmc: tmio: properly balance RPM on remove
To:     Wolfram Sang <wsa@kernel.org>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 13 May 2020 at 19:12, Wolfram Sang <wsa@kernel.org> wrote:
>
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Because we enabled the device with _noresume, we should disable it with
> _noidle to match the ref counting of the clocks during remove().
>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> I think this is the proper fix to the problem Geert reported [1]. I am
> not sure about a proper Fixes-tag, though. The corresponding _noidle
> call in the probe()-error-path was added with:
>
> aa86f1a38875 ("mmc: tmio: Fixup runtime PM management during probe")
>
> However, from my understanding this is more fitting?
>
> 1b32999e205b ("mmc: tmio: Avoid boilerplate code in ->runtime_suspend()")
>
> But maybe my understanding of the situation is still not perfect and
> even the commit message is bogus? Ulf, since both mentioned commits are
> from you, could you have a look? Thanks in advance!

I did start to look at it, but got sidetracked with other things.
Anyway, I will check in the next couple of days.

Kind regards
Uffe

>
>    Wolfram
>
> [1] Message-ID: <alpine.DEB.2.21.2004291630090.4052@ramsan.of.borg>
>
>  drivers/mmc/host/tmio_mmc_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index 9520bd94cf43..9a4ae954553b 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -1235,7 +1235,7 @@ void tmio_mmc_host_remove(struct tmio_mmc_host *host)
>         pm_runtime_dont_use_autosuspend(&pdev->dev);
>         if (host->native_hotplug)
>                 pm_runtime_put_noidle(&pdev->dev);
> -       pm_runtime_put_sync(&pdev->dev);
> +       pm_runtime_put_noidle(&pdev->dev);
>         pm_runtime_disable(&pdev->dev);
>  }
>  EXPORT_SYMBOL_GPL(tmio_mmc_host_remove);
> --
> 2.20.1
>
