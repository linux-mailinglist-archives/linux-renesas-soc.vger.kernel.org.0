Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B2342C39EB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Nov 2020 08:21:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbgKYHR3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Nov 2020 02:17:29 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:45003 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726708AbgKYHR3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Nov 2020 02:17:29 -0500
Received: by mail-oi1-f196.google.com with SMTP id y74so1744248oia.11;
        Tue, 24 Nov 2020 23:17:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qyS68A7KMuFoblISe8M6QxBpltTR6sqwPG+dCZ5S8FE=;
        b=CZeS96gaCpF9hqzvd0juSAPIIL/pXbmfdv0icxGIO7z6/aIBKvc6F5ZkCHIj7YOhUR
         j7NrTK9jLy9sj1nOCObZbWgppOdQxr7u5zY+ohKs8xmTMDSwd4hkAHaw4045fp57tRF9
         fuqpraKrC7JOlr8IyjPWQNftDdKOXOviRd5aT6yev2THZuFg3LBQl2zaNAuIzdghueFL
         GVUMdlGFeluJStf1YwgfKBO0BNmtswseUxHBOq1iqrOJQ+MIp3qyGhsPiupmJ0E3ORAC
         qoSCi6pbTp7gVb/BWu1g9rDwEXNx+TK4gkskvIFyYB9OvVsXQDLyn1obdD9s0kTniait
         bKfA==
X-Gm-Message-State: AOAM533pYhuK/z0zQ+JdczWJ6DrzBfn9oSMrx6pGz6wp/QZwEsqTkYvY
        v+npfNv7A7jV6N+I2r3wQ5kVKGBx4DAmV7tX0o0=
X-Google-Smtp-Source: ABdhPJyj14zPbljhO27Xvj9+1jKdzF0FLAssTkgwwij+JnnmekDCWO6+pXDdv5x78CYhXZg1G6KxfpSsLdrOs1ZgmfM=
X-Received: by 2002:aca:4bc3:: with SMTP id y186mr1341405oia.153.1606288648251;
 Tue, 24 Nov 2020 23:17:28 -0800 (PST)
MIME-Version: 1.0
References: <20201119125053.4065746-1-geert+renesas@glider.be> <160626282503.2717324.11024656692958658754@swboyd.mtv.corp.google.com>
In-Reply-To: <160626282503.2717324.11024656692958658754@swboyd.mtv.corp.google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 25 Nov 2020 08:17:17 +0100
Message-ID: <CAMuHMdWt0HizEuT-PmNrBadK=w6-gVmuBzuAHoSYGJaAabtg1Q@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: sh73a0: Stop using __raw_*() I/O accessors
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Stephen,

On Wed, Nov 25, 2020 at 1:07 AM Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Geert Uytterhoeven (2020-11-19 04:50:53)
> > There is no reason to keep on using the __raw_{read,write}l() I/O
> > accessors in Renesas ARM driver code.  Switch to using the plain
> > {read,write}l() I/O accessors, to have a chance that this works on
> > big-endian.
> >
> > Suggested-by: Arnd Bergmann <arnd@kernel.org>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
>
> Note that this now includes a barrier. It wasn't mentioned in the commit
> text so I'm just mentioning it now in case having a barrier now causes
> some sort of problem, which is highly unlikely.

Indeed, the barrier doesn't matter here.

> Reviewed-by: Stephen Boyd <sboyd@kernel.org>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
