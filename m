Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2399FC689
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Nov 2019 13:49:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbfKNMtT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Nov 2019 07:49:19 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:38837 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbfKNMtT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Nov 2019 07:49:19 -0500
Received: by mail-vk1-f194.google.com with SMTP id o82so1431264vka.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Nov 2019 04:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b1Q/m149A5PiemLfT6SquJYIvD0phNlImqR3A8L8/X0=;
        b=oDQOBZJMEqbwzWlmHcUKV9gnBv6LEuxHn1x4GtULF1fRydbf3dBCCVMd1Z5cWdSNjQ
         c1ZTfSEqLGcacYp4m6Xm4fNvVBRSarsr3C/Qo32kdAYLIvdZoIq8XnJjrKKL/EVY0hXh
         AG+WANyP6rcYS8fVx4CvjjYVZl9VEdZT1qBZZ8G9+s37MUakC7E2nqlmdemIT13yjDak
         0uOxTYdCgIS9sR/eXC6qNR5EHvj0AFE6c7zco+xBwItSrqedQROlEYCqCE4gT1XvImup
         wNUFikPH3cdaqOScbjGf5gCbCledicHsIM/Zyn/bqFrDWLDWmBLqCqdwSUToAS7WCgl/
         8fPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b1Q/m149A5PiemLfT6SquJYIvD0phNlImqR3A8L8/X0=;
        b=J5RL7VJWz1ib4WEN8viYH4flnIRwZ5x9jliBMDwyVIGMz/EAv535tDJBTMiUWi0gVq
         FkZXlD1wYbyUgHKlgGvXg44ZqtrdeFcUEFGCznESRqD/Y3mt0Osk6t2NsWZeLOYwdnFy
         ubSDY6tDZ1MQl8+Y2uaw5vomnacu5N9M2oiBIIMqTFhKHouwzJrd1CA1XTnxiztjA4xf
         5oZBN89ii+DFfw4750cfDUmliidIGfdAfngfZR/DcEZBJJegm+jZ9xpojwZNdbSAdwAy
         iCdEm6ko5KGuHMC/9qtLf12mUgWyUuWt/V7WLq7WRIlu1wavI3rAUdLkzKrhxkRV1Krr
         i8Xg==
X-Gm-Message-State: APjAAAXUn8Yd45rmg7cX7TlJBs0EMFixU7u57ETydCw90k7cYyFkWVVF
        Hb5zbwgu2g1tjLVWmylc3nfkqBTsdjNLiicFt5TqUA==
X-Google-Smtp-Source: APXvYqzeR1eD9xbTpxqtVCXbvQ0errOunVTWRox8BRoqYOgFufup0NzneBdevNKkYj3L0OW3QOUm0DwWKPTS2uChrsA=
X-Received: by 2002:a1f:fe0a:: with SMTP id l10mr4953847vki.59.1573735757811;
 Thu, 14 Nov 2019 04:49:17 -0800 (PST)
MIME-Version: 1.0
References: <20191112134808.23546-1-erosca@de.adit-jv.com> <20191112204952.GA2976@kunai>
 <CAPDyKFq8oVk26ruNA_R8HDXhMGKhDeHnL0q82xi40g1aeo109A@mail.gmail.com> <20191114113743.GA19656@vmlxhi-102.adit-jv.com>
In-Reply-To: <20191114113743.GA19656@vmlxhi-102.adit-jv.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 14 Nov 2019 13:48:41 +0100
Message-ID: <CAPDyKFp5iqrFDM1EWnYBwFmQAiAA5FADDLAyuVVBgMu4Sx=x5w@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: Add MMC_CAP_ERASE to
 Gen3 SoCs
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
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

On Thu, 14 Nov 2019 at 12:37, Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
>
> Hi everyone,
>
> On Thu, Nov 14, 2019 at 11:56:23AM +0100, Ulf Hansson wrote:
> > On Tue, 12 Nov 2019 at 21:49, Wolfram Sang <wsa@the-dreams.de> wrote:
> > >
> > > On Tue, Nov 12, 2019 at 02:48:08PM +0100, Eugeniu Rosca wrote:
> > > > From: Harish Jenny K N <harish_kandiga@mentor.com>
> > > >
> > > > Enable MMC_CAP_ERASE capability in the driver to allow
> > > > erase/discard/trim requests.
> > > >
> > > > Suggested-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
> > > > Signed-off-by: Harish Jenny K N <harish_kandiga@mentor.com>
> > > > [erosca: Forward-port and test on v5.4-rc7 using H3ULCB-KF:
> > > >          "blkdiscard /dev/mmcblk0" passes with this patch applied
> > > >          and complains otherwise:
> > > >        "BLKDISCARD ioctl failed: Operation not supported"]
> > > > Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> > >
> > > Looks good to me. Just a generic question, probably more for Ulf:
> > >
> > > Why does this CAP_ERASE exist? As I understand, the driver only needs to
> > > set the flag and no further handling is required. Why would a driver not
> > > set this flag and not support erase/trim commands?
> >
> > I am working on removing the cap, altogether. Step by step, this is
> > getting closer now.
> >
> > The main problem has been about busy detect timeouts, as an erase
> > command may have a very long busy timeout. On the host side, they
> > typically need to respect the cmd->busy_timeout for the request, and
> > if it can't because of some HW limitation, it needs to set
> > mmc->max_busy_timeout.
>
> FWIW we've discussed such concerns internally, based on past commits
> which either disable [1-2] busy timeouts or increase their value [3].
>
> To get a feeling if this is relevant for R-Car3, I've run blkdiscard on
> a 64 GiB eMMC without noticing any issues on v5.4-rc7. Hopefully this
> is sufficient as testing?

Let's first take a step back, because I don't know how the HW busy
detection works for your controller.

I have noticed there is TMIO_STAT_CMD_BUSY bit being set for some
variants, which seems to cause renesas_sdhi_wait_idle() to loop for a
pre-defined number of loops/timeout. This looks scary, but I can't
tell if it's really a problem.

BTW, do you know what TMIO_STAT_CMD_BUSY actually is monitoring?

I have also noticed that MMC_CAP_WAIT_WHILE_BUSY isn't set for any of
the renesas/tmio variant hosts. Is that simply because the HW doesn't
support this? Or because implementation is missing?

If you want to run a test that stretches the behaviour on the timeout
path, I would rather use an SD-card (the older the better). For eMMCs
the erase likely translates to a trim/discard, which is far more
quicker than a real erase - as is what happens on an old SD card.

>
> >
> > Once that is fixed for all, we can drop CAP_ERASE.
> >
> > Kind regards
> > Uffe
>
> [1] 93caf8e69eac76 ("omap_hsmmc: add erase capability")
> [2] b13d1f0f9ad64b ("mmc: omap: Add erase capability")
> [3] ec30f11e821f2d ("mmc: rtsx_usb: Use the provided busy timeout from the mmc core")
>
> --
> Best Regards,
> Eugeniu

Kind regards
Uffe
