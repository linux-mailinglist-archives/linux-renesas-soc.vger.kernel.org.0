Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A02BFB157
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2019 14:32:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbfKMNcb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Nov 2019 08:32:31 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39929 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726978AbfKMNcb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Nov 2019 08:32:31 -0500
Received: by mail-ot1-f65.google.com with SMTP id w24so1108091otk.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Nov 2019 05:32:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lq8qtGwmpElTMrGp/VyZWwTWqE2Cbch/Z4ML6h6REjs=;
        b=jeGYsIyLQYybd88oi5c0k5uIPM86UcfBjPdm5BiODrUz1dQe+Z75m4DWxhQZq8/X/f
         pSSx5zpIrFvYnzthM5b+eDbf/9DripjqZwO5y926+bum/uGHQfl1d+70VjVu30wvzY44
         KNABV5P4dMAZT2Yza7UY6RSkGupgFECKimqiAidhzzFI+FQa+RDJxvnXX8oj7TzLpegW
         dYUG4Yj5trXtPiVIrEiZn++vC8+v9/C17RFP99vRbmpFi8h6o4G+hWiCXJhpI0DWE16y
         jjlERe1gbUqeMN69qASvsF+igA/9lmh876w9qvqj+FIKOZTT9afqVO+sP1SusRpiGuIe
         uLPQ==
X-Gm-Message-State: APjAAAVVJN5tBVmFo9WdcoscfUxpAMaoy6azibEFaPuH7LI9siqHytjQ
        LACwBUmpqRGEvbVGb893zMvLOlGsAz4Ecc8DKi0=
X-Google-Smtp-Source: APXvYqx4GkIzrsgTfrDR16BExlducFGjzv3b6lG1dfNDm66M/Rs0tk7Eols4b2XLbBz5ooEFRMDAFWsw4lAWEAJmHEI=
X-Received: by 2002:a9d:5511:: with SMTP id l17mr3150607oth.145.1573651950407;
 Wed, 13 Nov 2019 05:32:30 -0800 (PST)
MIME-Version: 1.0
References: <20191113102729.29303-1-geert+renesas@glider.be> <20191113103919.GM25745@shell.armlinux.org.uk>
In-Reply-To: <20191113103919.GM25745@shell.armlinux.org.uk>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Nov 2019 14:32:19 +0100
Message-ID: <CAMuHMdXWsUChMA+_6sdavo8nd-9icX6nsN7unSfMMViOQrUVMQ@mail.gmail.com>
Subject: Re: [PATCH/RFC] ARM: boot: Relax kernel image alignment for RZ/A with
 CS3 SDRAM
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nico@fluxnic.net>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Russell,

On Wed, Nov 13, 2019 at 11:39 AM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
> On Wed, Nov 13, 2019 at 11:27:29AM +0100, Geert Uytterhoeven wrote:
> > The RZA2MEVB sub board has 64 MiB of SDRAM at 0x0C000000 (CS3 space).
> > Hence the mask for CONFIG_AUTO_ZRELADDR needs to be changed, otherwise
> > the system will crash because it will try to decompress a zImage or
> > uImage to a non-RAM garbage address.
> >
> > Based on a patch in the BSP by Chris Brandt <chris.brandt@renesas.com>.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > No idea what to do with the rest of the comment, or if this breaks
> > existing platforms.
>
> We occasionally have discussions about this - the last one was a big
> one in Edinburgh, and the answer is we can't change this in mainline.
> They've also come up on the mailing lists as well.
>
> I'm not going to rehash this old argument yet again - the comment
> details the reason for it, and is there to prevent exactly this.

Sorry, I wasn't aware of that discussion.
I had a chat about this at ELC-E with Arnd, and he was open to this change.

> If someone is silly enough to come up with a platform that violates
> the documented 32-bit ARM booting protocol, then they can't expect
> the kernel to bend to their platform's requirements at the expense of
> already merged platforms.

Documentation/arm/booting.rst:
  1. The kernel should be placed in the first 128MiB of RAM: check.
  2. A safe location is just above the 128MiB boundary from start of RAM:
     oops. Not all platforms have more than 128 MiB of RAM...

An alternative is to fall to the builtin 4 MiB of SRAM, or the 8 MiB of
HyperRAM on RZA2MEVB, but doing that requires using XIP.
Which brings us to your response in the other email:

> Are we going back to non-multi-platform kernels? ;)

Good question! ;-)

  1. CONFIG_AUTO_ZRELADDR=n
  2. CONFIG_XIP_KERNEL=y

What do you suggest?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
