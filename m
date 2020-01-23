Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B46E714709C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2020 19:19:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729009AbgAWSTB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Jan 2020 13:19:01 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:43460 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728911AbgAWSTB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Jan 2020 13:19:01 -0500
Received: by mail-vs1-f65.google.com with SMTP id f26so912676vsk.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jan 2020 10:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=benyossef-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OqxshwjEZk15r2HIYLwJvhZobDP5rWlqMcRJh/RNTO4=;
        b=vWDImQhWepEclk+VMgrMtqjicDFT3eIkDyKl3fKOvmTY2bj7EAZYV9HgzGnmXfPlyg
         33UX4671AAMqIUqxSIklCyvbUM30AmviPYm12FXMYgej0FKwPweLv45xc1BfDMdgiG34
         fhTZSJ4nNbHmRXGc7WLTKF/9kEQrTQ228JcsXqf3xjED9wHtbBOkBNVIjPUh0CLVCbxA
         +hVOaTvN+d82xDY2LuN0revzmFywaEhJr+Gg+/0cbl12fITXYJlswyhvQHOnjjlLHJ3g
         ok4rOPVTbE3Bkb2/+WzzTZpApczhCIYVhA9PBBcbPt+fpuWgJXt0WDoSljKei5NBivKF
         q5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OqxshwjEZk15r2HIYLwJvhZobDP5rWlqMcRJh/RNTO4=;
        b=PZOJCOV0rcr64moATNlWkk2YeOrEwXPGuDYiZkvfjThhlu/xkpqZBToXM0NI0QMBr2
         0k6GuhmgVF9znfmhpudJMs/cZfoff6YFw6hhf9YhNqD2fjAthNLvRcT8GjkU9sSytc61
         Emhc0VabIYP82rvTrwLoRTzaZdIkIrqyIKGkYE4FjDNHAXTQ7D6+3CCEhOMU/Xp/+23R
         GJD8crcJV2NP89wSnXTxBdA1+1t847iRzr+xGqhQvInW+oZA/YDvC+HJsQVLkXErC+lv
         fMG5JmdavzHGj5NNaNwnPD+8PxeOIiSMHrctVyFLQ1EMxGZbZ0qTEu9xba9T2SN0iiNs
         nYFQ==
X-Gm-Message-State: APjAAAWhb0RVwkK5HMXq3RrT025eQdpS+2OZtq45WSLk/bo1F+z6Ld0M
        uOSjt2YPX7/m8a1JF5o2pjvGa94YqI4k7QwQyTWD0g==
X-Google-Smtp-Source: APXvYqzOjOD3kh4FjOTrXgXqCPEKCyM8OuN7CeGs4LHHfnmXvUi9lx3crZYBAUn3Op+myZU5Ui/tHw3vwrtGAzpq1BY=
X-Received: by 2002:a67:c90d:: with SMTP id w13mr6769203vsk.164.1579803540508;
 Thu, 23 Jan 2020 10:19:00 -0800 (PST)
MIME-Version: 1.0
References: <20200116101447.20374-1-gilad@benyossef.com> <CAMuHMdUhR83SZyWX9Du9d3Sp4A48x_msKaOHGsa88EQKStEDQg@mail.gmail.com>
 <CAOtvUMfDnoFu8V7sYvhgsstX6fuUk3foq+9FJ6SbUKEFnq-zMw@mail.gmail.com> <CAMuHMdUZbbNX-vsa4TmU7DNKAz2Qo3SR1pHXDOsO4Rh5G8ygZw@mail.gmail.com>
In-Reply-To: <CAMuHMdUZbbNX-vsa4TmU7DNKAz2Qo3SR1pHXDOsO4Rh5G8ygZw@mail.gmail.com>
From:   Gilad Ben-Yossef <gilad@benyossef.com>
Date:   Thu, 23 Jan 2020 20:18:45 +0200
Message-ID: <CAOtvUMdCm8LTfVOgrkGAa5ig6dodyd7QwcEvHz-TnvkMfnhDZA@mail.gmail.com>
Subject: Re: [PATCH 00/11] crypto: ccree - fixes and cleanups
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

On Thu, Jan 23, 2020 at 5:46 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Gilad
>
> On Thu, Jan 23, 2020 at 12:44 PM Gilad Ben-Yossef <gilad@benyossef.com> wrote:
> > On Wed, Jan 22, 2020 at 6:51 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Thu, Jan 16, 2020 at 11:25 AM Gilad Ben-Yossef <gilad@benyossef.com> wrote:
> > > > A bunch of fixes and code cleanups for the ccree driver
> > >
> > > Thank you!
> > >
> > > I wanted to give this a try, but it looks like CCREE is no longer working
> > > on R-Car H3, both with/without this series.
> > >
> > > E.g. with renesas-devel[*] and renesas_defconfig +
> > > CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=n, I get the following crash:
> >
> > Thank you for the bug report Geert!
> >
> > My R-Car board is on loan at the moment to another project. I didn't
> > see this on our internal test board.
> > I will track down my R-Car board and reproduce this - hopefully
> > beginning of next week and will get back to you.
>
> In the mean time, I've bisected this failure to commit cdfee5623290bc89
> ("driver core: initialize a default DMA mask for platform device").
> However, this looks like a red herring, and seems to be only an exposer
> of an underlying problem.

Thank you for continue digging into this.

> What's happening is that cc_map_aead_request() receives a request with
> cryptlen = 0.  Due to DRV_CRYPTO_DIRECTION_ENCRYPT, the length to map is
> increased by 8.  This seems to works fine if there is sufficient space
> in the request's scatterlist.  However, if the scatterlist has only a
> single entry of size zero, cc_map_sg() tries to map a zero-length DMA
> buffer, and the BUG)() is triggered.
>

OK, this does rings a bell - can you verify please if
CONFIG_CRYPTO_MANAGER_EXTRA_TESTS is enabled and if it does can you
see if it happens if it is turned off?

There was an issue I've seen happen only with
CONFIG_CRYPTO_MANAGER_EXTRA_TESTS enabled and only after commit
49763fc6b1af4 ("crypto: testmgr - generate inauthentic AEAD test
vectors") which I am chasing. I was half starting to believe it
was an issue in the testmgr commit and not the ccree driver.

However, the stack trace doesn't look exactly the same but the
description of the issue does. It seems you are seeing the same issue
in another code path.

Thank you - this is very helpful!

I now have a better direction to look into...

Gilad
