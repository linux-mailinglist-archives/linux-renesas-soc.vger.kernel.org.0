Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73BB22AD626
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Nov 2020 13:26:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgKJM0q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Nov 2020 07:26:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730061AbgKJM0p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 07:26:45 -0500
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C61FC0613D1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2020 04:26:45 -0800 (PST)
Received: by mail-vs1-xe42.google.com with SMTP id m16so6908347vsl.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2020 04:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+4HfV4HcTWWifdRiIwBl3NJeUVjBCfnr5ggY4aZiD50=;
        b=HR+afSDs2xp6EyCGQDdjm36uSz9XqUrSGL/s6HIYuw8fvyifRb5PZUa/V/S1dWd9gJ
         L5NQOFjQkOYXnzy0R2KqmH/MHATZjHVPg8cSNgsmhvITwaie+6XsXX/Kb+pVHKdejnEf
         E5WjbCNw21vs6oq2ycyQcI4h4FCv+s8VBv57W/A9rWIHGQSsC+Q8eHSk2/bAsTuRqDnv
         8G5HSDtPQ4QBLEZy8uswZM7OKTtqJ4FCoOZAybrHnennBi5WtRSCcfO6cd3+wcrjLL0w
         eeTIExIZjqupJAuS7G/KTkw0ZLwbdg5JsCgruWgY/a6GM9HOxTzsFvwmw4ZIHsUEmzmN
         t1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+4HfV4HcTWWifdRiIwBl3NJeUVjBCfnr5ggY4aZiD50=;
        b=OH6yzKVVeVUHqBxrJpvvepuledn/lc1dVQdAT64Hs4j73ih8Voj+w2pzV6lnWVbWZu
         zfQDa6A9ZXNunee4VuTt6tlN87O2e9PsL5J+3a4PvsEKQgQuJQEdHzenSwN+zPRDvFvv
         S42SVp/acVHTIMsviLnXL5lzetobnuc/5cK4WID72zXNA6LIzeqEMFD+Kp1LUEP8GOKU
         jSi5q4GoEm8WwEYE/44gBwT8aP3YJqcOBPcbhqwjSXWHTPbAXCBvhtVhxO3/Tn9QYCdB
         yPC2wYtmp35hKZ800woFqVsTH6m2Vj0sMRmk0VllKFs/ffvHVkNJiTELeBLFMta5A9Up
         6Vxg==
X-Gm-Message-State: AOAM533bOGOz6X4kmeZNcrtz6r/MKnAiyKtHeeo89NSlxwOXgdBeTO5j
        4mpMJi6iTx+7w0NT8AuLTKq0YJHXtLU5cyCCrNTIzQ==
X-Google-Smtp-Source: ABdhPJzhAz95876CXcG+niRXySelIUggZwcDlb80XN/VChOU7kn49XCxPpRHEmhKP8GJuPE9keyb5xMWyZWbedsi8h8=
X-Received: by 2002:a05:6102:30a7:: with SMTP id y7mr10947641vsd.55.1605011204402;
 Tue, 10 Nov 2020 04:26:44 -0800 (PST)
MIME-Version: 1.0
References: <20201106072549.1495-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201106072549.1495-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 10 Nov 2020 13:26:08 +0100
Message-ID: <CAPDyKFpGX0HOQr4z4LEH9FLiqeRJzNiUpBLpCNquJGJnZNFycg@mail.gmail.com>
Subject: Re: [PATCH 0/3] tmio/sdhi: fix workaround for a regression
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 6 Nov 2020 at 08:26, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> After some refactoring, I had to insert a workaround because a
> regression was discovered when re-inserting SD cards. Now, this series
> implements the proper fixes and finally reverts the workaround.
>
> This has been tested on Salvator-XS (M3N and H3 ES2.0). These patches
> were already discussed with Shimoda-san and the BSP team internally.
> However, I'd appreciate Shimoda-san's tags be given here to make sure
> the patches are exactly that what we discussed.
>
> Thanks and happy hacking!
>
>
> Wolfram Sang (3):
>   mmc: tmio: when resetting, reset DMA controller, too
>   mmc: tmio: bring tuning HW to a sane state with MMC_POWER_OFF
>   Revert "mmc: renesas_sdhi: workaround a regression when reinserting SD
>     cards"
>
>  drivers/mmc/host/renesas_sdhi_core.c | 13 -------------
>  drivers/mmc/host/tmio_mmc_core.c     |  7 +++++--
>  2 files changed, 5 insertions(+), 15 deletions(-)
>

Applied for next, thanks!

Kind regards
Uffe
