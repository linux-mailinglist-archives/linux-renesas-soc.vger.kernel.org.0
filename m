Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1875F3473E9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Mar 2021 09:48:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234448AbhCXIrf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Mar 2021 04:47:35 -0400
Received: from mail-ua1-f46.google.com ([209.85.222.46]:39693 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234385AbhCXIr2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Mar 2021 04:47:28 -0400
Received: by mail-ua1-f46.google.com with SMTP id x8so7598808ual.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 01:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FX4YhcRrTtOWfNjjlu3aaCWI7W5SveqcMlD13s6eqt4=;
        b=BKzrPJdw6upniCqgfW7/15IR8WjOx2q3GHhWaNb78TgI8uSEkXrUK4hhCXqfjJJHL4
         UJiVmF0RW5TWRty2BUTLHMyLQZPzwZTd93ztmwFLVANuufbngPMnlcIDXl8pyK86cAtD
         4zJKBu5539qoPQyGIk0xHRs7wmFsRa60TC9FD9IMoy1rsXRGc1ysjuJUACvImxylDfEi
         xrLw4mmBY7BjalAF3uVr5tqoBn5/I3eJINR5bGZpQZ+oL1VyrMytq4+bIEldecUW9CDO
         iqC4rGndxblLYGzLRFSc9c53V7A3luUkh5JBkcuedF8e59KeGeyfubV9SzT2QaI7QvsV
         Ec9w==
X-Gm-Message-State: AOAM532l/UVWzszq5bv4v+BZW+TJclibtZ+qb7wyyTvCK/2NqRlyOx2T
        fdJPnlfN2tl1+qOjGl3oUJefvpyydgjqaM1jo0c=
X-Google-Smtp-Source: ABdhPJzP29xmBlDCp4PFhnPQFJUSoC4K4pGWei3p2zPlq3uAtPKdMIyVbFffA1UwuYpP1Imr6vLGx3hKMvY6yrJqsTQ=
X-Received: by 2002:ab0:6954:: with SMTP id c20mr895926uas.106.1616575636198;
 Wed, 24 Mar 2021 01:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-5-laurent.pinchart+renesas@ideasonboard.com> <CAD=FV=UDd9LC-sMEk0hn10roeM+Cz6VNekcZomkQXLhfw0-4wA@mail.gmail.com>
In-Reply-To: <CAD=FV=UDd9LC-sMEk0hn10roeM+Cz6VNekcZomkQXLhfw0-4wA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Mar 2021 09:47:05 +0100
Message-ID: <CAMuHMdXarCH4rP56HA5hxZ5heyotMD+_KraHu5r35baOe=MHug@mail.gmail.com>
Subject: Re: [RFC PATCH 04/11] drm/bridge: ti-sn65dsi86: Use bitmask to store
 valid rates
To:     Doug Anderson <dianders@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Doug,

On Tue, Mar 23, 2021 at 10:10 PM Doug Anderson <dianders@chromium.org> wrote:
> On Sun, Mar 21, 2021 at 8:02 PM Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com> wrote:
> >
> > The valid rates are stored in an array of 8 booleans. Replace it with a
> > bitmask to save space.
>
> I'm curious: do you have evidence that this does anything useful? I
> guess you're expecting it to save .text space, right? Stack usage and
> execution time differences should be irrelevant--it's not in a
> critical section and the difference should be tiny anyway. As far as
> .text segment goes, it's not obvious to me that the compiler will use
> fewer instructions to manipulate bits compared to booleans.
>
> Doing a super simple "ls -ah" on vmlinux (unstripped):
>
> Before: 224820232 bytes
> After: 224820376 bytes
>
> ...so your change made it _bigger_.   OK, so running "strip
> --strip-debug" on those:
>
> Before: 26599464 bytes
> After: 26599464 bytes

I've been surprised by the counter-intuitive impact of similar changes
before, too.  The result may also differ a lot between arm32 or arm64.

> ...so exactly the same. I tried finding some evidence using "readelf -ah":
>
> Before:
>   [ 2] .text             PROGBITS         ffffffc010010000  00020000
>        0000000000b03508  0000000000000000 WAX       0     0     65536
>   [ 3] .rodata           PROGBITS         ffffffc010b20000  00b30000
>        00000000002e84b3  0000000000000000 WAMS       0     0     4096
>
> After:
>   [ 2] .text             PROGBITS         ffffffc010010000  00020000
>        0000000000b03508  0000000000000000 WAX       0     0     65536
>   [ 3] .rodata           PROGBITS         ffffffc010b20000  00b30000
>        00000000002e84b3  0000000000000000 WAMS       0     0     4096
>
> Maybe you have some evidence showing an improvement? Ah, OK. I
> disassembled ti_sn_bridge_enable() and your patch saves 12 bytes, but
> I guess maybe alignment washes it out in reality...

Yes, arm64 is bad w.r.t. this.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
