Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 746CB147264
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2020 21:09:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727215AbgAWUJG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Jan 2020 15:09:06 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44577 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727141AbgAWUJG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Jan 2020 15:09:06 -0500
Received: by mail-oi1-f194.google.com with SMTP id d62so4114517oia.11;
        Thu, 23 Jan 2020 12:09:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vVKGzcjzgYKfbH5GrgrPtRduy6O94J9VHLSrUFzfF0o=;
        b=Lux9AFY2jlUsplSHb94BI+HoqGW7dWouvo2aFvkTCcGd9fvHhEWSO3CC7HEGtYVDQ2
         a53pS8GIJajr2KKILndYts6MuXD17MaiQ0Qt8wMfWh43W69iOogbfeDWsaav+OD52kWS
         OYHqwbltn0yYwygbO+UlULsvUiKPCT8ZYlx2JxWfEFLHT6dMPA6y3G79pItmz1XQ5fj8
         da75ZfM0VEoZ3/DJyrO93+9uV3Ilg9HKEUrK9jhAd0aYRJdSmUrDWOCJr0cZ+BQucC3V
         aEWt7UJ/4+h6XHAP8fXxqhHQDMWNzYU+961+mTUk2LBBzQ5eBpOTA/CggQKSSYSaPYZo
         4hGg==
X-Gm-Message-State: APjAAAUTK5BjU9TMwTpOFaR3OLDdxtmkXA1JpofXT+OyC96xhCzXLLkN
        8u+crsYyxcENBu51rAdHBT4Y0ahnQH4uj96/w34=
X-Google-Smtp-Source: APXvYqza9kKl70hhT8tgf/+Mkh35IoAIwHVHXs0FQsmG0LhbXki0VWdjBWY8SEXw+Tz1hJ5wmPBUzSOk6KjxSTgNats=
X-Received: by 2002:aca:48cd:: with SMTP id v196mr12160145oia.102.1579810145435;
 Thu, 23 Jan 2020 12:09:05 -0800 (PST)
MIME-Version: 1.0
References: <20200116101447.20374-1-gilad@benyossef.com> <CAMuHMdUhR83SZyWX9Du9d3Sp4A48x_msKaOHGsa88EQKStEDQg@mail.gmail.com>
 <CAOtvUMfDnoFu8V7sYvhgsstX6fuUk3foq+9FJ6SbUKEFnq-zMw@mail.gmail.com>
 <CAMuHMdUZbbNX-vsa4TmU7DNKAz2Qo3SR1pHXDOsO4Rh5G8ygZw@mail.gmail.com> <CAOtvUMdCm8LTfVOgrkGAa5ig6dodyd7QwcEvHz-TnvkMfnhDZA@mail.gmail.com>
In-Reply-To: <CAOtvUMdCm8LTfVOgrkGAa5ig6dodyd7QwcEvHz-TnvkMfnhDZA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Jan 2020 21:08:52 +0100
Message-ID: <CAMuHMdVPQsb=NrQ=N+S1TrD_CuJ=hnaYS+OLE9SnyWy43dC3GQ@mail.gmail.com>
Subject: Re: [PATCH 00/11] crypto: ccree - fixes and cleanups
To:     Gilad Ben-Yossef <gilad@benyossef.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Ofir Drang <ofir.drang@arm.com>, Hadar Gat <hadar.gat@arm.com>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Gilad,

On Thu, Jan 23, 2020 at 7:19 PM Gilad Ben-Yossef <gilad@benyossef.com> wrote:
> On Thu, Jan 23, 2020 at 5:46 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Thu, Jan 23, 2020 at 12:44 PM Gilad Ben-Yossef <gilad@benyossef.com> wrote:
> > > On Wed, Jan 22, 2020 at 6:51 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Thu, Jan 16, 2020 at 11:25 AM Gilad Ben-Yossef <gilad@benyossef.com> wrote:
> > > > > A bunch of fixes and code cleanups for the ccree driver
> > > >
> > > > Thank you!
> > > >
> > > > I wanted to give this a try, but it looks like CCREE is no longer working
> > > > on R-Car H3, both with/without this series.
> > > >
> > > > E.g. with renesas-devel[*] and renesas_defconfig +
> > > > CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=n, I get the following crash:
> > >
> > > Thank you for the bug report Geert!
> > >
> > > My R-Car board is on loan at the moment to another project. I didn't
> > > see this on our internal test board.
> > > I will track down my R-Car board and reproduce this - hopefully
> > > beginning of next week and will get back to you.
> >
> > In the mean time, I've bisected this failure to commit cdfee5623290bc89
> > ("driver core: initialize a default DMA mask for platform device").
> > However, this looks like a red herring, and seems to be only an exposer
> > of an underlying problem.
>
> Thank you for continue digging into this.
>
> > What's happening is that cc_map_aead_request() receives a request with
> > cryptlen = 0.  Due to DRV_CRYPTO_DIRECTION_ENCRYPT, the length to map is
> > increased by 8.  This seems to works fine if there is sufficient space
> > in the request's scatterlist.  However, if the scatterlist has only a
> > single entry of size zero, cc_map_sg() tries to map a zero-length DMA
> > buffer, and the BUG)() is triggered.
> >
>
> OK, this does rings a bell - can you verify please if
> CONFIG_CRYPTO_MANAGER_EXTRA_TESTS is enabled and if it does can you
> see if it happens if it is turned off?

No, I didn't have that option enabled.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
