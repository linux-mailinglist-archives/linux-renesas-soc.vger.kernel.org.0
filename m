Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A803517EA9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2019 19:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728886AbfEHRAW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 May 2019 13:00:22 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:41559 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728376AbfEHRAW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 May 2019 13:00:22 -0400
Received: by mail-vs1-f66.google.com with SMTP id g187so13093744vsc.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 May 2019 10:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UQpdS2BoEXavGkDkQ8SZu1pVpvwtdePVG1xQzZyqCT4=;
        b=okcPhIZtULRl8k2vYhNvSd0SlhyeZ+X6G8RNclUDbQjsxBiuxvtUYFc6GTvdlMDEF5
         JX0IYB1nOmMzX2RpbCUbGamC24WxKtdYJb3G7VgP+5nmpXkfRvrPmiiBMHDNI22le2et
         6wQchR/QQ4b0UJGbFptbK/bDilArJJjKKINs053R0yfnN6bTArhilZM5Hoyx2e0al2d0
         tEOh7TROWmy1wBsoAoiNeVi2HLhVQrNC1K9At827FO66ti/zIH6BTJzJcrBmrHvQBxFM
         iqTOauwEnV1flwRUWfEhP0vQ9NHd44H2/zFfRN+RZnuWLJNetrR+QVDijcF0a5GRPO01
         u90w==
X-Gm-Message-State: APjAAAXY0B5Gss39YiUcKqTiLeczX32tLr0OjG0euBTfnFPKim5XU2bv
        UjtyiawxZ4OZGfixC7qJDM6iYfP2slr0All+POc=
X-Google-Smtp-Source: APXvYqyU8GkdyLjbtfeyP0LPWxT1gdAL1M98hPFoTiogs2t4uJWzeKkD4ZHOi1UFIw89Yy4Iya6YxZ3GsHXerDyo8go=
X-Received: by 2002:a67:e2ca:: with SMTP id i10mr12858004vsm.96.1557334820955;
 Wed, 08 May 2019 10:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190320071605.4289-1-jonas@norrbonn.se> <20190320071605.4289-3-jonas@norrbonn.se>
 <CAMuHMdVH85iFJngkU6W61ybwR2j3YQ7=cugPxgC57hUgBOc5KA@mail.gmail.com>
 <1f33e1e5-d7bf-76a0-c4d3-ecbc35fbfd4f@microchip.com> <CAMuHMdU83vLeVSqMZuJwR4yd382mau-OE1saMAOC2+6HodsHvg@mail.gmail.com>
 <fac5fa6d-95e9-cfb0-4d5a-6b16d4470190@norrbonn.se> <CAMuHMdUEdNr5rgCdaGAFJ-WK4oL2DC419smk+QYOJ7qJvkWA8A@mail.gmail.com>
 <a9ad3641-1eb8-782c-9dfd-0db41256d3f1@microchip.com> <ad49240c-2073-4045-c11c-fb6bad231321@microchip.com>
 <CAMuHMdVcp--qRo3m8kSQ=++Vx33kvxBWEHFVHfh-j=pq1x-GPQ@mail.gmail.com>
 <898831ba-b8bb-7c2b-e623-2e6c26da91b5@microchip.com> <CAMuHMdXFwFAPzYPKqj+FZgSq01VAD0izS3ELyOg1YBwTAQ_QkQ@mail.gmail.com>
 <8b004a57-0fd9-04fe-d031-1d98d890f826@microchip.com>
In-Reply-To: <8b004a57-0fd9-04fe-d031-1d98d890f826@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 May 2019 19:00:06 +0200
Message-ID: <CAMuHMdXghAWmNJLUq_uOUVPrrNTAcFq=QqCGjLU51FchvOu3=g@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
To:     Tudor Ambarus <Tudor.Ambarus@microchip.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Jonas Bonn <jonas@norrbonn.se>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tudor,

On Wed, May 8, 2019 at 4:23 PM <Tudor.Ambarus@microchip.com> wrote:
> On 05/08/2019 04:11 PM, Geert Uytterhoeven wrote:
> > On Wed, May 8, 2019 at 12:44 PM <Tudor.Ambarus@microchip.com> wrote:
> >> Would you run this debug patch on top of mtd/next? I dumped the SR and CR before
> >> and after the operations in cause.
> >
> > Thanks, giving it a try...
> >
> >> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> >> index 73172d7f512b..20d0fdb1dc92 100644
> >> --- a/drivers/mtd/spi-nor/spi-nor.c
> >> +++ b/drivers/mtd/spi-nor/spi-nor.c
> >> @@ -22,6 +22,8 @@
> >>  #include <linux/spi/flash.h>
> >>  #include <linux/mtd/spi-nor.h>
> >>
> >> +#define DEBUG
> >
> > Should be moved to the top of the file, before dev_dbg() is defined.
> >
> > Result is:
> >
> > m25p80 spi0.0: bfpt.dwords[1] = ffffffff
> > m25p80 spi0.0: bfpt.dwords[2] = ffffffff
> > m25p80 spi0.0: bfpt.dwords[3] = ffffffff
> > m25p80 spi0.0: bfpt.dwords[4] = ffffffff
> > m25p80 spi0.0: bfpt.dwords[5] = ffffffff
> > m25p80 spi0.0: bfpt.dwords[6] = ffffffff
> > m25p80 spi0.0: bfpt.dwords[7] = ffffffff
> > m25p80 spi0.0: bfpt.dwords[8] = ffffffff
> > m25p80 spi0.0: bfpt.dwords[9] = ffffffff
> > m25p80 spi0.0: bfpt.dwords[10] = 00000000
> > m25p80 spi0.0: bfpt.dwords[11] = 00000000
> > m25p80 spi0.0: bfpt.dwords[12] = 00000000
> > m25p80 spi0.0: bfpt.dwords[13] = 00000000
> > m25p80 spi0.0: bfpt.dwords[14] = 00000000
> > m25p80 spi0.0: bfpt.dwords[15] = 00000000
> > m25p80 spi0.0: bfpt.dwords[16] = 00000000
> > m25p80 spi0.0: failed to parse BFPT: err = -22
> > m25p80 spi0.0: spi_nor_init_params sfdp parse failed, ret =-22
> > m25p80 spi0.0: SR = 00000000
> > m25p80 spi0.0: CR = 00000002
> > m25p80 spi0.0: Erase Error occurred
> > m25p80 spi0.0: timeout while writing SR, ret = -5
> > m25p80 spi0.0: SR = 000000ff
> > m25p80 spi0.0: CR = 000000ff
>
> ff can mean that the lines are "in air", maybe the flash resets when we
> write_sr(nor, 0)? How about adding a delay here to let the flash reset?

No difference after adding msleep(1000).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
