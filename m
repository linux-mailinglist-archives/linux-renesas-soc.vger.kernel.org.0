Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4EAC2B67C6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Nov 2020 15:49:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728925AbgKQOsC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Nov 2020 09:48:02 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34149 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728198AbgKQOsB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Nov 2020 09:48:01 -0500
Received: by mail-oi1-f194.google.com with SMTP id w188so22795372oib.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2020 06:48:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qNjOpDFd7ebYaZlyYL+B6aOhJFtV9NIpEJCZhZHXtZc=;
        b=C9NyBnVaCDLtWq6tb6LrJSh6jiV8CCBsxfAsskaG+uJSU34zsT8Bc10miyATcpP8mt
         4hV9Rh8RPfy5Upq6aVPWjCSyh2Wb/iyH3hhsfz+57Txx+RiyqOPyDKwTvz/7Dc0awWGX
         AauyYiErJvJFb9p9URwWbOoWGwqX3ZvZz652Cb90aeAXESA8pihAP9qUMXA753xwG9XD
         6KzN3fJpNwwi8ivJpHbkQNwZuI9LYE+hb0wCR+6OhpPZaasNoQ064IBy8qHMChU0+eZC
         FxhYCmv4FnorlesopmyQGIxQLlNXNE4whWBy54OEGHqrLs81H0wS0QF2Bg/GIKJh3nXa
         EP/A==
X-Gm-Message-State: AOAM530ctDoVc2DQwhWxCj5fquksq9e/L8PUpv8EVS/UXb6NfnVOlFIr
        wcR5RpezqttUeKp6h2jT6gmhK2O6k2UJfbMoVw0=
X-Google-Smtp-Source: ABdhPJyxDTSwRObrj3EWY6zD3hQ8RwzuCQXKXcXc11AYg234kF2wVUvurghNXj5N9o5l93k2skZttJR/gGT0ObWKq9w=
X-Received: by 2002:aca:c3c4:: with SMTP id t187mr2419288oif.148.1605624481112;
 Tue, 17 Nov 2020 06:48:01 -0800 (PST)
MIME-Version: 1.0
References: <20201117103022.2136527-1-geert+renesas@glider.be>
 <20201117103022.2136527-3-geert+renesas@glider.be> <CAK8P3a1CAmC3=QFA1EryDsx0aR-OF+=mf=Xj9cPrObe+qRoJKQ@mail.gmail.com>
 <CAMuHMdWTuzxg-a0f5MfPN=66EXcEqLfHCQMhiSAWH04p1BQ2ng@mail.gmail.com> <CAK8P3a363pGBYAyGgV1r+evpNk9Cpcu-vE++s7Ma4YB25AW+yg@mail.gmail.com>
In-Reply-To: <CAK8P3a363pGBYAyGgV1r+evpNk9Cpcu-vE++s7Ma4YB25AW+yg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Nov 2020 15:47:49 +0100
Message-ID: <CAMuHMdVFRXMcOgv5Qa6QgEAKsU31sKDBsTPs6ONdSqLAQZShow@mail.gmail.com>
Subject: Re: [PATCH 2/7] ARM: shmobile: r8a7779: Use ioremap() to map INTC2 registers
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Arnd,

On Tue, Nov 17, 2020 at 3:39 PM Arnd Bergmann <arnd@kernel.org> wrote:
> On Tue, Nov 17, 2020 at 3:19 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Nov 17, 2020 at 1:25 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > > On Tue, Nov 17, 2020 at 11:30 AM Geert Uytterhoeven
> > > <geert+renesas@glider.be> wrote:
> > > > Replace using the legacy IOMEM() macro to map various registers related
> > > > to INTC2 configuration by ioremap().
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > The patch looks good, but since you are already touching these __raw_writel(),
> > > could you turn them into normal writel() to have a chance that this works
> > > on big-endian? It could be either a follow-up or merged into the same patch.
> >
> > (Do you want us to support big-endian on these old platforms? ;-)
> >
> > At your service. Seems to work well.
>
> In general, my preference is that code is written in a portable way, to make
> it at least plausible that it works. I don't expect anyone to actually run
> big-endian code on it, but if you can confirm that it boots all the way
> to not finding a compatible /sbin/init, that would be awesome.

With "work well", I meant no regressions after converting from _raw_*()
to normal accessors.  No idea how to boot big-endian kernels on this
hardware ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
