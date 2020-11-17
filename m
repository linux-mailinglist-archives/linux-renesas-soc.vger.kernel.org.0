Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9F262B5EA1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Nov 2020 12:50:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728180AbgKQLu3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Nov 2020 06:50:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727885AbgKQLu3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Nov 2020 06:50:29 -0500
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D179C0617A6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2020 03:50:29 -0800 (PST)
Received: by mail-ua1-x941.google.com with SMTP id w3so6423524uau.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2020 03:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e+rjCaps2k7U9izTRIPQGN/KMYZwRytG4PHUUpIgG80=;
        b=YzqcEnN3GkNtcoqkI0qssQWdkbl05WfUiQqqJ2bWmCieyvmra8mQPgB7634gWNdORE
         b5PJ+mVtpRNgN2prafS3KaIq2yKpO5xTfx0CrxnWeCAX/n31LOft5nzVyu96/FGyquwT
         KTCiz+EqR2L8ESvFLPHHsR428S0sidn0fd157bydJeAdNYAorJL+vX2DTAX0bI6a0Oay
         yxr/A17G9V7zV/2Qm5W8hs2czi7yQLI23I4xLLlSzWJwCieYiV7rgasXl/x1pasdVZNa
         moSXmfsVJyhE9QtB88sqa9pNMQKz2afl9w/hZclYaEkWOXDI0dxS+Bvqh6c0bkf/YhLu
         RX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e+rjCaps2k7U9izTRIPQGN/KMYZwRytG4PHUUpIgG80=;
        b=lKK95N31NrwqLHuOgiZQ+QI/onwNydLicEQvSTyt9oOrYeL4O3PwsnXaiGR3+U4eF+
         og5G96G2mQd4xbemLWCRyIbX6oFL0yyN8K/RUUERrVniXSfrh5muhKJGNr9oPLk98lc1
         dx22OxcRRzt9ljUBGAK357VZ2DesAd4Xueq+ypuJ4JbcmfeZZECg+jI/zr7+zWgH3lNL
         YjwD1eAWnXKVGbDY2fqIIEm7G+VGmaoUBUR3duyeItp0IcD2r5lE2IqcgNDhuRsUGF/T
         rFw69lc6TukeLL8EflwU3/cMt2Rrg5CSjN9myuc6hHxGHrlrIWM6Z3Edydb/Uvr1Ku8e
         CElg==
X-Gm-Message-State: AOAM532aL7u/OXXp4RSmbnx7zlVqpG5x6EmFTjqMlLUyqJW4nPjE8gmB
        uFaPaqxY+E6pJ3cKVWZm9MBLHsfC77fxioPi2BaOzxQxtkHNpw==
X-Google-Smtp-Source: ABdhPJwF7Dt1wGHBA1HHAJEu9MvM5rVl5FxeUSNjTPa+EOqiQKf25uSI0oat04CPYqdeq/6atR0EsombgTTeDILVNKc=
X-Received: by 2002:ab0:754f:: with SMTP id k15mr10189267uaq.15.1605613828595;
 Tue, 17 Nov 2020 03:50:28 -0800 (PST)
MIME-Version: 1.0
References: <20201110142058.36393-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201110142058.36393-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 17 Nov 2020 12:49:52 +0100
Message-ID: <CAPDyKFrX=h_wOZkba9=gLHp46RwRPEX7QCMJ52ONA8nSxHH7Kw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] mmc: renesas_sdhi: reset SCC only when available
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 10 Nov 2020 at 15:21, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> While working on another improvement for the reset routine, I noted an
> issue with an old Gen2 SDHI instance which did not have a SCC. It turned
> out that we never distinguished between the SCC and non-SCC versions on
> Gen2 when it came to resetting. So far, it went OK but my upcoming
> change broke. So, this series fixes the underlying issue by only
> resetting the SCC when one is available.
>
> I made very fine-grained patches because this driver is so fragile.
> Nonetheless, my tests on a Renesas Lager board (R-Car H2) and
> Salvator-XS (R-Car M3-N) were successful. Debug output showed that
> proper code paths were taken and checksumming large files worked as well
> as reinserting cards. The patches are based on mmc/next and 5.11 will
> do because there seems to be no issue with current kernels.
>
> I'd be very happy about further review and testing!
>
> Thanks and all the best,
>
>    Wolfram
>
>
> Wolfram Sang (4):
>   mmc: renesas_sdhi: only reset SCC when its pointer is populated
>   mmc: renesas_sdhi: probe into TMIO after SCC parameters have been
>     setup
>   mmc: renesas_sdhi: populate SCC pointer at the proper place
>   mmc: renesas_sdhi: simplify reset routine a little
>
>  drivers/mmc/host/renesas_sdhi_core.c | 38 +++++++++++++---------------
>  1 file changed, 18 insertions(+), 20 deletions(-)

Applied for next, thanks!

Kind regards
Uffe
