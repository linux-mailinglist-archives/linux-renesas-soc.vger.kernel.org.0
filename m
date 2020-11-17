Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1EF82B6836
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Nov 2020 16:07:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728662AbgKQPGK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Nov 2020 10:06:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:54786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726883AbgKQPGJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Nov 2020 10:06:09 -0500
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DB39124198
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2020 15:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605625569;
        bh=/dejARFp9DWb/QfqvQrppqdVKkblFwZGEvk8tqfEgc4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jlnWhr4Cwr+UgrmfqChQ4cfRaEAl6VrK/tFP1DQTANK7HTIlcTKNQnM7WtgeTvZ2f
         AtyMXkERaEB1WoQnAtRsdB71MVdIzRdn+nRdOhejNgtf5Wio1jo3S83+3zyo9yCLnt
         HluuqBRKYMG+WvTTOVHY/p0h3DzQ1rpuGkaAsVws=
Received: by mail-oo1-f41.google.com with SMTP id l20so4803205oot.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2020 07:06:08 -0800 (PST)
X-Gm-Message-State: AOAM532WcPReF0JCBTkpWHxNZCAH7syzAWo/D/4zLmBdtEbMz39ikM/h
        rKDf2Z9KM1CjWw8DYbM//JRlbT09yRv02kC65sk=
X-Google-Smtp-Source: ABdhPJyFkWrW8hggOzq6FwmKiwMktXOONWbFZS5mou0B8PJmrHsmf0yzo8V0jkZ6lDgITboX46Z4W0maNDh2iIeGL8Y=
X-Received: by 2002:a4a:7055:: with SMTP id b21mr3252714oof.66.1605625568127;
 Tue, 17 Nov 2020 07:06:08 -0800 (PST)
MIME-Version: 1.0
References: <20201117103022.2136527-1-geert+renesas@glider.be>
 <20201117103022.2136527-3-geert+renesas@glider.be> <CAK8P3a1CAmC3=QFA1EryDsx0aR-OF+=mf=Xj9cPrObe+qRoJKQ@mail.gmail.com>
 <CAMuHMdWTuzxg-a0f5MfPN=66EXcEqLfHCQMhiSAWH04p1BQ2ng@mail.gmail.com>
 <CAK8P3a363pGBYAyGgV1r+evpNk9Cpcu-vE++s7Ma4YB25AW+yg@mail.gmail.com> <CAMuHMdVFRXMcOgv5Qa6QgEAKsU31sKDBsTPs6ONdSqLAQZShow@mail.gmail.com>
In-Reply-To: <CAMuHMdVFRXMcOgv5Qa6QgEAKsU31sKDBsTPs6ONdSqLAQZShow@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 17 Nov 2020 16:05:52 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3QZJjV99Oo=GytUc3q3RkSrtccTC12Vgd=E=UByFX7ZA@mail.gmail.com>
Message-ID: <CAK8P3a3QZJjV99Oo=GytUc3q3RkSrtccTC12Vgd=E=UByFX7ZA@mail.gmail.com>
Subject: Re: [PATCH 2/7] ARM: shmobile: r8a7779: Use ioremap() to map INTC2 registers
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Nov 17, 2020 at 3:47 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Nov 17, 2020 at 3:39 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > On Tue, Nov 17, 2020 at 3:19 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Tue, Nov 17, 2020 at 1:25 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > > > On Tue, Nov 17, 2020 at 11:30 AM Geert Uytterhoeven
> > > > <geert+renesas@glider.be> wrote:
> > > > > Replace using the legacy IOMEM() macro to map various registers related
> > > > > to INTC2 configuration by ioremap().
> > > > >
> > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > >
> > > > The patch looks good, but since you are already touching these __raw_writel(),
> > > > could you turn them into normal writel() to have a chance that this works
> > > > on big-endian? It could be either a follow-up or merged into the same patch.
> > >
> > > (Do you want us to support big-endian on these old platforms? ;-)
> > >
> > > At your service. Seems to work well.
> >
> > In general, my preference is that code is written in a portable way, to make
> > it at least plausible that it works. I don't expect anyone to actually run
> > big-endian code on it, but if you can confirm that it boots all the way
> > to not finding a compatible /sbin/init, that would be awesome.
>
> With "work well", I meant no regressions after converting from _raw_*()
> to normal accessors.  No idea how to boot big-endian kernels on this
> hardware ;-)

There is no change when booting them, you just enable
CONFIG_CPU_BIG_ENDIAN and recompile the kernel.

The bootloader remains little-endian and the first instruction in
the image then changes into big-endian mode. The expected
behavior is that it crashes as soon as it tries to get into user
space. Recompiling that is significantly more work.

     Arnd
