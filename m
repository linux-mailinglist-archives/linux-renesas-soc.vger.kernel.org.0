Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E417F151E1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2019 18:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbfEFQrL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 May 2019 12:47:11 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:46315 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbfEFQrL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 May 2019 12:47:11 -0400
Received: by mail-ua1-f65.google.com with SMTP id n23so4879131uap.13;
        Mon, 06 May 2019 09:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KRsp84CR/wZjf7JSxDT5PziM3wZtSANeGjBl9N5WJPY=;
        b=M2WAm3zKsvX/U5EO7RnbWnpV7F70x5KP9SwdmROsIEe7qOoeXWRK/+dzNYEuN7DLdf
         KDiyG3t+V1q1W/2lcHpFRCAjPDRAece4OzP3HgQ70yac83vwQH2I7qeyWnOZxbjGxSry
         uNssbiAoB9NF16QnVpDN0lkqrY4gbxmqhiQUth7bzjspFgVUdVufYKb7yy5gav8ib7va
         fCM6mIluYhwjk0tIbKmyO+xtf0Q1hpTY1re0EL819Pxrdtgft9vI+diJeECilhTadEvt
         Ou3xkObFCbrw1QKB6/KPuTzovxu/Q6hq3ZYypnLNHgSO21EaBxgw908AnK1j75jnyKNX
         x0vw==
X-Gm-Message-State: APjAAAXDkuZUo++LyflJ+YmIvW2c76Sg4eQTkYA8HIZJzlLFcRI3A6E9
        6Ld0RkJ1Iktz1RK0weH0ap6sPSvnq24muHlImOc=
X-Google-Smtp-Source: APXvYqxivUBYKeylf06dc/FajmKOGINCDT9FRcHViFrODon94uEeIITcByJUAga3hTH23Y3VDVffI/Cm5Acd2hQyJVE=
X-Received: by 2002:a9f:2b84:: with SMTP id y4mr10578570uai.28.1557161229621;
 Mon, 06 May 2019 09:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190504004258.23574-1-erosca@de.adit-jv.com> <20190504004258.23574-2-erosca@de.adit-jv.com>
 <20190506134700.ya565idfzzc3enbm@verge.net.au> <20190506152433.GA22769@vmlxhi-102.adit-jv.com>
In-Reply-To: <20190506152433.GA22769@vmlxhi-102.adit-jv.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 May 2019 18:46:57 +0200
Message-ID: <CAMuHMdXJzEYL48qwHAxrRsurQLBipZsQpv+w8i=+B2XCM_CZng@mail.gmail.com>
Subject: Re: [PATCH 1/6] serial: sh-sci: Reveal ptrval in dev_dbg
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "George G . Davis" <george_davis@mentor.com>,
        Andy Lowe <andy_lowe@mentor.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Helge Deller <deller@gmx.de>,
        Michael Neuling <mikey@neuling.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Philip Yang <Philip.Yang@amd.com>,
        Matthew Wilcox <mawilcox@microsoft.com>,
        Borislav Petkov <bp@suse.de>,
        "Darrick J. Wong" <darrick.wong@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Eugeniu,

On Mon, May 6, 2019 at 5:24 PM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> On Mon, May 06, 2019 at 03:47:05PM +0200, Simon Horman wrote:
> > On Sat, May 04, 2019 at 02:42:53AM +0200, Eugeniu Rosca wrote:
> > > Starting with v4.15-rc2 commit ad67b74d2469d9 ("printk: hash addresses
> > > printed with %p"), enabling debug prints in sh-sci.c would generate
> > > output like below confusing the users who try to sneak into the
> > > internals of the driver:
> > >
> > > sh-sci e6e88000.serial: sci_request_dma: TX: got channel (____ptrval____)
> > > sh-sci e6e88000.serial: sci_request_dma: mapped 4096@(____ptrval____) to 0x00000006798bf000
> > > sh-sci e6e88000.serial: sci_request_dma: RX: got channel (____ptrval____)
> > > sh-sci e6e88000.serial: sci_dma_tx_work_fn: (____ptrval____): 0...2, cookie 2
> > >
> > > There are two possible fixes for that:
> > >  - get rid of '%p' prints if they don't reveal any useful information
> > >  - s/%p/%px/, since it is unlikely we have any concerns leaking the
> > >    pointer values when running a debug/non-production kernel
> >
> > I am concerned that this may expose information in circumstances
> > where it is undesirable. Is it generally accepted practice to
> > use %px in conjunction with dev_dbg() ?
> >
> > ...
>
> Below commits performed a similar s/%p/%px/ update in debug context:
>
> Authors (CC-ed)   Commit         Subject
> ----------------------------------------
> Christophe Leroy  b18f0ae92b0a1d ("powerpc/prom: fix early DEBUG messages")
> Helge Deller      3847dab7742186 ("parisc: Add alternative coding infrastructure")
> Michael Neuling   51c3c62b58b357 ("powerpc: Avoid code patching freed init sections")
> Kuninori Morimoto dabdbe3ae0cb9a ("ASoC: rsnd: don't use %p for dev_dbg()")
> Philip Yang       fa7e65147e5dca ("drm/amdkfd: use %px to print user space address instead of %p")
> Matthew Wilcox    68c1f08203f2b0 ("lib/list_debug.c: print unmangled addresses")
> Borislav Petkov   0e6c16c652cada ("x86/alternative: Print unadorned pointers")
> Darrick J. Wong   c96900435fa9fd ("xfs: use %px for data pointers when debugging")
> Helge Deller      04903c06b4854d ("parisc: Show unhashed HPA of Dino chip")
>
> To quote Matthew, with respect to any debug prints:
> If an attacker can force this message to be printed, we've already lost.

I think the issue with using %px in debug code is that a distro may enable
CONFIG_DYNAMIC_DEBUG (it is enabled in several defconfigs), after which
an attacker just has to convince/trick the system into enabling debug for that
particular driver.

> In any case, I won't be affected much if the change is not accepted,
> since it doesn't resolve any major issue on my end. Thanks!

OK.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
