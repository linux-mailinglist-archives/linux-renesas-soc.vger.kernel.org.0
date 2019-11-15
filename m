Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90537FD8A1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Nov 2019 10:20:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727048AbfKOJUT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Nov 2019 04:20:19 -0500
Received: from mail-vk1-f195.google.com ([209.85.221.195]:40804 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727059AbfKOJUS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Nov 2019 04:20:18 -0500
Received: by mail-vk1-f195.google.com with SMTP id k24so2199123vko.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Nov 2019 01:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iq9uxDFFl/7R3Enfz7ThtyPFSTWSzvQY67xCc3VRtUg=;
        b=S/998+wZ1h0OvX9wPzQw6FItUWJUooke2YKgZHsySOGgG7sH+n4ZTj912GvMu0yhqz
         tn7x3k0Vy5itxaSs+VkNf3fUHWdi2YsOGHeYKQgZqZxyywLV+ADDNaIVH+nGpdzS6o0K
         xHRBmJWbc1v2chKnSbhPsIGhQZu/9Bl1xwQwH8sAjyGWiGL+PkNgal/JBeqR9o11UcD2
         mJJOTH6FWITSUWsHYsYZSsFVG3C4thpRFlVzcAo0oyqZi77IkirWUTONpbU80PPMxVc3
         V5NOijHMIT3PB5qXL4qBHAvvY7HIvp6Sx1FTwZA7z0goWBg2CT2in4jOwlOVqUXRtsfh
         Qt/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iq9uxDFFl/7R3Enfz7ThtyPFSTWSzvQY67xCc3VRtUg=;
        b=SyFLSxwuuz3P+Fbst5K+1ZFZhmyyVPn8ceoS5NM66qeyrlfwaLxsvIKj9P2NWToHPU
         /RqZqAYTjfYG3/wSPGV1O5OISU19/VbES/SWjsMEGF1mwu69BGjYFrhJSpsrQMIFPtI2
         l4SEpTNL6/uKUip7NbOSFZmyvEuSujnDiMFQ++RDKdJLpkV8LqYbF/ilHqBcHHJ5lIpZ
         M63Y1tpegYfEOdZEuTT0apMxfxEfcAKiI+um1VGV1Ef/CyQW0avuNtexHzdXJK2IPL4I
         SHQCHha6ZSqWqRB/zW+brEf1KoWNQ8rhKk+3TRA+UTUKpnz+IY3GJSAGUPsYC6cqJ6eQ
         bTyg==
X-Gm-Message-State: APjAAAUnpDeJvnC7swnS0jM8pWu7Sz5RjDNpiokcICnozXJI1gdP0fku
        jrE2vqWC+PuA2s+Zi3TYXkX0bX9JCT7UtiKIbbLsxw==
X-Google-Smtp-Source: APXvYqwpH4i6bh57UOCdu1M+WDA2ARzT7NfT4hh3f3AhDxVxh+gW4JIjt5X6Ic+nNsdNmBXwbu9ncA2AtQDZBknOnZQ=
X-Received: by 2002:ac5:cd47:: with SMTP id n7mr324617vkm.101.1573809616652;
 Fri, 15 Nov 2019 01:20:16 -0800 (PST)
MIME-Version: 1.0
References: <20191112134808.23546-1-erosca@de.adit-jv.com> <20191112204952.GA2976@kunai>
 <CAPDyKFq8oVk26ruNA_R8HDXhMGKhDeHnL0q82xi40g1aeo109A@mail.gmail.com>
 <20191114113743.GA19656@vmlxhi-102.adit-jv.com> <CAPDyKFp5iqrFDM1EWnYBwFmQAiAA5FADDLAyuVVBgMu4Sx=x5w@mail.gmail.com>
 <20191114201514.GA3058@kunai>
In-Reply-To: <20191114201514.GA3058@kunai>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 15 Nov 2019 10:19:40 +0100
Message-ID: <CAPDyKFpbu0tCWyUHRjVySRF3QR6Hzd8MXA+RhNeCjED1nPtkYg@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: Add MMC_CAP_ERASE to
 Gen3 SoCs
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 14 Nov 2019 at 21:15, Wolfram Sang <wsa@the-dreams.de> wrote:
>
> Hi Ulf,
>
> thanks again for the heads up.
>
> > Let's first take a step back, because I don't know how the HW busy
> > detection works for your controller.
> >
> > I have noticed there is TMIO_STAT_CMD_BUSY bit being set for some
> > variants, which seems to cause renesas_sdhi_wait_idle() to loop for a
> > pre-defined number of loops/timeout. This looks scary, but I can't
> > tell if it's really a problem.
>
> That should be okay. The datasheet mentions that some registers can only
> be accessed when either CBSY or SCLKDIVEN bits signal non-busyness.
> renesas_sdhi_wait_idle() is for that.
>
> > BTW, do you know what TMIO_STAT_CMD_BUSY actually is monitoring?
>
> 0: A command sequence has been completed.
> 1: A command sequence is being executed.

Alright, thanks for clarifying!

>
> > I have also noticed that MMC_CAP_WAIT_WHILE_BUSY isn't set for any of
> > the renesas/tmio variant hosts. Is that simply because the HW doesn't
> > support this? Or because implementation is missing?
>
> Good thing we use public development. I recalled we discussed this
> before but I needed a search engine to find it again:
>
> https://patchwork.kernel.org/patch/8114821/
>
> Summary: The HW (at least since Gen2) has HW support for busy timeout
> detection but I never came around to implement it (and even forgot about
> it :( ). So, we still use a workqueue for it.

I had a vague memory about this discussion as well, thanks for giving
the pointers to it.

I think using a workqueue for scheduling a reset work with a timeout
of 5 s, as in your case.

However, as a heads up, if/when implementing support for busy
detection and adding MMC_CAP_WAIT_WHILE_BUSY, needs to update that
timeout according to cmd->busy_timeout, which is provided by the core.

Kind regards
Uffe
