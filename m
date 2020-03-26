Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB35C193CBF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2020 11:13:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbgCZKNq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Mar 2020 06:13:46 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:35485 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727855AbgCZKNq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 06:13:46 -0400
Received: by mail-oi1-f196.google.com with SMTP id t25so5007499oij.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2020 03:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KySq9vbRqSVaUMQfJYnT/cg7WphNRu+W69gTqNBjRGw=;
        b=XZBJpxCfAhJmT/m2l+JEgrVCuNUuCwNNKyl9JEtiHIqLR4UONGL37OhaLdWOg96rCZ
         93ZIwW64I94CsBkMNRRwUONLnElm7hVURS3S0JvdI4BR5xQI19TgDH99DDvv1XHci6FS
         UpRqWgvT17rRgL5FTofINQUUTCQsHDW/suX57CdL4rOe9iVbPxGqpbltJ1j6kv/JawnJ
         344TAhYpLeMkbCyrGWaSBGc65xJM5OlLqErZhdT7bSFB3nyre8PuDHqdV9AHZHDQS0HN
         rn+Rf4aEdeliB9GXQp8pGz/wTigQmV0oWODMBKKASmEKgHvboSQX91EDxzAOr+6SSLNO
         1TWg==
X-Gm-Message-State: ANhLgQ2eUNdbMr9ZfEFkv5aghyt61DSzEryu56abSyLK5ms8uKWDp19y
        L1Ns3CNsIiIOf8wiMhz8oLkLXVyOO3qXVb/O5j7nKw==
X-Google-Smtp-Source: ADFU+vuwkSL3YLUNjEl230qgAOyjrsI3Ea64++0TBk6yds46R859Jr71wp2CbhwqgI9v1S15Z50ms4LbGIcP2KOpVNI=
X-Received: by 2002:aca:cdd1:: with SMTP id d200mr1168268oig.153.1585217625245;
 Thu, 26 Mar 2020 03:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200320144348.12865-1-geert+renesas@glider.be> <CAKv+Gu8q2bAVMRLSc-Ae=hxhg3sbvpfuaMJ_nx4FZFvegNZ+9w@mail.gmail.com>
In-Reply-To: <CAKv+Gu8q2bAVMRLSc-Ae=hxhg3sbvpfuaMJ_nx4FZFvegNZ+9w@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Mar 2020 11:13:34 +0100
Message-ID: <CAMuHMdVLA6aEzyudPkR=RP5MV9R4eiRUngAj9wymMv1hJ+uTuA@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: boot: Obtain start of physical memory from DTB
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Ard,

On Wed, Mar 25, 2020 at 5:40 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> On Fri, 20 Mar 2020 at 15:43, Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > Currently, the start address of physical memory is obtained by masking
> > the program counter with a fixed mask of 0xf8000000.  This mask value
> > was chosen as a balance between the requirements of different platforms.
> > However, this does require that the start address of physical memory is
> > a multiple of 128 MiB, precluding booting Linux on platforms where this
> > requirement is not fulfilled.
> >
> > Fix this limitation by obtaining the start address from the DTB instead,
> > if available (either explicitly passed, or appended to the kernel).
> > Fall back to the traditional method when needed.
> >
> > This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
> > on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
> > i.e. not at a multiple of 128 MiB.
> >
> > Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Nicolas Pitre <nico@fluxnic.net>
> > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > ---
> > v4:
> >   - Fix stack location after commit 184bf653a7a452c1 ("ARM:
> >     decompressor: factor out routine to obtain the inflated image
> >     size"),
> >
>
> Apologies for the breakage. I was aware of the existence of this
> patch, but I didn't realize it was accessing LC0 early on to find the
> stack pointer value.

No problem, you sent your PR on the same day I posted v2, which was
the first version to access LC0.

> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
