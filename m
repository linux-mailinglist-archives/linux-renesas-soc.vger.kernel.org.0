Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25220263453
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Sep 2020 19:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730424AbgIIRS7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Sep 2020 13:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbgIIP12 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Sep 2020 11:27:28 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2C1CC061757
        for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Sep 2020 04:11:02 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id b123so1079111vsd.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2020 04:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=khWyhAe+lN07SqtNkMSWgvbuoeZTuOj4AYam/mxcJqA=;
        b=VDxiHWdoA6M16HlkWBnXofA9gCh5u4mUs3a4g7d3yx3bXnwWeVnhEbXVxfNOJ2jsWI
         uZA6+5fKK7Wyj/Va++px8gtMcgyBMzUXpSQNPXFXZoueO33i291qK/z2eKBpKr1mchb6
         e6n8SewJ4hFBL6xSc7xSUF4yHAb2r9JosEIGXan6ZOo61vc8lvHt6bA1IEC/WfNjFdcs
         Kr7VLRW4ih/5x974ps3zfEJuQiSfzL6vMkLq617OQhkXn3yvy3PN6PhgF6W+6+s8Ni0+
         p1+FZHQqiwk1Dac+xzQf5H/1Gn2022/S8eQFdX7jRVHQyldLJc0Qszr8GfxwgOLcUllm
         5llw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=khWyhAe+lN07SqtNkMSWgvbuoeZTuOj4AYam/mxcJqA=;
        b=TCohVWof71WQd/YTsTNuDVPih7Nw3k94jOIMzV67YVvSv1tJ3x05H8uwWgUh0ouRy3
         T8feuzDNZZHo75GlJG45ctCJgzh4ZVp2HWt5knf37hioOxh6f+KBrVpqv1sv/YRfx/yx
         BlOO1Xuj0XcS1Fq/GWEA9qr++A+exMOhKJly2rG+5VXljz/MOfLaaDk6zXDcAneCq1/E
         McIuz+DKBoPKP1kCPlUyrEzH7lefV7QjwZkmKq77y8mlSV6M+DWQ6dvV4v0OAkZSogjC
         IwCmxfZ7p98DqQQa6+NSW/a+PT0aUofcWOpgZsNEuRHLeasvS4jhlWnkHmB9XUp3p0HD
         1BZA==
X-Gm-Message-State: AOAM532phQTV6+eCKLynJDASpeE0v23Ok2Mwekd0szlKB0sSdcdffac0
        ayrrc5GZwU+qhoCUMpMG0EiI3kyVB6oC2RRUApyKrg==
X-Google-Smtp-Source: ABdhPJyrhzUCjcXsxzlSgTTgLnzBPVGFjXoK2d+f6coDVgjEfNWL7TMizPQxlX5earJnYx3MmYEBFJXkH/Ia4T3/tI0=
X-Received: by 2002:a67:e355:: with SMTP id s21mr123357vsm.50.1599649861771;
 Wed, 09 Sep 2020 04:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200902081812.1591-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200902081812.1591-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 9 Sep 2020 13:10:25 +0200
