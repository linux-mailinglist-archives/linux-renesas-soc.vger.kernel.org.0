Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDCAC3C5BC2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jul 2021 14:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbhGLLw1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jul 2021 07:52:27 -0400
Received: from mail-ua1-f54.google.com ([209.85.222.54]:38691 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbhGLLw0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jul 2021 07:52:26 -0400
Received: by mail-ua1-f54.google.com with SMTP id g4so6377083uap.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jul 2021 04:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=suUGxZuH1NRbn1FE6724kH4NIGNiBE3ytdburjOMdEY=;
        b=lTpuRQ2JjZv9LdCB5Z99iYOzsXuNWOIAW/JVkIAmwr5dkwDlC049rOBJqdQS/HI3+3
         ZfFmyoL9OT2mgPtf8W8V0GIdaOPgNpSnfoJBb9IFXFyYOkdXklZLdEPINkgBdRjut4lt
         3Sqzkhp1+PsQZRAbfGvyKgOIMWPf/iX3+LuKH8AyeoiLrOlu6gsS156RhJOPofIMw3rp
         fVHdIk1LvmFTXqrSkFE76E864Ecsdf2eegEAEFxypGARlIkTz1/rPGLPTZsGXuz+yu39
         CQ2mVujTRp4AK+cxIKY1znsknymUxqifQ6Kfu+gNu97hRw1wj0B4avWdu+jfwEkdVxor
         NTYA==
X-Gm-Message-State: AOAM533ZZIf7uH81RZ/Dt/sLMo7xKoRtsO0FEEGVF95TQg9Px7tMeCYj
        LnEn/I6VrYeMQ9zk/5LvbWsXHmoxw3S+cIOuVDo=
X-Google-Smtp-Source: ABdhPJx4DatxBVO9vXNYA34jJfMX5mIPkLUkkF5jSvr/3G2g7afA2R7vdTJbIBWzpqJCEFY/xWznDGY5k9xrPLlHj/s=
X-Received: by 2002:a9f:3649:: with SMTP id s9mr24777062uad.2.1626090577376;
 Mon, 12 Jul 2021 04:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <2a4474be1d2c00c6ca97c2714844ea416a9ea9a9.1626084948.git.geert+renesas@glider.be>
 <YOwmfqZnVzcsp+T/@pendragon.ideasonboard.com> <CAMuHMdU2JKtnRWj-TsS+NxRN5hoapRRMgrmmZJY5agN6G-z_NQ@mail.gmail.com>
 <YOwq65XMf8jBVQ4I@pendragon.ideasonboard.com>
In-Reply-To: <YOwq65XMf8jBVQ4I@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Jul 2021 13:49:26 +0200
Message-ID: <CAMuHMdWNwHxM3a0T1RWx9mzbQmZocWV0b3QsHQiWs341THnSVQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: defconfig: Restore graphical consoles
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Mon, Jul 12, 2021 at 1:44 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Jul 12, 2021 at 01:35:34PM +0200, Geert Uytterhoeven wrote:
> > On Mon, Jul 12, 2021 at 1:25 PM Laurent Pinchart wrote:
> > > On Mon, Jul 12, 2021 at 12:16:57PM +0200, Geert Uytterhoeven wrote:
> > > > As of commit f611b1e7624ccdbd ("drm: Avoid circular dependencies for
> > > > CONFIG_FB"), CONFIG_FB is no longer auto-enabled.  While CONFIG_FB may
> > > > be considered unneeded for systems where graphics is provided by a DRM
> > > > driver, R-Mobile A1 still relies on a frame buffer device driver for
> > > > graphics support.
> > > >
> > > > Restore support for graphics on R-Mobile A1 and graphical consoles on
> > > > DRM-based systems by explicitly enabling CONFIG_FB in the defconfig for
> > > > Renesas ARM systems.
> > >
> > > Does anyone still care about the Armadillo board ?
> >
> > I do. It's my only Renesas board with graphical output ;-)
>
> I recommend a VGA or HDMI monitor :-) The sh-mobile-lcdcfb driver is
> unmaintained. If nostalgia is a big enough drive factor, you could try
> converting R-Mobile A1 to the shmob-drm driver :-)

I'll do so as soon as drivers/gpu/drm/shmobile has gained DT support...

> > > This being said, I think CONFIG_FB should be added , but for a different
> > > reason. There's no KMS console driver, so the only option we have today,
> > > even when a KMS driver is available, is to go through FBDEV emulation,
> > > which requires CONFIG_FB to be enabled.
> >
> > That's covered by "Restore [...] graphical consoles on DRM-based
> > systems", right?
>
> I had read the commit message as implying that a graphical console can
> be available without FB when a KMS driver is available.

I was wondering if you still wanted a graphical console on top of a
DRM driver...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
