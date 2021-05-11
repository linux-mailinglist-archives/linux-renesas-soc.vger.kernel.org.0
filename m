Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C515537A2E5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 May 2021 11:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230487AbhEKJEd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 May 2021 05:04:33 -0400
Received: from mail-vs1-f41.google.com ([209.85.217.41]:42823 "EHLO
        mail-vs1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230445AbhEKJEd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 May 2021 05:04:33 -0400
Received: by mail-vs1-f41.google.com with SMTP id 66so9829415vsk.9;
        Tue, 11 May 2021 02:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=niD93gOj93fQAVw5Gtqpl/pIAhzfVUS4on4XcHM79PM=;
        b=q9PhL75rQrKXYUaquSB9CQg7Dc2B1wlagY94lBGlNzigfM36YUthh/7h4SIyhe9phx
         M9AKN5wXrM4s1w2j7DJNzX+NSdpfQRELAwt3nrN+5Q5L016WozDMxVse6aisd0VrFLGK
         Z1/6BioWowe85EfyYVLucUYl6n6TCV6P3AQfB0YiBYHwEzQtfL+hGmrnXOwNmMfd38gz
         8DJtt3475KeR2cYNKKjbrbrCSUFWRQ5LwxV+CekvszWP2YEmRxhn29xdxgK+gvmUT6xi
         Mr0YRTG5eitY5PCWElC7c+Y+9mHRoN5JoUxdvs6Xr6tEg+Xvn2DZ/slu1Kk4ujMnKIAZ
         rkZg==
X-Gm-Message-State: AOAM531sIhAyJMbezymcBRgTVxQNPvBP+wDB7eNXpUrAMfUxLCd2Cm1G
        7ZzjGZ9nQZBBf/3RL38f+HyvIyNdqpuRwMyUmaI=
X-Google-Smtp-Source: ABdhPJya6BfruwNfTZaNfLSdWXR3LoM6nQKbag7MmyUukLiu3JExe4Vk4KB8XYBHZhoI/LhdDdxx3wDUixez1olrXAo=
X-Received: by 2002:a67:3113:: with SMTP id x19mr17964323vsx.40.1620723805651;
 Tue, 11 May 2021 02:03:25 -0700 (PDT)
MIME-Version: 1.0
References: <5eff320aef92ffb33d00e57979fd3603bbb4a70f.1620648218.git.geert+renesas@glider.be>
 <20210511085538.GC1626@ninjato>
In-Reply-To: <20210511085538.GC1626@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 11 May 2021 11:03:14 +0200
Message-ID: <CAMuHMdWsP=CV8CNvGcy-LRZ28x8pjLCTJnGiS937EcZpVOvKFQ@mail.gmail.com>
Subject: Re: [PATCH] serial: sh-sci: Fix off-by-one error in FIFO threshold
 register setting
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Linh Phung <linh.phung.jy@renesas.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Tue, May 11, 2021 at 10:55 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Mon, May 10, 2021 at 02:07:55PM +0200, Geert Uytterhoeven wrote:
> > The Receive FIFO Data Count Trigger field (RTRG[6:0]) in the Receive
> > FIFO Data Count Trigger Register (HSRTRGR) of HSCIF can only hold values
> > ranging from 0-127.  As the FIFO size is equal to 128 on HSCIF, the user
> > can write an out-of-range value, touching reserved bits.
> >
> > Fix this by limiting the trigger value to the FIFO size minus one.
> > Reverse the order of the checks, to avoid rx_trig becoming zero if the
> > FIFO size is one.
> >
> > Note that this change has no impact on other SCIF variants, as their
> > maximum supported trigger value is lower than the FIFO size anyway, and
> > the code below takes care of enforcing these limits.
> >
> > Reported-by: Linh Phung <linh.phung.jy@renesas.com>
> > Fixes: a380ed461f66d1b8 ("serial: sh-sci: implement FIFO threshold register setting")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Compile-tested only.
> >
> > The BSP contains a different patch[1], which masks the value to write by
> > 0x7f.  This is IMHO incorrect, as it would set the trigger value to zero
> > when 128 is requested.
>
> Makes also sense to me to have the trigger at fifosize-1 to have one
> spare byte to handle latencies.

Exactly, that's why the maximum value supported by the HSCIF
hardware is 127, not 128.

> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
