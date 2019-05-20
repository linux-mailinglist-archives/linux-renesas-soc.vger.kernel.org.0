Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 590DF22D3F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 May 2019 09:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729314AbfETHh5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 May 2019 03:37:57 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:43088 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725983AbfETHh5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 May 2019 03:37:57 -0400
Received: by mail-vs1-f66.google.com with SMTP id d128so8304606vsc.10;
        Mon, 20 May 2019 00:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZzFqnIOsi8p6z+3XrmxUiH+3WXG0rfBF0N579QptVnw=;
        b=XHlzanKfUZa49Qnj7RTchm/p+lSZvbWxzVhVGdoDtEEfmSlQnhMxXxtEMjbfIpOfQJ
         cPK3Sf6EWE72eSHCTDJD6hWY/CC1gFkRNFwoWOhgUP69M3n6lJdCcyqc6QWN3h4fqxzg
         IJnJM3S478GUZq1QwJn/TmjlJuAjz6tNiBm4VandNuz2qfnek2vSW4L2nvDLELzMFDrg
         qMg4C5Bvpj9+QDDQq/GeZDCXxqyJB+HrTModIDBUeXKSBkWyhagZoBSQqPNsdJJYtTm/
         K0ZV4Wi/EhAmQu9a6Ker0LLJUSr0cPbxo0wPo4yBm6Rc9tG0JUzYXF2WQFxDnhxarntK
         qpnw==
X-Gm-Message-State: APjAAAVFF04Nikw+/bnoHdVrVEO8xI2dnLQZXfuQYLo1/G7rilI4cDES
        249i1nOnYzyG0CH4W4SCNyuI+U+QtHE/oICDB4o=
X-Google-Smtp-Source: APXvYqyUussoat3RoiVGfWvPbqvmfPyaaXxlv6lPx8B2T1BSZy0HJO2KEIQH+Mu9ccoM18jhu0wEOGioz6Sr2M5lBWk=
X-Received: by 2002:a67:fdd4:: with SMTP id l20mr28417242vsq.63.1558337876203;
 Mon, 20 May 2019 00:37:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190504004258.23574-1-erosca@de.adit-jv.com> <20190504004258.23574-3-erosca@de.adit-jv.com>
 <CAMuHMdWnuvQvugqfMjE1R_QDvf-Pma8POb1x5YjRr97+M-=HHg@mail.gmail.com>
 <20190506194233.GA32430@vmlxhi-102.adit-jv.com> <OSBPR01MB3174C93C0A49701EC72F9D82D8060@OSBPR01MB3174.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB3174C93C0A49701EC72F9D82D8060@OSBPR01MB3174.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 May 2019 09:37:43 +0200
Message-ID: <CAMuHMdVR4idTqOiNWMi3GAS0D-V+SMsYSsukgEMYyz5zDcuPbw@mail.gmail.com>
Subject: Re: [PATCH 2/6] Revert "arm64: dts: renesas: r8a7796: Enable DMA for SCIF2"
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "REE erosca@DE.ADIT-JV.COM" <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "George G . Davis" <george_davis@mentor.com>,
        Andy Lowe <andy_lowe@mentor.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Rodin <mrodin@de.adit-jv.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

Thanks for your analysis!

On Mon, May 20, 2019 at 4:18 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Eugeniu Rosca, Sent: Tuesday, May 7, 2019 4:43 AM
> <snip>
> > > > [0] v5.0-rc6 commit 97f26702bc95b5 ("arm64: dts: renesas: r8a7796: Enable DMA for SCIF2")
> > > > [1] v4.14.106 commit 703db5d1b1759f ("arm64: dts: renesas: r8a7796: Enable DMA for SCIF2")
> > > > [2] scif (DEBUG) and rcar-dmac logs:
> > > >     https://gist.github.com/erosca/132cce76a619724a9e4fa61d1db88c66
> <snip>
> > Enabling DEBUG in drivers/dma/sh/rcar-dmac.c, I can notice that one of
> > the symptoms is a NULL dst_addr revealed by:
> >
> > rcar-dmac e7300000.dma-controller: chan0: queue chunk (____ptrval____): 0@0xffff800639eb8090 -> 0x0000000000000000
> >
> > In working scenarios, dst_addr is never zero. Does it give any hints?
>
> Thank you for the report! It's very helpful to me.
> I think we should fix the sh-sci driver at least.
>
> According to the [2] log above,
>
> [    4.379716] sh-sci e6e88000.serial: sci_dma_tx_work_fn: ffff800639b55000: 0...0, cookie 126
>
> This "0...0" means the s->tx_dma_len on the sci_dma_tx_work_fn will be zero. And,

How can this happen? schedule_work(&s->work_tx) is called only if
!uart_circ_empty(), and while holding the port lock? So the circular
buffer must be made empty in between the call to schedule_work() and the
work function sci_dma_tx_work_fn() being called.

I think this can happen if uart_flush_buffer() is called at the right
moment?

> > rcar-dmac e7300000.dma-controller: chan0: queue chunk (____ptrval____): 0@0xffff800639eb8090 -> 0x0000000000000000
>
> This means the chunk->dst_addr is not set to the "dst_addr" for SCIF because the len on rcar_dmac_chan_prep_sg is zero.
> So, I'm thinking:
>  - we have to fix the sh_sci driver to avoid "tx_dma_len = 0" transferring.

That sounds like just a simple check for !s->tx_dma_len in
sci_dma_tx_work_fn(), to return early, _and_ reset s->cookie_tx to
-EINVAL.

However, uart_flush_buffer() may still be called in between the check
and the calls to dmaengine_prep_slave_single() /
dma_sync_single_for_device(), clearing s->tx_dma_len again.
Unless something has changed recently, these two calls cannot be moved
inside the spinlock-protected section?
Using a cached value of s->tx_dma_len for the dmaengine calls might
work, though.

> and
>
>  - also we have to fix the rcar-dmac driver to avoid this issue because the DMA Engine API
>    guide doesn't prevent the len = 0.

I guess returning an error makes most sense?
Else we have to fix it deeper into the driver, where handling becomes
more complex.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
