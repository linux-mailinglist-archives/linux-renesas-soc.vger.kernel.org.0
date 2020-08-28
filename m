Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE6FE2556C2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Aug 2020 10:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728803AbgH1Ipa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Aug 2020 04:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728721AbgH1Iox (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Aug 2020 04:44:53 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7770FC06123D
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Aug 2020 01:44:53 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id v20so145806ual.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Aug 2020 01:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Quf84xjwBR0SIp0JM3phsyARD/Gfky6X+jIDmOR839I=;
        b=CCY/Qq7Tu2UjIqPLl4JGJ/HCM/DQgdfgIS7SXvbHELcDB78CuqM9aUVeznrBHpUB+y
         AQEGsivwFhk2xS70nVgaHgovEOnkV478x2KFdfHn7wEuQp5Q1PS24dSC/KuT/WZ4NRVw
         RsBUt2gpRSaS8a8nvaZwiBd8AEjPwvwZahy1m6UYZ2CMrDPAjnyDaCa/1q809c3jWKB7
         2P0mnf2riBaV4ifBhYkTSHIWc+6SSH0YVvv+U6S1oR+BJJLWcAGulhzzj2nrEEcFfGY3
         +mTiLOZf7EQIBhufgFAf7ddHIvHoD7D8xmMwfRb7gkMk3Bi/qw5vXzT74xIEOgB2nPyh
         WsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Quf84xjwBR0SIp0JM3phsyARD/Gfky6X+jIDmOR839I=;
        b=PREZuQQuddbyJ9J3UYn/ydR2PuzYz7wwNM+ajD8mmV5gNAhZG4wNWUPXzxAQr9CW7K
         PGn/AWIlGF0T/Xm3689jmIbYeYTz19g1LaGci3QblMfWjBscUpOSXn2BvxVKelNpuYpZ
         a+1dxj4o4YIBDlw3hD6tALdyVC2JkHbxt/SUSRKtlDn2vTIBbfhfCSiXg75iTlVV92Wd
         MobrojS6STmlbCrYN7sUME08qFiZlgsf0E0qOODSOV1a6D+6ORB60tD6p14pRn7yA6je
         n5jzUrDkLTLswcs1J/qqbs07IOKt2ThE44xULxrSG/sOO3eEsUg0AwfnkSXf9jDK4Fre
         S7vg==
X-Gm-Message-State: AOAM532reGAHwQ+IKUb56pKxJlaLBpiHdmn7Wcx84nKPMwlur4nLqxJN
        61lpVuR2uyRLRUCYLEr53+I9ho4IEjaBqHdHqA0zig==
X-Google-Smtp-Source: ABdhPJww9T+Y1GJDKFWNV6wqWl3WsYvjaR+msz3E5sOWpkmAOodhk9M8sWdW7GIaD+/Q50JIC2iLqDgMNRlghqLBEW8=
X-Received: by 2002:ab0:3114:: with SMTP id e20mr306915ual.104.1598604292732;
 Fri, 28 Aug 2020 01:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200820132538.24758-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200820132538.24758-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 28 Aug 2020 10:44:16 +0200
Message-ID: <CAPDyKFppvVoox2q1c03gVYO-WSZc+AZ3H8ggVHE6g6YpUEvj5w@mail.gmail.com>
Subject: Re: [RFT 0/6] mmc: refactor reset callbacks
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 20 Aug 2020 at 15:26, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> While debugging something else, I noticed that the SDHI driver
> doesn't use the 'hw_reset' callback as intended. It was used to reset
> the tuning block but not the remote card via RSTn.
>
> So, this patch series fixes it by moving stuff to the reset callback. In
> addition, calls within the TMIO core are converted to 'reset' and the
> 'hw_reset' callback is only used by the MMC core now.
>
> This allow for further cleanups which make the code a tad smaller and
> much more readable.
>
> I did some testing here, and tuning etc... still works, no regressions,
> both with eMMC and SDXC. I send this out as RFT because I want to give
> our BSP team also a chance to test more advanced cases. Also, I will be
> thinking of more ways to verify this all is correct. A branch for
> testing can be found here:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/refactor_hw_reset
>
> The branch is based on top of v5.9-rc1.
>
> Looking forward to comments!
>
> Happy hacking,
>
>    Wolfram
>
>
> Wolfram Sang (6):
>   mmc: renesas_sdhi: move wrong 'hw_reset' to 'reset'
>   Revert "mmc: tmio: fix reset operation"
>   mmc: tmio: remove indirection of 'hw_reset' callback
>   mmc: tmio: factor out common parts of the reset routine
>   mmc: tmio: don't reset whole IP core when tuning fails
>   mmc: tmio: remove indirection of 'execute_tuning' callback
>
>  drivers/mmc/host/renesas_sdhi_core.c | 58 ++++++++++++++--------------
>  drivers/mmc/host/tmio_mmc.c          |  8 ----
>  drivers/mmc/host/tmio_mmc.h          |  7 ----
>  drivers/mmc/host/tmio_mmc_core.c     | 45 ++++-----------------
>  drivers/mmc/host/uniphier-sd.c       |  5 ++-
>  5 files changed, 39 insertions(+), 84 deletions(-)
>
> --
> 2.20.1
>

Applied for next, also adding the tested-by tag from Shimoda-san to
all the patches, thanks!

Kind regards
Uffe
