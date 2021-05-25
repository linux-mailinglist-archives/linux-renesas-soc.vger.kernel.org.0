Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0286F38FBEF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 May 2021 09:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231708AbhEYHn6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 May 2021 03:43:58 -0400
Received: from mail-vk1-f179.google.com ([209.85.221.179]:46037 "EHLO
        mail-vk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231477AbhEYHn5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 May 2021 03:43:57 -0400
Received: by mail-vk1-f179.google.com with SMTP id f10so5511610vkm.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 May 2021 00:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PjsDp5BZn/eO/EcJtJ1/C3U/HaWps7lldYQE2hLa/x0=;
        b=fSKEdKsyrR4AbIIocXMMNv0RATOPiQ7GJDbL1+LY7jXj+a7ee/fSd+9itNvJQNoMsN
         s50UIs2jywWUNqEvoL3bH0o5pmU8FHpuEsguJ5qEy8qAuiiMqZesKcXOHmjG6GC842PJ
         SuHZfa0gaKxYpOwyufC4oAeqMz8fIUbBnQYHLab+82Db1wA5oL0KojHzKPpdJfdN/Hmz
         jnKKOtoA2Tml1ybmYqpouu2r7l0tuPzqkfl9qoedI4EJgcSNBDAjMkJPfzTMDHtS7Swg
         jokMNGM5rBwVsS3WDKtXKLWrhXD/voEz1XWqf8NwGsgm8t/aSeigzLl9YEMSqd4xsYCg
         AaPw==
X-Gm-Message-State: AOAM530PjCKDkDxnHKGjQd7nc3lUHPlGFm51kdjVTcToLWFbwSw0kO37
        1j1C9+SRBelXJx6n6GsBikZKQ5OvvSxqrbZyr2oCziFL
X-Google-Smtp-Source: ABdhPJxHG2eEUZOpWB/fM5vTmW3IO0/4Qkb99lq1WjwhT9rhN0iF9p5rkheFMlIc1SChxR3CQGCjq1GWWDaVGUbUqwk=
X-Received: by 2002:a1f:2504:: with SMTP id l4mr24259975vkl.5.1621928547182;
 Tue, 25 May 2021 00:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <87k0nyci2t.wl-kuninori.morimoto.gx@renesas.com>
 <87im3ici1u.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdX-JK7eta966wsLC-sGf7Z81196wmUVs3eGyVmAwi7FWw@mail.gmail.com>
 <87a6otc89m.wl-kuninori.morimoto.gx@renesas.com> <874ketosmq.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <874ketosmq.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 25 May 2021 09:42:16 +0200
Message-ID: <CAMuHMdUGWqii+35T3s7yOb177=PCfYmA2z_MmX=ewtQ7P_wghQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: r8a77995: Add ZA2 clock
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Harunobu Kurokawa <harunobu.kurokawa.dn@renesas.com>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        Hien Dang <hien.dang.eb@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Mon, May 24, 2021 at 2:57 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > > This does not match the Hardware User's Manual (Rev. 2.20):
> > >   1. ZA2 is not a fixed clock, but can be controlled through the ZA2CKCR
> > >      register.  Adding support for that requires writing a custom clock
> > >      driver.
> > >      Of course we can consider it a fixed clock initially, and make it
> > >      configurable later, when time permits.
> > >   2. The parent clock is either PLL0D3 or S0, with a configurable
> > >      post-divider of 2 or 4, yielding 200, 250, 400, or 500[*] MHz.
> > >      Using plain PLL0D24 would mean a post-divider of 8, yielding
> > >      125 MHz, which is not documented as a supported value.
> > >
> > > [*] Using the default would mean:
> > >
> > >     DEF_FIXED("za2", R8A77995_CLK_ZA2, CLK_PLL0D3, 4, 1);
>
> PLL0 * 1/3 = 1GHz.
> And default ZA2 on D3 is 500MHz thus it will be below
> but am I misunderstanding ?
>
>         - DEF_FIXED("za2", R8A77995_CLK_ZA2, CLK_PLL0D3, 4, 1);
>         + DEF_FIXED("za2", R8A77995_CLK_ZA2, CLK_PLL0D3, 2, 1);

Yes, /2 instead of /4. Sorry for the confusion.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
