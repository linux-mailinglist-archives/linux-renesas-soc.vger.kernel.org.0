Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 630C82FC1A0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Jan 2021 21:54:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727566AbhASUxZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Jan 2021 15:53:25 -0500
Received: from mail-ot1-f42.google.com ([209.85.210.42]:40063 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392081AbhASUxP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jan 2021 15:53:15 -0500
Received: by mail-ot1-f42.google.com with SMTP id i20so13383877otl.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jan 2021 12:52:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fLus/CuC+AN+IDYE7L9UePkEAgItcFI+laELScnfZUg=;
        b=uVHKKJZDIYRhHUjPhE3vqcrbC4CcD6izUWUDuDz3nioepiXEbtgAS36qik6jhB84OL
         pdPltdkXugvv7hCr8eOyny1ixGQuDGNHm56nF56W5x+Fsu/I9ANKrwgG7jEUbSjF3LmC
         vfPhElVBuDR+Cu3ChmTGLiwmsO/lHVANsBXeR2SnHG5LCjk+JAJFgQqXB8A7LmHn3sQc
         DEVIT0Wiyx9f0Qk2Yw/J7VJi8ZrYhGY3i23fc9GAPxiIt2PD66paWClRt7gsU0rglIPa
         vhXxy/hjmOm3RuuRCrj0H58oWkqnY25k616uNaXwpERqoeyVi4642OnyIMUaLkAAU4Qf
         DOAw==
X-Gm-Message-State: AOAM5304fQswqLiytdP2fA6uo3ZtSbEaiqmonOzZUenSN+YdU7qwM3pk
        G6/mnks4fnM/6FZzA/zZBOEUt9x3FD+4NvOZUsE=
X-Google-Smtp-Source: ABdhPJwpjs/e+77ykUPaGRT1S/0qBB9keFjqpZOQLcB14qap1OEvSZli50OyyqrBEdG4OCgJ/tvrr2kN9NgBKIlnHiw=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr4770784oth.250.1611089554078;
 Tue, 19 Jan 2021 12:52:34 -0800 (PST)
MIME-Version: 1.0
References: <20210119133322.87289-1-wsa+renesas@sang-engineering.com>
 <CAHCN7xLcqh0efDuMS96Tot2Wek736VTbSbYm-rQgJf=ghZ0sBA@mail.gmail.com>
 <CAMuHMdVLwcQ6WpEhybxwCjJ2S-tuOoWqSiQCmB2-=Bunw4fX4A@mail.gmail.com> <CAHCN7x+_h00tG4jw_NQ+kx7eW=ZOcrDJ1PAVgMWK-rq53TyoiQ@mail.gmail.com>
In-Reply-To: <CAHCN7x+_h00tG4jw_NQ+kx7eW=ZOcrDJ1PAVgMWK-rq53TyoiQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Jan 2021 21:52:23 +0100
Message-ID: <CAMuHMdV3wXM9GHiYN-nArs=SzojkjCGmuKBrdsAwz8N9SoqQyw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: disable SD functions for plain eMMC
To:     Adam Ford <aford173@gmail.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Adam,

On Tue, Jan 19, 2021 at 9:46 PM Adam Ford <aford173@gmail.com> wrote:
> On Tue, Jan 19, 2021 at 2:35 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Jan 19, 2021 at 7:43 PM Adam Ford <aford173@gmail.com> wrote:
> > > On Tue, Jan 19, 2021 at 8:48 AM Wolfram Sang
> > > <wsa+renesas@sang-engineering.com> wrote:
> > > >
> > > > Some SDHI instances are solely used for eMMC. Disable SD and SDIO
> > > > for faster initialization.
> > > >
> > > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >
> > > > --- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> > > > +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> > > > @@ -312,6 +312,8 @@ &sdhi3 {
> > > >         vqmmc-supply = <&reg_1p8v>;
> > > >         bus-width = <8>;
> > > >         mmc-hs200-1_8v;
> > > > +       no-sd;
> > > > +       no-sdio;
> > >
> > > No objections on the Beacon board.   I cannot speak for the rest.
> >
> > Does this mean I can add your
> >
> >     Acked-by: Adam Ford <aford173@gmail.com> [beacon]
> >
>
> Yes.  I wasn't sure what the appropriate response sould be. (Review-by
> or Acked-by)

I think "no objections" maps to "Acked-by" ;-)
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
