Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 276791C3B8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 May 2019 09:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbfENHQQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 May 2019 03:16:16 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:43994 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726218AbfENHQQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 May 2019 03:16:16 -0400
Received: by mail-vs1-f67.google.com with SMTP id d128so9633060vsc.10;
        Tue, 14 May 2019 00:16:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yp0fJxub6ZjKZY0jtIHu8KIkPHhsLNLtdfrqfrKo7/o=;
        b=PnRrrvyZN4sxJnSz77QMiPa/5s93YWvQRg3E+l1dbNlo7qmqHnVKZwKVy5L8ZxnaPq
         1aBAA6CNnKv0p/r3b7zpJT7iYgqqPappVpDqLD5dNgTS1EEyn/ieayxTLX+mU47XggvE
         dIPTF83rguG+HtG3KFAID0digI0FV9dE2zxOt3+2No1B6dILy6mpQmApuCrWS39vHxkN
         xoFq0Kcyz8+2WK24O4wMLXQJ/gQwG/5xA0v70L+Zl0raiLzAN7lp3kR+1E+p5GZ8rMin
         6rS6SXL3AxkAzAyFy9DkL99oNGIUU9omwXWR8hNlWYpicyoJFSJI/jiALYeJ583HslBy
         Ah9Q==
X-Gm-Message-State: APjAAAX9gd0xZ3raIP/3jxiTBiJJiLrTHu+RadUkYTdx9BBGHPNAf2cd
        LZiQz5LslnC+bbDjrZv5u0XCDa8zL1ZbZCMw7Gg=
X-Google-Smtp-Source: APXvYqzGLgiPXxb7cqkTUuev9vbQu6GXMlTpBhL6Ycq9p4IxkMcEEg5na6EfwrgDmLAKugBNM3Su1HcDn4HbHVdWKio=
X-Received: by 2002:a67:7c93:: with SMTP id x141mr8341728vsc.96.1557818175047;
 Tue, 14 May 2019 00:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <1557505377-28577-1-git-send-email-olekstysh@gmail.com>
 <e64d7f2f-209e-cf7d-6ddc-88d338b1c010@arm.com> <cc9c5c48-2bc1-be49-4188-8b26dbf7ecc1@gmail.com>
 <CAMuHMdWODzaHSeXyB5CgGmq3ZumFGVZYOUT1v1_Ps-RguPLseA@mail.gmail.com> <25f5f60e-46ff-18af-2a65-1e3f6719ef49@gmail.com>
In-Reply-To: <25f5f60e-46ff-18af-2a65-1e3f6719ef49@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 14 May 2019 09:16:03 +0200
Message-ID: <CAMuHMdWkEU7x_Lzk6NUCxEdZRx_xTBFzkETwShZ322aYL5=bLg@mail.gmail.com>
Subject: Re: [RFC PATCH] ARM: mach-shmobile: Parse DT to get ARCH timer memory region
To:     Oleksandr <olekstysh@gmail.com>
Cc:     Julien Grall <julien.grall@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Oleksandr,

On Mon, May 13, 2019 at 6:00 PM Oleksandr <olekstysh@gmail.com> wrote:
> On 13.05.19 18:13, Geert Uytterhoeven wrote:
> >> So, if the DT bindings for the counter module is not an option (if I
> >> correctly understood a discussion pointed by Geert in another letter),
> >> we should probably prevent all timer code here from being executed if
> >> PSCI is in use.
> >> What I mean is to return to [2], but with the modification to use
> >> psci_smp_available() helper as an indicator of PSCI usage.
> >>
> >> Julien, Geert, what do you think?
> > Yes, that sounds good to me.
> >
> > Note that psci_smp_available() seems to return false if CONFIG_SMP=n,
> > so checking for that is not sufficient to avoid crashes when running a
> > uniprocessor kernel on a PSCI-enabled system.
>
> Indeed, you are right.
>
>
> Nothing than just check for psci_ops.cpu_on == NULL directly comes to
> mind...
>
> Have already checked with CONFIG_SMP=n, it works.
>
> Sounds ok?

Fine for me, thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
