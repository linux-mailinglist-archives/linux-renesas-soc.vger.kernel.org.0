Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 537952C4695
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Nov 2020 18:24:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730816AbgKYRXl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Nov 2020 12:23:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730695AbgKYRXl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Nov 2020 12:23:41 -0500
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69282C0613D4;
        Wed, 25 Nov 2020 09:23:41 -0800 (PST)
Received: by mail-yb1-xb41.google.com with SMTP id o144so432412ybg.7;
        Wed, 25 Nov 2020 09:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xZV9+j2Fz0qufkKJrAOkz5+JLHtjo8L5rHWDGquTLcM=;
        b=eRcROy/69g3Xqx5IEAOienCCL4wA9c4r4VW24UnEl49nZGhLWIOFQdfP1kuGsuJKxv
         OcHkqlR/2mkXuJiIW/hlI4Jzp5gtfXgeoR6Co/4tZI5YL0dPGZn9GreyB2Y9zHjo675z
         yQy9komEWr8d6OTAkZW7Xeh1J1+7kWJlMg5hrln+4XpT6WL4YmXYuZ5UQfQz/4q58KPz
         2F6M0rl9kLKDj8V4w9Nr67NuVN8kYl5qHUKw3xYuvZrgKzZqzp5OqObg3bIbxDKt4BR9
         3HmkzpMiA7HCT7DCNbJu2a8ZzSoqj4ToCt+xq0OFw5lM6dGNWDK+RvJTujvqAz3KlkVi
         uHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xZV9+j2Fz0qufkKJrAOkz5+JLHtjo8L5rHWDGquTLcM=;
        b=p70NIXwPvDgtCGhJg+Rr04brd1jOFJssmuXP2hGSVEV56UDoVrJVkMJ1lYArn+8PAP
         ryRuWirnU+e7zQzBTksIpK/31OA06vZ4rKtfK+QCAhnfaakuZCjGPtv2NJPbKLC9tSxT
         4lNlg2k9V+X74eGbsDapdHMpPdgSipUbBwgbXAnaBmnT6tDEGvv4V74lu7yYnGaaAKbV
         jnn1vS1AvuokMzqbLDcCu1dd8jcJeYZA1LoyZ3nVCzMJ5RQcYOdc9IHvAEEWE9Kqh5Ux
         5CyC/xf/yVHHghEAK+z7O05Fxon1DdzAX2sl+YWLu5rsdLfD6jSOqYnt8B2FEpo/ww+h
         aPRw==
X-Gm-Message-State: AOAM5332nzVaPXV3TZ7RaFNPdouo3oReb3AOLpRMjCHuyzZWe6NFnKgL
        g3wYpONQsG+qe+mU2z4CqLtGHtr0fd8m5BBSutCMs7zt0zswSQ==
X-Google-Smtp-Source: ABdhPJw6hNT6UUNkOq0XdmIWXdolS1DJJdpm/q+dUjJB/51hdmbKlTvkCe+FCMK03zdyRUd35gMkKTDJtiSalO+tFxQ=
X-Received: by 2002:a25:e00b:: with SMTP id x11mr5466249ybg.518.1606325020731;
 Wed, 25 Nov 2020 09:23:40 -0800 (PST)
MIME-Version: 1.0
References: <20201125130148.28724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX+FZjAfbWWw53EToHP6c4JFmQX9wogAyW3OcOxHgMd0w@mail.gmail.com>
 <OSBPR01MB504858A417137ED7AC31F925AAFA0@OSBPR01MB5048.jpnprd01.prod.outlook.com>
 <CAMuHMdXGqv9aKra7Ncg4mRoc2caO5iOw+ydrNmo9UcHeDTgVGw@mail.gmail.com>
In-Reply-To: <CAMuHMdXGqv9aKra7Ncg4mRoc2caO5iOw+ydrNmo9UcHeDTgVGw@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 25 Nov 2020 17:23:14 +0000
Message-ID: <CA+V-a8sEQJhBF-MSj5o7Pf5KbkycQ2NpLnLmnCmHmN+tANO5Vg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] r8a7742-iwg21d-q7-dbcm: Add support for ov7725 sensors
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Wed, Nov 25, 2020 at 4:32 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, Nov 25, 2020 at 5:26 PM Prabhakar Mahadev Lad
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > -----Original Message-----
> > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Sent: 25 November 2020 16:21
> > > To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Cc: Magnus Damm <magnus.damm@gmail.com>; Rob Herring <robh+dt@kernel.org>; Linux-Renesas <linux-
> > > renesas-soc@vger.kernel.org>; open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
> > > <devicetree@vger.kernel.org>; Linux Kernel Mailing List <linux-kernel@vger.kernel.org>; Biju Das
> > > <biju.das.jz@bp.renesas.com>; Prabhakar <prabhakar.csengg@gmail.com>
> > > Subject: Re: [PATCH v2 0/2] r8a7742-iwg21d-q7-dbcm: Add support for ov7725 sensors
> > >
> > > Hi Prabhakar,
> > >
> > > On Wed, Nov 25, 2020 at 2:02 PM Lad Prabhakar
> > > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > > This patch set enables to connect ov7725 sensors on iWave-RZ/G1H Qseven
> > > > board.
> > >
> > > Thanks for your series!
> > >
> > > Do you think it's a valid use case to mix and match ov5640 and ov7725
> > > cameras? E.g. connect two of each?
> > >
> > Yes that is valid case to mix and match. Do you want me to make it configurable too ?
>
> If this is a valid use case, then please do so.
>
In that case do we still want to keep the ov7725/ov5640 nodes in
separate dtsi  ?

Cheers,
Prabhakar

> Thanks!
>
> > > Or should all four cameras be of the same type?
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