Message-ID: <CAPDyKFq6NiK1dopS=mBd2r8Eq3TwbT8ZfRG7ujWbYEKeAbDokg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] mmc: renesas_sdhi: support manual calibration
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 2 Sep 2020 at 10:18, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Some R-Car Gen3 SoCs need corrections after they tuned to HS400. This
> series implements that. Please have a look at the patch descriptions for
> details. The origins were patches in the BSP from Takeshi Saito.
>
> Changes since v1:
>         * correction is now enabled after tuning is complete not when it
>           is initiated
>         * rebased to new version of "fix stalled SCC series" which is a
>           dependency for this
>
> There is a branch for testing here (with the debug patch on top):
>
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/new_manual_calib-for-5.10
>
> Current test results (little different to v1):
> ----------------------------------------------
>
> An SDHI instance with a HS400 capable eMMC connected (R-Car M3-N):
>
> When preparing HS400 tuning, a calib table is found. So, (potential) old
> HS400 tuning gets reset and the manual adjustment gets disabled. Unlike
> previous series, the runtime flag is not enabled yet.
>
>      kworker/1:2-139   [001] ....     4.160517: renesas_sdhi_reset_hs400_mode: ee140000.mmc: calib table ffff800010bc15f8
>      kworker/1:2-139   [001] ....     4.160522: renesas_sdhi_reset_hs400_mode: ee140000.mmc: adjustment disabled
>
> Lots of tuning CMDs, runtime flag still disabled:
>
>      kworker/0:1-21    [000] ....     4.160630: renesas_sdhi_fixup_request: ee140000.mmc: opcode 21, flag 0
>      kworker/0:1-21    [000] ....     4.160725: renesas_sdhi_fixup_request: ee140000.mmc: opcode 21, flag 0
>      kworker/0:1-21    [000] ....     4.160831: renesas_sdhi_fixup_request: ee140000.mmc: opcode 21, flag 0
>      kworker/0:1-21    [000] ....     4.160936: renesas_sdhi_fixup_request: ee140000.mmc: opcode 21, flag 0
>      kworker/0:1-21    [000] ....     4.161024: renesas_sdhi_fixup_request: ee140000.mmc: opcode 21, flag 0
>      kworker/0:1-21    [000] ....     4.161122: renesas_sdhi_fixup_request: ee140000.mmc: opcode 21, flag 0
>      kworker/0:1-21    [000] ....     4.161214: renesas_sdhi_fixup_request: ee140000.mmc: opcode 21, flag 0
>      kworker/0:1-21    [000] ....     4.161305: renesas_sdhi_fixup_request: ee140000.mmc: opcode 21, flag 0
>      kworker/0:1-21    [000] ....     4.161407: renesas_sdhi_fixup_request: ee140000.mmc: opcode 21, flag 0
>      kworker/0:1-21    [000] ....     4.161496: renesas_sdhi_fixup_request: ee140000.mmc: opcode 21, flag 0
>      kworker/0:1-21    [000] ....     4.161579: renesas_sdhi_fixup_request: ee140000.mmc: opcode 21, flag 0
>      kworker/0:1-21    [000] ....     4.161669: renesas_sdhi_fixup_request: ee140000.mmc: opcode 21, flag 0
>      kworker/0:1-21    [000] ....     4.161762: renesas_sdhi_fixup_request: ee140000.mmc: opcode 21, flag 0
>      kworker/0:1-21    [000] ....     4.161845: renesas_sdhi_fixup_request: ee140000.mmc: opcode 21, flag 0
>      kworker/0:1-21    [000] ....     4.161927: renesas_sdhi_fixup_request: ee140000.mmc: opcode 21, flag 0
>      kworker/0:1-21    [000] ....     4.162011: renesas_sdhi_fixup_request: ee140000.mmc: opcode 21, flag 0
>      kworker/0:1-21    [000] ....     4.162074: renesas_sdhi_fixup_request: ee140000.mmc: opcode 6, flag 0
>      kworker/0:1-21    [000] ....     4.162612: renesas_sdhi_fixup_request: ee140000.mmc: opcode 13, flag 0
>      kworker/0:1-21    [000] ....     4.162671: renesas_sdhi_fixup_request: ee140000.mmc: opcode 6, flag 0
>      kworker/0:1-21    [000] ....     4.162722: renesas_sdhi_fixup_request: ee140000.mmc: opcode 13, flag 0
>      kworker/0:1-21    [000] ....     4.162778: renesas_sdhi_fixup_request: ee140000.mmc: opcode 6, flag 0
>
> Tuning was successful, now the runtime flag gets enabled:
>
>      kworker/1:2-139   [001] ....     4.163274: renesas_sdhi_hs400_complete: ee140000.mmc: flag enabled
>
> First CMD13 after successful tuning, enable adjustment, clear runtime
> flag, show replacement value. The replacement value is now also around
> 16 which is what Shimoda-san said to be an expected value at room
> temerature. It used to be 31 in v1 of the series.
>
>      kworker/0:1-21    [000] ....     4.163416: renesas_sdhi_fixup_request: ee140000.mmc: opcode 13, flag 1
>      kworker/0:1-21    [000] ....     4.163421: renesas_sdhi_fixup_request: ee140000.mmc: adjustment enabled, flag disabled
>      kworker/0:1-21    [000] ....     4.163422: renesas_sdhi_fixup_request: code 17 replacement 18
>
> Normal operation continues. Some switching and block reads:
>
>      kworker/0:1-21    [000] ....     4.163592: renesas_sdhi_fixup_request: ee140000.mmc: opcode 6, flag 0
>      kworker/0:1-21    [000] ....     4.163645: renesas_sdhi_fixup_request: ee140000.mmc: opcode 13, flag 0
>      kworker/0:1-21    [000] ....     4.163700: renesas_sdhi_fixup_request: ee140000.mmc: opcode 6, flag 0
>      kworker/0:1-21    [000] ....     4.163747: renesas_sdhi_fixup_request: ee140000.mmc: opcode 13, flag 0
>      kworker/0:1-21    [000] ....     4.217134: renesas_sdhi_fixup_request: ee140000.mmc: opcode 17, flag 0
>      kworker/0:1-21    [000] ....     4.217357: renesas_sdhi_fixup_request: ee140000.mmc: opcode 17, flag 0
>         ...
>
> And then checksumming a large file works without performance
> regressions. Unlike the previous version, retunes do not happen
> occasionally, so the new replacement value is indeed better.
>
> So, again a lot of text but I want interested parties to verify results.
>
> Looking forward to comments, although I won't complain if this is the
> final version ;)
>
> Thanks and kind regards,
>
>    Wolfram
>
>
> Wolfram Sang (2):
>   mmc: tmio: add generic hook to fixup after a completed request
>   mmc: renesas_sdhi: support manual calibration
>
>  drivers/mmc/host/renesas_sdhi.h      |   5 +
>  drivers/mmc/host/renesas_sdhi_core.c | 152 ++++++++++++++++++++++++++-
>  drivers/mmc/host/tmio_mmc.h          |   1 +
>  drivers/mmc/host/tmio_mmc_core.c     |   3 +
>  4 files changed, 159 insertions(+), 2 deletions(-)
>
> --
> 2.20.1
>

Applied for next, thanks!

Kind regards
Uffe
