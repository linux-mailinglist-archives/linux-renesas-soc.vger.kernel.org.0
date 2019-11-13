Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEA0FFB127
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2019 14:16:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727264AbfKMNQj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Nov 2019 08:16:39 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:34677 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbfKMNQi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Nov 2019 08:16:38 -0500
Received: by mail-oi1-f193.google.com with SMTP id l202so1740537oig.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Nov 2019 05:16:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cSGBlD/MkH4Bnh7ItCxdQ0EtQ4Pg4gMvYf3Uqe0+y+A=;
        b=sO5nSTz+GiGB/Jl3+qbEHhkV+shHNFLuO9wRFr2TYDr6nfanu3iNrtdQRWQdMDxhxP
         L7nlIsSqQeJh9CfP5JpkS7LV0p4VgyBhIDcWcfCg/T6gkCdnOv3CDaHF/ad4lVP5e877
         6AF3Y5FDyQvmcOlItOwcK4whc6D0tq57npR7P/oqMAYZZYspWWC0UfquC2HaJwBZ4O8+
         zdeaR3ojyGTIkO6BeRvyn1jp8SGvgqZpLhwD+VWLZwCxIxwvayH/VKtSL5eeHozVLwpl
         Xkv+2Y0l1RJloNCAcrAd3R/3EYuznTcHGnhWGBaHqQMPGz1YdsMljz3dXrEWoYufHu6N
         ykRg==
X-Gm-Message-State: APjAAAUV0e4J/P8DRKxQsf+LdOANmIpe+IWnkHcGfWBOkfFgq0KuZiap
        2OTKV+Buyf1rXWmDg7K0kz6NtY/QjXgsu3/bVPM=
X-Google-Smtp-Source: APXvYqxu0M+7o/f4NAj+E5PDesnooXsHgcWL8sXg+H53VtVwN40+X7BEW7gWLMiEGymuOz7VbjQeT3ePf9c4fQwwr9Q=
X-Received: by 2002:aca:4ac5:: with SMTP id x188mr3050451oia.148.1573650997821;
 Wed, 13 Nov 2019 05:16:37 -0800 (PST)
MIME-Version: 1.0
References: <20191113102729.29303-1-geert+renesas@glider.be> <20191113104037.e45j37xoxeztvut3@pengutronix.de>
In-Reply-To: <20191113104037.e45j37xoxeztvut3@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Nov 2019 14:16:26 +0100
Message-ID: <CAMuHMdW5+=Wek1pYoWbYjsWM_FC08PjambxJQAc6jaiu8+QvqA@mail.gmail.com>
Subject: Re: [PATCH/RFC] ARM: boot: Relax kernel image alignment for RZ/A with
 CS3 SDRAM
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Nicolas Pitre <nico@fluxnic.net>,
        Eric Miao <eric.miao@nvidia.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uwe,

On Wed, Nov 13, 2019 at 11:40 AM Uwe Kleine-König
<u.kleine-koenig@pengutronix.de> wrote:
> On Wed, Nov 13, 2019 at 11:27:29AM +0100, Geert Uytterhoeven wrote:
> > The RZA2MEVB sub board has 64 MiB of SDRAM at 0x0C000000 (CS3 space).
>
> This wording is misleading. You don't adapt the limit because 128 MiB >
> the amount of RAM on that platform but because the alignment of the CS3
> space isn't a multiple of 128 MiB. So I suggest:

Yeah, because of the "at 0x0C000000".

>         On the RZA2MEVB the SDRAM's base is at 0x0C000000 which isn't
>         aligned to 128 MiB. So to ensure the assumptions of the
>         decompressor are valid the used alignment must be decreased.

Thanks, sounds better!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
